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
 * Ghost ViewOnce patch - prevents view once media from being marked as seen
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.ViewOnce)
 * which hooks methods containing both "visual_item_seen" and "send_visual_item_seen_marker"
 * strings. This patch adapts that approach for smali patching by:
 * 
 * 1. Using multiple search patterns to find the correct file:
 *    - Pattern 1: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "permanent"
 *    - Pattern 2: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "replayed"
 *    - Pattern 3: Fallback to just "visual_item_seen" and "send_visual_item_seen_marker"
 * 2. Finding the method that contains both marker strings within its body
 * 3. Injecting an early return when ghost viewonce is enabled
 * 
 * The method signature in InstaEclipse is (?,?,AbstractClassType) -> void,
 * and it checks the third parameter at runtime. For smali patching, we instead
 * inject a static check that prevents the method from executing.
 */
@PInfos.PatchInfo(
    name = "Ghost ViewOnce",
    shortname = "ghost_viewonce",
    desc = "View once messages without marking as seen",
    isSingle = true
)
class GhostViewOnce: InstafelPatch() {

    lateinit var ghostViewOnceFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost viewonce source file")
        object: InstafelTask() {
            override fun execute() {
                // Try multiple search patterns in order of specificity
                val searchPatterns = listOf(
                    // Pattern 1: Include "permanent" - likely in view once handling
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker"),
                        listOf("permanent")
                    ),
                    // Pattern 2: Include "replayed" - related to view once replay
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker"),
                        listOf("replayed")
                    ),
                    // Pattern 3: Just the two main strings
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker")
                    )
                )
                
                for ((index, pattern) in searchPatterns.withIndex()) {
                    when (val result = runBlocking {
                        SearchUtils.getFileContainsAllCords(smaliUtils, pattern)
                    }) {
                        is FileSearchResult.Success -> {
                            ghostViewOnceFile = result.file
                            val patternDesc = when(index) {
                                0 -> "with permanent marker"
                                1 -> "with replayed marker"
                                else -> "basic search"
                            }
                            success("Ghost viewonce source class found successfully ($patternDesc)")
                            break
                        }
                        is FileSearchResult.NotFound -> {
                            if (index == searchPatterns.size - 1) {
                                // Last pattern and still not found
                                failure("Patch aborted because no classes found for ghost viewonce. Found ${result.scannedFiles} candidate files.")
                            }
                            // Try next pattern
                            continue
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost viewonce patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostViewOnceFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find the method that contains both marker strings
                var foundMethod = false
                fContent.forEachIndexed { index, line ->
                    if (foundMethod) return@forEachIndexed
                    
                    if (line.contains("visual_item_seen") || line.contains("send_visual_item_seen_marker")) {
                        // Search backwards to find the method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer methods with static or final modifiers
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    // Find method end to verify both strings are in this method
                                    var methodEndLine = -1
                                    for (j in i until fContent.size) {
                                        if (fContent[j].contains(".end method")) {
                                            methodEndLine = j
                                            break
                                        }
                                    }
                                    
                                    // Check if both strings are in this method
                                    if (methodEndLine != -1) {
                                        val methodContent = fContent.subList(i, methodEndLine + 1)
                                        val hasVisualItemSeen = methodContent.any { it.contains("visual_item_seen") }
                                        val hasSendMarker = methodContent.any { it.contains("send_visual_item_seen_marker") }
                                        
                                        if (hasVisualItemSeen && hasSendMarker) {
                                            methodLine = i
                                            // Find .locals line
                                            for (j in methodLine until minOf(methodLine + 10, fContent.size)) {
                                                if (fContent[j].contains(".locals")) {
                                                    localsLine = j
                                                    break
                                                }
                                            }
                                            foundMethod = true
                                            break
                                        }
                                    }
                                }
                                break // Exit method search once we've checked this method
                            }
                        }
                    }
                }

                if (methodLine != -1) {
                    // Insert after .locals line or after method declaration
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    val lines = listOf(
                        "",
                        "    # Ghost ViewOnce - Block view once seen markers",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_viewonce_continue",
                        "    return-void",
                        "    :ghost_viewonce_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostViewOnceFile, fContent)
                    success("Ghost viewonce patch successfully applied")
                } else {
                    failure("Required method for ghost viewonce cannot be found.")
                }
            }
        }
    )
}
