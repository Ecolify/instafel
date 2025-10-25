package instafel.patcher.core.patches

import instafel.patcher.core.patches.ghost.GhostScreenshot
import instafel.patcher.core.patches.ghost.GhostSeen
import instafel.patcher.core.patches.ghost.GhostTyping
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

@PInfos.PatchGroupInfo(
    name = "Ghost Mode",
    shortname = "ghost_mode",
    desc = "Enable Ghost Mode features (Seen, Typing, Screenshot)"
)
class GhostMode: InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        GhostSeen::class,
        GhostTyping::class,
        GhostScreenshot::class
    )
}
