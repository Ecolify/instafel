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
 * Ghost ViewOnce - Prevents view once messages from being marked as seen
 * 
 * REFERENCE: InstaEclipse ViewOnce.java
 * - Hooks void methods with exactly 3 parameters containing "visual_item_seen" string
 * - Validates third parameter contains "visual_item_seen" or "send_visual_item_seen_marker"
 *   at runtime before blocking
 * 
 * IMPLEMENTATION:
 * This smali patch targets the same method signature (3 params, void return) and injects
 * an early return when Ghost ViewOnce is enabled. The method is identified by the presence
 * of "visual_item_seen" const-string, which matches InstaEclipse's approach of searching
 * for methods using that string.
 * 
 * VALIDATION:
 * InstaEclipse performs runtime validation of the third parameter. In smali patching, we
 * achieve equivalent safety by:
 * 1. Confirming method has exactly 3 parameters (same as InstaEclipse)
 * 2. Verifying method is void return (same as InstaEclipse)
 * 3. Ensuring "visual_item_seen" string exists in method body
 * 4. Blocking only when GhostModeManager.isGhostViewOnceEnabled() returns true
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
        // Size filtering to exclude test/stub classes and overly complex classes
        private const val MIN_IMPLEMENTATION_LINES = 50
        private const val MAX_IMPLEMENTATION_LINES = 2000
        private const val MAX_LOCALS_SEARCH_OFFSET = 20
        
        /**
         * Counts parameters in a smali method signature
         * Example: (LX/2zq;LX/FC0;LX/5st;)V has 3 parameters
         */
        private fun countMethodParameters(signature: String): Int {
            val signatureMatch = Regex("\\(([^)]*)\\)").find(signature) ?: return 0
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
                    '[' -> i++  // Array prefix, doesn't count as separate param
                    else -> i++
                }
            }
            
            return paramCount
        }
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost viewonce source file")
        object: InstafelTask() {
            override fun execute() {
                val searchPattern = listOf(
                    listOf("visual_item_seen"),
                    listOf("invoke-")
                )
                
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
                }) {
                    is FileSearchResult.Success -> {
                        ghostViewOnceFile = result.file
                        success("Ghost ViewOnce source class found successfully: ${ghostViewOnceFile.name}")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for Ghost ViewOnce.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        val sizeFilteredCandidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        val candidates = sizeFilteredCandidates.filter { file ->
                            val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                            var hasTargetMethod = false
                            var visualItemSeenLine = -1
                            
                            // Find the line containing "visual_item_seen" const-string
                            fContent.forEachIndexed { index, line ->
                                if (line.contains("const-string") && line.contains("visual_item_seen")) {
                                    visualItemSeenLine = index
                                }
                            }
                            
                            // If found, search backwards for the enclosing method
                            if (visualItemSeenLine != -1) {
                                for (methodIndex in visualItemSeenLine downTo 0) {
                                    if (fContent[methodIndex].contains(".method")) {
                                        val methodDeclaration = fContent[methodIndex]
                                        // Check if method has exactly 3 parameters and is void
                                        if (methodDeclaration.contains(")V") && 
                                            countMethodParameters(methodDeclaration) == 3) {
                                            hasTargetMethod = true
                                        }
                                        break
                                    }
                                }
                            }
                            
                            hasTargetMethod
                        }
                        
                        if (candidates.size == 1) {
                            ghostViewOnceFile = candidates[0]
                            success("Ghost ViewOnce source class found after filtering: ${ghostViewOnceFile.name}")
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

                // Find the method containing "visual_item_seen" with exactly 3 parameters
                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("visual_item_seen")) {
                        // Search backwards for the method declaration
                        for (methodIndex in index downTo 0) {
                            if (fContent[methodIndex].contains(".method")) {
                                val methodDeclaration = fContent[methodIndex]
                                // Verify: void return type and exactly 3 parameters
                                if (methodDeclaration.contains(")V") && 
                                    countMethodParameters(methodDeclaration) == 3) {
                                    methodLine = methodIndex
                                    
                                    // Find .locals directive for proper insertion point
                                    for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                        if (fContent[j].contains(".locals")) {
                                            localsLine = j
                                            break
                                        }
                                    }
                                    break
                                }
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1
                    
                    // Inject early return when Ghost ViewOnce is enabled
                    // This matches InstaEclipse's approach of blocking the entire method call
                    val lines = listOf(
                        "",
                        "    # Ghost ViewOnce - Block visual item seen markers",
                        "    # Reference: InstaEclipse ViewOnce.java - hooks method with 3 params containing visual_item_seen",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_viewonce_continue",
                        "    return-void",
                        "    :ghost_viewonce_continue",
                        ""
                    )

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostViewOnceFile, fContent)
                    success("Ghost ViewOnce patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for Ghost ViewOnce cannot be found (need: void method with exactly 3 params containing visual_item_seen).")
                }
            }
        }
    )
}