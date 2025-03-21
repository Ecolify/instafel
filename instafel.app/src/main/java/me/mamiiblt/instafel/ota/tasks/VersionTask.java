package me.mamiiblt.instafel.ota.tasks;

import android.app.Activity;
import android.app.Dialog;
import android.os.AsyncTask;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import androidx.constraintlayout.widget.ConstraintLayout;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.GenericArrayType;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.format.ResolverStyle;

import me.mamiiblt.instafel.R;
import me.mamiiblt.instafel.ota.LastCheck;
import me.mamiiblt.instafel.ui.LoadingBar;
import me.mamiiblt.instafel.utils.DialogItem;
import me.mamiiblt.instafel.utils.GeneralFn;
import me.mamiiblt.instafel.utils.Localizator;
import me.mamiiblt.instafel.utils.dialog.InstafelDialog;
import me.mamiiblt.instafel.utils.dialog.InstafelDialogMargins;
import me.mamiiblt.instafel.utils.dialog.InstafelDialogTextType;

public class VersionTask extends AsyncTask<String, Void, String> {

    private final Activity act;
    private InstafelDialog instafelDialog;
    private int ifl_version = 0;
    private String ifl_type = "non_set";
    private boolean checkType;

    public VersionTask(Activity activity, String _ifl_type, int _ifl_version, boolean checkType) {
        this.ifl_type = _ifl_type;
        this.ifl_version = _ifl_version;
        this.instafelDialog = new InstafelDialog(activity);
        this.act = activity;
        this.checkType = checkType;
    }

    @Override
    protected String doInBackground(String... urls) {
        try {
            return sendGetRequest(urls[0]);
        } catch (IOException e) {
            e.printStackTrace();
            return "Couldn't connect to the server";
        }
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        if (this.checkType) {
            instafelDialog.addSpace("top_space", 25);
            LoadingBar loadingBar = new LoadingBar(this.act);
            ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(-2, -2);
            int i = (int) ((25 * this.act.getResources().getDisplayMetrics().density) + 0.5f);
            marginLayoutParams.setMargins(i, 0, i, 0);
            loadingBar.setLayoutParams(marginLayoutParams);
            instafelDialog.addCustomView("loading_bar", loadingBar);
            instafelDialog.addSpace("button_top_space", 25);
            instafelDialog.show();
        }
    }

    @Override
    protected void onPostExecute(String result) {
        try {
            LastCheck.update(act);
            if (checkType) {
                LastCheck.updateUi(act);
            }
            JSONObject jObject = new JSONObject(result);
            int lastVersion = Integer.parseInt(jObject.getString("tag_name").substring(1));

            JSONArray assetsArray = jObject.getJSONArray("assets");
            String buildInfoLink = "";
            for (int i = 0; i < assetsArray.length(); i++) {
                JSONObject asset = assetsArray.getJSONObject(i);
                String assetName = asset.getString("name");

                if (assetName.equals("build_info.json")) {
                    buildInfoLink = asset.getString("browser_download_url");
                }
            }
            new BuildInfoTask(act, ifl_version, ifl_type, lastVersion, instafelDialog, checkType).execute(buildInfoLink);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String sendGetRequest(String urlString) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.setConnectTimeout(15000);
        try {
            InputStream in = urlConnection.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            return response.toString();
        } finally {
            urlConnection.disconnect();
        }
    }
}