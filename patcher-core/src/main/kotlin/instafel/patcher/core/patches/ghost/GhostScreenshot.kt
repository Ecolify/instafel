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
    name = "Ghost Screenshot",
    shortname = "ghost_screenshot",
    desc = "Block screenshot detection notifications",
    isSingle = true
)
class GhostScreenshot: InstafelPatch() {

    lateinit var ghostScreenshotFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost screenshot source file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("ScreenshotNotificationManager"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostScreenshotFile = result.file
                        success("Ghost screenshot source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost screenshot.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost screenshot patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostScreenshotFile.absolutePath).toMutableList()
                var methodLine = -1

                fContent.forEachIndexed { index, line ->
                    if (line.contains("ScreenshotNotificationManager")) {
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
                    val lines = listOf(
                        "",
                        "    # Ghost Screenshot - Block screenshot detection",
                        "    invoke-static {}, Linstafel/app/managers/GhostModeManager;->isGhostScreenshotEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_screenshot_continue",
                        "    return-void",
                        "    :ghost_screenshot_continue",
                        ""
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostScreenshotFile, fContent)
                    success("Ghost screenshot patch successfully applied")
                } else {
                    failure("Required method for ghost screenshot cannot be found.")
                }
            }
        }
    )
}
