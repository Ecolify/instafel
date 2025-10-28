package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import org.apache.commons.io.FileUtils
import java.io.File

/**
 * Network Interceptor patch - intercepts network requests for Ghost Mode
 * 
 * Based on InstaEclipse Interceptor.java implementation which hooks
 * TigonServiceLayer.startRequest to intercept and block network requests
 * based on URI patterns.
 * 
 * This patch:
 * 1. Finds the TigonServiceLayer class
 * 2. Locates the startRequest method
 * 3. Injects NetworkInterceptor.interceptRequest() call at the beginning
 * 4. Blocks requests to ghost mode endpoints by redirecting them
 */
@PInfos.PatchInfo(
    name = "Network Interceptor",
    shortname = "network_interceptor",
    desc = "Intercept network requests for ghost mode features",
    isSingle = true
)
class NetworkInterceptor : InstafelPatch() {

    lateinit var tigonServiceLayerFile: File

    companion object {
        private const val MAX_LOCALS_SEARCH_OFFSET = 30
        private const val TIGON_CLASS_NAME = "com/instagram/api/tigon/TigonServiceLayer"
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find TigonServiceLayer class")
        object : InstafelTask() {
            override fun execute() {
                val tigonServiceLayerFiles = smaliUtils.getSmaliFilesByName("/com/instagram/api/tigon/TigonServiceLayer.smali")
                
                when {
                    tigonServiceLayerFiles.isEmpty() -> {
                        failure("Patch aborted: TigonServiceLayer class not found at /com/instagram/api/tigon/TigonServiceLayer.smali")
                    }
                    tigonServiceLayerFiles.size == 1 -> {
                        tigonServiceLayerFile = tigonServiceLayerFiles.first()
                        
                        val content = smaliUtils.getSmaliFileContent(tigonServiceLayerFile.absolutePath)
                        val hasStartRequest = content.any { line -> 
                            line.contains(".method") && line.contains("startRequest")
                        }
                        
                        if (hasStartRequest) {
                            success("TigonServiceLayer class found successfully: ${tigonServiceLayerFile.name}")
                        } else {
                            failure("Patch aborted: TigonServiceLayer found but does not contain startRequest method")
                        }
                    }
                    else -> {
                        tigonServiceLayerFile = tigonServiceLayerFiles.first()
                        
                        val content = smaliUtils.getSmaliFileContent(tigonServiceLayerFile.absolutePath)
                        val hasStartRequest = content.any { line -> 
                            line.contains(".method") && line.contains("startRequest")
                        }
                        
                        if (hasStartRequest) {
                            success("TigonServiceLayer class found (picked first of ${tigonServiceLayerFiles.size}): ${tigonServiceLayerFile.name}")
                        } else {
                            failure("Patch aborted: TigonServiceLayer found but does not contain startRequest method")
                        }
                    }
                }
            }
        },
        @PInfos.TaskInfo("Inject network interceptor into startRequest")
        object : InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(tigonServiceLayerFile.absolutePath).toMutableList()
                var methodLine = -1
                var localsLine = -1

                fContent.forEachIndexed { index, line ->
                    if (methodLine == -1 && line.contains(".method") && line.contains("startRequest")) {
                        val signatureMatch = Regex("\\(([^)]*)\\)").find(line)
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
                            
                            if (paramCount == 3) {
                                methodLine = index
                                
                                for (j in methodLine until minOf(methodLine + MAX_LOCALS_SEARCH_OFFSET, fContent.size)) {
                                    if (fContent[j].contains(".locals")) {
                                        localsLine = j
                                        break
                                    }
                                }
                            }
                        }
                    }
                }

                if (methodLine == -1) {
                    failure("Could not find startRequest method with 3 parameters in TigonServiceLayer")
                    return
                }

                val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1

                val interceptorCode = listOf(
                    "",
                    "    invoke-static {p1}, Linstafel/app/utils/ghost/NetworkInterceptor;->interceptRequest(Ljava/lang/Object;)V",
                    ""
                )

                fContent.add(insertLine, interceptorCode.joinToString("\n"))
                FileUtils.writeLines(tigonServiceLayerFile, fContent)
                success("Network interceptor patch applied successfully at line $methodLine")
            }
        }
    )
}
