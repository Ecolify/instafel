package instafel.patcher.core.patches.general

import instafel.patcher.core.source.SmaliParser
import instafel.patcher.core.utils.Log
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import org.apache.commons.io.FileUtils
import kotlin.system.exitProcess

@PInfos.PatchInfo(
    name = "Add Initialize Instafel",
    shortname = "add_init_instafel",
    desc = "This patch must be applied for Instafel Menu",
    isSingle = false
)
class AddInitInstafel: InstafelPatch() {

    override fun initializeTasks() = mutableListOf<InstafelTask> (
        @PInfos.TaskInfo("Hook Application.attach() for early initialization")
        object: InstafelTask() {
            override fun execute() {
                val appShellResult = smaliUtils.getSmaliFilesByName("/com/instagram/app/InstagramAppShell.smali")
                val appShellFile = if (appShellResult.isEmpty() || appShellResult.size > 1) {
                    failure("InstagramAppShell file can't be found / selected.")
                    exitProcess(-1)
                } else {
                    appShellResult.first()
                }

                val fContent = smaliUtils.getSmaliFileContent(appShellFile.absolutePath).toMutableList()

                // Hook attach() instead of onCreate() to initialize before QPL and StorageInitializer
                // This prevents "QuickPerformanceLogger instance wasn't installed" errors
                var attachMethodLine = 0
                var lock = false

                for (i in fContent.indices) {
                    val line = fContent[i]

                    // Find the attach(Landroid/content/Context;)V method declaration
                    if (line.contains("attach(Landroid/content/Context;)V") && line.contains(".method")) {
                        attachMethodLine = i
                    }

                    // Find the super.attach() call within the attach method
                    if (line.contains("Landroid/app/Application;->attach(Landroid/content/Context;)V")) {
                        if (attachMethodLine == 0) {
                            Log.severe("attach(Landroid/content/Context;)V method declaration not found before super.attach() call.")
                        }

                        val callerInstruction = SmaliParser.parseInstruction(line, i)
                        val attachVariableName = callerInstruction.registers[0]

                        val unusedRegister = smaliUtils.getUnusedRegistersOfMethod(fContent, attachMethodLine, i)
                        Log.info("Unused register is v$unusedRegister before line $i in attach method")

                        // Initialize Instafel AFTER super.attach() but BEFORE any Instagram initialization
                        // This ensures context is set before QPL or StorageInitializer access it
                        val content = listOf(
                            "    invoke-static {$attachVariableName}, Linstafel/app/utils/InitializeInstafel;->setContext(Landroid/app/Application;)V",
                            "    new-instance v$unusedRegister, Linstafel/app/utils/InstafelCrashHandler;",
                            "    invoke-direct {v$unusedRegister, $attachVariableName}, Linstafel/app/utils/InstafelCrashHandler;-><init>(Landroid/content/Context;)V",
                            "    invoke-static {v$unusedRegister}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread\$UncaughtExceptionHandler;)V"
                        )

                        if (fContent[i + 2].contains("Linstafel/app")) {
                            failure("This patch is applied already.")
                        }

                        fContent.add(i + 2, content.joinToString("\n\n") + "\n")
                        lock = true
                    }
                }

                if (lock) {
                    FileUtils.writeLines(appShellFile, fContent)
                    success("Initializer lines added successfully in attach() method.")
                } else if (attachMethodLine == 0) {
                    failure("attach(Landroid/content/Context;)V method declaration not found in InstagramAppShell.")
                } else {
                    failure("super.attach() call not found within attach() method.")
                }
            }
        }
    )
}