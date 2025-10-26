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
    name = "Ghost Seen",
    shortname = "ghost_seen",
    desc = "Prevent message seen status from being sent",
    isSingle = false
)
class GhostSeen: InstafelPatch() {

    lateinit var ghostSeenFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find seen status method")
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
                        failure("Patch aborted because no matching class found for seen status")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Add ghost seen check")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostSeenFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find the method containing "mark_thread_seen-"
                fContent.forEachIndexed { index, line ->
                    if (line.contains("mark_thread_seen-")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                methodLine = i
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // Add early return to prevent seen status
                    val lines = listOf(
                        "",
                        "    # Ghost Seen: Block seen status from being sent",
                        "    invoke-static {}, Linstafel/ifl/GhostModeUtils;->isGhostSeenEnabled()Z",
                        "",
                        "    move-result v0",
                        "",
                        "    if-eqz v0, :ghost_seen_disabled",
                        "",
                        "    return-void",
                        "",
                        "    :ghost_seen_disabled"
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostSeenFile, fContent)
                    success("Ghost seen patch applied successfully")
                } else {
                    failure("Required method cannot be found.")
                }
            }
        }
    )
}
