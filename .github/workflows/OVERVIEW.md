# Instagram Alpha Automated Patching

This directory contains the automated workflow for patching Instagram Alpha APKs with Instafel.

## Overview

The workflow automatically:
1. Downloads the latest Instagram Alpha version from Google Play
2. Compiles the Instafel patcher
3. Applies all Instafel patches to the APK
4. Uploads the patched APK as a downloadable artifact

## Files

- **patch-instagram-alpha.yml** - Main GitHub Actions workflow
- **README.md** - Detailed documentation for the workflow

## Quick Start

### Prerequisites

Configure the following secrets in your repository settings:

1. `GPLAY_EMAIL` - Your Google account email
2. `GPLAY_AAS_TOKEN` - AAS token from [Aurora Authenticator](https://github.com/whyorean/Authenticator/releases/latest)
3. `RELEASE_CONTENT_API_URL` - (Optional) API URL for release content
4. `GH_PAT` - (Optional) GitHub Personal Access Token

### Running the Workflow

**Manual Trigger:**
1. Go to the "Actions" tab in GitHub
2. Select "Patch Instagram Alpha" workflow
3. Click "Run workflow"
4. Wait for completion (~60-90 minutes total)
5. Download the patched APK from the artifacts

**Automatic Trigger:**
- The workflow runs automatically every day at 2 AM UTC

## Workflow Duration

- Build Tools: ~5 minutes
- Download APK: ~10 minutes
- Initialize Project: ~15 minutes
- Apply Patches: ~20 minutes
- Build Patched APK: ~25 minutes
- **Total: ~75 minutes**

## Artifacts

After successful completion:
- **instafel-patched-apk** - The patched Instagram APK (30 days retention)
- **build-logs** - Build logs for debugging (7 days retention)

## Troubleshooting

See [README.md](README.md) for detailed troubleshooting information.

## Technical Details

The workflow uses two custom JAR files built from the Instafel project:

1. **ifl-gplayapi-downloader** - Downloads Instagram Alpha APK from Google Play
2. **ifl-patcher** - Patches the APK with Instafel features

Both are built from source during the workflow execution.
