package instafel.patcher.core.patches.ghost

import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

/**
 * Ghost Mode patch group - contains all ghost mode features
 * Based on InstaEclipse implementation
 */
@PInfos.PatchGroupInfo(
    name = "Ghost Mode",
    shortname = "ghost_mode",
    desc = "Stealth features for Instagram - prevent seen, typing, screenshot detection"
)
class GhostMode : InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        GhostSeen::class,
        GhostTyping::class,
        GhostScreenshot::class,
        GhostViewOnce::class,
        GhostStory::class,
        GhostLive::class
    )
}
