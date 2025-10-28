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
 * Based on InstaEclipse: hooks void methods with exactly 3 parameters containing "visual_item_seen" string.
 * InstaEclipse validates the third parameter contains "visual_item_seen" or "send_visual_item_seen_marker"
 * at runtime before blocking. This smali patch achieves the same by injecting an early return.
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
                val searchPattern = listOf(
                    listOf("visual_item_seen"),
                    listOf("invoke-")
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
                        val sizeFilteredCandidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        val candidates = sizeFilteredCandidates.filter { file ->
                            val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                            var hasTargetMethod = false
                            var visualItemSeenLine = -1
                            
                            fContent.forEachIndexed { index, line ->
                                if (line.contains("const-string") && line.contains("visual_item_seen")) {
                                    visualItemSeenLine = index
                                }
                            }
                            
                            if (visualItemSeenLine != -1) {
                                for (methodIndex in visualItemSeenLine downTo 0) {
                                    if (fContent[methodIndex].contains(".method")) {
                                        val methodDeclaration = fContent[methodIndex]
                                        val signatureMatch = Regex("\\(([^)]*)\\)V").find(methodDeclaration)
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
                                            if (paramCount == 3) {
                                                hasTargetMethod = true
                                            }
                                        }
                                        break
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

                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("visual_item_seen")) {
                        for (methodIndex in index downTo 0) {
                            if (fContent[methodIndex].contains(".method")) {
                                val methodDeclaration = fContent[methodIndex]
                                val signatureMatch = Regex("\\(([^)]*)\\)V").find(methodDeclaration)
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
                                    
                                    if (paramCount == 3) {
                                        methodLine = methodIndex
                                        for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                            if (fContent[j].contains(".locals")) {
                                                localsLine = j
                                                break
                                            }
                                        }
                                        break
                                    }
                                }
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
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