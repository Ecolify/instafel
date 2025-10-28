package instafel.patcher.core.patches.ghost

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
 * Ghost ViewOnce patch - prevents view once media from being marked as seen
 * 
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.ViewOnce)
 * which hooks methods containing "visual_item_seen" string with signature:
 * void method(?, ?, Object) - exactly 3 parameters
 * 
 * InstaEclipse uses runtime parameter inspection to verify the third argument
 * contains "visual_item_seen" or "send_visual_item_seen_marker" before blocking.
 * 
 * For smali patching, we use multi-stage filtering:
 * 1. Search for files containing "visual_item_seen" and "invoke-" (excludes constant files)
 * 2. Filter by file size (50-2000 lines) to target implementation classes
 * 3. Filter by LX/KHI; reference (Instagram's marker-sending API)
 * 4. Verify method signature: void method with exactly 3 parameters
 * 5. Inject early return check for GhostModeManager.isGhostViewOnceEnabled()
 * 6. Block the method execution if enabled, preventing the seen marker from being sent
 * 
 * This approach mirrors InstaEclipse's logic but uses static analysis instead of runtime hooks.
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
                        // Stage 1: Filter by file size to get implementation files (50-2000 lines)
                        // This excludes tiny utility classes and massive constant definition files
                        val sizeFiltered = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        Log.info("After size filter: ${sizeFiltered.size} candidates (${sizeFiltered.map { it.name }})")
                        
                        if (sizeFiltered.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files (50-2000 lines) found among ${result.files.size} candidates")
                            return@execute
                        }
                        
                        // Stage 2: Filter by LX/KHI; reference
                        // KHI is Instagram's internal API for sending markers - only implementation files reference it
                        val khiFiltered = sizeFiltered.filter { file ->
                            file.useLines { lines ->
                                lines.any { line -> line.contains("LX/KHI;") }
                            }
                        }
                        
                        Log.info("After KHI reference filter: ${khiFiltered.size} candidates (${khiFiltered.map { it.name }})")
                        
                        when {
                            khiFiltered.size == 1 -> {
                                ghostViewOnceFile = khiFiltered[0]
                                success("Ghost viewonce source class found with KHI reference: ${ghostViewOnceFile.name}")
                            }
                            khiFiltered.isEmpty() -> {
                                // Fallback to size-filtered results if KHI filter was too strict
                                if (sizeFiltered.size == 1) {
                                    ghostViewOnceFile = sizeFiltered[0]
                                    success("Ghost viewonce source class found (no KHI filter): ${ghostViewOnceFile.name}")
                                } else {
                                    failure("Patch aborted: No files with KHI reference found, and ${sizeFiltered.size} candidates remain: ${sizeFiltered.map { it.name }}")
                                }
                            }
                            else -> {
                                // Stage 3: Further filter by checking for method with exactly 3 parameters
                                // InstaEclipse looks for: void method(?, ?, Object)
                                val methodFiltered = khiFiltered.filter { file ->
                                    val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                                    fContent.any { line ->
                                        if (line.contains("const-string") && line.contains("visual_item_seen")) {
                                            // Find the method containing this string
                                            val lineIndex = fContent.indexOf(line)
                                            for (i in lineIndex downTo 0) {
                                                if (fContent[i].contains(".method")) {
                                                    // Check if method has signature (?,?,?)V
                                                    val signatureMatch = Regex("\\(([^)]*)\\)V").find(fContent[i])
                                                    if (signatureMatch != null) {
                                                        val params = signatureMatch.groupValues[1]
                                                        var paramCount = 0
                                                        var idx = 0
                                                        while (idx < params.length) {
                                                            when (params[idx]) {
                                                                'L' -> {
                                                                    paramCount++
                                                                    val semicolonIdx = params.indexOf(';', idx)
                                                                    if (semicolonIdx == -1) break
                                                                    idx = semicolonIdx + 1
                                                                }
                                                                'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                                                    paramCount++
                                                                    idx++
                                                                }
                                                                '[' -> idx++
                                                                else -> idx++
                                                            }
                                                        }
                                                        return@filter paramCount == 3
                                                    }
                                                    break
                                                }
                                            }
                                        }
                                        false
                                    }
                                }
                                
                                Log.info("After method signature filter: ${methodFiltered.size} candidates (${methodFiltered.map { it.name }})")
                                
                                if (methodFiltered.size == 1) {
                                    ghostViewOnceFile = methodFiltered[0]
                                    success("Ghost viewonce source class found after method filter: ${ghostViewOnceFile.name}")
                                } else if (methodFiltered.isEmpty()) {
                                    failure("Patch aborted: No files passed method signature filter (need void method with 3 params)")
                                } else {
                                    failure("Patch aborted: Found ${methodFiltered.size} candidate files after all filtering: ${methodFiltered.map { it.name }}")
                                }
                            }
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
                // Also verify method contains LX/KHI; reference (Instagram's marker-sending API)
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
                                        // Find method end to check for KHI reference
                                        var methodEndIndex = methodIndex + 1
                                        while (methodEndIndex < fContent.size && !fContent[methodEndIndex].contains(".end method")) {
                                            methodEndIndex++
                                        }
                                        
                                        // Verify method contains KHI reference (marker-sending API)
                                        val hasKHI = (methodIndex..methodEndIndex).any { i ->
                                            fContent[i].contains("LX/KHI;")
                                        }
                                        
                                        if (hasKHI) {
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

                    fContent.add(insertLine, lines.joinToString("\n"))
                    FileUtils.writeLines(ghostViewOnceFile, fContent)
                    success("Ghost viewonce patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost viewonce cannot be found (need: void method with exactly 3 params containing visual_item_seen string and LX/KHI; reference).")
                }
            }
        }
    )
}
