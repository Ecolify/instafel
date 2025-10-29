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
 * Ghost Story - Prevents story view tracking (anonymous story viewing)
 * 
 * REFERENCE: InstaEclipse StorySeen.java
 * - Finds methods containing "media/seen/" string
 * - Hooks final void methods with 0 parameters
 * - Blocks execution when Ghost Story is enabled
 * 
 * IMPLEMENTATION:
 * This patch locates the method responsible for marking stories as seen by searching
 * for the exact "media/seen/" const-string (without query parameters). It validates
 * the method is final void with no parameters and injects an early return check.
 * When GhostModeManager.isGhostStoryEnabled() returns true, story view tracking is blocked.
 * 
 * METHOD SIGNATURE REQUIREMENTS:
 * - Must be final void with no parameters ()V
 * - Must contain exact "media/seen/" string (not with ? or query params)
 * 
 * FILTERING STRATEGY:
 * - Searches for files containing both const-string "media/seen/" and .method
 * - Filters by size (100-1000 lines) to get implementation files
 * - Ensures exact match of "media/seen/" without query parameters
 * - Validates method is final void with no parameters
 * 
 * BEHAVIOR:
 * - Active: Stories are viewable without marking as seen to the story owner
 * - Inactive: Normal Instagram story view tracking works
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
                val searchPattern = listOf(
                    listOf("const-string", "\"media/seen/\""),
                    listOf(".method")
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
                        val candidates = result.files.filter { file ->
                            val content = smaliUtils.getSmaliFileContent(file.absolutePath)
                            val lineCount = content.size
                            
                            if (lineCount !in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES) {
                                return@filter false
                            }
                            
                            val hasExactMediaSeen = content.any { line ->
                                line.contains("const-string") && 
                                line.contains("\"media/seen/\"") &&
                                !line.contains("?")
                            }
                            
                            if (!hasExactMediaSeen) {
                                return@filter false
                            }
                            
                            content.any { line ->
                                line.contains(".method") &&
                                line.contains("final") &&
                                line.contains("()V")
                            }
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

                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("media/seen/")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                if (methodDeclaration.contains("final") &&
                                    methodDeclaration.contains("()V")) {
                                    
                                    methodLine = i
                                    for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                        if (fContent[j].contains(".locals")) {
                                            localsLine = j
                                            break
                                        }
                                    }
                                    break
                                }
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
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