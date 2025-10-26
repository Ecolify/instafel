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
    desc = "Prevent screenshot detection notifications",
    isSingle = false
)
class GhostScreenshot: InstafelPatch() {

    lateinit var ghostScreenshotFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find screenshot notification method")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("ScreenshotNotificationManager"),
                            listOf(".method")  // any method in the class
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostScreenshotFile = result.file
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
                val fContent = smaliUtils.getSmaliFileContent(ghostScreenshotFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find the method containing "ScreenshotNotificationManager" with compatible signatures
                fContent.forEachIndexed { index, line ->
                    if (line.contains("ScreenshotNotificationManager")) {
                        // Search backwards for the method signature
                        // Looking for void method(long) which can be (J)V or (Ljava/lang/Long;)V
                        for (i in index downTo 0) {
                            val methodDef = fContent[i]
                            if (methodDef.contains(".method") && 
                                (methodDef.contains("(J)V") || methodDef.contains("(Ljava/lang/Long;)V"))) {
                                methodLine = i
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // Add early return to prevent screenshot notification
                    val lines = listOf(
                        "",
                        "    # Ghost Screenshot: Block screenshot detection",
                        "    invoke-static {}, Linstafel/ifl/GhostModeUtils;->isGhostScreenshotEnabled()Z",
                        "",
                        "    move-result v0",
                        "",
                        "    if-eqz v0, :ghost_screenshot_disabled",
                        "",
                        "    return-void",
                        "",
                        "    :ghost_screenshot_disabled"
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostScreenshotFile, fContent)
                    success("Ghost screenshot patch applied successfully")
                } else {
                    failure("Required method cannot be found.")
                }
            }
        }
    )
}
