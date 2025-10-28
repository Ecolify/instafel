package instafel.patcher.core.jobs

import com.google.gson.Gson
import instafel.patcher.core.source.APKSigner
import instafel.patcher.core.source.SourceManager
import instafel.patcher.core.source.SourceUtils
import instafel.patcher.core.source.WorkingDir
import instafel.patcher.core.utils.Env
import instafel.patcher.core.utils.Log
import instafel.patcher.core.utils.SmaliUtils
import instafel.patcher.core.utils.Utils
import instafel.patcher.core.utils.modals.CLIJob
import instafel.patcher.core.utils.modals.pojo.BuildInfo
import instafel.patcher.core.utils.modals.pojo.FileInfo
import instafel.patcher.core.utils.modals.pojo.FileInfos
import instafel.patcher.core.utils.modals.pojo.Patcher
import instafel.patcher.core.utils.modals.pojo.PatcherData
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.TrueFileFilter
import java.io.File
import java.time.Instant
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter
import kotlin.system.exitProcess

object BuildProject: CLIJob {

    lateinit var smaliUtils: SmaliUtils
    lateinit var sourceManager: SourceManager
    lateinit var IG_VERSION: String
    lateinit var IG_VER_CODE: String
    lateinit var GENERATION_ID: String
    var IFL_VERSION = 0
    lateinit var APK_UC: File
    lateinit var APK_C: File
    lateinit var buildFolder: File
    lateinit var APK_SIGNER_JAR: File
    lateinit var TESTKEY_KS: File
    lateinit var BUILD_TS: String
    lateinit var cloneRefFolder: File

    var isCloneGenerated = false
    var isProductionMode = false

    override fun runJob(vararg args: Any) {
        val workingDir = args.getOrNull(0) as? File
        val coreCommit = args.getOrNull(1) as? String
        val projectTag = args.getOrNull(2) as? String
        val projectVersion = args.getOrNull(3) as? String

        if (workingDir !is File || coreCommit !is String || projectTag !is String || projectVersion !is String) {
            Log.severe("Wrong arguments given by CLI")
            exitProcess(-1)
        }

        Env.PROJECT_DIR = WorkingDir.getExistsWorkingDir(workingDir)
        Env.setupConfig()
        Env.setupProject()

        Log.info("Building \"${workingDir.name}\" project...")
        configureEnvironment()
        setOutputAPKFiles()
        updateInstafelEnv(coreCommit, projectTag, projectVersion)
        generateAPKs()
        signOutputs()
        generateBuildInfo(coreCommit, projectTag, projectVersion)
        Log.info("Project successfully built into /build folder of project")

        Env.saveConfig()
        Env.saveProject()
    }

    fun signOutputs() {
        APKSigner.moveOrDeleteApkSigner(true, APK_SIGNER_JAR, TESTKEY_KS)
        if (isCloneGenerated) {
            signAPKs(APK_UC, APK_C)
        } else {
            signAPKs(APK_UC)
        }
        APKSigner.moveOrDeleteApkSigner(false, APK_SIGNER_JAR, TESTKEY_KS)
    }

    fun signAPKs(vararg APKs: File) {
        Log.info("Signing APKs")

        val params = mutableListOf("-a").apply {
            addAll(APKs.map { it.absolutePath })
            Log.info("Using default keystore for signing APKs")

            addAll(
                listOf(
                    "--ks", TESTKEY_KS.absolutePath,
                    "--ksAlias", "testkey",
                    "--ksPass", "android",
                    "--ksKeyPass", "android"
                )
            )

            add("--overwrite")
        }

        Log.info("Signing apks...")
        val exitCode = APKSigner.execSigner(params, APK_SIGNER_JAR)

        if (exitCode == 0) {
            Log.info("All APKs successfully signed")
        } else {
            Log.severe("Error while signing APKs, clearing /build directory and force exiting")
            exitProcess(-1)
        }
    }

    fun generateBuildInfo(coreCommit: String, patcherTag: String, patcherVersion: String) {
        val buildInfo = BuildInfo(
            manifestVersion = 1,
            patcher = Patcher(
                version = patcherVersion,
                commit = coreCommit,
                channel = patcherTag
            ),
            patcherData = PatcherData(
                buildDate = BUILD_TS,
                generationId = GENERATION_ID,
                iflVersion = IFL_VERSION,
                igVersion = IG_VERSION,
                igVersionCode = IG_VER_CODE
            ),
            fileInfos = FileInfos(
                unclone = FileInfo(
                    fileName = APK_UC.name,
                    fileHash = Utils.getFileMD5(APK_UC)
                ),
                clone = FileInfo(
                    fileName = APK_C.name,
                    fileHash = Utils.getFileMD5(APK_C)
                )
            ),
        )

        val bInfoFile = File(Utils.mergePaths(buildFolder.absolutePath, "build_info.json"))
        bInfoFile.writeText(Env.gson.toJson(buildInfo, BuildInfo::class.java))
        Log.info("Build information file saved.")
    }


    fun generateAPKs() {
        Log.info("Generating APKs...")
        Log.info("Generating unclone variant...")
        sourceManager.build(APK_UC.name)
        Log.info("Unclone APK successfully generated...")
        if (isCloneGenerated) {
            Log.info("Generating clone variant....")
            replaceSourceFiles(true);
            sourceManager.build(APK_C.name)
            replaceSourceFiles(false);
            Log.info("Clone APK successfully generated.")
        }
    }

    fun replaceSourceFiles(type: Boolean) {
        val originalTempDir = File(Utils.mergePaths(Env.PROJECT_DIR, "orig_temp"))
        FileUtils.forceMkdir(originalTempDir)

        val filesAndDirs = FileUtils.listFilesAndDirs(
            cloneRefFolder,
            TrueFileFilter.TRUE,
            TrueFileFilter.TRUE
        )

        if (type) {
            for (cloneFile in filesAndDirs) {
                if (!cloneFile.isDirectory) {
                    val sourceFile = File(cloneFile.absolutePath.replace("clone_ref", "sources"))
                    val tempOrigFile = File(cloneFile.absolutePath.replace("clone_ref", "orig_temp"))

                    FileUtils.moveFile(sourceFile, tempOrigFile)
                    FileUtils.moveFile(cloneFile, sourceFile)
                }
            }
        } else {
            for (cloneFile in filesAndDirs) {
                if (!cloneFile.isDirectory) {
                    val originalFileFromTemp = File(cloneFile.absolutePath.replace("clone_ref", "orig_temp"))
                    val originalFile = File(cloneFile.absolutePath.replace("clone_ref", "sources"))

                    FileUtils.deleteQuietly(originalFile)
                    FileUtils.moveFile(originalFileFromTemp, originalFile)
                }
            }
        }
    }

    fun configureEnvironment() {
        Log.info("Initializing build environment...")

        smaliUtils = SmaliUtils(Env.PROJECT_DIR)
        BUILD_TS = Instant.now().toString()
        buildFolder =  File(Utils.mergePaths(Env.PROJECT_DIR, "build"))
        APK_SIGNER_JAR = File(Utils.mergePaths(Env.PROJECT_DIR, "build", "signer.jar"))
        TESTKEY_KS = File(Utils.mergePaths(Env.PROJECT_DIR, "build", "testkey.keystore"))
        cloneRefFolder = File(Env.PROJECT_DIR, "clone_ref")
        isCloneGenerated = cloneRefFolder.exists()
        isProductionMode = Env.Config.productionMode
        IG_VER_CODE = Env.Project.igVersionCode.ifEmpty { "E" }
        IG_VERSION = Env.Project.igVersion.ifEmpty { "E" }

        if (buildFolder.exists()) {
            FileUtils.deleteDirectory(buildFolder)
            Log.info("Old build directory got deleted.")
        }

        if (isProductionMode) {
            IFL_VERSION = Env.Project.iflVersion
            GENERATION_ID = Env.Project.generationId

            if (IFL_VERSION == 0 && GENERATION_ID == "E") {
                Log.severe("Environment file is not compatible for building..")
                exitProcess(-1)
            }
        } else {
            IFL_VERSION = 0
            GENERATION_ID = Env.Project.generationId.ifEmpty { "E" }
        }

        if (IG_VERSION == "E" && IG_VER_CODE == "E") {
            Log.severe("Environment file is not compatible for building..")
            exitProcess(-1)
        }

        sourceManager = SourceManager().apply {
            config = SourceUtils.getDefaultIflConfigBuilder(config)
            config.frameworkDirectory = SourceUtils.getDefaultFrameworkDirectory()
        }

        Log.info("Building environment is configured successfully")
    }

    fun setOutputAPKFiles() {
        val buildPath = Utils.mergePaths(Env.PROJECT_DIR, "build")

        if (!isProductionMode) {
            APK_UC = File(buildPath, "unclone.apk")
            APK_C = File(buildPath, "clone.apk")
        } else {
            val versionSuffix = "v${IFL_VERSION}_${IG_VERSION}"
            APK_UC = File(buildPath, "instafel_uc_$versionSuffix.apk")
            APK_C = File(buildPath, "instafel_c_$versionSuffix.apk")
        }
    }

    /**
     * Updates the InstafelEnv.smali file with build-time values.
     * 
     * This function modifies the InstafelEnv.smali file to replace placeholder values
     * with actual build information. It's important to maintain valid smali syntax:
     * - String placeholders are replaced in const-string instructions
     * - Boolean fields like PRODUCTION_MODE must be set via the <clinit> constructor,
     *   not through field declaration default values
     * 
     * File location:
     * The InstafelEnv.smali file may be located in either the primary DEX folder or the
     * iflSourceFolder depending on how the CopyInstafelSources patch executed:
     * - If primary DEX differs from the smallest smali folder, InstafelEnv.smali is moved
     *   to the primary DEX (required for early app initialization)
     * - Otherwise, it remains in the iflSourceFolder (smallest smali folder)
     * This function checks both locations to ensure the file is found regardless of the setup.
     */
    fun updateInstafelEnv(coreCommit: String, projectTag: String, patcherVersion: String) {
        var envOkCheck = false;
        Env.Project.appliedPatches.groupPatches.forEach { group ->
            group.patches.forEach { patch ->
                if (patch.shortname == "copy_instafel_src") envOkCheck = true;
            }
        }

        if (envOkCheck) {
            Log.info("Updating Instafel app environment...")

            val iflSourceFolder = Env.Project.iflSourcesFolder.ifEmpty { "E" }
            if (iflSourceFolder == "E") {
                Log.severe("IFL_SOURCES_FOLDER is not defined")
                exitProcess(-1)
            }

            // InstafelEnv.smali may be in the primary DEX or in the iflSourceFolder
            // The CopyInstafelSources patch moves it to primary DEX if they differ
            // Primary DEX is the first smali folder (usually "smali")
            val primaryDexFolder = smaliUtils.smaliFolders?.firstOrNull()
            
            val envFile = if (primaryDexFolder != null) {
                // Try primary DEX first
                val primaryDexEnvFile = File(
                    Utils.mergePaths(
                        Env.PROJECT_DIR,
                        "sources",
                        primaryDexFolder.name,
                        "instafel",
                        "app",
                        "InstafelEnv.smali"
                    )
                )
                
                if (primaryDexEnvFile.exists()) {
                    primaryDexEnvFile
                } else {
                    // Fallback to iflSourceFolder location
                    File(
                        Utils.mergePaths(
                            Env.PROJECT_DIR,
                            "sources",
                            iflSourceFolder,
                            "instafel",
                            "app",
                            "InstafelEnv.smali"
                        )
                    )
                }
            } else {
                // No primary DEX found, use iflSourceFolder
                File(
                    Utils.mergePaths(
                        Env.PROJECT_DIR,
                        "sources",
                        iflSourceFolder,
                        "instafel",
                        "app",
                        "InstafelEnv.smali"
                    )
                )
            }
            
            if (!envFile.exists()) {
                Log.severe("InstafelEnv.smali not found at ${envFile.absolutePath}")
                exitProcess(-1)
            }

            val origEnvFile = File(Utils.mergePaths(Env.PROJECT_DIR, "sources", "InstafelEnv_orig.smali"))

            if (origEnvFile.exists()) {
                FileUtils.copyFile(origEnvFile, envFile)
            } else {
                FileUtils.copyFile(envFile, origEnvFile)
            }

            val fContent = smaliUtils.getSmaliFileContent(envFile.absolutePath).toMutableList()

            val pairs = mutableMapOf(
                "_iflver_" to if (isProductionMode) IFL_VERSION.toString() else "NOT_PROD_MODE",
                "_genid_" to if (isProductionMode) GENERATION_ID else "NOT_PROD_MODE",
                "_igver_" to IG_VERSION,
                "_igvercode_" to IG_VER_CODE,
                "_commit_" to coreCommit,
                "_ptag" to projectTag,
                "_pversion_" to "v$patcherVersion",
                "_branch_" to "main"
            )

            Env.Project.appliedPatches.appliedPatchCounts["singles"] = Env.Project.appliedPatches.singlePatches.count()
            Env.Project.appliedPatches.groupPatches.forEach { group -> Env.Project.appliedPatches.appliedPatchCounts[group.shortname] = group.patches.count() }

            val gson = Gson()
            val patchesTextEscaped = gson.toJson(Env.Project.appliedPatches)
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")

            pairs["_patchesjson_"] = patchesTextEscaped

            for (i in fContent.indices) {
                var line = fContent[i]

                // IMPORTANT: Only modify the PRODUCTION_MODE initialization in <clinit>, not the field declaration.
                // In smali, boolean fields cannot have default values in their declaration (unlike constant int fields in R classes).
                // The correct syntax is to modify the const/4 instruction that sets the value in the static constructor.
                // Example:
                //   .field public static PRODUCTION_MODE:Z  <- Field declaration (DO NOT MODIFY)
                //   ...
                //   const/4 v0, 0x1                         <- Sets boolean value (MODIFY THIS)
                //   sput-boolean v0, L.../PRODUCTION_MODE:Z <- Stores the value
                if (line.contains("sput-boolean") && line.contains("PRODUCTION_MODE")) {
                    // Change the boolean value being set (0x0 = false, 0x1 = true)
                    if (isProductionMode) {
                        // Ensure the previous line sets v0 to 0x1 (true)
                        if (i > 1 && fContent[i - 2].trim().startsWith("const/4")) {
                            fContent[i - 2] = "    const/4 v0, 0x1"
                        }
                    } else {
                        // Ensure the previous line sets v0 to 0x0 (false)
                        if (i > 1 && fContent[i - 2].trim().startsWith("const/4")) {
                            fContent[i - 2] = "    const/4 v0, 0x0"
                        }
                    }
                }

                for ((key, value) in pairs) {
                    if (line.contains(key)) {
                        line = line.replace(key, value)
                    }
                }

                fContent[i] = line
            }

            FileUtils.writeLines(envFile, fContent)
            Log.info("Instafel app environment configured successfully")
        }
    }
}