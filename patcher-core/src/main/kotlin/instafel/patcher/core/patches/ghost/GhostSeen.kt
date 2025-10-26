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
 * Ghost Seen patch - prevents "seen" status from being sent
 * Based on InstaEclipse implementation
 */
@PInfos.PatchInfo(
    name = "Ghost Seen",
    shortname = "ghost_seen",
    desc = "Hide read receipts in Direct Messages",
    isSingle = true
)
class GhostSeen: InstafelPatch() {

    lateinit var ghostSeenFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost seen source file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("mark_thread_seen-"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostSeenFile = result.file
                        success("Ghost seen source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost seen.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost seen patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostSeenFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                fContent.forEachIndexed { index, line ->
                    if (line.contains("mark_thread_seen-")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer methods with static or final modifiers
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    methodLine = i
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
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // Insert after .locals line or after method declaration
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    val lines = listOf(
                        "",
                        "    # Ghost Seen - Block read receipts",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeenEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_seen_continue",
                        "    return-void",
                        "    :ghost_seen_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostSeenFile, fContent)
                    success("Ghost seen patch successfully applied")
                } else {
                    failure("Required method for ghost seen cannot be found.")
                }
            }
        }
    )
}
