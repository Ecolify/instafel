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
 * which hooks methods containing both "visual_item_seen" and "send_visual_item_seen_marker"
 * strings. This patch adapts that approach for smali patching by:
 * 
 * 1. Using multiple search patterns to find the correct file:
 *    - Pattern 1: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "permanent"
 *    - Pattern 2: Search for files with "visual_item_seen", "send_visual_item_seen_marker", and "replayed"
 *    - Pattern 3: Fallback to just "visual_item_seen" and "send_visual_item_seen_marker"
 * 2. When multiple files are found, apply additional filtering based on:
 *    - Method signature matching (preferring methods with 3 parameters and void return)
 *    - Presence of both required strings within the same method
 *    - Method modifier analysis (static/final preference)
 * 3. Finding the method that contains both marker strings within its body
 * 4. Injecting an early return when ghost viewonce is enabled
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

    /**
     * Data class to hold scored candidate files for filtering
     */
    private data class ScoredCandidate(
        val file: File,
        val score: Int,
        val hasTargetMethod: Boolean
    )

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
                
                var candidateFiles = emptyList<File>()
                
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
                        is FileSearchResult.NotFound -> {
                            if (result.candidateFiles.isNotEmpty()) {
                                candidateFiles = result.candidateFiles
                                Log.info("Pattern ${index + 1} found ${candidateFiles.size} candidates, trying next pattern...")
                            }
                            
                            if (index == searchPatterns.size - 1) {
                                // Last pattern - if we have candidates, try to filter them
                                if (candidateFiles.isNotEmpty()) {
                                    val filteredFile = filterCandidateFiles(candidateFiles)
                                    if (filteredFile != null) {
                                        ghostViewOnceFile = filteredFile
                                        success("Ghost viewonce source class found after filtering ${candidateFiles.size} candidates")
                                        return
                                    }
                                }
                                failure("Patch aborted because no classes found for ghost viewonce. Found ${result.scannedFiles} candidate files.")
                            }
                            // Try next pattern
                            continue
                        }
                    }
                }
            }
            
            /**
             * Filter candidate files to find the most likely correct one
             * Based on InstaEclipse logic: method with signature (?,?,AbstractClassType) -> void
             */
            private fun filterCandidateFiles(candidates: List<File>): File? {
                Log.info("Filtering ${candidates.size} candidate files for ghost viewonce...")
                
                val scoredCandidates = candidates.map { file ->
                    val content = smaliUtils.getSmaliFileContent(file.absolutePath)
                    var score = 0
                    var hasTargetMethod = false
                    
                    // Look for methods that contain both required strings
                    var currentMethod = mutableListOf<String>()
                    var inMethod = false
                    var methodSignature = ""
                    
                    for (line in content) {
                        if (line.contains(".method")) {
                            inMethod = true
                            methodSignature = line
                            currentMethod.clear()
                        }
                        
                        if (inMethod) {
                            currentMethod.add(line)
                        }
                        
                        if (line.contains(".end method")) {
                            inMethod = false
                            
                            // Check if this method contains both required strings
                            val methodText = currentMethod.joinToString("\n")
                            val hasVisualItemSeen = methodText.contains("visual_item_seen")
                            val hasSendMarker = methodText.contains("send_visual_item_seen_marker")
                            
                            if (hasVisualItemSeen && hasSendMarker) {
                                hasTargetMethod = true
                                score += 100 // High score for having both strings
                                
                                // Analyze method signature
                                // Prefer methods with 3 parameters (InstaEclipse pattern)
                                val paramCount = countMethodParameters(methodSignature)
                                if (paramCount == 3) {
                                    score += 50
                                }
                                
                                // Prefer void return type
                                if (methodSignature.contains(")V")) {
                                    score += 30
                                }
                                
                                // Prefer static or final methods
                                if (methodSignature.contains("static") || methodSignature.contains("final")) {
                                    score += 20
                                }
                                
                                // Prefer methods with AbstractClass in signature (third parameter)
                                if (methodSignature.contains("L") && paramCount >= 3) {
                                    score += 25
                                }
                            }
                        }
                    }
                    
                    // Additional scoring for specific keywords
                    val fullContent = content.joinToString("\n")
                    if (fullContent.contains("permanent")) score += 10
                    if (fullContent.contains("replayed")) score += 10
                    if (fullContent.contains("ephemeral")) score += 15
                    if (fullContent.contains("view_once")) score += 15
                    
                    ScoredCandidate(file, score, hasTargetMethod)
                }.filter { it.hasTargetMethod } // Only keep files with target method
                 .sortedByDescending { it.score } // Sort by score
                
                if (scoredCandidates.isNotEmpty()) {
                    val best = scoredCandidates.first()
                    Log.info("Selected candidate with score ${best.score}: ${best.file.name}")
                    scoredCandidates.forEach { candidate ->
                        Log.info("  - ${candidate.file.name}: score ${candidate.score}")
                    }
                    return best.file
                }
                
                return null
            }
            
            /**
             * Count the number of parameters in a method signature
             * Example: .method public static foo(Ljava/lang/String;ILjava/lang/Object;)V
             * Would return 3 (String, int, Object)
             */
            private fun countMethodParameters(methodSignature: String): Int {
                val signatureMatch = Regex("""\(([^)]*)\)""").find(methodSignature)
                if (signatureMatch != null) {
                    val params = signatureMatch.groupValues[1]
                    if (params.isEmpty()) return 0
                    
                    var count = 0
                    var i = 0
                    while (i < params.length) {
                        when (params[i]) {
                            'L' -> {
                                // Object type, find the semicolon
                                count++
                                val semicolonIndex = params.indexOf(';', i)
                                if (semicolonIndex == -1) {
                                    // Malformed signature, bail out
                                    return count
                                }
                                i = semicolonIndex + 1
                            }
                            '[' -> {
                                // Array, skip to the next character
                                i++
                            }
                            else -> {
                                // Primitive type
                                count++
                                i++
                            }
                        }
                    }
                    return count
                }
                return 0
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
