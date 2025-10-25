# Instagram Alpha Patching Workflow

This workflow automates the process of downloading the latest Instagram Alpha version, compiling Instafel, and patching the APK.

## Requirements

The following secrets need to be configured in the repository settings:

- `GPLAY_EMAIL`: Google account email for Google Play authentication
- `GPLAY_AAS_TOKEN`: AAS token obtained from [Aurora's Authenticator](https://github.com/whyorean/Authenticator/releases/latest)
- `RELEASE_CONTENT_API_URL`: API URL for release content (optional, used by gplayapi)
- `GH_PAT`: GitHub Personal Access Token (optional, used by gplayapi)

## How to Get AAS Token

1. Download [Aurora's Authenticator](https://github.com/whyorean/Authenticator/releases/latest) app
2. Install and open the app on your Android device
3. Sign in with your Google account
4. Copy the AAS token displayed in the app
5. Add it as a secret in your GitHub repository settings

## Workflow Triggers

The workflow can be triggered:

1. **Manually**: Go to Actions tab → "Patch Instagram Alpha" → "Run workflow"
2. **Scheduled**: Runs automatically daily at 2 AM UTC

## Workflow Steps

1. **Setup Environment**: Checks out the repository and sets up Java 17
2. **Build Tools**: 
   - Builds the GPlayAPI downloader JAR
   - Builds the Patcher JAR
3. **Download Instagram Alpha**: Uses GPlayAPI to download the latest Instagram Alpha APK from Google Play
4. **Initialize Project**: Initializes the patcher project with the downloaded APK
5. **Run Patches**: Applies all available Instafel patches to the APK
6. **Build Patched APK**: Builds the final patched APK
7. **Upload Artifacts**: Uploads the patched APK as a workflow artifact (available for 30 days)

## Outputs

The workflow produces:

- **Patched APK**: Available as `instafel-patched-apk` artifact
- **Build Logs**: Available as `build-logs` artifact (7 days retention)

## Usage

After the workflow completes successfully:

1. Go to the Actions tab in GitHub
2. Click on the completed workflow run
3. Download the `instafel-patched-apk` artifact
4. Extract the APK from the ZIP file
5. Install on your Android device

## Troubleshooting

If the workflow fails:

1. Check the build logs artifact for detailed error messages
2. Verify that all required secrets are correctly configured
3. Ensure your AAS token is valid (they can expire)
4. Check if Instagram Alpha is available on Google Play

## Notes

- The workflow requires valid Google Play credentials
- Instagram Alpha versions typically use version numbers ending in `.0.0.0.`
- The patched APK is not signed by default; you may need to sign it before installation
