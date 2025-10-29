package instafel.patcher.core.patches

import instafel.patcher.core.patches.general.AddAppTrigger
import instafel.patcher.core.patches.general.AddInitInstafel
import instafel.patcher.core.patches.general.AddLongClickEvent
import instafel.patcher.core.patches.general.CopyInstafelSources
import instafel.patcher.core.patches.general.GetGenerationInfo
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

/**
 * Instafel Stuffs - Core patches for integrating Instafel functionality
 * 
 * PURPOSE:
 * This patch group contains essential patches that integrate Instafel's
 * custom code, UI, and features into the Instagram app. These are the
 * foundation patches that enable all other Instafel functionality.
 * 
 * COMPONENTS:
 * 1. GetGenerationInfo: Extracts build information and metadata
 * 2. CopyInstafelSources: Injects Instafel's smali source files into the APK
 * 3. AddInitInstafel: Initializes Instafel on app startup
 * 4. AddLongClickEvent: Adds long-press handler to open Instafel menu
 * 5. AddAppTrigger: Sets up app lifecycle triggers for Instafel
 * 
 * EXECUTION ORDER:
 * These patches must run in sequence as they have dependencies:
 * - Generation info is needed for source preparation
 * - Sources must be copied before initialization
 * - Initialization must occur before event handlers
 * - Event handlers connect user interactions to Instafel features
 * 
 * INTEGRATION POINTS:
 * - App startup: Initializes Instafel managers and settings
 * - UI events: Long-press on search icon opens Instafel menu
 * - Lifecycle: Tracks app state for feature management
 * 
 * BEHAVIOR:
 * - Enables Instafel menu access via long-press on search icon
 * - Initializes Ghost Mode, preferences, and other Instafel features
 * - Provides foundation for all custom Instafel functionality
 * 
 * NOTE: This is the most critical patch group - without it, no Instafel
 * features will be available in the patched Instagram app.
 */
@PInfos.PatchGroupInfo(
    name = "Instafel Stuffs",
    shortname = "instafel",
    desc = "You can add Instafel stuffs with this patches"
)
class InstafelStuffs: InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        GetGenerationInfo::class,    // Extract build and generation metadata
        CopyInstafelSources::class,  // Copy Instafel smali files into APK
        AddInitInstafel::class,      // Initialize Instafel on app startup
        AddLongClickEvent::class,    // Add long-press handler for Instafel menu
        AddAppTrigger::class         // Set up app lifecycle triggers
    )
}