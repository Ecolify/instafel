package instafel.app.utils.ghost;

import android.content.Context;
import android.widget.Toast;

import instafel.app.managers.PreferenceManager;
import instafel.app.utils.types.PreferenceKeys;

/**
 * Manager class for Ghost Mode features in Instafel.
 * Ghost Mode allows users to browse Instagram without sending read receipts,
 * typing indicators, screenshot notifications, and other tracking signals.
 * 
 * Based on InstaEclipse's ghost mode implementation.
 */
public class GhostModeManager {
    private static Context staticContext;
    private PreferenceManager prefManager;
    private Context context;

    public GhostModeManager(Context context) {
        this.context = context;
        this.prefManager = new PreferenceManager(context);
        staticContext = context;
    }

    /**
     * Initialize static context for smali patch calls
     * This should be called during app initialization
     */
    public static void initializeStatic(Context context) {
        staticContext = context;
    }

    // Static methods for smali patches to call
    // These methods can be invoked from patched Instagram smali code

    public static boolean checkGhostSeenEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false);
    }

    public static boolean checkGhostTypingEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false);
    }

    public static boolean checkGhostScreenshotEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false);
    }

    public static boolean checkGhostViewOnceEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, false);
    }

    public static boolean checkGhostStoryEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_story, false);
    }

    public static boolean checkGhostLiveEnabled() {
        if (staticContext == null) return false;
        PreferenceManager pm = new PreferenceManager(staticContext);
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_live, false);
    }

    /**
     * Check if any ghost mode feature is currently active
     * @return true if at least one ghost mode feature is enabled
     */
    public boolean isGhostModeActive() {
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_seen) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_seen)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_typing) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_typing)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_screenshot) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_screenshot)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_view_once) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_view_once)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_story) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_story)) return true;
        return isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_live) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_live);
    }

    /**
     * Toggle selected ghost mode features on/off
     */
    public void toggleSelectedGhostOptions() {
        boolean anySelected = false;
        boolean shouldDisable = false;

        // Check if any quick toggle is enabled and if corresponding ghost feature is active
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_seen)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_seen)) shouldDisable = true;
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_typing)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_typing)) shouldDisable = true;
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_screenshot)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_screenshot)) shouldDisable = true;
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_view_once)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_view_once)) shouldDisable = true;
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_story)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_story)) shouldDisable = true;
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_live)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_live)) shouldDisable = true;
        }

        if (!anySelected) {
            Toast.makeText(context, "❗ No Ghost Mode options selected!", Toast.LENGTH_SHORT).show();
            return;
        }

        boolean newState = !shouldDisable; // true = enable, false = disable

        // Toggle all selected features
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_seen)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_seen, newState);
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_typing)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_typing, newState);
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_screenshot)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_screenshot, newState);
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_view_once)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_view_once, newState);
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_story)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_story, newState);
        }
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_live)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_live, newState);
        }

        // Update main ghost mode flag
        prefManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, newState);

        // Show toast notification
        if (newState) {
            Toast.makeText(context, "👻 Ghost Mode Enabled", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(context, "❌ Ghost Mode Disabled", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Check if a ghost feature is enabled
     */
    public boolean isGhostFeatureEnabled(String featureKey) {
        return prefManager.getPreferenceBoolean(featureKey, false);
    }

    /**
     * Set a ghost feature state
     */
    public void setGhostFeature(String featureKey, boolean enabled) {
        prefManager.setPreferenceBoolean(featureKey, enabled);
    }

    /**
     * Check if a quick toggle is enabled
     */
    public boolean isQuickToggleEnabled(String toggleKey) {
        return prefManager.getPreferenceBoolean(toggleKey, false);
    }

    /**
     * Set a quick toggle state
     */
    public void setQuickToggle(String toggleKey, boolean enabled) {
        prefManager.setPreferenceBoolean(toggleKey, enabled);
    }

    // Convenience methods for individual features

    public boolean isGhostSeenEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_seen);
    }

    public void setGhostSeen(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_seen, enabled);
    }

    public boolean isGhostTypingEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_typing);
    }

    public void setGhostTyping(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_typing, enabled);
    }

    public boolean isGhostScreenshotEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_screenshot);
    }

    public void setGhostScreenshot(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_screenshot, enabled);
    }

    public boolean isGhostViewOnceEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_view_once);
    }

    public void setGhostViewOnce(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_view_once, enabled);
    }

    public boolean isGhostStoryEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_story);
    }

    public void setGhostStory(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_story, enabled);
    }

    public boolean isGhostLiveEnabled() {
        return isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_live);
    }

    public void setGhostLive(boolean enabled) {
        setGhostFeature(PreferenceKeys.ifl_ghost_live, enabled);
    }
}
