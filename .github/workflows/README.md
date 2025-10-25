# Instagram Alpha Patching Workflow

This GitHub Actions workflow automates the process of downloading Instagram Alpha APKs and patching them with Instafel.

## Overview

The workflow performs the following steps:
1. Downloads Instagram Alpha APK (either from a provided URL or using gplayapi)
2. Builds the Instafel patcher
3. Initializes a patching project with the Instagram APK
4. Builds the patched APK with Instafel features
5. Uploads the patched APK as a workflow artifact

## Usage

### Option 1: Using a Direct APK URL (Recommended)

1. Go to the **Actions** tab in your repository
2. Select the **Patch Instagram Alpha** workflow
3. Click **Run workflow**
4. Fill in the inputs:
   - **instagram_apk_url**: Direct download URL to an Instagram Alpha APK
   - **instagram_version**: (Optional) Version name for artifact naming
   - **use_gplayapi**: Leave unchecked (false)
5. Click **Run workflow**

Example APK URLs can be found on sites like APKMirror, APKPure, or other APK repositories that host Instagram Alpha builds.

### Option 2: Using gplayapi (Advanced)

To use the gplayapi to automatically download the latest Instagram Alpha from Google Play, you need to configure the following GitHub Secrets:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add the following secrets:
   - `GPLAY_EMAIL`: Your Google account email
   - `GPLAY_AAS_TOKEN`: AAS token from [Aurora Authenticator](https://github.com/whyorean/Authenticator/releases/latest)
   - `RELEASE_CONTENT_API_URL`: (Optional) API URL for release content
   - `GH_TOKEN`: GitHub Personal Access Token with appropriate permissions

Then run the workflow with:
- **use_gplayapi**: Check this option (true)
- **instagram_apk_url**: Leave empty

## Outputs

The workflow produces the following artifacts:

- **instafel-patched-instagram-{version}**: Contains the patched APK files (both clone and unclone variants if applicable)
- **instafel-build-info-{version}**: Contains build metadata and information JSON files

Additionally, if `RELEASE_CONTENT_API_URL` and `GH_TOKEN` secrets are configured, the workflow will automatically upload the build information to the specified API endpoint.

## Requirements

- GitHub Actions enabled for the repository
- For gplayapi usage: Valid Google Play credentials configured as secrets
- For API upload: `RELEASE_CONTENT_API_URL` and `GH_TOKEN` secrets configured

## Notes

- The patcher runs in non-production mode by default, generating `clone.apk` and `unclone.apk` files
- The patching process can take several minutes depending on the APK size
- The workflow uses JDK 17 for building the patcher and running the patching process
- When `RELEASE_CONTENT_API_URL` is configured, build information is automatically uploaded to the API after successful builds

## Troubleshooting

If the workflow fails:

1. Check the workflow logs for specific error messages
2. Verify the Instagram APK URL is valid and accessible
3. If using gplayapi, ensure all required secrets are correctly configured
4. Make sure the APK is actually an Instagram Alpha build (version should contain `.0.0.0.`)

## Related Documentation

- [What is Instafel?](https://instafel.app/wiki/what-is-instafel)
- [Instafel Patcher](https://instafel.app/wiki/instafel-patcher)
- [GPlayAPI Documentation](../gplayapi/README.md)
