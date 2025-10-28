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
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.SeenState)
 * which hooks methods containing "mark_thread_seen-" string with signature:
 * static final void method(?, ?, ?, ...) with >= 3 parameters
 */
@PInfos.PatchInfo(
    name = "Ghost Seen",
    shortname = "ghost_seen",
    desc = "Hide read receipts in Direct Messages",
    isSingle = true
)
class GhostSeen: InstafelPatch() {

    lateinit var ghostSeenFile: File

    companion object {
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost seen source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files with "mark_thread_seen-" that have method invocations
                val searchPattern = listOf(
                    listOf("mark_thread_seen-"),
                    listOf("invoke-")  // Must have method calls
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostSeenFile = result.file
                        success("Ghost seen source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost seen.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        // Apply multi-stage filtering to find the correct implementation file
                        // Stage 1: Filter by file size (implementation files are typically 50-2000 lines)
                        val sizeFiltered = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        // Stage 2: Find files with the target method signature
                        // Must have: static final void method with >= 3 parameters containing "mark_thread_seen-"
                        val candidates = sizeFiltered.filter { file ->
                            val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                            var hasTargetMethod = false
                            var markThreadSeenLine = -1
                            
                            // Find line with "mark_thread_seen-"
                            fContent.forEachIndexed { index, line ->
                                if (line.contains("const-string") && line.contains("mark_thread_seen-")) {
                                    markThreadSeenLine = index
                                }
                            }
                            
                            if (markThreadSeenLine != -1) {
                                // Search backwards to find the method containing this string
                                for (methodIndex in markThreadSeenLine downTo 0) {
                                    if (fContent[methodIndex].contains(".method")) {
                                        val methodDeclaration = fContent[methodIndex]
                                        
                                        // Check for InstaEclipse signature: static final void with >= 3 params
                                        if (methodDeclaration.contains("static") &&
                                            methodDeclaration.contains("final") &&
                                            methodDeclaration.contains(")V")) {
                                            
                                            val signatureMatch = Regex("\\(([^)]*)\\)").find(methodDeclaration)
                                            if (signatureMatch != null) {
                                                val params = signatureMatch.groupValues[1]
                                                var paramCount = 0
                                                var i = 0
                                                
                                                while (i < params.length) {
                                                    when (params[i]) {
                                                        'L' -> {
                                                            paramCount++
                                                            val semicolonIdx = params.indexOf(';', i)
                                                            if (semicolonIdx == -1) break
                                                            i = semicolonIdx + 1
                                                        }
                                                        'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                                            paramCount++
                                                            i++
                                                        }
                                                        '[' -> i++
                                                        else -> i++
                                                    }
                                                }
                                                
                                                if (paramCount >= 3) {
                                                    hasTargetMethod = true
                                                }
                                            }
                                        }
                                        break
                                    }
                                }
                            }
                            
                            hasTargetMethod
                        }
                        
                        if (candidates.size == 1) {
                            ghostSeenFile = candidates[0]
                            success("Ghost seen source class found after filtering: ${ghostSeenFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates (size filtered: ${sizeFiltered.size})")
                        } else {
                            // If multiple candidates still exist, take the first one
                            // This matches InstaEclipse behavior which hooks the first matching method
                            ghostSeenFile = candidates.first()
                            success("Ghost seen source class found (selected first of ${candidates.size}): ${ghostSeenFile.name}")
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost seen patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostSeenFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find method containing "mark_thread_seen-" const-string
                // InstaEclipse signature: static final void (?, ?, ?, ...) with >= 3 params
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("mark_thread_seen-")) {
                        // Search backwards to find method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Match InstaEclipse: static final void method with >= 3 parameters
                                if (methodDeclaration.contains("static") && 
                                    methodDeclaration.contains("final") &&
                                    methodDeclaration.contains(")V")) {  // void return type
                                    
                                    // Count parameters in signature properly
                                    val signatureMatch = Regex("\\(([^)]*)\\)").find(methodDeclaration)
                                    if (signatureMatch != null) {
                                        val params = signatureMatch.groupValues[1]
                                        
                                        // Count parameters: each L starts an object param, primitives are single chars
                                        var paramCount = 0
                                        var idx = 0
                                        while (idx < params.length) {
                                            when (params[idx]) {
                                                'L' -> {
                                                    // Object parameter - skip until semicolon
                                                    paramCount++
                                                    val semicolonIdx = params.indexOf(';', idx)
                                                    if (semicolonIdx == -1) break // Invalid signature, stop
                                                    idx = semicolonIdx + 1
                                                }
                                                'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                                    // Primitive parameter
                                                    paramCount++
                                                    idx++
                                                }
                                                '[' -> {
                                                    // Array - skip bracket and process type
                                                    idx++
                                                }
                                                else -> idx++
                                            }
                                        }
                                        
                                        if (paramCount >= 3) {
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
                        "    # Ghost Seen - Block read receipts",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeenEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_seen_continue",
                        "    return-void",
                        "    :ghost_seen_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostSeenFile, fContent)
                    success("Ghost seen patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost seen cannot be found (need: static final void with >= 3 params).")
                }
            }
        }
    )
}
