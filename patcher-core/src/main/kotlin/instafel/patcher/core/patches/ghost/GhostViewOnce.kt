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
 * Ghost Mode - ViewOnce Patch
 * Prevents Instagram from notifying senders when ViewOnce messages are viewed.
 * Based on InstaEclipse's ViewOnce implementation.
 */
@PInfos.PatchInfo(
    name = "Ghost Mode - ViewOnce",
    shortname = "ghost_view_once",
    desc = "View ViewOnce messages anonymously when ghost mode is enabled",
    isSingle = true
)
class GhostViewOnce : InstafelPatch() {

    lateinit var viewOnceFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ViewOnce seen method")
        object : InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(
                        smaliUtils,
                        listOf(
                            listOf("visual_item_seen"),
                        )
                    )
                }) {
                    is FileSearchResult.Success -> {
                        viewOnceFile = result.file
                        success("Ghost ViewOnce source class found: ${result.file.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("ViewOnce seen method not found. Instagram version may not be supported.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Inject ghost mode check")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(viewOnceFile.absolutePath).toMutableList()
                var methodLine = -1

                // Find the method containing "visual_item_seen"
                fContent.forEachIndexed { index, line ->
                    if (line.contains("visual_item_seen") && methodLine == -1) {
                        for (i in index downTo 0) {
                            val methodDecl = fContent[i].trim()
                            // Look for void method with 3 parameters
                            if (methodDecl.startsWith(".method") && methodDecl.contains(")V")) {
                                // Count parameters - should be 3
                                val paramStart = methodDecl.indexOf('(')
                                val paramEnd = methodDecl.indexOf(')')
                                if (paramStart != -1 && paramEnd != -1) {
                                    val params = methodDecl.substring(paramStart + 1, paramEnd)
                                    // Simple parameter count (count L for objects and primitive type letters)
                                    val paramCount = params.count { it == 'L' || it in "ZBCSIJFD" }
                                    if (paramCount >= 3) {
                                        methodLine = i
                                        break
                                    }
                                }
                            }
                        }
                    }
                }

                if (methodLine != -1) {
                    val ghostCheckCode = listOf(
                        "    # Ghost Mode - ViewOnce check",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhostViewOnceEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_viewonce_disabled",
                        "    return-void",
                        "    :ghost_viewonce_disabled"
                    )

                    var insertLine = methodLine + 1
                    while (insertLine < fContent.size && 
                           (fContent[insertLine].trim().startsWith(".locals") || 
                            fContent[insertLine].trim().startsWith(".param") ||
                            fContent[insertLine].trim().isEmpty())) {
                        insertLine++
                    }

                    fContent.addAll(insertLine, ghostCheckCode)
                    FileUtils.writeLines(viewOnceFile, fContent)
                    success("Ghost ViewOnce check successfully injected")
                } else {
                    failure("Could not locate ViewOnce seen method.")
                }
            }
        }
    )
}
