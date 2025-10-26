package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.modals.FileSearchResult
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import kotlinx.coroutines.runBlocking
import org.apache.commons.io.FileUtils
import java.io.File

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
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("visual_item_seen"),
                            listOf("send_visual_item_seen_marker")
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        ghostViewOnceFile = result.file
                        success("Ghost viewonce source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost viewonce.")
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
                var methodEndLine = -1

                // Find the method that contains both marker strings
                fContent.forEachIndexed { index, line ->
                    if (line.contains("visual_item_seen") || line.contains("send_visual_item_seen_marker")) {
                        // Search backwards to find the method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer methods with static or final modifiers
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    // Find method end to verify both strings are in this method
                                    var tempMethodEnd = -1
                                    for (j in i until fContent.size) {
                                        if (fContent[j].contains(".end method")) {
                                            tempMethodEnd = j
                                            break
                                        }
                                    }
                                    
                                    // Check if both strings are in this method
                                    if (tempMethodEnd != -1) {
                                        val methodContent = fContent.subList(i, tempMethodEnd + 1)
                                        val hasVisualItemSeen = methodContent.any { it.contains("visual_item_seen") }
                                        val hasSendMarker = methodContent.any { it.contains("send_visual_item_seen_marker") }
                                        
                                        if (hasVisualItemSeen && hasSendMarker) {
                                            methodLine = i
                                            methodEndLine = tempMethodEnd
                                            // Find .locals line
                                            for (j in methodLine until minOf(methodLine + 10, fContent.size)) {
                                                if (fContent[j].contains(".locals")) {
                                                    localsLine = j
                                                    break
                                                }
                                            }
                                            break
                                        }
                                    }
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
