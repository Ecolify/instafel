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
 * Ghost Live patch - prevents live viewer tracking
 * 
 * NOTE: This patch does not have a direct InstaEclipse reference implementation.
 * It was developed based on reverse engineering Instagram's live viewer tracking.
 * 
 * The patch searches for methods containing "live_viewer_invite" string, which is
 * used by Instagram to track who is viewing live broadcasts. By blocking these
 * methods when ghost mode is enabled, users can watch live videos anonymously.
 * 
 * Since there's no InstaEclipse reference, this patch may need additional verification
 * and refinement based on testing with actual Instagram APKs.
 */
@PInfos.PatchInfo(
    name = "Ghost Live",
    shortname = "ghost_live",
    desc = "Watch live videos anonymously",
    isSingle = true
)
class GhostLive: InstafelPatch() {

    lateinit var ghostLiveFile: File

    companion object {
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost live source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files containing "live_viewer_invite" with method invocations
                val searchPattern = listOf(
                    listOf("live_viewer_invite"),
                    listOf("invoke-")  // Must have method calls
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostLiveFile = result.file
                        success("Ghost live source class found successfully: ${ghostLiveFile.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost live.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        // Filter by file size to get implementation files
                        val candidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        if (candidates.size == 1) {
                            ghostLiveFile = candidates[0]
                            success("Ghost live source class found after filtering: ${ghostLiveFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            // Multiple candidates - take first one as best guess
                            ghostLiveFile = candidates.first()
                            success("Ghost live source class selected (first of ${candidates.size}): ${ghostLiveFile.name}")
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost live patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostLiveFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find method containing "live_viewer_invite" const-string
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("live_viewer_invite")) {
                        // Search backwards to find method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Look for methods that are likely the target
                                // Prefer static/final methods as they're typically API calls
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
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
                        "    # Ghost Live - Block live viewer tracking",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLiveEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_live_continue",
                        "    return-void",
                        "    :ghost_live_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostLiveFile, fContent)
                    success("Ghost live patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost live cannot be found (need method with 'live_viewer_invite' string).")
                }
            }
        }
    )
}
