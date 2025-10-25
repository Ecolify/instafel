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
                var isStaticFinal = false

                fContent.forEachIndexed { index, line ->
                    if (line.contains("mark_thread_seen-")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                isStaticFinal = methodDeclaration.contains("static") && methodDeclaration.contains("final")
                                if (isStaticFinal) {
                                    methodLine = i
                                    break
                                }
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    val lines = listOf(
                        "",
                        "    # Ghost Seen - Block read receipts",
                        "    invoke-static {}, Linstafel/app/managers/GhostModeManager;->isGhostSeenEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_seen_continue",
                        "    return-void",
                        "    :ghost_seen_continue",
                        ""
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostSeenFile, fContent)
                    success("Ghost seen patch successfully applied")
                } else {
                    failure("Required method for ghost seen cannot be found.")
                }
            }
        }
    )
}
