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
 * Ghost Screenshot patch - prevents screenshot detection
 * Based on InstaEclipse implementation
 */
@PInfos.PatchInfo(
    name = "Ghost Screenshot",
    shortname = "ghost_screenshot",
    desc = "Prevent screenshot detection notifications",
    isSingle = true
)
class GhostScreenshot : InstafelPatch() {

    lateinit var screenshotFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find screenshot notification method")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("ScreenshotNotificationManager"),
                            listOf("(J)V")
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        screenshotFile = result.file
                        success("Ghost screenshot source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no matching class found for screenshot detection")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Add ghost screenshot check")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(screenshotFile.absolutePath).toMutableList()
                var methodStartLine = -1

                // Find methods that handle screenshot notifications
                fContent.forEachIndexed { index, line ->
                    if (line.contains("ScreenshotNotificationManager") && methodStartLine == -1) {
                        // Find the method start
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method") && 
                                (fContent[i].contains("static") || fContent[i].contains("public"))) {
                                // Check if method signature matches (void method with long parameter)
                                if (fContent[i].contains("(J)V") || fContent[i].contains("(Ljava/lang/Long;)V")) {
                                    methodStartLine = i
                                    break
                                }
                            }
                        }
                    }
                }

                if (methodStartLine == -1) {
                    failure("Could not find screenshot notification method")
                    return
                }

                // Add ghost mode check at the beginning of the method
                val ghostCheckCode = listOf(
                    "",
                    "    # Ghost Mode screenshot check",
                    "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshotEnabled()Z",
                    "    move-result v0",
                    "    if-eqz v0, :ghost_screenshot_off",
                    "    return-void",
                    "    :ghost_screenshot_off",
                    ""
                )

                // Find the first line after .locals
                var insertLine = methodStartLine + 1
                for (i in methodStartLine until fContent.size) {
                    if (fContent[i].contains(".locals")) {
                        insertLine = i + 1
                        break
                    }
                }

                fContent.addAll(insertLine, ghostCheckCode)

                FileUtils.writeLines(screenshotFile, fContent)
                success("Ghost screenshot patch applied successfully")
            }
        }
    )
}
