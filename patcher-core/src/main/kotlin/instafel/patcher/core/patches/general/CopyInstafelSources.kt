package instafel.patcher.core.patches.general

import instafel.patcher.core.utils.Env
import instafel.patcher.core.utils.Log
import instafel.patcher.core.utils.Utils
import instafel.patcher.core.utils.modals.LastResourceIDs
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import instafel.patcher.core.utils.resources.IFLResData
import instafel.patcher.core.utils.resources.RTypes
import instafel.patcher.core.utils.resources.ResourceHelper
import instafel.patcher.core.utils.resources.ResourceParser
import instafel.patcher.core.utils.resources.ResourceType
import instafel.patcher.core.utils.resources.Resources
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.PrefixFileFilter
import org.apache.commons.io.filefilter.TrueFileFilter
import java.io.File

@PInfos.PatchInfo(
    name = "Copy Instafel Sources",
    shortname = "copy_instafel_src",
    desc = "This patch needs to executed for use Instafel stuffs",
    isSingle = false
)
class CopyInstafelSources: InstafelPatch() {

    lateinit var resDataParser: IFLResData.Parser
    var valuesFolderPath = Utils.mergePaths(Env.PROJECT_DIR, "sources", "res", "values");

    init {
        prepareResData()
    }

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Copy smali / resources")
        object: InstafelTask() {
            override fun execute() {
                val smallDexFolder: File? = smaliUtils.getSmallSizeSmaliFolder(smaliUtils.smaliFolders)

                if (smallDexFolder == null) {
                    failure("Smallest smali folder not found")
                    return;
                }

                val destFolder = File(
                    Utils.mergePaths(
                        Env.PROJECT_DIR,
                        "sources",
                        smallDexFolder.name,
                        "instafel"
                    )
                )

                Env.Project.iflSourcesFolder = smallDexFolder.name

                Log.info("Copying instafel resources")
                Utils.unzipFromResources(false, "/ifl_sources/ifl_sources.zip", destFolder.absolutePath)

                // ContentProvider classes must be in the primary DEX because they are loaded before
                // the Application class and before secondary DEXes are loaded by MultiDexApplication.
                // Additionally, classes referenced from Application.attach() must also be in the primary DEX
                // to avoid ClassNotFoundException during early app initialization.
                val primaryDexFolder = smaliUtils.smaliFolders?.firstOrNull()
                if (primaryDexFolder != null && primaryDexFolder != smallDexFolder) {
                    // Map of classes that must be in the primary DEX: subpath -> base class names
                    // Subpath is relative to instafel/app/
                    // All inner classes and synthetic classes (e.g., Class$InnerClass.smali, Class$$Lambda.smali) 
                    // will be automatically included for each base class
                    val classesToMoveToPrimaryDex = mapOf(
                        "utils" to listOf(
                            "InstafelFileProvider",      // ContentProvider - loaded before Application
                            "InitializeInstafel",         // Called from InstagramAppShell.attach()
                            "InstafelCrashHandler",       // Called from InstagramAppShell.attach()
                            "InstafelAdminUser",          // Used by InitializeInstafel.triggerUploadMapping()
                            "UploadMapping",              // Used by InitializeInstafel.triggerUploadMapping()
                            "GeneralFn",                  // Used by CheckUpdates and LocalizedStringGetter - must be in primary DEX
                            "OpenIflMenu"                 // Referenced from UserDetailFragment (AddLongClickEvent patch) - must be in primary DEX
                        ),
                        "utils/localization" to listOf(
                            "LocalizationUtils",          // Used by InitializeInstafel.setContext()
                            "Locales",                    // Used by LocalizationUtils.getDeviceLocale()
                            "LocalizedStringGetter"       // Used by CheckUpdates.showWelcomeDialog()
                        ),
                        "utils/types" to listOf(
                            "PreferenceKeys",             // Used by LocalizationUtils.getIflLocale()
                            "Types"                       // Used by CheckUpdates (Types$FreqLabels) - must be in primary DEX
                        ),
                        "utils/ghost" to listOf(
                            "GhostModeManager",           // Used by InitializeInstafel.setContext() - must be in primary DEX
                            "NetworkInterceptor"          // Called from TigonServiceLayer.startRequest (primary DEX) - must be in primary DEX
                        ),
                        "utils/dialog" to listOf(
                            // Dialog classes must be in primary DEX because CheckUpdates.showWelcomeDialog()
                            // is called during early app initialization from InitializeInstafel.triggerCheckUpdates()
                            "InstafelDialog",             // Used by CheckUpdates.showWelcomeDialog() - must be in primary DEX
                            "InstafelDialogItem",         // Used by InstafelDialog
                            "InstafelDialogMargins",      // Used by InstafelDialog
                            "InstafelDialogTextType",     // Used by InstafelDialog
                            "StringInputViews"            // Used by InstafelDialog
                        ),
                        "managers" to listOf(
                            "PreferenceManager",          // Used by LocalizationUtils.getIflLocale()
                            "OverridesManager"            // Used by InitializeInstafel.triggerUploadMapping()
                        ),
                        "ota" to listOf(
                            "CheckUpdates",               // Called from InitializeInstafel.triggerCheckUpdates() - must be in primary DEX
                            "IflEnvironment",             // Used by CheckUpdates - must be in primary DEX
                            "LastCheck"                   // Used by CheckUpdates - must be in primary DEX
                        ),
                        "ota/tasks" to listOf(
                            "VersionTask",                // Instantiated by CheckUpdates.check() - must be in primary DEX
                            "ChangelogTask",              // Instantiated by CheckUpdates.checkChangelog() - must be in primary DEX
                            "ChangelogContentTask",       // Instantiated by ChangelogTask.onPostExecute() - must be in primary DEX
                            "BuildInfoTask"               // Instantiated by VersionTask.onPostExecute() - must be in primary DEX
                        ),
                        "api/tasks" to listOf(
                            "BackupUpdateTask",           // Instantiated by CheckUpdates.checkBackupUpdate() - must be in primary DEX
                            "BackupUpdateDownloadTask"    // Instantiated by BackupUpdateTask.onPostExecute() - must be in primary DEX
                        ),
                        "api/models" to listOf(
                            "AutoUpdateInfo"              // Used by CheckUpdates.checkBackupUpdate() - must be in primary DEX
                        ),
                        "" to listOf(
                            "InstafelEnv",                // Used by InitializeInstafel.setContext()
                            "R"                           // R classes must be in primary DEX because Locales references R$drawable
                        )
                    )
                    
                    classesToMoveToPrimaryDex.forEach { (subPath, baseClassNames) ->
                        baseClassNames.forEach { baseClassName ->
                            // Get the source directory for this subpath
                            val sourceDir = File(
                                Utils.mergePaths(
                                    destFolder.absolutePath,
                                    "app",
                                    subPath
                                )
                            )
                            
                            // Find all files matching the base class name (including inner and synthetic classes)
                            // e.g., for "Locales" find: Locales.smali, Locales$LocaleType.smali, Locales$$Lambda.smali, etc.
                            val classFiles = sourceDir.listFiles { file ->
                                file.name == "$baseClassName.smali" || 
                                file.name.startsWith("$baseClassName$") && file.name.endsWith(".smali")
                            } ?: emptyArray()
                            
                            if (classFiles.isEmpty()) {
                                Log.warning("No files found for $baseClassName in ${sourceDir.absolutePath}")
                            }
                            
                            classFiles.forEach { classFile ->
                                val classDest = File(
                                    Utils.mergePaths(
                                        Env.PROJECT_DIR,
                                        "sources",
                                        primaryDexFolder.name,
                                        "instafel",
                                        "app",
                                        subPath,
                                        classFile.name
                                    )
                                )
                                
                                try {
                                    if (!classDest.parentFile.exists() && !classDest.parentFile.mkdirs()) {
                                        Log.severe("Failed to create directory for ${classFile.name} in primary DEX")
                                        failure("Could not create directory: ${classDest.parentFile.absolutePath}")
                                        return
                                    }
                                    FileUtils.copyFile(classFile, classDest)
                                    if (!classFile.delete()) {
                                        Log.warning("Failed to delete source ${classFile.name} after copy")
                                    }
                                    Log.info("${classFile.name} moved to primary DEX (${primaryDexFolder.name})")
                                } catch (e: Exception) {
                                    Log.severe("Failed to move ${classFile.name} to primary DEX: ${e.message}")
                                    failure("${classFile.name} must be in primary DEX for app to function")
                                    return
                                }
                            }
                        }
                    }
                }

                val igResourcesFolder = File(Utils.mergePaths(Env.PROJECT_DIR, "sources", "res"))
                Utils.unzipFromResources(false, "/ifl_sources/ifl_resources.zip", igResourcesFolder.absolutePath)
                success("Instafel resources copied")
            }
        },
        @PInfos.TaskInfo("Add activities and providers to manifest")
        object: InstafelTask() {
            override fun execute() {
                val manifestFile = File(Utils.mergePaths(Env.PROJECT_DIR, "sources", "AndroidManifest.xml"))
                val manifestDoc = ResourceParser.parseResourceDocument(manifestFile)

                val applicationElement = ResourceParser.getNodesFromResFile(manifestDoc, "application").item(0)
                val manifestElement = manifestDoc.documentElement

                val iflActivities = resDataParser.activities
                iflActivities.forEach { activity ->
                    applicationElement?.appendChild(manifestDoc.importNode(activity, true))
                }
                Log.info("Totally ${iflActivities.size} activity added")

                val iflProviders = resDataParser.providers
                iflProviders.forEach { provider ->
                    applicationElement?.appendChild(manifestDoc.importNode(provider, true))
                }
                Log.info("Totally ${iflProviders.size} provider added")

                val requestPermEl = manifestDoc.createElement("uses-permission").apply {
                    setAttribute("android:name", "android.permission.REQUEST_INSTALL_PACKAGES")
                }
                manifestElement.appendChild(requestPermEl)

                ResourceParser.buildXmlFile(manifestDoc, manifestFile) // build manifest xml file
                success("Activities & providers added successfully from Instafel base")
            }
        },
        @PInfos.TaskInfo("Merge Instafel strings with IG")
        object: InstafelTask() {
            override fun execute() {
                val igResources = ResourceParser.parseResString(getValueResourceFile("strings.xml"))

                resDataParser.resourcesStrings["strings"]?.let { sourceResources ->
                    mergeResources(igResources, sourceResources)
                }

                igResources.document?.let { doc ->
                    igResources.sourceFile?.let { file ->
                        ResourceParser.buildXmlFile(doc, file)
                    }
                }

                val strings: Map<String, Resources<RTypes.TString>> = resDataParser.resourcesStrings

                Env.INSTAFEL_LOCALES.forEach { locale ->
                    val targetFile = File(Utils.mergePaths("$valuesFolderPath-$locale", "strings.xml"))
                    val targetResources = ResourceParser.parseResString(targetFile)

                    strings["strings-$locale"]?.let { sourceResources ->
                        mergeResources(targetResources, sourceResources)
                    }
                }

                success("Instafel strings merged successfully.")
            }
        },
        @PInfos.TaskInfo("Copy IFL resources into Instagram")
        object: InstafelTask() {
            override fun execute() {
                mergeResources(ResourceParser.parseResColor(
                    getValueResourceFile("colors.xml")
                ), resDataParser.resourcesColor);
                mergeResources(ResourceParser.parseResAttr(
                    getValueResourceFile("attrs.xml")
                ), resDataParser.resourcesAttr);
                mergeResources(ResourceParser.parseResId(
                    getValueResourceFile("ids.xml")
                ), resDataParser.resourcesId);
                mergeResources(ResourceParser.parseResStyle(
                    getValueResourceFile("styles.xml")
                ), resDataParser.resourcesStyle);

                success("All resources merged succesfully");
            }
        },
        @PInfos.TaskInfo("Copy public resources with new IDs")
        object: InstafelTask() {
            override fun execute() {
                val igPublic: Resources<RTypes.TPublic> = ResourceParser.parseResPublic(getValueResourceFile("public.xml"))
                val categorizedIGPublics: Map<String, List<Int>> = ResourceHelper.getIDsWithCategory(igPublic)
                val lastResourceIds = ResourceHelper.getBiggestResourceID(categorizedIGPublics)

                val iflPublic: Resources<RTypes.TPublic> = resDataParser.resourcesPublic
                iflPublic.forEach { tPublic ->
                    val newId = lastResourceIds[tPublic.type] + 1
                    lastResourceIds[tPublic.type] = newId
                    tPublic.id = ResourceHelper.convertToHex(newId)
                }

                Log.info("Totally ${iflPublic.count()} public's id updated.")

                mergeResources(igPublic, iflPublic)
                success("ID's successfully defined.")
            }
        },
        @PInfos.TaskInfo("Update Instafel R classes")
        object: InstafelTask() {
            override fun execute() {
                val smaliFolder = File(
                    Utils.mergePaths(
                        smaliUtils.getSmaliFolderByPaths("instafel", "app")!!.absolutePath,
                        "instafel", "app"
                    )
                )

                val files: Collection<File> = FileUtils.listFiles(smaliFolder, PrefixFileFilter("R$"), TrueFileFilter.INSTANCE)
                val igResources: Resources<RTypes.TPublic> = ResourceParser.parseResPublic(getValueResourceFile("public.xml"))
                igResources.resources.removeIf { !it.name.startsWith("ifl_") }
                files.forEach { file -> ResourceHelper.updateRClass(igResources, file) }

                success("All R classes updated successfully.")
            }
        }
    )

    private fun <T : ResourceType> mergeResources(target: Resources<T>, source: Resources<T>) {
        source.forEach { resource ->
            target.addExternalResource(resource)
        }

        target.document?.let { doc ->
            target.sourceFile?.let { file ->
                ResourceParser.buildXmlFile(doc, file)
            }
        }

        Log.info("Totally ${source.count()} resource(s) added to ${target.resTypeName}")
    }

    private fun getValueResourceFile(fileName: String): File {
        return File(Utils.mergePaths(valuesFolderPath, fileName))
    }

    private fun prepareResData() {
        val resDataPath = File(Utils.mergePaths(Env.PROJECT_DIR, "ifl_data_temp.xml"))
        Utils.copyResourceToFile("/ifl_sources/ifl_data.xml", resDataPath)
        resDataParser = IFLResData.Parser(resDataPath)
    }
}