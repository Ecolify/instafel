package instafel.app.utils;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

import instafel.app.activity.ifl_a_menu;
import instafel.app.InstafelEnv;
import instafel.app.managers.OverridesManager;
import instafel.app.managers.PreferenceManager;
import instafel.app.ota.CheckUpdates;
import instafel.app.utils.ghost.GhostModeManager;
import instafel.app.utils.localization.LocalizationUtils;

public class InitializeInstafel {
    private static final String LOG_TAG = "IFL";
    public static Context ctx;

    public static void setContext(Application application) {
        ctx = application;
        String iflLocale = LocalizationUtils.getIflLocale(ctx);
        InstafelEnv.IFL_LANG = iflLocale;
        Log.v(LOG_TAG, "InstafelEnv.IFL_LANG is set to " + iflLocale);
        
        // Initialize Ghost Mode Manager with saved preferences
        PreferenceManager prefManager = new PreferenceManager(ctx);
        GhostModeManager.loadFlags(prefManager);
        Log.v(LOG_TAG, String.format("Ghost Mode initialized - Seen: %b, Typing: %b, Screenshot: %b, ViewOnce: %b, Story: %b, Live: %b",
                GhostModeManager.isGhostSeen, GhostModeManager.isGhostTyping, GhostModeManager.isGhostScreenshot,
                GhostModeManager.isGhostViewOnce, GhostModeManager.isGhostStory, GhostModeManager.isGhostLive));
    }

    public static void triggerCheckUpdates(Activity activity) {
        try {
            CheckUpdates.checkUpdates(activity);
        } catch (Exception e) {
            // Prevent update check failures from crashing the app during startup
            Log.v(LOG_TAG, "Update check failed: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void triggerUploadMapping(Activity activity) {
        OverridesManager overridesManager = new OverridesManager(activity);
        if (InstafelAdminUser.isUserLogged(activity) && overridesManager.getMappingFile().exists()) {
            new UploadMapping(activity);
        }
    }

    public static void startInstafel() {
        try {
            Intent intent = new Intent(ctx, ifl_a_menu.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
        } catch (Exception e) {
            Toast.makeText(ctx, e.toString(), Toast.LENGTH_LONG).show();
        }
    }
}
