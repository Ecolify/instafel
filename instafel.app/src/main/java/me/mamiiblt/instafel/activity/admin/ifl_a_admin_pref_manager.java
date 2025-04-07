package me.mamiiblt.instafel.activity.admin;

import static me.mamiiblt.instafel.utils.GeneralFn.updateIflUi;
import static me.mamiiblt.instafel.utils.Localizator.updateIflLocale;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import me.mamiiblt.instafel.R;
import me.mamiiblt.instafel.managers.PreferenceManager;
import me.mamiiblt.instafel.ui.TileLargeEditText;
import me.mamiiblt.instafel.ui.TileLargeSwitch;
import me.mamiiblt.instafel.utils.GeneralFn;
import me.mamiiblt.instafel.utils.PreferenceKeys;
import me.mamiiblt.instafel.utils.PreferenceTypes;

public class ifl_a_admin_pref_manager extends AppCompatActivity {

    PreferenceManager preferenceManager;
    LinearLayout layout;
    List<TileLargeEditText> prefTiles = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        updateIflUi(this);
        updateIflLocale(this, false);
        setContentView(R.layout.ifl_at_admin_action_pref_manager);
        layout = findViewById(R.id.ifl_prefs_layout);
        preferenceManager = new PreferenceManager(this);

        // Add the visible prefs
        createPreferenceTitle(PreferenceKeys.ifl_lang, "ifl_lang", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_show_admin_dash_as_tile, "ifl_show_admin_dash_as_tile", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_enable_debug_mode, "ifl_enable_debug_mode", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_debug_mode_custom_api_url, "ifl_debug_mode_custom_api_url", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_enable_amoled_theme, "ifl_enable_amoled_theme", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_custom_ifl_version, "ifl_custom_ifl_version", PreferenceTypes.INT);
        createPreferenceTitle(PreferenceKeys.ifl_custom_ig_version, "ifl_custom_ig_version", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_custom_ig_ver_code, "ifl_custom_ig_ver_code", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_custom_gen_id, "ifl_custom_gen_id", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_backup_last_check, "ifl_backup_last_check", PreferenceTypes.LONG);
        createPreferenceTitle(PreferenceKeys.ifl_enable_auto_update, "ifl_enable_auto_update", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_backup_update_value, "ifl_backup_update_value", PreferenceTypes.STRING);
        createPreferenceTitle(PreferenceKeys.ifl_ota_background_enable, "ifl_ota_background_enable", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_ota_last_check, "ifl_ota_last_check", PreferenceTypes.LONG);
        createPreferenceTitle(PreferenceKeys.ifl_ota_freq, "ifl_ota_freq", PreferenceTypes.INT);
        createPreferenceTitle(PreferenceKeys.ifl_ota_setting, "ifl_ota_setting", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_ota_last_success_install, "ifl_ota_last_success_install", PreferenceTypes.LONG);
        createPreferenceTitle(PreferenceKeys.ifl_welcome_message, "ifl_welcome_message", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_debug_mode_warning_dialog, "ifl_debug_mode_warning_dialog", PreferenceTypes.BOOLEAN);
        createPreferenceTitle(PreferenceKeys.ifl_clog_last_shown_version, "ifl_clog_last_shown_version", PreferenceTypes.INT);
        createPreferenceTitle(PreferenceKeys.ifl_clog_disable_version_control, "ifl_clog_disable_version_control", PreferenceTypes.BOOLEAN);
        buildLayout();
    }

    public String parsePreferenceType(int preferenceType) {
        switch (preferenceType){
            case 1:
                return "int";
            case 2:
                return "string";
            case 3:
                return "bool";
            case 4:
                return "long";
        }
        return "unknown";
    }

    public void createPreferenceTitle(String preferenceId, String preferenceName, int preferenceType) {
        TileLargeEditText tileLargeSwitch = new TileLargeEditText(this);
        tileLargeSwitch.setTitleText(preferenceName + " (" +parsePreferenceType(preferenceType) + ")");
        tileLargeSwitch.setIconRes(R.drawable.ifl_developer);
        tileLargeSwitch.setSpaceBottom("visible");
        tileLargeSwitch.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        EditText editText = tileLargeSwitch.getEditTextView();
        editText.setImeOptions(EditorInfo.IME_ACTION_DONE);
        editText.setHint("NOT_DEFINED_YET");
        String preferenceTypeParsed = parsePreferenceType(preferenceType);
        switch (preferenceTypeParsed) {
            case "string":
                if (preferenceManager.exists(preferenceId)) {
                    if (!preferenceName.equals("ifl_debug_mode_custom_api_url")) {
                        editText.setText(preferenceManager.getPreferenceString(preferenceId, "NULL"));
                    } else {
                        editText.setText(GeneralFn.DEFAULT_API_PATH);
                    }
                }
                break;
            case "int":
                if (preferenceManager.exists(preferenceId)) {
                    editText.setText(Integer.toString(preferenceManager.getPreferenceInt(preferenceId, 0)));
                }
                break;
            case "bool":
                if (preferenceManager.exists(preferenceId)) {
                    editText.setText(Boolean.toString(preferenceManager.getPreferenceBoolean(preferenceId, false)));
                }
                break;
            case "long":
                if (preferenceManager.exists(preferenceId)) {
                    editText.setText(Long.toString(preferenceManager.getPreferenceLong(preferenceId, 0)));
                }
                break;
        }
        setEditorAction(editText, preferenceTypeParsed, preferenceId);
        prefTiles.add(tileLargeSwitch);
    }

    private void setEditorAction(EditText editText, String preferenceTypeParsed, String preferenceId) {
        editText.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_DONE) {
                    switch (preferenceTypeParsed) {
                        case "string":
                            preferenceManager.setPreferenceString(preferenceId, editText.getText().toString());
                            Toast.makeText(ifl_a_admin_pref_manager.this, "Preference updated", Toast.LENGTH_SHORT).show();
                            break;
                        case "int":
                            try {
                                int parsedValue = Integer.parseInt(editText.getText().toString());
                                preferenceManager.setPreferenceInt(preferenceId, parsedValue);
                                Toast.makeText(ifl_a_admin_pref_manager.this, "Preference updated", Toast.LENGTH_SHORT).show();
                            } catch (Exception e) {
                                Toast.makeText(ifl_a_admin_pref_manager.this, "New value cannot converted into INT", Toast.LENGTH_SHORT).show();
                            }
                            break;
                        case "bool":
                            if (editText.getText().toString().equals("true")) {
                                preferenceManager.setPreferenceBoolean(preferenceId, true);
                                Toast.makeText(ifl_a_admin_pref_manager.this, "Preference updated", Toast.LENGTH_SHORT).show();
                            } else if (editText.getText().toString().equals("false")) {
                                preferenceManager.setPreferenceBoolean(preferenceId, false);
                                Toast.makeText(ifl_a_admin_pref_manager.this, "Preference updated", Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(ifl_a_admin_pref_manager.this, "New value cannot converted into BOOL", Toast.LENGTH_SHORT).show();
                            }
                            break;
                        case "long":
                            try {
                                long parsedValue = Long.parseLong(editText.getText().toString());
                                preferenceManager.setPreferenceLong(preferenceId, parsedValue);
                                Toast.makeText(ifl_a_admin_pref_manager.this, "Preference updated", Toast.LENGTH_SHORT).show();
                            } catch (Exception e) {
                                Toast.makeText(ifl_a_admin_pref_manager.this, "New value cannot converted into LONG", Toast.LENGTH_SHORT).show();
                            }
                            break;
                    }
                }
                return false;
            }
        });
    }

    public void buildLayout() {
        layout.removeAllViews();
        for (int i = 0; i < prefTiles.size(); i++) {
            layout.addView(prefTiles.get(i));
        }
    }
}