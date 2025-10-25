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
 * Ghost Mode - Seen Status Patch
 * Prevents Instagram from sending "message read" notifications to other users.
 * Based on InstaEclipse's SeenState implementation.
 * 
 * How it works in InstaEclipse:
 * - Finds methods containing "mark_thread_seen-" string using DexKit
 * - Hooks the method to check if ghost mode is enabled
 * - If enabled, blocks execution by returning early
 * 
 * How it works in Instafel:
 * - Searches for methods containing "mark_thread_seen-" in smali files
 * - Injects a check at the beginning of the method
 * - If ghost mode is enabled (checked via GhostModeManager.isGhostSeenEnabled()), returns early
 */
@PInfos.PatchInfo(
    name = "Ghost Mode - Seen Status",
    shortname = "ghost_seen",
    desc = "Hide DM read receipts when ghost mode is enabled",
    isSingle = true
)
class GhostSeen : InstafelPatch() {

    lateinit var seenStateFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find seen status method")
        object : InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("mark_thread_seen-"),
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        seenStateFile = result.file
                        success("Ghost Seen source class found: ${result.file.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Seen status method not found. Instagram version may not be supported.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Inject ghost mode check")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(seenStateFile.absolutePath).toMutableList()
                var methodLine = -1
                var methodEndLine = -1

                // Find the method containing "mark_thread_seen-"
                fContent.forEachIndexed { index, line ->
                    if (line.contains("mark_thread_seen-") && methodLine == -1) {
                        // Search backwards to find the method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].trim().startsWith(".method")) {
                                methodLine = i
                                // Find end of method
                                for (j in i + 1 until fContent.size) {
                                    if (fContent[j].trim().startsWith(".end method")) {
                                        methodEndLine = j
                                        break
                                    }
                                }
                                break
                            }
                        }
                    }
                }

                if (methodLine != -1 && methodEndLine != -1) {
                    // Inject ghost mode check right after method declaration
                    val ghostCheckCode = listOf(
                        "    # Ghost Mode - Seen Status check injected by Instafel",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhostSeenEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_seen_disabled",
                        "    return-void",
                        "    :ghost_seen_disabled"
                    )

                    // Insert after the .method line and any .locals or .param directives
                    var insertLine = methodLine + 1
                    while (insertLine < fContent.size && 
                           (fContent[insertLine].trim().startsWith(".locals") || 
                            fContent[insertLine].trim().startsWith(".param") ||
                            fContent[insertLine].trim().startsWith(".annotation") ||
                            fContent[insertLine].trim().isEmpty())) {
                        insertLine++
                        if (fContent[insertLine - 1].trim().startsWith(".end annotation")) {
                            break
                        }
                    }

                    fContent.addAll(insertLine, ghostCheckCode)
                    FileUtils.writeLines(seenStateFile, fContent)
                    success("Ghost Seen check successfully injected into method")
                } else {
                    failure("Could not locate proper method boundaries for seen status.")
                }
            }
        }
    )
}
