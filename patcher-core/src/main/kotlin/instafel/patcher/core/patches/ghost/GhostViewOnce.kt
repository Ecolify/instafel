package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.Utils
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
 * strings.
 * 
 * Strategy:
 * 1. Search for files containing both marker strings
 * 2. If multiple files found, select the one that best matches the target pattern:
 *    - Prefer files with fewer methods (more focused classes)
 *    - Exclude very large files (likely string constant tables)
 *    - Exclude simple data classes (just getters/setters)
 * 3. Find the method that contains both marker strings
 * 4. Inject an early return when ghost viewonce is enabled
 */
@PInfos.PatchInfo(
    name = "Ghost ViewOnce",
    shortname = "ghost_viewonce",
    desc = "View once messages without marking as seen",
    isSingle = true
)
class GhostViewOnce: InstafelPatch() {

    lateinit var ghostViewOnceFile: File

    /**
     * Select the best candidate file from multiple matches
     * Criteria:
     * - Exclude files with >1000 lines (likely string constant tables like 000.smali, 6oh.smali)
     * - Exclude files with <50 lines (too simple, likely just data classes)
     * - Prefer files with moderate complexity (50-500 lines)
     * - Prefer files with "send" or "marker" in method names
     */
    private fun selectBestCandidate(candidates: List<File>): File? {
        data class FileScore(val file: File, val score: Int, val lineCount: Int)
        
        val scored = candidates.mapNotNull { file ->
            val content = smaliUtils.getSmaliFileContent(file.absolutePath)
            val lineCount = content.size
            var score = 0
            
            // Scoring criteria
            when {
                lineCount > 1000 -> return@mapNotNull null // Exclude very large files
                lineCount < 50 -> return@mapNotNull null // Exclude very small files
                lineCount in 50..200 -> score += 50 // Prefer small to medium files
                lineCount in 201..500 -> score += 30 // Medium files are OK
                else -> score += 10 // Larger files are less preferred
            }
            
            // Check for relevant method names
            val hasRelevantMethods = content.any { line ->
                line.contains(".method") && (
                    line.contains("send", ignoreCase = true) ||
                    line.contains("marker", ignoreCase = true) ||
                    line.contains("visual", ignoreCase = true)
                )
            }
            if (hasRelevantMethods) score += 20
            
            // Check if it's not just a string constant class
            val methodCount = content.count { it.contains(".method") }
            if (methodCount > 2) score += 10 // More than just init/getters
            
            // Check for constructor patterns (data classes usually have complex constructors)
            val hasComplexConstructor = content.any { line ->
                line.contains("<init>") && (
                    line.contains("LX/") || // Takes custom types
                    line.contains("parseFromJson") // JSON parsing
                )
            }
            if (hasComplexConstructor) score += 15
            
            FileScore(file, score, lineCount)
        }
        
        if (scored.isEmpty()) return null
        
        // Return the file with highest score
        return scored.maxByOrNull { it.score }?.file
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find ghost viewonce source file")
        object: InstafelTask() {
            override fun execute() {
                // Search for files containing both marker strings
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCordsAllowMultiple(smaliUtils,
                        listOf(
                            listOf("visual_item_seen"),
                            listOf("send_visual_item_seen_marker")
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        ghostViewOnceFile = result.file
                        success("Ghost viewonce source class found successfully")
                    }
                    is FileSearchResult.MultipleFound -> {
                        val selected = selectBestCandidate(result.files)
                        if (selected != null) {
                            ghostViewOnceFile = selected
                            success("Ghost viewonce source class selected from ${result.files.size} candidates: ${Utils.makeSmaliPathShort(selected)}")
                        } else {
                            failure("Could not select best candidate from ${result.files.size} files. Candidates: ${result.files.map { Utils.makeSmaliPathShort(it) }}")
                        }
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no classes found for ghost viewonce.")
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
