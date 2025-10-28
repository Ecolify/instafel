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
                        // Filter by multiple criteria to find the correct implementation
                        val candidates = result.files.filter { file ->
                            val content = smaliUtils.getSmaliFileContent(file.absolutePath)
                            val lineCount = content.size
                            
                            // Must be within reasonable size range for implementation files
                            if (lineCount !in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES) {
                                return@filter false
                            }
                            
                            // Must have exact "media/seen/" without format parameters
                            val hasExactMediaSeen = content.any { line ->
                                line.contains("const-string") && 
                                line.contains("\"media/seen/\"") &&
                                !line.contains("?")  // Exclude format strings like "media/seen/?reel="
                            }
                            
                            if (!hasExactMediaSeen) {
                                return@filter false
                            }
                            
                            // Must have a final void method with 0 parameters (matching InstaEclipse)
                            val hasFinalVoidMethod = content.any { line ->
                                line.contains(".method") &&
                                line.contains("final") &&
                                line.contains("()V")
                            }
                            
                            hasFinalVoidMethod
                        }
                        
                        if (candidates.size == 1) {
                            ghostStoryFile = candidates[0]
                            success("Ghost story source class found after filtering: ${ghostStoryFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
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
