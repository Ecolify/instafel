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
                            listOf(".method", "(J)V")
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
                var localsLine = -1

                // Find all methods with signature (J)V (void method with long parameter)
                fContent.forEachIndexed { index, line ->
                    if (line.contains(".method") && methodStartLine == -1) {
                        // Check if method signature matches: void method with long parameter (J)V
                        if (line.contains("(J)V")) {
                            // Prefer methods with static or final modifiers
                            val isStaticOrFinal = line.contains("static") || line.contains("final")
                            if (isStaticOrFinal) {
                                methodStartLine = index
                                // Find .locals line
                                for (j in methodStartLine until minOf(methodStartLine + 10, fContent.size)) {
                                    if (fContent[j].contains(".locals")) {
                                        localsLine = j
                                        break
                                    }
                                }
                                // Found a suitable method, stop searching
                                return@forEachIndexed
                            }
                        }
                    }
                }

                if (methodStartLine == -1) {
                    failure("Could not find screenshot notification method with signature (J)V")
                    return
                }

                // Insert after .locals line or after method declaration
                val insertLine = if (localsLine != -1) localsLine + 1 else methodStartLine + 1

                // Add ghost mode check at the beginning of the method
                val ghostCheckCode = listOf(
                    "",
                    "    # Ghost Screenshot - Block screenshot notifications",
                    "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostScreenshotEnabled()Z",
                    "    move-result v0",
                    "    if-eqz v0, :ghost_screenshot_continue",
                    "    return-void",
                    "    :ghost_screenshot_continue",
                    ""
                )

                fContent.add(insertLine, ghostCheckCode.joinToString("\n"))
                FileUtils.writeLines(screenshotFile, fContent)
                success("Ghost screenshot patch applied successfully")
            }
        }
    )
}
