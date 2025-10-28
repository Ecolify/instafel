package instafel.app.utils.ghost;

import android.content.Context;
import android.widget.Toast;

import instafel.app.managers.PreferenceManager;
import instafel.app.utils.types.PreferenceKeys;

/**
 * Manages Ghost Mode features for Instafel
 * Based on InstaEclipse implementation
 * 
 * This class provides centralized management for all Ghost Mode features, allowing users
 * to browse Instagram anonymously by blocking various tracking mechanisms.
 * 
 * ARCHITECTURE:
 * - Uses static fields for easy access from smali patches injected into Instagram
 * - Each Ghost Mode feature has an enable flag and a quick toggle flag
 * - Smali patches call isGhostXxxEnabled() methods to check if blocking should occur
 * - Preferences are persisted using PreferenceManager
 * 
 * GHOST MODE FEATURES:
 * 1. Ghost Seen: Blocks read receipts in Direct Messages
 *    - Patches: GhostSeen.kt (mark_thread_seen- endpoint)
 *    - Reference: InstaEclipse SeenState.java
 * 
 * 2. Ghost Typing: Hides typing indicator in Direct Messages
 *    - Patches: GhostTyping.kt (is_typing_indicator_enabled)
 *    - Reference: InstaEclipse TypingStatus.java
 * 
 * 3. Ghost Screenshot: Prevents screenshot detection notifications
 *    - Patches: GhostScreenshot.kt (ScreenshotNotificationManager)
 *    - Reference: InstaEclipse ScreenshotDetection.java
 *    - Network: /screenshot/, /ephemeral_screenshot/
 * 
 * 4. Ghost ViewOnce: Allows viewing once messages without marking as seen
 *    - Patches: GhostViewOnce.kt (visual_item_seen)
 *    - Reference: InstaEclipse ViewOnce.java
 *    - Network: /item_replayed/, /direct/.../item_seen/
 * 
 * 5. Ghost Story: View stories anonymously without marking as seen
 *    - Patches: GhostStory.kt (media/seen/)
 *    - Reference: InstaEclipse StorySeen.java
 *    - Network: /api/v2/media/seen/
 * 
 * 6. Ghost Live: Watch live videos without appearing in viewer list
 *    - Patches: GhostLive.kt (live_viewer_invite)
 *    - Network: /heartbeat_and_get_viewer_count/
 * 
 * INTEGRATION WITH PATCHES:
 * - Each patch injects code early in the target method
 * - Injected code calls the appropriate isGhostXxxEnabled() method
 * - If enabled, the method returns early (return-void) blocking the action
 * - If disabled, execution continues normally
 * 
 * INTEGRATION WITH UI:
 * - GhostEmojiManager displays a ghost emoji (👻) when any feature is active
 * - Quick toggle allows rapid enabling/disabling of selected features
 * - Interceptor (reference only) shows network-level blocking approach
 */
public class GhostModeManager {
    
    // Ghost Mode state flags - public static for smali access
    public static boolean isGhostModeEnabled = false;
    public static boolean isGhostSeen = false;
    public static boolean isGhostTyping = false;
    public static boolean isGhostScreenshot = false;
    public static boolean isGhostViewOnce = false;
    public static boolean isGhostStory = false;
    public static boolean isGhostLive = false;
    
    // Quick toggle flags
    public static boolean quickToggleSeen = false;
    public static boolean quickToggleTyping = false;
    public static boolean quickToggleScreenshot = false;
    public static boolean quickToggleViewOnce = false;
    public static boolean quickToggleStory = false;
    public static boolean quickToggleLive = false;
    
    /**
     * Load all Ghost Mode flags from preferences
     */
    public static void loadFlags(PreferenceManager prefManager) {
        isGhostModeEnabled = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, false);
        isGhostSeen = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false);
        isGhostTyping = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false);
        isGhostScreenshot = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false);
        isGhostViewOnce = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, false);
        isGhostStory = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_story, false);
        isGhostLive = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_live, false);
        
        quickToggleSeen = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, false);
        quickToggleTyping = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, false);
        quickToggleScreenshot = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, false);
        quickToggleViewOnce = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, false);
        quickToggleStory = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, false);
        quickToggleLive = prefManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, false);
    }
    
    /**
     * Save all Ghost Mode flags to preferences
     */
    public static void saveFlags(PreferenceManager prefManager) {
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, isGhostModeEnabled);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, isGhostSeen);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, isGhostTyping);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, isGhostScreenshot);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, isGhostViewOnce);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_story, isGhostStory);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_live, isGhostLive);
        
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, quickToggleSeen);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, quickToggleTyping);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, quickToggleScreenshot);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, quickToggleViewOnce);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, quickToggleStory);
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, quickToggleLive);
    }
    
    /**
     * Check if any ghost mode feature is currently active
     */
    public static boolean isAnyGhostModeActive() {
        if (quickToggleSeen && isGhostSeen) return true;
        if (quickToggleTyping && isGhostTyping) return true;
        if (quickToggleScreenshot && isGhostScreenshot) return true;
        if (quickToggleViewOnce && isGhostViewOnce) return true;
        if (quickToggleStory && isGhostStory) return true;
        return quickToggleLive && isGhostLive;
    }
    
    /**
     * Toggle selected ghost mode options on/off
     * Logic: If all selected options are currently enabled, disable them all.
     *        If any selected option is disabled, enable all selected options.
     * This provides an "all or nothing" toggle behavior for consistency.
     */
    public static void toggleSelectedGhostOptions(Context context, PreferenceManager prefManager) {
        boolean anySelected = false;
        boolean allSelectedEnabled = true;
        
        // Check which options are selected for quick toggle and their current state
        if (quickToggleSeen) {
            anySelected = true;
            if (!isGhostSeen) allSelectedEnabled = false;
        }
        if (quickToggleTyping) {
            anySelected = true;
            if (!isGhostTyping) allSelectedEnabled = false;
        }
        if (quickToggleScreenshot) {
            anySelected = true;
            if (!isGhostScreenshot) allSelectedEnabled = false;
        }
        if (quickToggleViewOnce) {
            anySelected = true;
            if (!isGhostViewOnce) allSelectedEnabled = false;
        }
        if (quickToggleStory) {
            anySelected = true;
            if (!isGhostStory) allSelectedEnabled = false;
        }
        if (quickToggleLive) {
            anySelected = true;
            if (!isGhostLive) allSelectedEnabled = false;
        }
        
        if (!anySelected) {
            Toast.makeText(context, "❗ No Ghost Mode options selected for quick toggle!", Toast.LENGTH_SHORT).show();
            return;
        }
        
        // Toggle logic: if all are enabled, turn off; otherwise turn all on
        boolean newState = !allSelectedEnabled;
        
        if (quickToggleSeen) isGhostSeen = newState;
        if (quickToggleTyping) isGhostTyping = newState;
        if (quickToggleScreenshot) isGhostScreenshot = newState;
        if (quickToggleViewOnce) isGhostViewOnce = newState;
        if (quickToggleStory) isGhostStory = newState;
        if (quickToggleLive) isGhostLive = newState;
        
        // Save the new state
        saveFlags(prefManager);
        
        // Show toast notification
        if (newState) {
            Toast.makeText(context, "👻 Ghost Mode Enabled", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(context, "❌ Ghost Mode Disabled", Toast.LENGTH_SHORT).show();
        }
    }
    
    /**
     * Check if Ghost Seen is enabled
     * Called from smali patches
     */
    public static boolean isGhostSeenEnabled() {
        return isGhostSeen;
    }
    
    /**
     * Check if Ghost Typing is enabled
     * Called from smali patches
     */
    public static boolean isGhostTypingEnabled() {
        return isGhostTyping;
    }
    
    /**
     * Check if Ghost Screenshot is enabled
     * Called from smali patches
     */
    public static boolean isGhostScreenshotEnabled() {
        return isGhostScreenshot;
    }
    
    /**
     * Check if Ghost ViewOnce is enabled
     * Called from smali patches
     */
    public static boolean isGhostViewOnceEnabled() {
        return isGhostViewOnce;
    }
    
    /**
     * Check if Ghost Story is enabled
     * Called from smali patches
     */
    public static boolean isGhostStoryEnabled() {
        return isGhostStory;
    }
    
    /**
     * Check if Ghost Live is enabled
     * Called from smali patches
     */
    public static boolean isGhostLiveEnabled() {
        return isGhostLive;
    }
}
