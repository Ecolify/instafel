# Ghost Mode Patches - Developer Guide

## Overview

This directory contains the Ghost Mode patches for Instafel, based on [InstaEclipse's ghost mode implementation](https://github.com/ReSo7200/InstaEclipse.git).

Ghost Mode allows users to browse Instagram anonymously by blocking various tracking signals.

## Patches Included

### 1. GhostSeen.kt
**Purpose**: Hide DM read receipts  
**Target**: Methods containing `"mark_thread_seen-"`  
**Effect**: When enabled, prevents Instagram from sending "message read" notifications

### 2. GhostTyping.kt
**Purpose**: Hide typing indicators  
**Target**: Methods containing `"is_typing_indicator_enabled"`  
**Effect**: When enabled, prevents Instagram from showing typing status to other users

### 3. GhostScreenshot.kt
**Purpose**: Block screenshot notifications  
**Target**: Methods in `ScreenshotNotificationManager`  
**Effect**: When enabled, prevents Instagram from notifying users when you screenshot their messages

### 4. GhostStory.kt
**Purpose**: View stories anonymously  
**Target**: Methods containing `"media/seen/"`  
**Effect**: When enabled, prevents Instagram from marking stories as viewed

### 5. GhostViewOnce.kt
**Purpose**: View ViewOnce messages anonymously  
**Target**: Methods containing `"visual_item_seen"`  
**Effect**: When enabled, prevents Instagram from notifying senders when ViewOnce messages are viewed

## How It Works

### Architecture Comparison

**InstaEclipse (Xposed Approach)**:
```
Runtime → DexKit finds methods → Xposed hooks → Check flag → Block if enabled
```

**Instafel (Smali Patching Approach)**:
```
Build time → Search smali files → Inject check code → Check preference → Return if enabled
```

### Injection Pattern

Each patch follows this pattern:

1. **Search Phase**: Find smali files containing specific strings (e.g., `"mark_thread_seen-"`)
2. **Locate Phase**: Find the method declaration containing that string
3. **Inject Phase**: Add check code at the method start:

```smali
# Ghost Mode check injected by Instafel
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhost{Feature}Enabled()Z
move-result v0
if-eqz v0, :ghost_{feature}_disabled
return-void
:ghost_{feature}_disabled
# Original method code continues...
```

4. **Runtime**: When Instagram executes the method, it checks the preference first
5. **Block**: If ghost mode is enabled, returns early without executing tracking code

## Usage

### Applying Patches

The patches are bundled in the `GhostMode` patch group. To apply them:

```bash
# Using Instafel patcher
./patcher apply ghost_mode
```

Or individually:
```bash
./patcher apply ghost_seen
./patcher apply ghost_typing
./patcher apply ghost_screenshot
./patcher apply ghost_story
./patcher apply ghost_view_once
```

### Enabling/Disabling at Runtime

Users control ghost mode features through the Instafel app preferences:

```java
GhostModeManager ghostManager = new GhostModeManager(context);

// Enable a feature
ghostManager.setGhostSeen(true);

// Check if feature is enabled
boolean enabled = ghostManager.isGhostSeenEnabled();

// Toggle all selected features
ghostManager.toggleSelectedGhostOptions();
```

The preferences are stored in SharedPreferences and checked by the injected smali code.

## Technical Details

### Static Method Access

The `GhostModeManager` provides static methods that can be called from smali:

```java
// App code (instance methods)
public boolean isGhostSeenEnabled() { ... }

// Smali-callable (static methods)
public static boolean checkGhostSeenEnabled() { ... }
```

The static methods are used because smali can only invoke static methods without an instance.

### Context Initialization

The static methods require a Context. Initialize it during app startup:

```java
@Override
public void onCreate() {
    super.onCreate();
    GhostModeManager.initializeStatic(this);
}
```

### Preference Keys

Each feature has a preference key defined in `PreferenceKeys.java`:

- `ifl_ghost_seen` - Ghost Seen
- `ifl_ghost_typing` - Ghost Typing
- `ifl_ghost_screenshot` - Ghost Screenshot
- `ifl_ghost_view_once` - Ghost ViewOnce
- `ifl_ghost_story` - Ghost Story
- `ifl_ghost_live` - Ghost Live (future implementation)

## Limitations

### 1. Instagram Version Compatibility
These patches target specific string patterns in Instagram's code. If Instagram changes these strings or the method structure, patches may fail to apply.

**Solution**: Update search patterns when Instagram updates.

### 2. Method Signature Changes
If Instagram changes method signatures (parameters, return types), the patch may not find the target method.

**Solution**: Add fallback search patterns or update matching criteria.

### 3. Obfuscation
Instagram uses ProGuard/R8 obfuscation which changes method and class names between versions.

**Solution**: Search by string constants (which are not obfuscated) rather than class/method names.

## Debugging

### Patch Application Failures

If a patch fails to apply:

1. Check the search pattern is still valid in the current Instagram version
2. Verify the method signature matching criteria
3. Check patcher logs for specific error messages

Example log output:
```
[GhostSeen] Ghost Seen source class found: SmaliFile_1234.smali
[GhostSeen] Ghost Seen check successfully injected into method
```

### Runtime Issues

If ghost mode doesn't work after patching:

1. Verify patch was applied successfully (check patched APK's smali files)
2. Ensure `GhostModeManager.initializeStatic()` is called
3. Check preference values are being set correctly
4. Verify static methods are being called from injected code

### Manual Verification

To verify a patch was applied, decompile the patched APK and search for:
```smali
# Ghost Mode - {Feature} check
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->checkGhost{Feature}Enabled()Z
```

## Maintenance

### Updating for New Instagram Versions

When Instagram updates break a patch:

1. Decompile the new Instagram APK
2. Search for the string pattern (e.g., `"mark_thread_seen-"`)
3. Examine the containing method structure
4. Update the patch's search and matching criteria if needed
5. Test the updated patch

### Adding New Ghost Features

To add a new ghost mode feature:

1. Analyze Instagram's code to find the tracking method
2. Identify unique strings or patterns in that method
3. Create a new patch file following the existing pattern
4. Add a static check method to `GhostModeManager`
5. Add preference key to `PreferenceKeys`
6. Add to `GhostMode` patch group
7. Add localization strings
8. Test thoroughly

## Security Considerations

- ✅ Patches only modify tracking behavior, not core functionality
- ✅ All preferences stored locally in SharedPreferences
- ✅ No data sent to external servers
- ✅ User has full control over each feature
- ✅ Injected code is minimal and auditable

## Contributing

When contributing ghost mode patches:

1. Follow the existing patch structure
2. Use descriptive comments in smali injection code
3. Add proper error handling and logging
4. Test on multiple Instagram versions if possible
5. Document any Instagram version-specific quirks
6. Update this README with any new patterns or findings

## References

- [InstaEclipse Repository](https://github.com/ReSo7200/InstaEclipse.git) - Original Xposed implementation
- [Instafel Documentation](../../GHOST_MODE_IMPLEMENTATION.md) - Technical details
- [Smali Reference](https://github.com/JesusFreke/smali/wiki) - Smali syntax guide

## License

These patches are part of Instafel and subject to the same license.

---

For questions or issues, please open a GitHub issue in the Instafel repository.
