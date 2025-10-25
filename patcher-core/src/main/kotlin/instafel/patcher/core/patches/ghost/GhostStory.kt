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
    name = "Ghost Story",
    shortname = "ghost_story",
    desc = "View stories anonymously",
    isSingle = true
)
class GhostStory: InstafelPatch() {

    lateinit var ghostStoryFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost story source file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("media/seen/"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostStoryFile = result.file
                        success("Ghost story source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost story.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost story patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostStoryFile.absolutePath).toMutableList()
                var methodLine = -1

                fContent.forEachIndexed { index, line ->
                    if (line.contains("media/seen/")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                if (methodDeclaration.contains("final")) {
                                    methodLine = i
                                    break
                                }
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    val lines = listOf(
                        "",
                        "    # Ghost Story - Block story seen tracking",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStoryEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_story_continue",
                        "    return-void",
                        "    :ghost_story_continue",
                        ""
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostStoryFile, fContent)
                    success("Ghost story patch successfully applied")
                } else {
                    failure("Required method for ghost story cannot be found.")
                }
            }
        }
    )
}
