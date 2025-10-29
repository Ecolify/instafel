package instafel.patcher.core.patches

import instafel.patcher.core.patches.clone.CloneGeneral
import instafel.patcher.core.patches.clone.ClonePackageReplacer
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelPatchGroup
import instafel.patcher.core.utils.patch.PInfos
import kotlin.reflect.KClass

/**
 * Clone Patches - Enables installing Instafel alongside official Instagram
 * 
 * PURPOSE:
 * This patch group modifies the package name and app identifiers to allow
 * Instafel to be installed alongside the official Instagram app without
 * conflicts. Users can run both apps simultaneously on the same device.
 * 
 * COMPONENTS:
 * 1. CloneGeneral: Modifies general app identifiers and references
 * 2. ClonePackageReplacer: Changes package name throughout the APK
 * 
 * IMPLEMENTATION:
 * - Changes package name from com.instagram.android to com.instafel.android
 * - Updates all internal references to the package name
 * - Modifies AndroidManifest.xml package declaration
 * - Updates provider authorities and intent filters
 * - Ensures no conflicts with official Instagram installation
 * 
 * TECHNICAL DETAILS:
 * - Package name change propagates through all smali files
 * - Updates both code references and XML configurations
 * - Maintains app functionality with new package identity
 * - Preserves compatibility with Android system services
 * 
 * BEHAVIOR:
 * - Active: Instafel can be installed alongside official Instagram
 * - Both apps maintain separate data, accounts, and settings
 * - No interference between official and modded versions
 * 
 * USE CASES:
 * - Testing Instafel features without losing official Instagram
 * - Using both apps for different accounts
 * - Comparing behavior between official and modded versions
 * - Development and debugging scenarios
 * 
 * NOTE: This is essential for users who want to keep the official
 * Instagram app while also using Instafel.
 */
@PInfos.PatchGroupInfo(
    name = "Clone Patches",
    shortname = "clone",
    desc = "These patches needs to be applied for generate clone in build."
)
class Clone: InstafelPatchGroup() {
    override fun initializePatches(): List<KClass<out InstafelPatch>> = mutableListOf(
        CloneGeneral::class,         // Modify general app identifiers
        ClonePackageReplacer::class  // Change package name throughout APK
    )
}