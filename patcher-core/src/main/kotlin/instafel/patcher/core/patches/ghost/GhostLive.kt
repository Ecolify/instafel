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
    name = "Ghost Live",
    shortname = "ghost_live",
    desc = "Watch live videos anonymously",
    isSingle = true
)
class GhostLive: InstafelPatch() {

    lateinit var ghostLiveFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost live source file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("live_viewer_invite"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostLiveFile = result.file
                        success("Ghost live source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost live.")
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

                fContent.forEachIndexed { index, line ->
                    if (line.contains("live_viewer_invite")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
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
                    success("Ghost live patch successfully applied")
                } else {
                    failure("Required method for ghost live cannot be found.")
                }
            }
        }
    )
}
