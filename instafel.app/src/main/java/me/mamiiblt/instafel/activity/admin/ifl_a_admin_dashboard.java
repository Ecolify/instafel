package me.mamiiblt.instafel.activity.admin;

import static me.mamiiblt.instafel.utils.GeneralFn.updateIflUi;
import static me.mamiiblt.instafel.utils.Localizator.updateIflLocale;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;

import me.mamiiblt.instafel.R;
import me.mamiiblt.instafel.managers.OverridesManager;
import me.mamiiblt.instafel.ota.IflEnvironment;
import me.mamiiblt.instafel.ui.TileCompact;
import me.mamiiblt.instafel.utils.GeneralFn;
import me.mamiiblt.instafel.utils.InstafelAdminUser;

public class ifl_a_admin_dashboard extends AppCompatActivity {

    TileCompact tileLogout, tileExportMapping, tileUpdateBackup, tilePreferenceManager, tileApprovePreview;
    OverridesManager overridesManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        updateIflUi(this);
        updateIflLocale(this, false);
        setContentView(R.layout.ifl_at_admin_dashboard);

        overridesManager = new OverridesManager(this);
        tileLogout = findViewById(R.id.ifl_tile_admin_action_logout);
        tileExportMapping = findViewById(R.id.ifl_tile_admin_action_export_mapping);
        tilePreferenceManager = findViewById(R.id.ifl_tile_admin_action_sharedpref_manager);
        tileApprovePreview = findViewById(R.id.ifl_tile_admin_update_approve_preview);

        tileUpdateBackup = findViewById(R.id.ifl_tile_admin_update_update_backup);
        tileUpdateBackup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                GeneralFn.startIntent(ifl_a_admin_dashboard.this, ifl_a_admin_action_updatebackup.class);
            }
        });

        tileApprovePreview.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                GeneralFn.startIntent(ifl_a_admin_dashboard.this, ifl_a_admin_action_approvepreview.class);
            }
        });

        tileExportMapping.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.putExtra(Intent.EXTRA_TITLE, IflEnvironment.getIgVersion(ifl_a_admin_dashboard.this).replace(".", "d") + ".json");
                intent.setType("application/json");
                startActivityForResult(intent, 15);
            }
        });

        tileLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (InstafelAdminUser.isUserLogged(ifl_a_admin_dashboard.this)) {
                    InstafelAdminUser.logoutUser(ifl_a_admin_dashboard.this);
                    finish();
                } else {
                    Toast.makeText(ifl_a_admin_dashboard.this, "User not logged", Toast.LENGTH_SHORT).show();
                }
            }
        });

        tilePreferenceManager.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                GeneralFn.startIntent(ifl_a_admin_dashboard.this, ifl_a_admin_pref_manager.class);
            }
        });
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);

        switch (requestCode) {
            case 15:
                Uri backup_uri;
                if (intent != null) {
                    backup_uri = intent.getData();
                } else {
                    backup_uri = null;
                }

                if (backup_uri == null) {
                    Toast.makeText(this, R.string.ifl_a4_04, Toast.LENGTH_SHORT).show();
                    return;
                }

                if (resultCode == -1) {
                    try {
                        JSONArray contentOverride = overridesManager.readMappingFile();
                        if (contentOverride == null) {
                            Toast.makeText(this, "Error while reading mapping file.", Toast.LENGTH_SHORT).show();
                        } else {
                            boolean status = overridesManager.writeContentIntoMappingFile(backup_uri, contentOverride);
                            if (status) {
                                Toast.makeText(this, contentOverride.length() + " mapping successfully exported", Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(this, "Error while writing content into mapping file.", Toast.LENGTH_SHORT).show();
                            }
                        }
                    } catch (Exception e) {
                        Toast.makeText(this, "Error while exporting mapping file", Toast.LENGTH_SHORT).show();
                        e.printStackTrace();
                    }
                }
                break;
        }
    }
}