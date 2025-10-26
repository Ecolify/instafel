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
 * which hooks methods containing both "visual_item_seen" and "send_visual_item_seen_marker"
 * strings. This patch adapts that approach for smali patching by:
 * 
 * 1. Using multiple search patterns to find the correct file:
 *    - Pattern 1: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "permanent"
 *    - Pattern 2: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "replayed"
 *    - Pattern 3: Fallback to just "visual_item_seen" and "send_visual_item_seen_marker"
 * 2. Finding the method that contains both marker strings within its body
 * 3. Injecting an early return when ghost viewonce is enabled
 * 
 * The method signature in InstaEclipse is (?,?,AbstractClassType) -> void,
 * and it checks the third parameter at runtime. For smali patching, we instead
 * inject a static check that prevents the method from executing.
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
                // Try multiple search patterns in order of specificity
                val searchPatterns = listOf(
                    // Pattern 1: Include "permanent" - likely in view once handling
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker"),
                        listOf("permanent")
                    ),
                    // Pattern 2: Include "replayed" - related to view once replay
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker"),
                        listOf("replayed")
                    ),
                    // Pattern 3: Just the two main strings
                    listOf(
                        listOf("visual_item_seen"),
                        listOf("send_visual_item_seen_marker")
                    )
                )
                
                for ((index, pattern) in searchPatterns.withIndex()) {
                    when (val result = runBlocking {
                        SearchUtils.getFileContainsAllCords(smaliUtils, pattern)
                    }) {
                        is FileSearchResult.Success -> {
                            ghostViewOnceFile = result.file
                            val patternDesc = when (index) {
                                0 -> "with permanent marker"
                                1 -> "with replayed marker"
                                else -> "basic search"
                            }
                            success("Ghost viewonce source class found successfully ($patternDesc)")
                            return
                        }
                        is FileSearchResult.MultipleFound -> {
                            // We found multiple candidates, try to select the best one
                            val bestCandidate = selectBestCandidate(result.files)
                            if (bestCandidate != null) {
                                ghostViewOnceFile = bestCandidate
                                val patternDesc = when (index) {
                                    0 -> "with permanent marker"
                                    1 -> "with replayed marker"
                                    else -> "basic search"
                                }
                                success("Ghost viewonce source class found successfully from ${result.files.size} candidates ($patternDesc)")
                                return
                            }
                            // If we can't select best candidate, try next pattern
                            continue
                        }
                        is FileSearchResult.NotFound -> {
                            if (index == searchPatterns.size - 1) {
                                // Last pattern and still not found
                                failure("Patch aborted because no classes found for ghost viewonce.")
                            }
                            // Try next pattern
                            continue
                        }
                    }
                }
            }
            
            /**
             * Select the best candidate file from multiple matches.
             * Based on InstaEclipse logic: method should have 3 parameters and void return type.
             * We look for a method with both marker strings in the same method body.
             */
            private fun selectBestCandidate(candidates: List<File>): File? {
                val scoredCandidates = candidates.mapNotNull { file ->
                    val score = scoreCandidate(file)
                    if (score > 0) file to score else null
                }.sortedByDescending { it.second }
                
                return scoredCandidates.firstOrNull()?.first
            }
            
            /**
             * Score a candidate file based on how well it matches our criteria.
             * Higher score = better match
             */
            private fun scoreCandidate(file: File): Int {
                var score = 0
                val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                
                // Look for methods that contain both marker strings
                fContent.forEachIndexed { index, line ->
                    if (line.contains("visual_item_seen") || line.contains("send_visual_item_seen_marker")) {
                        // Search backwards to find the method declaration
                        for (i in index downTo maxOf(0, index - 100)) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                
                                // Find method end
                                var methodEndLine = -1
                                for (j in i until minOf(i + 500, fContent.size)) {
                                    if (fContent[j].contains(".end method")) {
                                        methodEndLine = j
                                        break
                                    }
                                }
                                
                                if (methodEndLine != -1) {
                                    val methodContent = fContent.subList(i, methodEndLine + 1)
                                    val hasVisualItemSeen = methodContent.any { it.contains("visual_item_seen") }
                                    val hasSendMarker = methodContent.any { it.contains("send_visual_item_seen_marker") }
                                    
                                    // Both strings must be in the same method
                                    if (hasVisualItemSeen && hasSendMarker) {
                                        score += 100 // Base score for having both strings in same method
                                        
                                        // Check for method signature with 3 parameters (matching InstaEclipse)
                                        // Look for patterns like: (Lcom/...;Lcom/...;Lcom/...;)V
                                        if (methodDeclaration.contains(")V")) {
                                            // Count parameters by counting semicolons before )V
                                            val paramSection = methodDeclaration.substringAfter("(").substringBefore(")V")
                                            val paramCount = paramSection.count { it == ';' }
                                            if (paramCount == 3) {
                                                score += 50 // Bonus for 3-parameter void method
                                            }
                                        }
                                        
                                        // Prefer static or final methods
                                        if (methodDeclaration.contains("static")) {
                                            score += 10
                                        }
                                        if (methodDeclaration.contains("final")) {
                                            score += 5
                                        }
                                        
                                        // Check for additional marker strings
                                        if (methodContent.any { it.contains("permanent") }) {
                                            score += 20
                                        }
                                        if (methodContent.any { it.contains("replayed") }) {
                                            score += 15
                                        }
                                        
                                        // Only score the first matching method in this file
                                        return score
                                    }
                                }
                                break
                            }
                        }
                    }
                }
                
                return score
            }
        },
        @PInfos.TaskInfo("Apply ghost viewonce patch")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(ghostViewOnceFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                // Find the method that contains both marker strings
                var foundMethod = false
                fContent.forEachIndexed { index, line ->
                    if (foundMethod) return@forEachIndexed
                    
                    if (line.contains("visual_item_seen") || line.contains("send_visual_item_seen_marker")) {
                        // Search backwards to find the method declaration
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                // Prefer methods with static or final modifiers
                                if (methodDeclaration.contains("static") || methodDeclaration.contains("final")) {
                                    // Find method end to verify both strings are in this method
                                    var methodEndLine = -1
                                    for (j in i until fContent.size) {
                                        if (fContent[j].contains(".end method")) {
                                            methodEndLine = j
                                            break
                                        }
                                    }
                                    
                                    // Check if both strings are in this method
                                    if (methodEndLine != -1) {
                                        val methodContent = fContent.subList(i, methodEndLine + 1)
                                        val hasVisualItemSeen = methodContent.any { it.contains("visual_item_seen") }
                                        val hasSendMarker = methodContent.any { it.contains("send_visual_item_seen_marker") }
                                        
                                        if (hasVisualItemSeen && hasSendMarker) {
                                            methodLine = i
                                            // Find .locals line
                                            for (j in methodLine until minOf(methodLine + 10, fContent.size)) {
                                                if (fContent[j].contains(".locals")) {
                                                    localsLine = j
                                                    break
                                                }
                                            }
                                            foundMethod = true
                                            break
                                        }
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
                    success("Ghost viewonce patch successfully applied")
                } else {
                    failure("Required method for ghost viewonce cannot be found.")
                }
            }
        }
    )
}
