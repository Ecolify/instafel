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
    name = "Ghost Typing",
    shortname = "ghost_typing",
    desc = "Prevent typing indicator from being sent",
    isSingle = false
)
class GhostTyping: InstafelPatch() {

    lateinit var ghostTypingFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find typing indicator method")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("is_typing_indicator_enabled"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostTypingFile = result.file
                        success("Ghost typing source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no matching class found for typing indicator")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Add ghost typing check")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostTypingFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find the method containing "is_typing_indicator_enabled"
                fContent.forEachIndexed { index, line ->
                    if (line.contains("is_typing_indicator_enabled")) {
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
                    // Add early return to prevent typing indicator
                    val lines = listOf(
                        "",
                        "    # Ghost Typing: Block typing indicator from being sent",
                        "    invoke-static {}, Linstafel/ifl/GhostModeUtils;->isGhostTypingEnabled()Z",
                        "",
                        "    move-result v0",
                        "",
                        "    if-eqz v0, :ghost_typing_disabled",
                        "",
                        "    return-void",
                        "",
                        "    :ghost_typing_disabled"
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostTypingFile, fContent)
                    success("Ghost typing patch applied successfully")
                } else {
                    failure("Required method cannot be found.")
                }
            }
        }
    )
}
