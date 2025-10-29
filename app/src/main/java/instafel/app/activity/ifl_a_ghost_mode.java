package instafel.app.activity;

import static instafel.app.utils.localization.LocalizationUtils.updateIflLocale;

import android.os.Bundle;
import android.view.View;
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
    
    // References to ghost feature switches for visibility control
    private TileLargeSwitch tileGhostSeen;
    private TileLargeSwitch tileGhostTyping;
    private TileLargeSwitch tileGhostScreenshot;
    private TileLargeSwitch tileGhostViewOnce;
    private TileLargeSwitch tileGhostStory;
    private TileLargeSwitch tileGhostLive;

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

        // Initialize all ghost feature switch references
        tileGhostSeen = findViewById(R.id.ifl_tile_ghost_seen);
        tileGhostTyping = findViewById(R.id.ifl_tile_ghost_typing);
        tileGhostScreenshot = findViewById(R.id.ifl_tile_ghost_screenshot);
        tileGhostViewOnce = findViewById(R.id.ifl_tile_ghost_viewonce);
        tileGhostStory = findViewById(R.id.ifl_tile_ghost_story);
        tileGhostLive = findViewById(R.id.ifl_tile_ghost_live);
        
        // Ghost Mode Main Toggle
        TileLargeSwitch tileGhostMode = findViewById(R.id.ifl_tile_ghost_mode_main);
        Switch ghostModeSwitch = tileGhostMode.getSwitchView();
        ghostModeSwitch.setChecked(GhostModeManager.isGhostModeEnabled);
        ghostModeSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostModeEnabled = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, isChecked);
            
            // Update visibility of all ghost feature options
            updateGhostFeaturesVisibility(isChecked);
            
            // If disabling ghost mode, turn off all individual features and network interceptor
            if (!isChecked) {
                disableAllGhostFeatures();
            }
            
            Toast.makeText(ifl_a_ghost_mode.this, 
                isChecked ? "Ghost Mode Enabled - Network Interceptor Active" : "Ghost Mode Disabled", 
                Toast.LENGTH_SHORT).show();
        });

        // Ghost Seen (DM Read Receipts)
        Switch ghostSeenSwitch = tileGhostSeen.getSwitchView();
        ghostSeenSwitch.setChecked(GhostModeManager.isGhostSeen);
        ghostSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostSeen = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, isChecked);
        });

        // Ghost Typing
        Switch ghostTypingSwitch = tileGhostTyping.getSwitchView();
        ghostTypingSwitch.setChecked(GhostModeManager.isGhostTyping);
        ghostTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostTyping = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, isChecked);
        });

        // Ghost Screenshot
        Switch ghostScreenshotSwitch = tileGhostScreenshot.getSwitchView();
        ghostScreenshotSwitch.setChecked(GhostModeManager.isGhostScreenshot);
        ghostScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostScreenshot = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, isChecked);
        });

        // Ghost ViewOnce
        Switch ghostViewOnceSwitch = tileGhostViewOnce.getSwitchView();
        ghostViewOnceSwitch.setChecked(GhostModeManager.isGhostViewOnce);
        ghostViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostViewOnce = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, isChecked);
        });

        // Ghost Story
        Switch ghostStorySwitch = tileGhostStory.getSwitchView();
        ghostStorySwitch.setChecked(GhostModeManager.isGhostStory);
        ghostStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostStory = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_story, isChecked);
        });

        // Ghost Live
        Switch ghostLiveSwitch = tileGhostLive.getSwitchView();
        ghostLiveSwitch.setChecked(GhostModeManager.isGhostLive);
        ghostLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostLive = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_live, isChecked);
        });

        // Set initial visibility based on current ghost mode state
        // This must be called AFTER all switches are initialized
        updateGhostFeaturesVisibility(GhostModeManager.isGhostModeEnabled);
    }
    
    /**
     * Updates visibility of all ghost feature options based on main ghost mode switch
     * When ghost mode is disabled, all features are hidden
     * When ghost mode is enabled, all features are shown
     */
    private void updateGhostFeaturesVisibility(boolean isGhostModeEnabled) {
        int visibility = isGhostModeEnabled ? View.VISIBLE : View.GONE;
        
        // Update visibility for all ghost feature switches
        tileGhostSeen.setVisibility(visibility);
        tileGhostTyping.setVisibility(visibility);
        tileGhostScreenshot.setVisibility(visibility);
        tileGhostViewOnce.setVisibility(visibility);
        tileGhostStory.setVisibility(visibility);
        tileGhostLive.setVisibility(visibility);
    }
    
    /**
     * Disables all ghost features when the main ghost mode switch is turned off
     * This ensures network interceptor and all individual features are inactive
     */
    private void disableAllGhostFeatures() {
        // Disable all ghost features
        GhostModeManager.isGhostSeen = false;
        GhostModeManager.isGhostTyping = false;
        GhostModeManager.isGhostScreenshot = false;
        GhostModeManager.isGhostViewOnce = false;
        GhostModeManager.isGhostStory = false;
        GhostModeManager.isGhostLive = false;
        
        // Save all disabled states to preferences
        GhostModeManager.saveFlags(preferenceManager);
        
        // Update UI switches to reflect disabled state
        tileGhostSeen.getSwitchView().setChecked(false);
        tileGhostTyping.getSwitchView().setChecked(false);
        tileGhostScreenshot.getSwitchView().setChecked(false);
        tileGhostViewOnce.getSwitchView().setChecked(false);
        tileGhostStory.getSwitchView().setChecked(false);
        tileGhostLive.getSwitchView().setChecked(false);
    }
}
