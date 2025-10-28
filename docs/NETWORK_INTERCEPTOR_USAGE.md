# Network Interceptor Usage Guide

## Overview

The Network Interceptor is a ghost mode feature that blocks network requests at the TigonServiceLayer level, preventing Instagram from knowing when you view stories, screenshots, view once messages, or watch live videos.

## Prerequisites

Before using the Network Interceptor:

1. **Instafel Patcher:** You need the Instafel patcher to apply patches to Instagram
2. **Instagram APK:** A compatible Instagram Alpha APK
3. **Setup Complete:** Run `copilot-custom-setup` to prepare the environment
   - Clones InstaEclipse reference repository
   - Decompiles Instagram APK for patching

## How to Use

### 1. Build the Patcher

```bash
cd /home/runner/work/instafel/instafel
./gradlew :patcher-core:assemble
```

### 2. Apply Patches to Instagram

The Network Interceptor is automatically included when you enable Ghost Mode patches:

```bash
# Run the patcher with ghost mode enabled
./patcher --input instagram.apk --output instafel.apk --enable-ghost-mode
```

### 3. Install the Patched APK

```bash
adb install instafel.apk
```

### 4. Enable Ghost Mode Features

Open Instafel settings in Instagram:

1. Go to **Settings** → **Instafel**
2. Enable **Ghost Mode**
3. Toggle individual ghost features:
   - ✓ Ghost Screenshot (blocks screenshot detection)
   - ✓ Ghost ViewOnce (view once messages without marking as seen)
   - ✓ Ghost Story (view stories anonymously)
   - ✓ Ghost Live (watch live videos anonymously)

## What Gets Blocked

When ghost mode features are enabled, the Network Interceptor blocks these requests:

### Ghost Screenshot Enabled
- `/screenshot/` - Screenshot notification
- `/ephemeral_screenshot/` - Ephemeral screenshot notification

### Ghost ViewOnce Enabled
- `/item_replayed/` - View once replay marker
- `/direct.../item_seen/` - Direct message view once seen marker

### Ghost Story Enabled
- `/api/v2/media/seen/` - Story view tracking

### Ghost Live Enabled
- `/heartbeat_and_get_viewer_count/` - Live viewer tracking

## How It Works

```
┌───────────────────────────────────────┐
│ You take action (view story, etc.)    │
└─────────────┬─────────────────────────┘
              │
              ▼
┌───────────────────────────────────────┐
│ Instagram prepares network request    │
└─────────────┬─────────────────────────┘
              │
              ▼
┌───────────────────────────────────────┐
│ TigonServiceLayer.startRequest()      │
│ ┌─────────────────────────────────┐   │
│ │ NetworkInterceptor checks URI    │   │
│ │ - Is ghost mode enabled?         │   │
│ │ - Does URI match blocked pattern?│   │
│ │ - If yes: redirect to 127.0.0.1  │   │
│ └─────────────────────────────────┘   │
└─────────────┬─────────────────────────┘
              │
              ▼
┌───────────────────────────────────────┐
│ Request either blocked or sent        │
│ - Blocked: Goes to localhost          │
│ - Allowed: Goes to Instagram servers  │
└───────────────────────────────────────┘
```

## Verification

To verify the Network Interceptor is working:

### Method 1: Check Patch Applied

After building, verify the patch was applied:

```bash
# Check if NetworkInterceptor patch is in build logs
grep "Network interceptor patch applied" patcher.log
```

### Method 2: Test Ghost Features

1. **Test Ghost Story:**
   - Enable Ghost Story in Instafel settings
   - View someone's story
   - Check if your profile appears in their viewers list
   - ✓ Success: You don't appear in viewers

2. **Test Ghost Screenshot:**
   - Enable Ghost Screenshot
   - Take a screenshot of ephemeral content (disappearing photo/video in DM)
   - Check if sender gets notified
   - ✓ Success: No notification sent
   - Note: Regular message screenshots may not trigger notifications in all Instagram versions

3. **Test Ghost ViewOnce:**
   - Enable Ghost ViewOnce
   - View a "view once" photo/video
   - Check if it's still available to view again
   - ✓ Success: Can view multiple times

### Method 3: Network Monitoring (Advanced)

Use a network proxy to verify blocked requests:

```bash
# Install mitmproxy
pip install mitmproxy

# Start proxy
mitmproxy -p 8080

# Configure Instagram to use proxy
adb shell settings put global http_proxy 192.168.1.100:8080

# Use Instagram with ghost mode enabled
# Check mitmproxy logs for:
# - Requests to 127.0.0.1/404 (blocked)
# - Missing /screenshot/, /media/seen/, etc. requests
```

## Troubleshooting

### Issue: Ghost mode doesn't work

**Check:**
1. Is ghost mode enabled in Instafel settings?
2. Did the patch apply successfully during build?
3. Are you using a compatible Instagram version?

**Solution:**
```bash
# Rebuild with verbose logging
./gradlew :patcher:assemble --info | tee build.log
grep -i "network.*interceptor" build.log
```

### Issue: Some features work, others don't

**Cause:** Individual ghost features have separate toggles

**Solution:**
- Check each ghost feature is enabled in settings
- Each feature (screenshot, story, viewonce, live) must be enabled separately

### Issue: App crashes when using ghost mode

**Cause:** Reflection error or incompatible Instagram version

**Solution:**
1. Check Instagram version compatibility
2. Review crash logs: `adb logcat | grep -i instafel`
3. Try disabling and re-enabling ghost mode
4. Report issue with logs to developers

## Advanced Configuration

### Quick Toggle (Future Feature)

Quick toggle allows enabling/disabling ghost mode with a button:

1. Enable **Quick Toggle** for desired features
2. Use the ghost mode toggle button in Instagram
3. All selected features toggle on/off together

### Custom Blocking Patterns (Future Feature)

Advanced users can add custom endpoint patterns to block:

1. Edit NetworkInterceptor.java
2. Add pattern to shouldBlockRequest()
3. Rebuild and reinstall

Example:
```java
// Block custom endpoint
if (path.contains("/my/custom/endpoint/")) {
    return true;
}
```

## Integration with Other Patches

The Network Interceptor works alongside other ghost mode patches:

- **NetworkInterceptor:** Blocks network requests (primary defense)
- **GhostScreenshot:** Blocks screenshot detection method (backup)
- **GhostSeen:** Blocks read receipt method (backup)
- **GhostTyping:** Blocks typing indicator method
- **GhostStory:** Blocks story seen method (backup)
- **GhostViewOnce:** Blocks view once seen method (backup)

Both network-level and method-level blocking work together for maximum coverage.

## Best Practices

1. **Enable Features Selectively:** Only enable ghost features you actually use
2. **Test Before Relying:** Verify ghost mode works before trusting it
3. **Stay Updated:** Update Instafel when new Instagram versions release
4. **Report Issues:** Help improve the patch by reporting problems
5. **Use Responsibly:** Respect others' privacy and Instagram's terms

## FAQ

**Q: Will ghost mode get me banned from Instagram?**
A: Using modified Instagram apps violates Instagram's Terms of Service. While many users report no issues, there is always a risk of account restrictions or bans. Use at your own risk and consider using a secondary account for testing.

**Q: Does ghost mode work on all Instagram versions?**
A: No. It's tested on Instagram Alpha versions. Compatibility varies by version.

**Q: Can others tell I'm using ghost mode?**
A: No, if working correctly. Your actions appear normal to others; the tracking is just blocked.

**Q: Does this work for regular Instagram or just Alpha?**
A: Currently designed for Instagram Alpha. May work on regular Instagram with modifications.

**Q: How is this different from individual ghost patches?**
A: Network Interceptor blocks at the network layer (more comprehensive), while individual patches block at the method layer (more specific). Both work together.

## Support

For help with Network Interceptor:

1. Check this documentation
2. Review [NETWORK_INTERCEPTOR.md](NETWORK_INTERCEPTOR.md) for technical details
3. Search existing GitHub issues
4. Create a new issue with:
   - Instagram version
   - Instafel version
   - Steps to reproduce
   - Logs (if available)

## References

- Technical Documentation: [NETWORK_INTERCEPTOR.md](NETWORK_INTERCEPTOR.md)
- InstaEclipse Reference: `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- Main README: [README.md](../README.md)
