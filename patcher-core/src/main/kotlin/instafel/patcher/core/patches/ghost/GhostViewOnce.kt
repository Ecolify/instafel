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
 * Ghost ViewOnce patch - prevents view once media from being marked as seen
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.ViewOnce)
 * which hooks methods containing "visual_item_seen" string with signature:
 * void method(?, ?, Object) - exactly 3 parameters
 * 
 * InstaEclipse uses runtime parameter inspection to verify the third argument
 * contains "visual_item_seen" or "send_visual_item_seen_marker" before blocking.
 * 
 * For smali patching, we:
 * 1. Find methods with "visual_item_seen" string that have 3 parameters and void return
 * 2. Inject early return check for GhostModeManager.isGhostViewOnceEnabled()
 * 3. Block the method execution if enabled, preventing the seen marker from being sent
 */
@PInfos.PatchInfo(
    name = "Ghost ViewOnce",
    shortname = "ghost_viewonce",
    desc = "View once messages without marking as seen",
    isSingle = true
)
class GhostViewOnce: InstafelPatch() {

    lateinit var ghostViewOnceFile: File
    
    companion object {
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost viewonce source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files containing "visual_item_seen" string with method invocations
                // InstaEclipse: hooks methods with signature void(?, ?, Object) containing "visual_item_seen"
                val searchPattern = listOf(
                    listOf("visual_item_seen"),
                    listOf("invoke-")  // Must have method calls
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostViewOnceFile = result.file
                        success("Ghost viewonce source class found successfully: ${ghostViewOnceFile.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost viewonce.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        // Filter by file size to get implementation files (50-2000 lines)
                        val sizeFilteredCandidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        // Additional filtering: find file with method matching InstaEclipse signature
                        // We need: void method(?, ?, Object) - exactly 3 parameters
                        val candidates = sizeFilteredCandidates.filter { file ->
                            val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                            var hasTargetMethod = false
                            var visualItemSeenLine = -1
                            
                            // First, find line with "visual_item_seen"
                            fContent.forEachIndexed { index, line ->
                                if (line.contains("const-string") && line.contains("visual_item_seen")) {
                                    visualItemSeenLine = index
                                }
                            }
                            
                            if (visualItemSeenLine != -1) {
                                // Search backwards from visual_item_seen to find the method
                                for (methodIndex in visualItemSeenLine downTo 0) {
                                    if (fContent[methodIndex].contains(".method")) {
                                        val methodDeclaration = fContent[methodIndex]
                                        
                                        // Extract signature to match InstaEclipse: void(?, ?, ?)
                                        val signatureMatch = Regex("\\(([^)]*)\\)V").find(methodDeclaration)
                                        if (signatureMatch != null) {
                                            val params = signatureMatch.groupValues[1]
                                            
                                            // Count parameters: each L starts an object param
                                            var paramCount = 0
                                            var i = 0
                                            while (i < params.length) {
                                                when (params[i]) {
                                                    'L' -> {
                                                        // Object parameter - skip until semicolon
                                                        paramCount++
                                                        val semicolonIdx = params.indexOf(';', i)
                                                        if (semicolonIdx == -1) break
                                                        i = semicolonIdx + 1
                                                    }
                                                    'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                                        // Primitive parameter
                                                        paramCount++
                                                        i++
                                                    }
                                                    '[' -> {
                                                        // Array - skip bracket and process type
                                                        i++
                                                    }
                                                    else -> i++
                                                }
                                            }
                                            
                                            // InstaEclipse matches: void method with exactly 3 parameters
                                            if (paramCount == 3) {
                                                hasTargetMethod = true
                                            }
                                        }
                                        break  // Exit method search once we've checked this method
                                    }
                                }
                            }
                            
                            hasTargetMethod
                        }
                        
                        if (candidates.size == 1) {
                            ghostViewOnceFile = candidates[0]
                            success("Ghost viewonce source class found after filtering: ${ghostViewOnceFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates (size filtered: ${sizeFilteredCandidates.size})")
                        } else {
                            failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Apply ghost viewonce patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostViewOnceFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find method containing "visual_item_seen" with InstaEclipse signature:
                // void method(?, ?, Object) - exactly 3 parameters, void return type
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("visual_item_seen")) {
                        // Search backwards to find method declaration
                        for (methodIndex in index downTo 0) {
                            if (fContent[methodIndex].contains(".method")) {
                                val methodDeclaration = fContent[methodIndex]
                                
                                // Extract signature to match InstaEclipse: void(?, ?, ?)
                                val signatureMatch = Regex("\\(([^)]*)\\)V").find(methodDeclaration)
                                if (signatureMatch != null) {
                                    val params = signatureMatch.groupValues[1]
                                    
                                    // Count parameters: each L starts an object param, primitives are single chars
                                    var paramCount = 0
                                    var i = 0
                                    while (i < params.length) {
                                        when (params[i]) {
                                            'L' -> {
                                                // Object parameter - skip until semicolon
                                                paramCount++
                                                val semicolonIdx = params.indexOf(';', i)
                                                if (semicolonIdx == -1) break // Invalid signature, stop
                                                i = semicolonIdx + 1
                                            }
                                            'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                                // Primitive parameter
                                                paramCount++
                                                i++
                                            }
                                            '[' -> {
                                                // Array - skip bracket and process type
                                                i++
                                            }
                                            else -> i++
                                        }
                                    }
                                    
                                    // InstaEclipse matches: void method with exactly 3 parameters
                                    if (paramCount == 3) {
                                        methodLine = methodIndex
                                        
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
                                break  // Exit method search once we've checked this method
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
                        "    # Ghost ViewOnce - Block view once seen markers",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_viewonce_continue",
                        "    return-void",
                        "    :ghost_viewonce_continue",
                        ""
                    )

                    fContent.addAll(insertLine, lines)
                    FileUtils.writeLines(ghostViewOnceFile, fContent)
                    success("Ghost viewonce patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost viewonce cannot be found (need: void method with exactly 3 params).")
                }
            }
        }
    )
}
