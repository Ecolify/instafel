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
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.ScreenshotDetection)
 * which finds class containing "ScreenshotNotificationManager" string, then hooks
 * void method(long) signature
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
                // Search for files containing "ScreenshotNotificationManager" with method (J)V signature
                val searchPattern = listOf(
                    listOf("ScreenshotNotificationManager"),
                    listOf(".method"),  // Must have methods
                    listOf("(J)V")  // Must have void method with long parameter
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
                        // If multiple files, take the first one (should be rare)
                        // InstaEclipse also just takes first match
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

                // Find void method with long parameter (J)V - matching InstaEclipse signature
                fContent.forEachIndexed { index, line ->
                    if (methodStartLine == -1 && line.contains(".method") && line.contains("(J)V")) {
                        // Found a method with signature void(long)
                        methodStartLine = index
                        
                        // Find .locals line
                        for (j in methodStartLine until minOf(methodStartLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                            if (fContent[j].contains(".locals")) {
                                localsLine = j
                                break
                            }
                        }
                        
                        // Found the target method, stop searching
                        return@forEachIndexed
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
                success("Ghost screenshot patch applied successfully to method at line $methodStartLine")
            }
        }
    )
}
