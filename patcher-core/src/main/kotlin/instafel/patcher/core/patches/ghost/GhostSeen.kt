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
 * Ghost Seen - Prevents read receipts from being sent
 * 
 * Based on InstaEclipse: hooks static final void methods with >= 3 parameters 
 * containing "mark_thread_seen-" string.
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
                val searchPattern = listOf(
                    listOf("mark_thread_seen-"),
                    listOf("invoke-")
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
                        // Filter by file size to get implementation files
                        val candidates = result.files.filter { file ->
                            val lineCount = file.useLines { it.count() }
                            lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
                        }
                        
                        if (candidates.size == 1) {
                            ghostSeenFile = candidates[0]
                            success("Ghost seen source class found after filtering: ${ghostSeenFile.name}")
                        } else if (candidates.isEmpty()) {
                            failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates")
                        } else {
                            failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
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

                fContent.forEachIndexed { index, line ->
                    if (line.contains("const-string") && line.contains("mark_thread_seen-")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                val methodDeclaration = fContent[i]
                                if (methodDeclaration.contains("static") && 
                                    methodDeclaration.contains("final") &&
                                    methodDeclaration.contains(")V")) {
                                    
                                    val signatureMatch = Regex("\\(([^)]*)\\)").find(methodDeclaration)
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
                                        
                                        if (paramCount >= 3) {
                                            methodLine = i
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
                        "    # Ghost Seen - Block read receipts",
                        "    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeenEnabled()Z",
                        "    move-result v0",
                        "    if-eqz v0, :ghost_seen_continue",
                        "    return-void",
                        "    :ghost_seen_continue",
                        ""
                    )

                    fContent.addAll(insertLine, lines)
                    FileUtils.writeLines(ghostSeenFile, fContent)
                    success("Ghost seen patch successfully applied to method at line $methodLine")
                } else {
                    failure("Required method for ghost seen cannot be found (need: static final void with >= 3 params).")
                }
            }
        }
    )
}