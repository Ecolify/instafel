# Troubleshooting Guide: InstafelFileProvider ClassNotFoundException

## Quick Diagnosis

If you're still seeing `ClassNotFoundException: instafel.app.utils.InstafelFileProvider` after applying this fix, use this guide to diagnose the issue.

## Step 1: Verify the Patcher is Updated

Check that you're using the updated patcher-core JAR:

```bash
# Extract the JAR to check the manifest
unzip -p ifl-patcher-core.jar META-INF/MANIFEST.MF | grep Patcher-Core-Commit
```

Compare the commit hash with the one that includes this fix: `b4db787` or later.

## Step 2: Check Patcher Logs

During patching, look for these log messages:

### Success indicators:
```
[INFO] Copying instafel resources
[INFO] InstafelFileProvider.smali moved to primary DEX (smali)
[INFO] Instafel resources copied
```

### Error indicators:
```
[SEVERE] Failed to create directory for InstafelFileProvider in primary DEX
[SEVERE] Failed to move InstafelFileProvider to primary DEX
```

If you see errors, the patch likely failed. Check file permissions and disk space.

## Step 3: Manually Verify DEX Location

After patching, extract and check the APK:

```bash
# Extract the patched APK
unzip your_patched_instagram.apk -d /tmp/check_apk

# Look for the provider in primary DEX
cd /tmp/check_apk
apktool d classes.dex -o dex1_contents

# Search for the provider
find dex1_contents -name "InstafelFileProvider.smali"
```

**Expected:** File should be at `dex1_contents/smali/instafel/app/utils/InstafelFileProvider.smali`

**If not found:** Check secondary DEX files:

```bash
apktool d classes2.dex -o dex2_contents
find dex2_contents -name "InstafelFileProvider.smali"
```

**If found in classes2.dex or later:** The fix didn't work. File an issue.

## Step 4: Check AndroidManifest.xml

Verify the provider is declared:

```bash
# Extract manifest
unzip -p your_patched_instagram.apk AndroidManifest.xml > /tmp/manifest_binary.xml

# Decode with apktool
apktool d your_patched_instagram.apk -o /tmp/decoded_apk

# Check for provider
grep -A 3 "InstafelFileProvider" /tmp/decoded_apk/AndroidManifest.xml
```

**Expected:**
```xml
<provider
    android:name="instafel.app.utils.InstafelFileProvider"
    android:authorities="instafel.app.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true"/>
```

## Step 5: Check Device Logs (Logcat)

If the app still crashes, capture logcat:

```bash
adb logcat -c  # Clear logs
# Launch the app
adb logcat -d > crash.log
```

Look for:
```
ClassNotFoundException: instafel.app.utils.InstafelFileProvider
```

Also check for:
```
DexPathList[[zip file ".../base.apk"]
```

This shows which DEX files are being loaded. If `InstafelFileProvider` is in a DEX that's not listed, that's your problem.

## Common Issues

### Issue 1: Old Patcher Version
**Symptom:** No log message about moving InstafelFileProvider  
**Solution:** Rebuild patcher-core with the latest code

### Issue 2: Insufficient Permissions
**Symptom:** Errors about directory creation or file copy  
**Solution:** Run patcher with proper permissions, ensure output directory is writable

### Issue 3: Corrupted ifl_sources.zip
**Symptom:** InstafelFileProvider.smali not found during extraction  
**Solution:** Rebuild the app module to regenerate ifl_sources.zip

### Issue 4: Multi-DEX Not Working
**Symptom:** App crashes but provider IS in primary DEX  
**Solution:** Check Instagram's MultiDexApplication setup, may be a different issue

## Advanced Debugging

### Enable Detailed Logging

Modify `CopyInstafelSources.kt` temporarily:

```kotlin
// Add after line 59
Log.info("Extracted to: ${destFolder.absolutePath}")
Log.info("Primary DEX: ${primaryDexFolder?.name}")
Log.info("Smallest DEX: ${smallDexFolder.name}")
Log.info("Provider source exists: ${fileProviderSource.exists()}")
```

Rebuild and re-patch to see detailed information.

### Manual Fix (Emergency)

If automated fix fails, manually move the file:

```bash
# After patching but before recompiling
cd your_patch_directory/sources
mv smali_classes2/instafel/app/utils/InstafelFileProvider.smali \
   smali/instafel/app/utils/
```

Then continue with the patcher's recompile step.

## Report an Issue

If none of the above helps, create an issue with:

1. Full patcher logs (with any sensitive info redacted)
2. Output of Step 3 (DEX location verification)
3. Crash logcat
4. Instagram version being patched
5. Patcher-core version (commit hash)

Include this template:

```
### Environment
- Patcher-core commit: [from MANIFEST.MF]
- Instagram version: [e.g., 315.0.0.0.119]
- Device: [if testing on device]
- Android version: [if testing on device]

### Steps Taken
1. Built patcher: [yes/no]
2. Verified DEX location: [primary/secondary/not found]
3. Checked manifest: [provider declared: yes/no]
4. Checked logs: [attach]

### Logs
[Attach patcher logs and crash logcat]
```
