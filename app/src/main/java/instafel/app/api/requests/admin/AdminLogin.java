package instafel.app.api.requests.admin;

import android.app.Activity;
import android.os.AsyncTask;
import android.util.Base64;
import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import instafel.app.activity.admin.ifl_a_admin_dashboard;
import instafel.app.activity.ifl_a_menu;
import instafel.app.api.models.InstafelResponse;
import instafel.app.managers.PreferenceManager;
import instafel.app.utils.GeneralFn;
import instafel.app.utils.InstafelAdminUser;
import instafel.app.utils.types.PreferenceKeys;
import instafel.app.utils.dialog.InstafelDialog;

/**
 * Admin Login API Request
 * 
 * Handles asynchronous authentication of Instafel administrators.
 * Sends credentials to the Instafel API with Base64 encoding for security.
 * 
 * Authentication Flow:
 * 1. Encode username and password with Base64
 * 2. Send GET request with encoded credentials in headers
 * 3. Parse response and handle authentication result
 * 4. Store admin credentials on successful login
 * 5. Offer dashboard shortcut creation
 * 
 * Response Handling:
 * - SUCCESS: User authenticated, credentials stored
 * - AUTHENTICATION_REJECTED: Invalid credentials
 * 
 * Must be in primary DEX as it's used by ifl_a_admin_login (primary DEX).
 */
public class AdminLogin extends AsyncTask<String, Void, InstafelResponse> {

    private String uname, pass;
    private Activity activity;
    private InstafelDialog instafelDialog;

    public AdminLogin(Activity activity, String username, String password, InstafelDialog iflDialog) {
        this.activity = activity;
        this.uname = username;
        this.pass = password;
        this.instafelDialog = iflDialog;
    }

    /**
     * Execute authentication request in background
     * @param f_url API endpoint URL for admin login
     * @return InstafelResponse containing authentication result
     */
    @Override
    protected InstafelResponse doInBackground(String... f_url) {
        InstafelResponse instafelResponse = null;
        try {
            URL url = new URL(f_url[0]);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("ifl-admin-username", Base64.encodeToString(uname.getBytes(), Base64.NO_WRAP));
            connection.setRequestProperty("ifl-admin-password", Base64.encodeToString(pass.getBytes(), Base64.NO_WRAP));
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                instafelResponse = new InstafelResponse(response.toString());
            } else {
                Log.v("Instafel", "Request failed with code " + responseCode);
                instafelDialog.hide();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return instafelResponse;
    }

    /**
     * Handle authentication response on UI thread
     * Shows welcome dialog and offers dashboard shortcut creation
     * @param instafelResponse Parsed API response
     */
    @Override
    protected void onPostExecute(InstafelResponse instafelResponse) {
        if (instafelResponse != null) {
            Log.v("Instafel", instafelResponse.getStatus());
            
            if (instafelResponse.getStatus().equals("SUCCESS")) {
                // Store admin credentials for future authenticated requests
                InstafelAdminUser.login(activity, uname, pass);
                InstafelDialog instafelDialog2 = InstafelDialog.createSimpleDialog(activity,
                        "Welcome",
                        "Welcome " + uname+ "!\n\nDo you want a shortcut created in the menu for quick access to admin dashboard?",
                        "Yes",
                        "No",
                        view -> {
                            PreferenceManager preferenceManager = new PreferenceManager(activity);
                            preferenceManager.setPreferenceBoolean(PreferenceKeys.ifl_show_admin_dash_as_tile, true);

                            activity.finish();
                            GeneralFn.startIntent(activity, ifl_a_menu.class);
                        },
                        view -> {
                            activity.finish();
                            GeneralFn.startIntent(activity, ifl_a_admin_dashboard.class);
                        }
                );
                instafelDialog.hide();
                instafelDialog2.show();
            } else if (instafelResponse.getStatus().equals("AUTHENTICATION_REJECTED")){
                instafelDialog.hide();
                InstafelDialog.createSimpleAlertDialog(activity, "Error", "Authentication rejected, please check your credentials");
            }
        } else {
            Log.v("Instafel", "instafelResponse is null on postExcute");
        }

        super.onPostExecute(instafelResponse);
    }
}
