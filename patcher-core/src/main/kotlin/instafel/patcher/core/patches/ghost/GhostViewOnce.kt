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
 * which hooks methods containing "visual_item_seen" string. This patch adapts that 
 * approach for smali patching by:
 * 
 * 1. Finding the implementation file that:
 *    - Contains "visual_item_seen" string constant
 *    - Has actual method invocations (not just string definitions)
 *    - Is a moderate-sized file (50-2000 lines) indicating an implementation class
 *    - References LX/KHI class (Instagram's internal API for sending markers)
 * 
 * 2. Finding the specific method that:
 *    - Contains "visual_item_seen" const-string declaration
 *    - Calls LX/KHI;->A00() to send the marker to Instagram's servers
 *    - Example: Fe3 method in X/5nc class
 * 
 * 3. Injecting an early return when ghost viewonce is enabled:
 *    - Checks GhostModeManager.isGhostViewOnceEnabled()
 *    - Returns early if enabled, preventing the marker from being sent
 *    - Otherwise continues with normal execution
 * 
 * The patch effectively blocks the "visual_item_seen" marker from being sent to
 * Instagram servers, allowing users to view "view once" messages without the sender
 * knowing they were viewed.
 */
@PInfos.PatchInfo(
    name = "Ghost ViewOnce",
    shortname = "ghost_viewonce",
    desc = "View once messages without marking as seen",
    isSingle = true
)
class GhostViewOnce: InstafelPatch() {

    lateinit var ghostViewOnceFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost viewonce source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files containing "visual_item_seen" string that also have method implementations
                // Based on InstaEclipse approach: find methods that use visual_item_seen in their logic
                val searchPattern = listOf(
                    listOf("visual_item_seen"),
                    listOf("invoke-static")  // Must have method calls, not just string constants
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
                        // Filter candidates by file size - we want implementation files, not utility classes
                        val candidates = result.files.filter { file ->
                            val lineCount = file.readLines().size
                            // Filter files between 50 and 2000 lines (implementation classes, not huge utility files)
                            lineCount in 50..2000
                        }
                        
                        if (candidates.size == 1) {
                            ghostViewOnceFile = candidates[0]
                            success("Ghost viewonce source class found after filtering: ${ghostViewOnceFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            // Multiple candidates after filtering - try to find the one with KHI reference
                            val withKHI = candidates.filter { file ->
                                file.readText().contains("LX/KHI;")
                            }
                            
                            if (withKHI.size == 1) {
                                ghostViewOnceFile = withKHI[0]
                                success("Ghost viewonce source class found with KHI reference: ${ghostViewOnceFile.name}")
                            } else {
                                failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
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

                // Find the method that contains "visual_item_seen" and calls KHI
                // Based on analysis: target method Fe3 in 5nc.smali line 88 that calls LX/KHI;->A00
                var foundMethod = false
                fContent.forEachIndexed { index, line ->
                    if (foundMethod) return@forEachIndexed
                    
                    // Look for methods that contain visual_item_seen const-string
                    if (line.contains("const-string") && line.contains("visual_item_seen")) {
                        // Search backwards to find the method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                methodLine = i
                                
                                // Find method end to verify this method also has KHI call
                                var methodEndLine = -1
                                for (j in i until fContent.size) {
                                    if (fContent[j].contains(".end method")) {
                                        methodEndLine = j
                                        break
                                    }
                                }
                                
                                // Verify this method contains KHI reference
                                if (methodEndLine != -1) {
                                    val methodContent = fContent.subList(i, methodEndLine + 1)
                                    val hasKHI = methodContent.any { it.contains("LX/KHI;") }
                                    
                                    if (hasKHI) {
                                        // Find .locals line
                                        for (j in methodLine until minOf(methodLine + 20, fContent.size)) {
                                            if (fContent[j].contains(".locals")) {
                                                localsLine = j
                                                break
                                            }
                                        }
                                        foundMethod = true
                                        break
                                    }
                                }
                                break // Exit method search once we've checked this method
                            }
                        }
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
                    failure("Required method for ghost viewonce cannot be found.")
                }
            }
        }
    )
}
