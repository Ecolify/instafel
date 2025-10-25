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
 * Ghost Mode - Screenshot Detection Patch
 * Prevents Instagram from detecting and notifying when screenshots are taken.
 * Based on InstaEclipse's ScreenshotDetection implementation.
 */
@PInfos.PatchInfo(
    name = "Ghost Mode - Screenshot Detection",
    shortname = "ghost_screenshot",
    desc = "Block screenshot notifications when ghost mode is enabled",
    isSingle = true
)
class GhostScreenshot : InstafelPatch() {

    lateinit var screenshotFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find screenshot notification method")
        object : InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("ScreenshotNotificationManager"),
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        screenshotFile = result.file
                        success("Ghost Screenshot source class found: ${result.file.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Screenshot notification method not found. Instagram version may not be supported.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Inject ghost mode check")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(screenshotFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find method in the ScreenshotNotificationManager class
                fContent.forEachIndexed { index, line ->
                    if (line.contains("ScreenshotNotificationManager") && methodLine == -1) {
                        for (i in index downTo 0) {
                            val methodDecl = fContent[i].trim()
                            // Look for void method with single long parameter
                            if (methodDecl.startsWith(".method") && methodDecl.contains("(J)V")) {
                                methodLine = i
                                break
                            }
                        }
                    }
                }

                if (methodLine != -1) {
                    val ghostCheckCode = listOf(
                        "    # Ghost Mode - Screenshot Detection check",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhostScreenshotEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_screenshot_disabled",
                        "    return-void",
                        "    :ghost_screenshot_disabled"
                    )

                    var insertLine = methodLine + 1
                    while (insertLine < fContent.size && 
                           (fContent[insertLine].trim().startsWith(".locals") || 
                            fContent[insertLine].trim().startsWith(".param") ||
                            fContent[insertLine].trim().isEmpty())) {
                        insertLine++
                    }

                    fContent.addAll(insertLine, ghostCheckCode)
                    FileUtils.writeLines(screenshotFile, fContent)
                    success("Ghost Screenshot check successfully injected")
                } else {
                    failure("Could not locate screenshot notification method.")
                }
            }
        }
    )
}
