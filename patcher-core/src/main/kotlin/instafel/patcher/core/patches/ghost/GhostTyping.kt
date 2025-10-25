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
 * Ghost Mode - Typing Status Patch
 * Prevents Instagram from sending typing indicators in direct messages.
 * Based on InstaEclipse's TypingStatus implementation.
 */
@PInfos.PatchInfo(
    name = "Ghost Mode - Typing Status",
    shortname = "ghost_typing",
    desc = "Hide typing indicators when ghost mode is enabled",
    isSingle = true
)
class GhostTyping : InstafelPatch() {

    lateinit var typingStatusFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find typing indicator method")
        object : InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("is_typing_indicator_enabled"),
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        typingStatusFile = result.file
                        success("Ghost Typing source class found: ${result.file.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Typing indicator method not found. Instagram version may not be supported.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Inject ghost mode check")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(typingStatusFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find the method containing "is_typing_indicator_enabled"
                fContent.forEachIndexed { index, line ->
                    if (line.contains("is_typing_indicator_enabled") && methodLine == -1) {
                        for (i in index downTo 0) {
                            if (fContent[i].trim().startsWith(".method")) {
                                methodLine = i
                                break
                            }
                        }
                    }
                }

                if (methodLine != -1) {
                    val ghostCheckCode = listOf(
                        "    # Ghost Mode - Typing Status check",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhostTypingEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_typing_disabled",
                        "    return-void",
                        "    :ghost_typing_disabled"
                    )

                    var insertLine = methodLine + 1
                    while (insertLine < fContent.size && 
                           (fContent[insertLine].trim().startsWith(".locals") || 
                            fContent[insertLine].trim().startsWith(".param") ||
                            fContent[insertLine].trim().isEmpty())) {
                        insertLine++
                    }

                    fContent.addAll(insertLine, ghostCheckCode)
                    FileUtils.writeLines(typingStatusFile, fContent)
                    success("Ghost Typing check successfully injected")
                } else {
                    failure("Could not locate typing indicator method.")
                }
            }
        }
    )
}
