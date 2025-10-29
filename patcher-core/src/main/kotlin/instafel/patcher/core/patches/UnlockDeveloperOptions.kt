package instafel.patcher.core.patches

import instafel.patcher.core.source.SmaliParser
import instafel.patcher.core.utils.Log
import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.modals.FileSearchResult
import instafel.patcher.core.utils.modals.LineData
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.system.exitProcess

/**
 * Unlock Developer Options - Enables Instagram's hidden developer menu
 * 
 * REFERENCE: InstaEclipse devops module
 * - Enables access to Instagram's internal developer tools and settings
 * - Similar to enabling Android's Developer Options but for Instagram app
 * 
 * IMPLEMENTATION:
 * This patch locates the developer options constraint check in BaseFragmentActivity
 * and modifies it to always return true, effectively unlocking developer options.
 * 
 * PROCESS:
 * 1. Find BaseFragmentActivity class (entry point for developer options check)
 * 2. Locate static method with signature (Lcom/instagram/common/session/UserSession;)Z
 * 3. Extract the class name from the invoke-static call
 * 4. Modify the method to always return true (const v0, 0x1)
 * 
 * TECHNICAL DETAILS:
 * - Searches for unique invoke-static pattern with UserSession parameter
 * - Validates exactly one match to ensure precision
 * - Adds const v0, 0x1 after move-result to force true return
 * 
 * BEHAVIOR:
 * - Active: Developer options become accessible in Instagram settings
 * - Provides access to internal debugging tools, logging, and experimental features
 * - Intended for Alpha/Beta versions of Instagram for best compatibility
 * 
 * NOTE: This patch is essential for testing and development purposes
 */
@PInfos.PatchInfo(
    name = "Unlock Developer Options",
    shortname = "unlock_developer_options",
    desc = "You can unlock developer options with applying this patch!",
    isSingle = true
)
class UnlockDeveloperOptions: InstafelPatch() {

    lateinit var className: String
    lateinit var unlockRefSmali: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Get constraint definition class")
        object: InstafelTask() {
            override fun execute() {
                val unlockRefClassResults = smaliUtils.getSmaliFilesByName("/com/instagram/base/activity/BaseFragmentActivity.smali")
                unlockRefSmali = if (unlockRefClassResults.isEmpty() || unlockRefClassResults.size > 1) {
                    failure("BaseFragmentActivity class can't be found / selected.")
                    exitProcess(-1)
                } else {
                    unlockRefClassResults.first()
                }
                val referenceFileContent = smaliUtils.getSmaliFileContent(unlockRefSmali.getAbsolutePath())
                val linesWithInvokeAndUserSession: List<LineData> = smaliUtils.getContainLines(
                    referenceFileContent, "(Lcom/instagram/common/session/UserSession;)Z", "invoke-static"
                )

                if (linesWithInvokeAndUserSession.size != 1) {
                    failure("Static caller opcode can't found or more than 1!")
                    return;
                }

                val callLine: LineData = linesWithInvokeAndUserSession.get(0)
                val callLineInstruction = SmaliParser.parseInstruction(callLine.content, callLine.num)
                className = callLineInstruction.className.replace("LX/", "").replace(";", "")
                success("DevOptions class is $className")
            }
        },
        @PInfos.TaskInfo("Add constraint line to DevOptions class")
        object: InstafelTask() {
            override fun execute() {
                val devOptionsFile = smaliUtils.getSmaliFilesByName("X/$className.smali")
                    .firstOrNull() ?: run {
                    failure("Developer options file not found")
                    return
                }

                val devOptionsContent = smaliUtils.getSmaliFileContent(devOptionsFile.absolutePath).toMutableList()

                val moveResultLine = smaliUtils.getContainLines(devOptionsContent, "move-result", "v0")
                    .also { check(it.size == 1) { "Move result line size is 0 or bigger than 1" } }
                    .first()

                check(!devOptionsContent[moveResultLine.num + 2].contains("const v0, 0x1")) { "Developer options already unlocked." }

                devOptionsContent.add(moveResultLine.num + 1, "    ")
                devOptionsContent.add(moveResultLine.num + 2, "    const v0, 0x1")

                smaliUtils.writeContentIntoFile(devOptionsFile.absolutePath, devOptionsContent)

                Log.info("Constraint added successfully.")
                success("Developer options unlocked successfully.")
            }
        }
    )
}