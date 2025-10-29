package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import org.apache.commons.io.FileUtils
import java.io.File

/**
 * Network Interceptor - Intercepts network requests for Ghost Mode and other features
 * 
 * REFERENCE: InstaEclipse Interceptor.java
 * - Hooks TigonServiceLayer.startRequest to intercept network requests
 * - Analyzes URI patterns to determine if requests should be blocked
 * - Replaces blocked URIs with fake endpoint (https://127.0.0.1/404)
 * 
 * IMPLEMENTATION:
 * This patch finds the TigonServiceLayer class and its startRequest method with
 * 3 parameters. It injects a call to NetworkInterceptor.interceptRequest() which:
 * 1. Uses reflection to find the URI field in the request object
 * 2. Checks if the URI matches any ghost mode or feature patterns
 * 3. Replaces blocked URIs with a fake endpoint to prevent the request
 * 
 * BLOCKED REQUEST PATTERNS (when respective features are enabled):
 * 
 * Ghost Screenshot:
 * - /screenshot/ and /ephemeral_screenshot/ endpoints
 * 
 * Ghost ViewOnce:
 * - /item_replayed/ endpoints (view once replay tracking)
 * - /direct.*/item_seen/ endpoints (direct message seen tracking)
 * 
 * Ghost Story:
 * - /api/v2/media/seen/ endpoints (story view tracking)
 * 
 * Ghost Live:
 * - /heartbeat_and_get_viewer_count/ endpoints (live viewer tracking)
 * 
 * TECHNICAL DETAILS:
 * - Uses reflection to locate URI field dynamically (handles obfuscation)
 * - Caches field name after first successful discovery for performance
 * - Works in conjunction with method-level patches for comprehensive coverage
 * 
 * BEHAVIOR:
 * - Active: Blocked requests are redirected to https://127.0.0.1/404
 * - Inactive: All requests pass through normally
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
                val candidates = smaliUtils.getSmaliFilesByName("com/instagram/api/tigon/TigonServiceLayer.smali")
                
                if (candidates.isEmpty()) {
                    failure("Patch aborted: TigonServiceLayer class not found")
                    return
                }

                val validCandidates = candidates.filter { file ->
                    val content = smaliUtils.getSmaliFileContent(file.absolutePath)
                    var hasClassDeclaration = false
                    var hasStartRequest = false
                    
                    for (line in content) {
                        if (line.contains(".class") && line.contains("Lcom/instagram/api/tigon/TigonServiceLayer;")) {
                            hasClassDeclaration = true
                        }
                        if (line.contains("startRequest")) {
                            hasStartRequest = true
                        }
                        if (hasClassDeclaration && hasStartRequest) break
                    }
                    
                    hasClassDeclaration && hasStartRequest
                }

                when {
                    validCandidates.isEmpty() -> {
                        failure("Patch aborted: No valid TigonServiceLayer class with startRequest method found")
                    }
                    validCandidates.size == 1 -> {
                        tigonServiceLayerFile = validCandidates[0]
                        success("TigonServiceLayer class found successfully: ${tigonServiceLayerFile.absolutePath}")
                    }
                    else -> {
                        tigonServiceLayerFile = validCandidates[0]
                        success("TigonServiceLayer class found (first of ${validCandidates.size}): ${tigonServiceLayerFile.absolutePath}")
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

                // Find the startRequest method with 3 parameters
                // Based on InstaEclipse: startRequest(?, ?, ?) where first param contains URI field
                fContent.forEachIndexed { index, line ->
                    if (methodLine == -1 && line.contains(".method") && line.contains("startRequest")) {
                        // Check if it has 3 parameters by analyzing the signature
                        val signatureMatch = Regex("\\(([^)]*)\\)").find(line)
                        if (signatureMatch != null) {
                            val params = signatureMatch.groupValues[1]
                            
                            // Count parameters
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
                            
                            // InstaEclipse hooks startRequest with 3 parameters
                            if (paramCount == 3) {
                                methodLine = index
                                
                                // Find .locals line
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

                // Insert after .locals line or after method declaration
                val insertLine = if (localsLine != -1) localsLine + 1 else methodLine + 1

                // Inject network interceptor check using reflection-based approach
                // The NetworkInterceptor.interceptRequest() method will use reflection to:
                // 1. Find the URI field in the request object (p1)
                // 2. Check if it should be blocked
                // 3. Replace it with a fake URI if needed
                val interceptorCode = listOf(
                    "",
                    "    # Network Interceptor - Ghost Mode",
                    "    # Call NetworkInterceptor.interceptRequest(requestObj) using reflection",
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
