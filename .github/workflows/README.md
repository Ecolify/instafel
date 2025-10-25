# Instagram Alpha Patching Workflow

This GitHub Actions workflow automates the process of downloading Instagram Alpha APKs and patching them with Instafel.

## Overview

The workflow performs the following steps:
1. Builds all Instafel components:
   - Instafel App (debug and release variants)
   - Patcher Core JAR
   - Patcher JAR
2. Downloads Instagram Alpha APK (either from a provided URL or using gplayapi)
3. Initializes a patching project with the Instagram APK
4. Applies Instafel patches and builds the unclone variant APK
5. Applies clone patches and builds the clone variant APK
6. Uploads all artifacts (Instafel app, patcher tools, and patched Instagram APKs)

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

- **instafel-app-{version}**: Contains the Instafel App APKs (debug and release variants)
- **instafel-patcher-{version}**: Contains the Patcher JAR file
- **instafel-patcher-core-{version}**: Contains the Patcher Core JAR file
- **instafel-patched-instagram-{version}**: Contains the patched Instagram APK files (both clone and unclone variants)
- **instafel-build-info-{version}**: Contains build metadata and information JSON files

## Requirements

- GitHub Actions enabled for the repository
- For gplayapi usage: Valid Google Play credentials configured as secrets

## Notes

- The workflow builds both clone and unclone variants of the patched Instagram:
  - **Unclone variant**: Includes only the base Instafel patches
  - **Clone variant**: Includes the clone feature patches in addition to base patches
- All APK files are properly named with their variant suffix (`-unclone.apk` or `-clone.apk`)
- The patching process can take several minutes depending on the APK size
- The workflow uses JDK 17 for building the patcher and running the patching process
- The Instafel App APK is built and included to resolve INSTALL_FAILED_MISSING_SPLIT errors

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
