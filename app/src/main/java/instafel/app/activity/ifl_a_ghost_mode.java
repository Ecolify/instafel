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
import instafel.app.utils.ghost.NetworkInterceptor;
import instafel.app.utils.types.PreferenceKeys;

public class ifl_a_ghost_mode extends AppCompatActivity {
    PreferenceManager preferenceManager;
    
    // References to all ghost mode sub-option tiles for visibility control
    private TileLargeSwitch tileGhostSeen;
    private TileLargeSwitch tileGhostTyping;
    private TileLargeSwitch tileGhostScreenshot;
    private TileLargeSwitch tileGhostViewOnce;
    private TileLargeSwitch tileGhostStory;
    private TileLargeSwitch tileGhostLive;
    private TileLargeSwitch tileQuickToggleSeen;
    private TileLargeSwitch tileQuickToggleTyping;
    private TileLargeSwitch tileQuickToggleScreenshot;
    private TileLargeSwitch tileQuickToggleViewOnce;
    private TileLargeSwitch tileQuickToggleStory;
    private TileLargeSwitch tileQuickToggleLive;

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
        
        // Initialize all tile references
        initializeTileReferences();

        // Ghost Mode Main Toggle
        // This is the master switch that controls visibility of all ghost mode features
        // When enabled: NetworkInterceptor is activated and all sub-options become visible
        // When disabled: NetworkInterceptor is deactivated and all sub-options are hidden
        TileLargeSwitch tileGhostMode = findViewById(R.id.ifl_tile_ghost_mode_main);
        Switch ghostModeSwitch = tileGhostMode.getSwitchView();
        ghostModeSwitch.setChecked(GhostModeManager.isGhostModeEnabled);
        ghostModeSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.isGhostModeEnabled = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_mode_enabled, isChecked);
            
            // Update visibility of all ghost mode options based on the main toggle
            updateGhostModeOptionsVisibility(isChecked);
            
            // Show feedback to user
            Toast.makeText(ifl_a_ghost_mode.this, 
                isChecked ? "Ghost Mode Enabled - Network Interceptor Active" : "Ghost Mode Disabled", 
                Toast.LENGTH_SHORT).show();
            
            // When ghost mode is disabled, also disable all individual ghost features
            if (!isChecked) {
                disableAllGhostFeatures();
            }
        });
        
        // Set initial visibility based on current ghost mode state
        updateGhostModeOptionsVisibility(GhostModeManager.isGhostModeEnabled);

        // Initialize all ghost mode feature switches
        // These are only visible when main ghost mode toggle is enabled
        setupGhostModeFeatures();
    }
    
    /**
     * Initialize references to all tile views for visibility management
     */
    private void initializeTileReferences() {
        tileGhostSeen = findViewById(R.id.ifl_tile_ghost_seen);
        tileGhostTyping = findViewById(R.id.ifl_tile_ghost_typing);
        tileGhostScreenshot = findViewById(R.id.ifl_tile_ghost_screenshot);
        tileGhostViewOnce = findViewById(R.id.ifl_tile_ghost_viewonce);
        tileGhostStory = findViewById(R.id.ifl_tile_ghost_story);
        tileGhostLive = findViewById(R.id.ifl_tile_ghost_live);
        tileQuickToggleSeen = findViewById(R.id.ifl_tile_quick_toggle_seen);
        tileQuickToggleTyping = findViewById(R.id.ifl_tile_quick_toggle_typing);
        tileQuickToggleScreenshot = findViewById(R.id.ifl_tile_quick_toggle_screenshot);
        tileQuickToggleViewOnce = findViewById(R.id.ifl_tile_quick_toggle_viewonce);
        tileQuickToggleStory = findViewById(R.id.ifl_tile_quick_toggle_story);
        tileQuickToggleLive = findViewById(R.id.ifl_tile_quick_toggle_live);
    }
    
    /**
     * Setup all ghost mode feature switches and their listeners
     * These features are sub-options that only work when ghost mode is enabled
     */
    private void setupGhostModeFeatures() {
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

        // Quick Toggle Settings Section
        // These control which features the quick toggle button will affect
        Switch quickToggleSeenSwitch = tileQuickToggleSeen.getSwitchView();
        quickToggleSeenSwitch.setChecked(GhostModeManager.quickToggleSeen);
        quickToggleSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleSeen = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_seen, isChecked);
        });

        Switch quickToggleTypingSwitch = tileQuickToggleTyping.getSwitchView();
        quickToggleTypingSwitch.setChecked(GhostModeManager.quickToggleTyping);
        quickToggleTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleTyping = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_typing, isChecked);
        });

        Switch quickToggleScreenshotSwitch = tileQuickToggleScreenshot.getSwitchView();
        quickToggleScreenshotSwitch.setChecked(GhostModeManager.quickToggleScreenshot);
        quickToggleScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleScreenshot = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_screenshot, isChecked);
        });

        Switch quickToggleViewOnceSwitch = tileQuickToggleViewOnce.getSwitchView();
        quickToggleViewOnceSwitch.setChecked(GhostModeManager.quickToggleViewOnce);
        quickToggleViewOnceSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleViewOnce = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_view_once, isChecked);
        });

        Switch quickToggleStorySwitch = tileQuickToggleStory.getSwitchView();
        quickToggleStorySwitch.setChecked(GhostModeManager.quickToggleStory);
        quickToggleStorySwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleStory = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_story, isChecked);
        });

        Switch quickToggleLiveSwitch = tileQuickToggleLive.getSwitchView();
        quickToggleLiveSwitch.setChecked(GhostModeManager.quickToggleLive);
        quickToggleLiveSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            GhostModeManager.quickToggleLive = isChecked;
            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_quick_toggle_live, isChecked);
        });
    }
    
    /**
     * Update visibility of all ghost mode sub-options based on main toggle state
     * When ghost mode is enabled, NetworkInterceptor is active and options are visible
     * When ghost mode is disabled, NetworkInterceptor is inactive and options are hidden
     * 
     * @param isEnabled whether ghost mode is enabled
     */
    private void updateGhostModeOptionsVisibility(boolean isEnabled) {
        int visibility = isEnabled ? View.VISIBLE : View.GONE;
        
        // Main ghost mode features
        tileGhostSeen.setVisibility(visibility);
        tileGhostTyping.setVisibility(visibility);
        tileGhostScreenshot.setVisibility(visibility);
        tileGhostViewOnce.setVisibility(visibility);
        tileGhostStory.setVisibility(visibility);
        tileGhostLive.setVisibility(visibility);
        
        // Quick toggle options
        tileQuickToggleSeen.setVisibility(visibility);
        tileQuickToggleTyping.setVisibility(visibility);
        tileQuickToggleScreenshot.setVisibility(visibility);
        tileQuickToggleViewOnce.setVisibility(visibility);
        tileQuickToggleStory.setVisibility(visibility);
        tileQuickToggleLive.setVisibility(visibility);
    }
    
    /**
     * Disable all individual ghost features when ghost mode is turned off
     * This ensures that when the master switch is disabled, all sub-features are also disabled
     * and prevents ghost features from being active when the main toggle is off
     */
    private void disableAllGhostFeatures() {
        // Disable all ghost mode features
        GhostModeManager.isGhostSeen = false;
        GhostModeManager.isGhostTyping = false;
        GhostModeManager.isGhostScreenshot = false;
        GhostModeManager.isGhostViewOnce = false;
        GhostModeManager.isGhostStory = false;
        GhostModeManager.isGhostLive = false;
        
        // Save the disabled state to preferences
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false);
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false);
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false);
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_view_once, false);
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_story, false);
        preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_live, false);
        
        // Update switch states in UI
        tileGhostSeen.getSwitchView().setChecked(false);
        tileGhostTyping.getSwitchView().setChecked(false);
        tileGhostScreenshot.getSwitchView().setChecked(false);
        tileGhostViewOnce.getSwitchView().setChecked(false);
        tileGhostStory.getSwitchView().setChecked(false);
        tileGhostLive.getSwitchView().setChecked(false);
    }
}
