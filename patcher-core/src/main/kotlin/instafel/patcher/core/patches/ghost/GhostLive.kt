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
 * Ghost Live - Prevents live viewer tracking
 * 
 * REFERENCE: No InstaEclipse equivalent exists
 * This feature was developed through reverse engineering Instagram's live tracking mechanism.
 * 
 * IMPLEMENTATION:
 * Targets methods containing "live_viewer_invite" string which is used to notify the
 * broadcaster of viewers joining their live stream. The method is typically static or final,
 * indicating it's an API endpoint for live viewer notifications.
 * 
 * APPROACH:
 * 1. Search for methods containing "live_viewer_invite" or "send_live_viewer_invite_message"
 * 2. Prefer static/final methods as they're typically API endpoints
 * 3. Inject early return when GhostModeManager.isGhostLiveEnabled() returns true
 * 4. This prevents the live viewer notification from being sent to the broadcaster
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
        // Size filtering to exclude test/stub classes and overly complex classes
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost live source file")
        object: InstafelTask() {
            override fun execute() {
                val searchPattern = listOf(
                    listOf("live_viewer_invite"),
                    listOf("invoke-")
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostLiveFile = result.file
                        success("Ghost Live source class found successfully: ${ghostLiveFile.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for Ghost Live.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        val candidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        if (candidates.size == 1) {
                            ghostLiveFile = candidates[0]
                            success("Ghost Live source class found after filtering: ${ghostLiveFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            // Multiple candidates remain - apply additional filtering
                            // Prefer files with static/final methods as they're typically API endpoints
                            val refinedCandidates = candidates.filter { file ->
                                val content = smaliUtils.getSmaliFileContent(file.absolutePath)
                                content.any { line ->
                                    line.contains("const-string") && 
                                    line.contains("live_viewer_invite") &&
                                    // Look backwards for method that contains this string
                                    content.indexOfFirst { it == line }.let { idx ->
                                        (idx downTo maxOf(0, idx - 50)).any { i ->
                                            content[i].contains(".method") && 
                                            (content[i].contains("static") || content[i].contains("final"))
                                        }
                                    }
                                }
                            }
                            
                            if (refinedCandidates.size == 1) {
                                ghostLiveFile = refinedCandidates[0]
                                success("Ghost Live source class selected after refinement: ${ghostLiveFile.name}")
                            } else if (refinedCandidates.isEmpty()) {
                                // Fall back to first candidate if refinement fails
                                ghostLiveFile = candidates.first()
                                success("Ghost Live source class selected (best match from ${candidates.size}): ${ghostLiveFile.name}")
                            } else {
                                // Still multiple - take first as best guess
                                ghostLiveFile = refinedCandidates.first()
                                success("Ghost Live source class selected (first of ${refinedCandidates.size} refined): ${ghostLiveFile.name}")
                            }
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

                // Find the method containing "live_viewer_invite"
                // Prefer static/final methods as they're typically API endpoints
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("live_viewer_invite")) {
                        // Search backwards for the enclosing method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer static/final methods (API endpoints)
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    methodLine = i
                                    
                                    // Find .locals directive for proper insertion point
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
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    // Inject early return when Ghost Live is enabled
                    // This prevents live viewer notifications from being sent
                    val lines = listOf(
                        "",
                        "    # Ghost Live - Block live viewer tracking",
                        "    # Prevents sending notifications when user joins a live stream",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostLiveEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_live_continue",
                        "    return-void",
                        "    :ghost_live_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostLiveFile, fContent)
                    success("Ghost Live patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for Ghost Live cannot be found (need: static/final method with live_viewer_invite string).")
                }
            }
        }
    )
}