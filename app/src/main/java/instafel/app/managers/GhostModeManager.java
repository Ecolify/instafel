package instafel.app.managers;

import android.content.Context;
import instafel.app.utils.types.PreferenceKeys;

public class GhostModeManager {
    private static Context appContext;

    public static void initialize(Context context) {
        appContext = context.getApplicationContext();
    }

    private static PreferenceManager getPreferenceManager() {
        if (appContext == null) {
            return null;
        }
        return new PreferenceManager(appContext);
    }

    public static boolean isGhostSeenEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false);
    }

    public static boolean isGhostTypingEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false);
    }

    public static boolean isGhostScreenshotEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false);
    }

    public static boolean isGhostViewOnceEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_viewonce, false);
    }

    public static boolean isGhostStoryEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_story, false);
    }

    public static boolean isGhostLiveEnabled() {
        PreferenceManager pm = getPreferenceManager();
        if (pm == null) return false;
        return pm.getPreferenceBoolean(PreferenceKeys.ifl_ghost_live, false);
    }
}
