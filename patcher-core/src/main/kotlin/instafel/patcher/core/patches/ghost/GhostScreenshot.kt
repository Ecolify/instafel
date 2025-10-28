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
 * Ghost Screenshot - Prevents screenshot detection
 * 
 * Based on InstaEclipse: hooks void method with long parameter (J)V in classes
 * containing "ScreenshotNotificationManager" string.
 */
@PInfos.PatchInfo(
    name = "Ghost Screenshot",
    shortname = "ghost_screenshot",
    desc = "Prevent screenshot detection notifications",
    isSingle = true
)
class GhostScreenshot : InstafelPatch() {

    lateinit var screenshotFile: File

    companion object {
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find screenshot notification method")
        object: InstafelTask() {
            override fun execute() {
                val searchPattern = listOf(
                    listOf("ScreenshotNotificationManager"),
                    listOf(".method"),
                    listOf("(J)V")
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        screenshotFile = result.file
                        success("Ghost screenshot source class found successfully: ${screenshotFile.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no matching class found for screenshot detection")
                    }
                    is FileSearchResult.MultipleFound -> {
                        screenshotFile = result.files.first()
                        success("Ghost screenshot source class found (picked first of ${result.files.size}): ${screenshotFile.name}")
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

                fContent.forEachIndexed { index, line ->
                    if (methodStartLine == -1 && line.contains(".method") && line.contains("(J)V")) {
                        methodStartLine = index
                        for (j in methodStartLine until minOf(methodStartLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                            if (fContent[j].contains(".locals")) {
                                localsLine = j
                                break
                            }
                        }
                        return@forEachIndexed
                    }
                }

                if (methodStartLine == -1) {
                    failure("Could not find screenshot notification method with signature (J)V")
                    return
                }

                val insertLine = if (localsLine != -1) localsLine + 1 else methodStartLine + 1

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
                success("Ghost screenshot patch applied successfully to method at line $methodStartLine")
            }
        }
    )
}