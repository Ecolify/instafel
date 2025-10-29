package instafel.patcher.core.patches

import instafel.patcher.core.utils.Env
import instafel.patcher.core.utils.Log
import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.modals.FileSearchResult
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import kotlinx.coroutines.runBlocking
import org.apache.commons.io.FileUtils
import java.io.File

/**
 * Change Visible Channel Name - Brands Instagram with Instafel name
 * 
 * PURPOSE:
 * This patch modifies Instagram's internal channel name display to show
 * "Instafel" instead of the original channel names (NONE, ALPHA, BETA, PROD).
 * This provides clear visual indication that the modded version is running.
 * 
 * IMPLEMENTATION:
 * Locates the class containing all channel name const-strings and replaces
 * them with "Instafel" or "Instafel vX" based on the build version.
 * 
 * PROCESS:
 * 1. Search for class containing all four channel name strings
 *    - "NONE", "ALPHA", "BETA", "PROD"
 * 2. Cache the file path for faster subsequent runs
 * 3. Replace all channel name strings with Instafel branding
 * 4. Include version number if available (e.g., "Instafel v300")
 * 
 * TECHNICAL DETAILS:
 * - Uses path caching (pVClassPath) to speed up repeated patching
 * - Modifies const-string declarations in smali code
 * - Version number comes from Env.Project.iflVersion
 * 
 * BEHAVIOR:
 * - Active: Developer options and system info show "Instafel" as channel name
 * - Provides clear identification of modded Instagram version
 * - Helps distinguish from official Instagram builds
 * 
 * VISIBILITY:
 * The changed name appears in:
 * - Developer Options menu (if unlocked)
 * - System information screens
 * - Debug logs and crash reports
 */
@PInfos.PatchInfo(
    name = "Change Visible Channel Name",
    shortname = "change_channel_name",
    desc = "Change visible channel name in Developer Options",
    isSingle = true
)
class ChangeVisibleChannelName: InstafelPatch() {

    lateinit var constFile: File
    var searchConstStrings = listOf( "\"NONE\"", "\"ALPHA\"", "\"BETA\"", "\"PROD\"")

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find const definition class in X classes")
        object: InstafelTask() {
            override fun execute() {
                val cachePath = Env.Project.pVClassPath.ifEmpty { "NFN" }

                if (cachePath != "NFN") {
                    constFile = File(cachePath)
                    success("File path cached in project dir")
                    return
                }

                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf( "\"NONE\""),
                            listOf("\"ALPHA\""),
                            listOf("\"BETA\""),
                            listOf("\"PROD\"")
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        constFile = result.file
                        success("Const definition class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no any classes found.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        failure("Patch aborted: Found ${result.files.size} candidate files. Need more specific search conditions.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Change string constraints in file")
        object: InstafelTask() {
            override fun execute() {
                val sContent = smaliUtils.getSmaliFileContent(constFile.absolutePath).toMutableList()

                sContent.forEachIndexed { i, line ->
                    searchConstStrings.forEach { searchConst ->
                        if (line.contains(searchConst)) {
                            val iflVer = Env.Project.iflVersion
                            val changeToStr = if (iflVer == 0) "Instafel" else "Instafel v$iflVer "
                            sContent[i] = line.replace(searchConst, "\"$changeToStr\"")
                            Log.info("Constraint $searchConst found at line $i")
                        }
                    }
                }

                FileUtils.writeLines(constFile, sContent)
                success("All changeable channel name constrains updated successfully.")
            }
        }
    )
}