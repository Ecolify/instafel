package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

/**
 * Ghost Mode - Comprehensive stealth features for Instagram
 * 
 * REFERENCE: InstaEclipse ghost mode implementation
 * - Multiple patches working together to provide stealth functionality
 * - Network-level interception for blocking tracking requests
 * - Method-level hooks for preventing notifications
 * 
 * FEATURES:
 * - Ghost Seen: Hide read receipts in Direct Messages
 * - Ghost Typing: Hide typing indicator in conversations
 * - Ghost Screenshot: Prevent screenshot detection notifications
 * - Ghost ViewOnce: View "view once" messages multiple times
 * - Ghost Story: View stories anonymously without marking as seen
 * - Ghost Live: Watch live videos without being visible to broadcaster
 * 
 * ARCHITECTURE:
 * - NetworkInterceptor: Blocks network requests at API level (URI-based filtering)
 * - Individual patches: Hook specific methods for granular control
 * - Both approaches are used for redundancy and comprehensive coverage
 * 
 * BEHAVIOR:
 * Each ghost feature can be independently enabled/disabled through GhostModeManager
 */
@PInfos.PatchGroupInfo(
    name = "Ghost Mode",
    shortname = "ghost_mode",
    desc = "Stealth features for Instagram - prevent seen, typing, screenshot detection"
)
class GhostMode : InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        NetworkInterceptor::class,  // Network-level interception (InstaEclipse Interceptor.java)
        GhostSeen::class,           // Hide read receipts (SeenState.java)
        GhostTyping::class,         // Hide typing indicator (TypingStatus.java)
        GhostScreenshot::class,     // Block screenshot detection (ScreenshotDetection.java)
        GhostViewOnce::class,       // View once messages multiple times (ViewOnce.java)
        GhostStory::class,          // Anonymous story viewing (StorySeen.java)
        GhostLive::class            // Anonymous live viewing (custom implementation)
    )
}
