package instafel.app.activity;

import static instafel.app.utils.localization.LocalizationUtils.updateIflLocale;

import android.os.Bundle;
import android.widget.Switch;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import instafel.app.R;
import instafel.app.managers.PreferenceManager;
import instafel.app.ui.TileLargeSwitch;
import instafel.app.utils.GeneralFn;
import instafel.app.utils.ghost.GhostModeManager;
import instafel.app.utils.types.PreferenceKeys;

public class ifl_a_ghost_mode extends AppCompatActivity {
    PreferenceManager preferenceManager;

    @Override 
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        GeneralFn.updateIflUi(this);
        updateIflLocale(this, false);
        setContentView(R.layout.ifl_at_ghost_mode);
        PreferenceManager preferenceManager = new PreferenceManager(this);
        this.preferenceManager = preferenceManager;
        
        // Load Ghost Mode flags from preferences into static fields
        GhostModeManager.loadFlags(preferenceManager);

        // Ghost Mode Main Toggle
        TileLargeSwitch tileGhostMode = findViewById(R.id.ifl_tile_ghost_mode_main);
        Switch ghostModeSwitch = tileGhostMode.getSwitchView();
        ghostModeSwitch.setChecked(GhostModeManager.isGhostModeEnabled);
        ghostModeSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostModeEnabled = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, isChecked);
            Toast.makeText(ifl_a_ghost_mode.this, 
                isChecked ? "Ghost Mode Enabled" : "Ghost Mode Disabled", 
                Toast.LENGTH_SHORT).show();
        });

        // Ghost Seen (DM Read Receipts)
        TileLargeSwitch tileGhostSeen = findViewById(R.id.ifl_tile_ghost_seen);
        Switch ghostSeenSwitch = tileGhostSeen.getSwitchView();
        ghostSeenSwitch.setChecked(GhostModeManager.isGhostSeen);
        ghostSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostSeen = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, isChecked);
        });

        // Ghost Typing
        TileLargeSwitch tileGhostTyping = findViewById(R.id.ifl_tile_ghost_typing);
        Switch ghostTypingSwitch = tileGhostTyping.getSwitchView();
        ghostTypingSwitch.setChecked(GhostModeManager.isGhostTyping);
        ghostTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostTyping = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, isChecked);
        });

        // Ghost Screenshot
        TileLargeSwitch tileGhostScreenshot = findViewById(R.id.ifl_tile_ghost_screenshot);
        Switch ghostScreenshotSwitch = tileGhostScreenshot.getSwitchView();
        ghostScreenshotSwitch.setChecked(GhostModeManager.isGhostScreenshot);
        ghostScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostScreenshot = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, isChecked);
        });

        // Ghost ViewOnce
        TileLargeSwitch tileGhostViewOnce = findViewById(R.id.ifl_tile_ghost_viewonce);
        Switch ghostViewOnceSwitch = tileGhostViewOnce.getSwitchView();
        ghostViewOnceSwitch.setChecked(GhostModeManager.isGhostViewOnce);
        ghostViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostViewOnce = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, isChecked);
        });

        // Ghost Story
        TileLargeSwitch tileGhostStory = findViewById(R.id.ifl_tile_ghost_story);
        Switch ghostStorySwitch = tileGhostStory.getSwitchView();
        ghostStorySwitch.setChecked(GhostModeManager.isGhostStory);
        ghostStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostStory = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_story, isChecked);
        });

        // Ghost Live
        TileLargeSwitch tileGhostLive = findViewById(R.id.ifl_tile_ghost_live);
        Switch ghostLiveSwitch = tileGhostLive.getSwitchView();
        ghostLiveSwitch.setChecked(GhostModeManager.isGhostLive);
        ghostLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostLive = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_live, isChecked);
        });

        // Quick Toggle Settings Section
        TileLargeSwitch tileQuickToggleSeen = findViewById(R.id.ifl_tile_quick_toggle_seen);
        Switch quickToggleSeenSwitch = tileQuickToggleSeen.getSwitchView();
        quickToggleSeenSwitch.setChecked(GhostModeManager.quickToggleSeen);
        quickToggleSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleSeen = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, isChecked);
        });

        TileLargeSwitch tileQuickToggleTyping = findViewById(R.id.ifl_tile_quick_toggle_typing);
        Switch quickToggleTypingSwitch = tileQuickToggleTyping.getSwitchView();
        quickToggleTypingSwitch.setChecked(GhostModeManager.quickToggleTyping);
        quickToggleTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleTyping = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, isChecked);
        });

        TileLargeSwitch tileQuickToggleScreenshot = findViewById(R.id.ifl_tile_quick_toggle_screenshot);
        Switch quickToggleScreenshotSwitch = tileQuickToggleScreenshot.getSwitchView();
        quickToggleScreenshotSwitch.setChecked(GhostModeManager.quickToggleScreenshot);
        quickToggleScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleScreenshot = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, isChecked);
        });

        TileLargeSwitch tileQuickToggleViewOnce = findViewById(R.id.ifl_tile_quick_toggle_viewonce);
        Switch quickToggleViewOnceSwitch = tileQuickToggleViewOnce.getSwitchView();
        quickToggleViewOnceSwitch.setChecked(GhostModeManager.quickToggleViewOnce);
        quickToggleViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleViewOnce = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, isChecked);
        });

        TileLargeSwitch tileQuickToggleStory = findViewById(R.id.ifl_tile_quick_toggle_story);
        Switch quickToggleStorySwitch = tileQuickToggleStory.getSwitchView();
        quickToggleStorySwitch.setChecked(GhostModeManager.quickToggleStory);
        quickToggleStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleStory = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, isChecked);
        });

        TileLargeSwitch tileQuickToggleLive = findViewById(R.id.ifl_tile_quick_toggle_live);
        Switch quickToggleLiveSwitch = tileQuickToggleLive.getSwitchView();
        quickToggleLiveSwitch.setChecked(GhostModeManager.quickToggleLive);
        quickToggleLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleLive = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, isChecked);
        });
    }
}
