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

        // Ghost Mode Main Toggle
        TileLargeSwitch tileGhostMode = findViewById(R.id.ifl_tile_ghost_mode_main);
        Switch ghostModeSwitch = tileGhostMode.getSwitchView();
        ghostModeSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, false));
        ghostModeSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, isChecked);
            Toast.makeText(ifl_a_ghost_mode.this, 
                isChecked ? "Ghost Mode Enabled" : "Ghost Mode Disabled", 
                Toast.LENGTH_SHORT).show();
        });

        // Ghost Seen (DM Read Receipts)
        TileLargeSwitch tileGhostSeen = findViewById(R.id.ifl_tile_ghost_seen);
        Switch ghostSeenSwitch = tileGhostSeen.getSwitchView();
        ghostSeenSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false));
        ghostSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, isChecked);
        });

        // Ghost Typing
        TileLargeSwitch tileGhostTyping = findViewById(R.id.ifl_tile_ghost_typing);
        Switch ghostTypingSwitch = tileGhostTyping.getSwitchView();
        ghostTypingSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false));
        ghostTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, isChecked);
        });

        // Ghost Screenshot
        TileLargeSwitch tileGhostScreenshot = findViewById(R.id.ifl_tile_ghost_screenshot);
        Switch ghostScreenshotSwitch = tileGhostScreenshot.getSwitchView();
        ghostScreenshotSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false));
        ghostScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, isChecked);
        });

        // Ghost ViewOnce
        TileLargeSwitch tileGhostViewOnce = findViewById(R.id.ifl_tile_ghost_viewonce);
        Switch ghostViewOnceSwitch = tileGhostViewOnce.getSwitchView();
        ghostViewOnceSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, false));
        ghostViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, isChecked);
        });

        // Ghost Story
        TileLargeSwitch tileGhostStory = findViewById(R.id.ifl_tile_ghost_story);
        Switch ghostStorySwitch = tileGhostStory.getSwitchView();
        ghostStorySwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_story, false));
        ghostStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_story, isChecked);
        });

        // Ghost Live
        TileLargeSwitch tileGhostLive = findViewById(R.id.ifl_tile_ghost_live);
        Switch ghostLiveSwitch = tileGhostLive.getSwitchView();
        ghostLiveSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_live, false));
        ghostLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_live, isChecked);
        });

        // Quick Toggle Settings Section
        TileLargeSwitch tileQuickToggleSeen = findViewById(R.id.ifl_tile_quick_toggle_seen);
        Switch quickToggleSeenSwitch = tileQuickToggleSeen.getSwitchView();
        quickToggleSeenSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, false));
        quickToggleSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, isChecked);
        });

        TileLargeSwitch tileQuickToggleTyping = findViewById(R.id.ifl_tile_quick_toggle_typing);
        Switch quickToggleTypingSwitch = tileQuickToggleTyping.getSwitchView();
        quickToggleTypingSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, false));
        quickToggleTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, isChecked);
        });

        TileLargeSwitch tileQuickToggleScreenshot = findViewById(R.id.ifl_tile_quick_toggle_screenshot);
        Switch quickToggleScreenshotSwitch = tileQuickToggleScreenshot.getSwitchView();
        quickToggleScreenshotSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, false));
        quickToggleScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, isChecked);
        });

        TileLargeSwitch tileQuickToggleViewOnce = findViewById(R.id.ifl_tile_quick_toggle_viewonce);
        Switch quickToggleViewOnceSwitch = tileQuickToggleViewOnce.getSwitchView();
        quickToggleViewOnceSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, false));
        quickToggleViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, isChecked);
        });

        TileLargeSwitch tileQuickToggleStory = findViewById(R.id.ifl_tile_quick_toggle_story);
        Switch quickToggleStorySwitch = tileQuickToggleStory.getSwitchView();
        quickToggleStorySwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, false));
        quickToggleStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, isChecked);
        });

        TileLargeSwitch tileQuickToggleLive = findViewById(R.id.ifl_tile_quick_toggle_live);
        Switch quickToggleLiveSwitch = tileQuickToggleLive.getSwitchView();
        quickToggleLiveSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, false));
        quickToggleLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, isChecked);
        });
    }
}
