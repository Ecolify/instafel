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
    private static GhostModeManager instance;
    private PreferenceManager prefManager;
    private Context context;

    private GhostModeManager(Context context) {
        this.context = context.getApplicationContext();
        this.prefManager = new PreferenceManager(this.context);
    }

    public static void initialize(Context context) {
        if (instance == null) {
            instance = new GhostModeManager(context);
        }
    }

    private static GhostModeManager getInstance() {
        return instance;
    }

    /**
     * Check if any ghost mode feature is currently active
     * @return true if at least one ghost mode feature is enabled
     */
    public boolean isGhostModeActive() {
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_seen) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_seen)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_typing) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_typing)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_screenshot) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_screenshot)) return true;
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_viewonce) && isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_viewonce)) return true;
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
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_viewonce)) {
            anySelected = true;
            if (isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_viewonce)) shouldDisable = true;
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
        if (isQuickToggleEnabled(PreferenceKeys.ifl_quick_toggle_viewonce)) {
            setGhostFeature(PreferenceKeys.ifl_ghost_viewonce, newState);
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

    // Static convenience methods for patches
    // These are called from injected smali code, so they must handle null instance gracefully

    public static boolean isGhostSeenEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_seen);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGhostTypingEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_typing);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGhostScreenshotEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_screenshot);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGhostViewOnceEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_viewonce);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGhostStoryEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_story);
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGhostLiveEnabled() {
        try {
            GhostModeManager manager = getInstance();
            if (manager == null || manager.prefManager == null) return false;
            return manager.isGhostFeatureEnabled(PreferenceKeys.ifl_ghost_live);
        } catch (Exception e) {
            return false;
        }
    }
}
