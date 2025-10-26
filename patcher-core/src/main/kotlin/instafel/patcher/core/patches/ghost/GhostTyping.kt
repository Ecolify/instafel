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
    desc = "Hide typing indicator in Direct Messages",
    isSingle = true
)
class GhostTyping: InstafelPatch() {

    lateinit var ghostTypingFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost typing source file")
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
                    is FileSearchResult.MultipleFound -> {
                        failure("Found multiple candidate files. Add more search conditions to narrow down results.")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost typing.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost typing patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostTypingFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                fContent.forEachIndexed { index, line ->
                    if (line.contains("is_typing_indicator_enabled")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer methods with static or final modifiers
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    methodLine = i
                                    // Find .locals line
                                    for (j in methodLine until minOf(methodLine + 10, fContent.size)) {
                                        if (fContent[j].contains(".locals")) {
                                            localsLine = j
                                            break
                                        }
                                    }
                                    break
                                }
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // Insert after .locals line or after method declaration
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    val lines = listOf(
                        "",
                        "    # Ghost Typing - Block typing indicator",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostTypingEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_typing_continue",
                        "    return-void",
                        "    :ghost_typing_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostTypingFile, fContent)
                    success("Ghost typing patch successfully applied")
                } else {
                    failure("Required method for ghost typing cannot be found.")
                }
            }
        }
    )
}
