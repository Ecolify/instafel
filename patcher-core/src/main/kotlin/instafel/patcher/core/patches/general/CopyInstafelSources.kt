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
                //
                // This mapping includes ALL classes extracted from ifl_sources.zip to ensure complete
                // functionality across all features. Each class and its inner/synthetic classes will be
                // automatically moved to the primary DEX.
                val primaryDexFolder = smaliUtils.smaliFolders?.firstOrNull()
                if (primaryDexFolder != null && primaryDexFolder != smallDexFolder) {
                    // Map of classes that must be in the primary DEX: subpath -> base class names
                    // Subpath is relative to instafel/app/
                    // All inner classes and synthetic classes (e.g., Class$InnerClass.smali, Class$$Lambda.smali) 
                    // will be automatically included for each base class
                    val classesToMoveToPrimaryDex = mapOf(
                        "" to listOf(
                            "ExampleAppClass",            // Example/template class
                            "InstafelEnv",                // Used by InitializeInstafel.setContext()
                            "R"                           // R classes must be in primary DEX because Locales references R$drawable
                        ),
                        "activity" to listOf(
                            "ifl_a_ghost_mode",           // Ghost mode activity
                            "ifl_a_language",             // Language selection activity
                            "ifl_a_menu",                 // Main menu activity - Started by InitializeInstafel.startInstafel()
                            "ifl_a_misc",                 // Miscellaneous settings activity
                            "ifl_a_ota"                   // OTA update activity
                        ),
                        "activity/about" to listOf(
                            "ifl_a_about",                // About screen activity
                            "ifl_a_build_info",           // Build information activity
                            "ifl_a_patches_info"          // Patches information activity
                        ),
                        "activity/admin" to listOf(
                            "ifl_a_admin_action_approvepreview",  // Admin approve preview action
                            "ifl_a_admin_action_updatebackup",    // Admin update backup action
                            "ifl_a_admin_dashboard",              // Admin dashboard activity
                            "ifl_a_admin_login",                  // Admin login activity
                            "ifl_a_admin_pref_manager"            // Admin preference manager activity
                        ),
                        "activity/crash_manager" to listOf(
                            "ifl_a_crash_reports",        // Crash reports list activity
                            "ifl_a_crash_viewer"          // Crash details viewer activity
                        ),
                        "activity/devmode" to listOf(
                            "ifl_a_devmode",              // Developer mode main activity
                            "ifl_a_devmode_import"        // Developer mode import activity
                        ),
                        "activity/devmode/analyzer" to listOf(
                            "ifl_a_devmode_backup_analyzer",      // Backup analyzer activity
                            "ifl_a_devmode_backup_analyzer_menu"  // Backup analyzer menu
                        ),
                        "activity/devmode/backup" to listOf(
                            "ifl_a_export_backup"         // Export backup activity
                        ),
                        "activity/devmode/comparator" to listOf(
                            "ifl_a_devmode_backup_comparator",      // Backup comparator activity
                            "ifl_a_devmode_backup_comparator_menu"  // Backup comparator menu
                        ),
                        "activity/library" to listOf(
                            "ifl_a_library_menu"          // Library menu activity
                        ),
                        "activity/library/backup" to listOf(
                            "ifl_a_library_backup",                // Library backup activity
                            "ifl_a_library_backup_info",           // Library backup info activity
                            "ifl_a_library_backup_info_author"     // Library backup author info
                        ),
                        "api/models" to listOf(
                            "AutoUpdateInfo",             // Auto update information model - Used by CheckUpdates
                            "Backup",                     // Backup model
                            "BackupListItem",             // Backup list item model
                            "InstafelResponse"            // Generic API response model
                        ),
                        "api/requests" to listOf(
                            "ApiCallbackInterface",       // API callback interface
                            "ApiGet",                     // Generic GET request handler
                            "ApiGetAdmin",                // Admin GET request handler
                            "ApiGetString",               // String GET request handler
                            "ApiPostAdmin"                // Admin POST request handler
                        ),
                        "api/requests/admin" to listOf(
                            "AdminLogin",                 // Admin login request handler
                            "AdminUploadMapping"          // Admin upload mapping handler
                        ),
                        "api/tasks" to listOf(
                            "BackupUpdateDownloadTask",   // Backup update download task - Instantiated by BackupUpdateTask
                            "BackupUpdateTask"            // Backup update task - Instantiated by CheckUpdates
                        ),
                        "managers" to listOf(
                            "AttributeManager",           // Attribute management
                            "CrashManager",               // Crash management
                            "FrequencyManager",           // Frequency management
                            "NotificationOtaManager",     // OTA notification management
                            "OverridesManager",           // Overrides management - Used by InitializeInstafel
                            "PermissionManager",          // Permission management
                            "PreferenceManager"           // Preference management - Used by LocalizationUtils
                        ),
                        "managers/modals" to listOf(
                            "FlagItem",                   // Flag item model
                            "ParseResult"                 // Parse result model
                        ),
                        "ota" to listOf(
                            "CheckUpdates",               // Update checker - Called from InitializeInstafel.triggerCheckUpdates()
                            "IflEnvironment",             // Environment configuration - Used by CheckUpdates
                            "LastCheck"                   // Last check tracker - Used by CheckUpdates
                        ),
                        "ota/tasks" to listOf(
                            "BuildInfoTask",              // Build info task - Instantiated by VersionTask
                            "ChangelogContentTask",       // Changelog content task - Instantiated by ChangelogTask
                            "ChangelogTask",              // Changelog task - Instantiated by CheckUpdates
                            "DownloadUpdateTask",         // Download update task
                            "VersionTask"                 // Version task - Instantiated by CheckUpdates
                        ),
                        "ui" to listOf(
                            "LoadingBar",                 // Loading bar UI component
                            "Page",                       // Page UI component
                            "PageContentArea",            // Page content area UI component
                            "PageTitle",                  // Page title UI component
                            "TileCompact",                // Compact tile UI component
                            "TileLarge",                  // Large tile UI component
                            "TileLargeEditText",          // Large tile with edit text UI component
                            "TileLargeSwitch",            // Large tile with switch UI component
                            "TileSocials",                // Social media tile UI component
                            "TileTitle"                   // Tile title UI component
                        ),
                        "utils" to listOf(
                            "GeneralFn",                  // General utility functions - Used by CheckUpdates and LocalizedStringGetter
                            "InitializeInstafel",         // Initialization handler - Called from InstagramAppShell.attach()
                            "InstafelAdminUser",          // Admin user handler - Used by InitializeInstafel
                            "InstafelCrashHandler",       // Crash handler - Called from InstagramAppShell.attach()
                            "InstafelFileProvider",       // File provider - ContentProvider loaded before Application
                            "OpenIflMenu",                // Menu opener - Referenced from UserDetailFragment
                            "UploadMapping"               // Upload mapping handler - Used by InitializeInstafel
                        ),
                        "utils/crashlog" to listOf(
                            "CLogDataTypes",              // Crash log data types
                            "Crashlog"                    // Crash logging utility
                        ),
                        "utils/dialog" to listOf(
                            "InstafelDialog",             // Dialog utility - Used by CheckUpdates.showWelcomeDialog()
                            "InstafelDialogItem",         // Dialog item model - Used by InstafelDialog
                            "InstafelDialogMargins",      // Dialog margins model - Used by InstafelDialog
                            "InstafelDialogTextType",     // Dialog text type model - Used by InstafelDialog
                            "StringInputViews"            // String input views - Used by InstafelDialog
                        ),
                        "utils/ghost" to listOf(
                            "GhostModeManager",           // Ghost mode manager - Used by InitializeInstafel.setContext()
                            "NetworkInterceptor"          // Network interceptor - Called from TigonServiceLayer.startRequest
                        ),
                        "utils/localization" to listOf(
                            "Locales",                    // Locale definitions - Used by LocalizationUtils.getDeviceLocale()
                            "LocalizationInfo",           // Localization metadata and configuration data
                            "LocalizationUtils",          // Localization utilities - Used by InitializeInstafel.setContext()
                            "LocalizedStringGetter"       // Localized string getter - Used by CheckUpdates.showWelcomeDialog()
                        ),
                        "utils/types" to listOf(
                            "PreferenceKeys",             // Preference key constants - Used by LocalizationUtils
                            "Types"                       // Type definitions - Used by CheckUpdates
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