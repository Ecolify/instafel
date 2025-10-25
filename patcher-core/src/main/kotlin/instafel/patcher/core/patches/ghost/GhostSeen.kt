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
 * Ghost Seen patch - prevents "seen" status from being sent
 * Based on InstaEclipse implementation
 */
@PInfos.PatchInfo(
    name = "Ghost Seen",
    shortname = "ghost_seen",
    desc = "Prevent message seen status from being sent",
    isSingle = true
)
class GhostSeen : InstafelPatch() {

    lateinit var seenFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find seen status method")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("mark_thread_seen-")
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        seenFile = result.file
                        success("Ghost seen source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no matching class found for seen status")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Add ghost seen check")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(seenFile.absolutePath).toMutableList()
                var methodStartLine = -1

                // Find the method that handles seen status
                fContent.forEachIndexed { index, line ->
                    if (line.contains("mark_thread_seen-") && methodStartLine == -1) {
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
                    failure("Could not find method containing 'mark_thread_seen-'")
                    return
                }

                // Add ghost mode check at the beginning of the method
                val ghostCheckCode = listOf(
                    "    # Ghost Mode check",
                    "    sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z",
                    "    if-eqz v0, :ghost_mode_off",
                    "    return-void",
                    "    :ghost_mode_off"
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

                FileUtils.writeLines(seenFile, fContent)
                success("Ghost seen patch applied successfully")
            }
        }
    )
}
