package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.modals.FileSearchResult
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import kotlinx.coroutines.runBlocking
import org.apache.commons.io.FileUtils
import java.io.File

/**
 * Ghost Story patch - prevents story seen tracking
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.StorySeen)
 * which hooks methods containing "media/seen/" string with signature:
 * final void method() with 0 parameters
 */
@PInfos.PatchInfo(
    name = "Ghost Story",
    shortname = "ghost_story",
    desc = "View stories anonymously",
    isSingle = true
)
class GhostStory: InstafelPatch() {

    lateinit var ghostStoryFile: File

    companion object {
        private const val MIN_IMPLEMENTATION_LINES = 100
        private const val MAX_IMPLEMENTATION_LINES = 1000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost story source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files with exact "media/seen/" string (not format strings)
                // and method declarations (to filter out utility/constant classes)
                val searchPattern = listOf(
                    listOf("const-string", "\"media/seen/\""),  // Exact match for the endpoint
                    listOf(".method")  // Must have methods
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostStoryFile = result.file
                        success("Ghost story source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost story.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        // Apply multi-stage filtering to find the correct implementation
                        // Stage 1: Filter by file size (implementation files are 100-1000 lines)
                        val sizeFiltered = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        // Stage 2: Find files with exact "media/seen/" and target method signature
                        val candidates = sizeFiltered.filter { file ->
                            val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                            var hasTargetMethod = false
                            
                            // Must have exact "media/seen/" without format parameters
                            val hasExactMediaSeen = fContent.any { line ->
                                line.contains("const-string") && 
                                line.contains("\"media/seen/\"") &&
                                !line.contains("?")  // Exclude format strings
                            }
                            
                            if (!hasExactMediaSeen) {
                                return@filter false
                            }
                            
                            // Find the method containing "media/seen/"
                            var mediaSeenLine = -1
                            fContent.forEachIndexed { index, line ->
                                if (line.contains("const-string") && line.contains("\"media/seen/\"") && !line.contains("?")) {
                                    mediaSeenLine = index
                                }
                            }
                            
                            if (mediaSeenLine != -1) {
                                // Search backwards for method declaration
                                for (methodIndex in mediaSeenLine downTo 0) {
                                    if (fContent[methodIndex].contains(".method")) {
                                        val methodDeclaration = fContent[methodIndex]
                                        
                                        // InstaEclipse signature: final void() with 0 parameters
                                        if (methodDeclaration.contains("final") &&
                                            methodDeclaration.contains("()V")) {
                                            hasTargetMethod = true
                                        }
                                        break
                                    }
                                }
                            }
                            
                            hasTargetMethod
                        }
                        
                        if (candidates.size == 1) {
                            ghostStoryFile = candidates[0]
                            success("Ghost story source class found after filtering: ${ghostStoryFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates (size filtered: ${sizeFiltered.size})")
                        } else {
                            // Take first candidate, matching InstaEclipse behavior
                            ghostStoryFile = candidates.first()
                            success("Ghost story source class found (selected first of ${candidates.size}): ${ghostStoryFile.name}")
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost story patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostStoryFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find method containing "media/seen/" const-string
                // InstaEclipse signature: final void () with 0 parameters
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("media/seen/")) {
                        // Search backwards to find method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Match InstaEclipse: final void method with 0 parameters
                                if (methodDeclaration.contains("final") &&
                                    methodDeclaration.contains("()V")) {  // void return type with no params
                                    
                                    methodLine = i
                                    // Find .locals line
                                    for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                        if (fContent[j].contains(".locals")) {
                                            localsLine = j
                                            break
                                        }
                                    }
                                    break
                                }
                                break  // Exit method search
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // Insert after .locals line or after method declaration
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    val lines = listOf(
                        "",
                        "    # Ghost Story - Block story seen tracking",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStoryEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_story_continue",
                        "    return-void",
                        "    :ghost_story_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostStoryFile, fContent)
                    success("Ghost story patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost story cannot be found (need: final void with 0 params).")
                }
            }
        }
    )
}
