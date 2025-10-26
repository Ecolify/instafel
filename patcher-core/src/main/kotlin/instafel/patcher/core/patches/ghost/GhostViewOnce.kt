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
 * which finds and hooks methods containing "visual_item_seen" with signature (?,?,?) -> void.
 * 
 * Analysis of Instagram smali shows:
 * - LX/GTu is a class with method A01() returning "visual_item_seen" string
 * - LX/5nb is the ViewOnce message class that has a field of type LX/GTu
 * - LX/5nc is the HANDLER that sends the visual_item_seen marker
 * - Method Fe3(LX/2vp;LX/Qff;LX/5eh;)V in 5nc handles sending the marker
 * 
 * Search strategy:
 * 1. Find handler class that implements an interface and contains "visual_item_seen"
 * 2. Identify method with 3 parameters, void return, containing "visual_item_seen"
 * 3. Additional validation: method should cast third parameter (check-cast instruction)
 * 4. Inject early return when ghost viewonce is enabled
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
                // Strategy: Find the handler class, not the message class
                // The handler implements an interface and contains "visual_item_seen"
                // with a method that has 3 parameters and casts the third one
                val searchPatterns = listOf(
                    // Pattern 1: Handler class implementing interface with visual_item_seen
                    // Use quotes to match exact string, not as substring of send_visual_item_seen_marker
                    listOf(
                        listOf("# interfaces"),
                        listOf(".implements"),
                        listOf("\"visual_item_seen\"")
                    ),
                    // Pattern 2: More relaxed - just interface implementation and visual_item_seen
                    listOf(
                        listOf("implements"),
                        listOf("\"visual_item_seen\"")
                    ),
                    // Pattern 3: Fallback - files with visual_item_seen and check-cast
                    // (the handler casts the third parameter)
                    listOf(
                        listOf("\"visual_item_seen\""),
                        listOf("check-cast")
                    )
                )
                
                for ((index, pattern) in searchPatterns.withIndex()) {
                    when (val result = runBlocking {
                        SearchUtils.getFileContainsAllCords(smaliUtils, pattern)
                    }) {
                        is FileSearchResult.Success -> {
                            ghostViewOnceFile = result.file
                            val patternDesc = when (index) {
                                0 -> "interface handler with visual_item_seen"
                                1 -> "implements with visual_item_seen"
                                else -> "check-cast pattern"
                            }
                            success("Ghost viewonce handler class found successfully ($patternDesc)")
                            break
                        }
                        is FileSearchResult.NotFound -> {
                            if (index == searchPatterns.size - 1) {
                                // Last pattern and still not found
                                failure("Patch aborted because no handler class found for ghost viewonce. Found ${result.scannedFiles} candidate files.")
                            }
                            // Try next pattern
                            continue
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

                // Find method with:
                // 1. 3 parameters (matches InstaEclipse signature)
                // 2. void return type ()V
                // 3. Contains "visual_item_seen" string
                // 4. Contains "check-cast" (casts third parameter)
                var foundMethod = false
                var currentMethodStart = -1
                var currentMethodEnd = -1
                
                fContent.forEachIndexed { index, line ->
                    if (foundMethod) return@forEachIndexed
                    
                    // Track method boundaries
                    if (line.contains(".method")) {
                        currentMethodStart = index
                        currentMethodEnd = -1
                    } else if (line.contains(".end method")) {
                        currentMethodEnd = index
                        
                        // Check if this method matches our criteria
                        if (currentMethodStart != -1 && currentMethodEnd != -1) {
                            val methodDeclaration = fContent[currentMethodStart]
                            val methodContent = fContent.subList(currentMethodStart, currentMethodEnd + 1)
                            
                            // Check signature: 3 parameters (3 semicolons in param list) and void return
                            val paramMatch = Regex("""\(([^)]*)\)V""").find(methodDeclaration)
                            if (paramMatch != null) {
                                val params = paramMatch.groupValues[1]
                                val paramCount = params.count { it == ';' }
                                
                                // Must have exactly 3 parameters and return void
                                if (paramCount == 3) {
                                    // Check if method contains visual_item_seen
                                    val hasVisualItemSeen = methodContent.any { 
                                        it.contains("visual_item_seen") 
                                    }
                                    
                                    // Check if method casts the third parameter (typical pattern)
                                    val hasCheckCast = methodContent.any { 
                                        it.trim().startsWith("check-cast p3,") || 
                                        it.trim().startsWith("check-cast p2,")
                                    }
                                    
                                    if (hasVisualItemSeen && hasCheckCast) {
                                        methodLine = currentMethodStart
                                        // Find .locals line
                                        for (j in methodLine until minOf(methodLine + 15, fContent.size)) {
                                            if (fContent[j].contains(".locals")) {
                                                localsLine = j
                                                break
                                            }
                                        }
                                        foundMethod = true
                                        return@forEachIndexed
                                    }
                                }
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
                    success("Ghost viewonce patch successfully applied to method with 3 parameters")
                } else {
                    failure("Required method (3 params, void return, visual_item_seen, check-cast) for ghost viewonce cannot be found.")
                }
            }
        }
    )
}
