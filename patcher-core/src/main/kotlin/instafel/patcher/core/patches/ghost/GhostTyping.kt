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
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.TypingStatus)
 * which hooks methods containing "is_typing_indicator_enabled" string with signature:
 * static final void method(ClassType, boolean)
 */
@PInfos.PatchInfo(
    name = "Ghost Typing",
    shortname = "ghost_typing",
    desc = "Hide typing indicator in Direct Messages",
    isSingle = true
)
class GhostTyping: InstafelPatch() {

    lateinit var ghostTypingFile: File

    companion object {
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost typing source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files with "is_typing_indicator_enabled" that have method invocations
                val searchPattern = listOf(
                    listOf("is_typing_indicator_enabled"),
                    listOf("invoke-")  // Must have method calls
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostTypingFile = result.file
                        success("Ghost typing source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost typing.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        // Filter by file size to get implementation files
                        val candidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        if (candidates.size == 1) {
                            ghostTypingFile = candidates[0]
                            success("Ghost typing source class found after filtering: ${ghostTypingFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
                        }
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

                // Find method containing "is_typing_indicator_enabled" const-string
                // InstaEclipse signature: static final void (ClassType, boolean)
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("is_typing_indicator_enabled")) {
                        // Search backwards to find method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Match InstaEclipse: static final void method with 2 params (?, boolean)
                                if (methodDeclaration.contains("static") && 
                                    methodDeclaration.contains("final") &&
                                    methodDeclaration.contains(")V")) {  // void return type
                                    
                                    // Extract parameter signature and verify it's (object, boolean)
                                    val signatureMatch = Regex("\\(([^)]*)\\)").find(methodDeclaration)
                                    if (signatureMatch != null) {
                                        val params = signatureMatch.groupValues[1]
                                        
                                        // Check for exactly 2 parameters: first is object (L), second is boolean (Z)
                                        // Pattern should be like: LX/XXX;Z or similar
                                        if (params.contains("Z") && params.contains("L")) {
                                            // Count exact parameters
                                            var paramCount = 0
                                            var idx = 0
                                            var hasBoolean = false
                                            
                                            while (idx < params.length) {
                                                when (params[idx]) {
                                                    'L' -> {
                                                        paramCount++
                                                        val semicolonIdx = params.indexOf(';', idx)
                                                        if (semicolonIdx == -1) break // Invalid signature, stop
                                                        idx = semicolonIdx + 1
                                                    }
                                                    'Z' -> {
                                                        paramCount++
                                                        hasBoolean = true
                                                        idx++
                                                    }
                                                    'I', 'J', 'F', 'D', 'B', 'S', 'C' -> {
                                                        paramCount++
                                                        idx++
                                                    }
                                                    '[' -> idx++
                                                    else -> idx++
                                                }
                                            }
                                            
                                            if (paramCount == 2 && hasBoolean) {
                                                methodLine = i
                                                // Find .locals line
                                                for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                                    if (fContent[j].contains(".locals")) {
                                                        localsLine = j
                                                        break
                                                    }
                                                }
                                                break
                                            }
                                        }
                                    }
                                }
                                break  // Exit method search
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

                    // Add each line individually to maintain proper smali structure
                    lines.reversed().forEach { line ->
                        fContent.add(insertLine, line)
                    }
                    FileUtils.writeLines(ghostTypingFile, fContent)
                    success("Ghost typing patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost typing cannot be found (need: static final void with 2 params, second is boolean).")
                }
            }
        }
    )
}
