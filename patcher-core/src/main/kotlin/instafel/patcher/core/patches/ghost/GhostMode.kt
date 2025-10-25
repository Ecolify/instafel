package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

/**
 * Ghost Mode Patch Group
 * 
 * This patch group bundles all ghost mode features together.
 * Based on InstaEclipse's ghost mode implementation (https://github.com/ReSo7200/InstaEclipse.git)
 * 
 * Ghost Mode allows users to browse Instagram without sending tracking signals:
 * - Ghost Seen: Hide DM read receipts
 * - Ghost Typing: Hide typing indicators
 * - Ghost Screenshot: Block screenshot notifications  
 * - Ghost Story: View stories anonymously
 * - Ghost ViewOnce: View ViewOnce messages anonymously
 * 
 * Technical Approach:
 * Unlike InstaEclipse which uses Xposed Framework for runtime hooking, Instafel uses
 * smali patching to inject ghost mode checks directly into Instagram's code during APK patching.
 * 
 * Each patch:
 * 1. Searches for specific string patterns (same as InstaEclipse uses with DexKit)
 * 2. Locates the containing method
 * 3. Injects a check to GhostModeManager.check{Feature}Enabled() at method start
 * 4. Returns early if ghost mode is enabled for that feature
 * 
 * Users can enable/disable features via the Instafel app preferences.
 */
@PInfos.PatchGroupInfo(
    name = "Ghost Mode",
    shortname = "ghost_mode",
    desc = "Browse Instagram anonymously - hide read receipts, typing indicators, screenshot notifications, and view tracking"
)
class GhostMode : InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        GhostSeen::class,
        GhostTyping::class,
        GhostScreenshot::class,
        GhostStory::class,
        GhostViewOnce::class
    )
}
