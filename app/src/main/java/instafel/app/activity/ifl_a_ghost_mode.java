package instafel.app.activity;

import static instafel.app.utils.localization.LocalizationUtils.updateIflLocale;

import android.os.Bundle;
import android.view.View;
import android.widget.Switch;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import instafel.app.R;
import instafel.app.InstafelEnv;
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

        // Check if any ghost mode patches are applied
        boolean ghostSeenPatchApplied = InstafelEnv.isPatchApplied("ghost_seen");
        boolean ghostTypingPatchApplied = InstafelEnv.isPatchApplied("ghost_typing");
        boolean ghostScreenshotPatchApplied = InstafelEnv.isPatchApplied("ghost_screenshot");
        boolean anyGhostPatchApplied = ghostSeenPatchApplied || ghostTypingPatchApplied || ghostScreenshotPatchApplied;

        // If no ghost patches are applied, hide the entire section
        if (!anyGhostPatchApplied) {
            findViewById(R.id.ifl_ghost_mode_container).setVisibility(View.GONE);
            Toast.makeText(this, "Ghost Mode patches are not applied", Toast.LENGTH_LONG).show();
            return;
        }

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
        if (ghostSeenPatchApplied) {
            Switch ghostSeenSwitch = tileGhostSeen.getSwitchView();
            ghostSeenSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, false));
            ghostSeenSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
                preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_seen, isChecked);
                Toast.makeText(ifl_a_ghost_mode.this, 
                    isChecked ? "Ghost Seen Enabled" : "Ghost Seen Disabled", 
                    Toast.LENGTH_SHORT).show();
            });
        } else {
            tileGhostSeen.setVisibility(View.GONE);
        }

        // Ghost Typing (Typing Indicator)
        TileLargeSwitch tileGhostTyping = findViewById(R.id.ifl_tile_ghost_typing);
        if (ghostTypingPatchApplied) {
            Switch ghostTypingSwitch = tileGhostTyping.getSwitchView();
            ghostTypingSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, false));
            ghostTypingSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
                preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_typing, isChecked);
                Toast.makeText(ifl_a_ghost_mode.this, 
                    isChecked ? "Ghost Typing Enabled" : "Ghost Typing Disabled", 
                    Toast.LENGTH_SHORT).show();
            });
        } else {
            tileGhostTyping.setVisibility(View.GONE);
        }

        // Ghost Screenshot (Screenshot Detection)
        TileLargeSwitch tileGhostScreenshot = findViewById(R.id.ifl_tile_ghost_screenshot);
        if (ghostScreenshotPatchApplied) {
            Switch ghostScreenshotSwitch = tileGhostScreenshot.getSwitchView();
            ghostScreenshotSwitch.setChecked(preferenceManager.getPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, false));
            ghostScreenshotSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
                preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_ghost_screenshot, isChecked);
                Toast.makeText(ifl_a_ghost_mode.this, 
                    isChecked ? "Ghost Screenshot Enabled" : "Ghost Screenshot Disabled", 
                    Toast.LENGTH_SHORT).show();
            });
        } else {
            tileGhostScreenshot.setVisibility(View.GONE);
        }
    }
}
