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
 * Ghost Typing patch - prevents typing indicator from being sent
 * Based on InstaEclipse implementation
 */
@PInfos.PatchInfo(
    name = "Ghost Typing",
    shortname = "ghost_typing",
    desc = "Prevent typing indicator from being sent",
    isSingle = true
)
class GhostTyping : InstafelPatch() {

    lateinit var typingFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find typing indicator method")
        object : InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("is_typing_indicator_enabled")
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        typingFile = result.file
                        success("Ghost typing source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no matching class found for typing indicator")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Add ghost typing check")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(typingFile.absolutePath).toMutableList()
                var methodStartLine = -1

                // Find the method that handles typing indicator
                fContent.forEachIndexed { index, line ->
                    if (line.contains("is_typing_indicator_enabled") && methodStartLine == -1) {
                        // Find the method start
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method") && 
                                (fContent[i].contains("static") || fContent[i].contains("public"))) {
                                methodStartLine = i
                                break
                            }
                        }
                    }
                }

                if (methodStartLine == -1) {
                    failure("Could not find method containing 'is_typing_indicator_enabled'")
                    return
                }

                // Add ghost mode check at the beginning of the method
                val ghostCheckCode = listOf(
                    "    # Ghost Mode typing check",
                    "    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTyping:Z",
                    "    if-eqz v0, :ghost_typing_off",
                    "    return-void",
                    "    :ghost_typing_off"
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

                FileUtils.writeLines(typingFile, fContent)
                success("Ghost typing patch applied successfully")
            }
        }
    )
}
