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
                // TigonServiceLayer is NOT obfuscated - it's in com/instagram/api/tigon/
                // Search for it by known package path instead of using X folder search
                val possiblePaths = listOf(
                    "com/instagram/api/tigon/TigonServiceLayer.smali"
                )
                
                var foundFile: File? = null
                
                // Search in all smali folders
                for (smaliFolder in smaliUtils.smaliFolders) {
                    for (path in possiblePaths) {
                        val candidateFile = File(smaliFolder, path)
                        if (candidateFile.exists()) {
                            // Verify it's the correct class by checking its content
                            val content = smaliUtils.getSmaliFileContent(candidateFile.absolutePath)
                            val hasClassDeclaration = content.any { line ->
                                line.contains(".class") && 
                                line.contains("Lcom/instagram/api/tigon/TigonServiceLayer;")
                            }
                            val hasStartRequest = content.any { line ->
                                line.contains(".method") && line.contains("startRequest")
                            }
                            
                            if (hasClassDeclaration && hasStartRequest) {
                                foundFile = candidateFile
                                break
                            }
                        }
                    }
                    if (foundFile != null) break
                }
                
                if (foundFile != null) {
                    tigonServiceLayerFile = foundFile
                    success("TigonServiceLayer class found successfully: ${tigonServiceLayerFile.absolutePath}")
                } else {
                    failure("Patch aborted: TigonServiceLayer class not found in expected location")
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
