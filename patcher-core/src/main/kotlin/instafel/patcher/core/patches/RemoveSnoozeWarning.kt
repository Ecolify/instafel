package instafel.patcher.core.patches

import instafel.patcher.core.source.SmaliParser
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
 * Remove Snooze Warning - Disables Instagram's build expiration warning
 * 
 * PURPOSE:
 * Instagram Alpha and Beta builds have expiration dates. After a certain period,
 * the app shows a warning that the build is outdated and needs to be updated.
 * This patch removes that warning by setting the check duration to 0.
 * 
 * IMPLEMENTATION:
 * This patch locates the DogfoodingEligibilityApi initialization and modifies
 * the days duration parameter to 0, effectively bypassing the expiration check.
 * 
 * PROCESS:
 * 1. Find the class containing "invoke-direct/range" to DogfoodingEligibilityApi
 * 2. Locate the long-to-int conversion 4 lines before the invoke call
 * 3. Replace the long-to-int with const/4 vX, 0x0 to set duration to 0
 * 4. This prevents the expiration warning from appearing
 * 
 * TECHNICAL DETAILS:
 * - DogfoodingEligibilityApi checks build expiration based on days parameter
 * - The patch modifies the constructor parameter before API initialization
 * - Uses register name extraction to maintain code correctness
 * 
 * BEHAVIOR:
 * - Active: Build expiration warnings are suppressed
 * - Allows continued use of Alpha/Beta builds past their expiration date
 * - Essential for testing and development with older builds
 * 
 * NOTE: This is particularly useful for testers and developers who need
 * to use specific Alpha/Beta versions for extended periods.
 */
@PInfos.PatchInfo(
    name = "Remove Snooze Warning",
    shortname = "remove_snooze_warning",
    desc = "You remove build exp warning fragment with this patch",
    isSingle = true
)
class RemoveSnoozeWarning: InstafelPatch() {

    lateinit var callerClass: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find caller file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("invoke-direct/range", "Lcom/instagram/release/lockout/DogfoodingEligibilityApi"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        callerClass = result.file
                        success("DogfoodingEligibilityApi caller class found successfully")
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
        @PInfos.TaskInfo("Set check days duration to 0 for bypass it")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(callerClass.absolutePath).toMutableList()

                val invokeLines = smaliUtils.getContainLines(fContent,
                    "invoke-direct/range",
                    "Lcom/instagram/release/lockout/DogfoodingEligibilityApi;")

                if (invokeLines.size != 1) {
                    failure("Correct invoke-direct/range line couldn't found.")
                }

                val longConversationLine = invokeLines[0].num - 4
                val longConversationContent = fContent[longConversationLine]
                if (!longConversationContent.contains("long-to-int")) {
                    failure("long-to-int conversation couldn't found.")
                }

                val regex = Regex("""long-to-int\s+(v\d+)""")
                val match = regex.find(longConversationContent)
                val registerName = match?.groups?.get(1)?.value

                val convertedValue = "    const/4 ${registerName}, 0x0"
                Log.info("Day duration converted from '${longConversationContent.trim()}' to '${convertedValue.trim()}'")
                fContent[invokeLines[0].num - 4] = convertedValue
                FileUtils.writeLines(callerClass, fContent)
                success("Time duration successfully set to 0")
            }
        },
    )
}