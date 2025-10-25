# Ghost Mode Implementation for Instafel

## Overview
This implementation adds Ghost Mode features to Instafel, based on the InstaEclipse repository. Ghost Mode allows users to use Instagram stealthily by preventing various tracking and notification mechanisms.

## Components Added

### 1. App Module - GhostModeManager (`app/src/main/java/instafel/app/utils/ghost/GhostModeManager.java`)

A manager class that:
- Stores Ghost Mode state flags as public static fields for easy access from smali patches
- Provides methods to load and save Ghost Mode settings from SharedPreferences
- Implements toggle functionality for quick enable/disable of selected ghost features
- Manages the following ghost features:
  - **Ghost Seen**: Prevents "message seen" status from being sent
  - **Ghost Typing**: Prevents typing indicator from being sent
  - **Ghost Screenshot**: Prevents screenshot detection notifications
  - **Ghost View Once**: Prevents view once media tracking
  - **Ghost Story**: Prevents story view tracking
  - **Ghost Live**: Prevents live video view tracking

### 2. App Module - PreferenceKeys Updates (`app/src/main/java/instafel/app/utils/types/PreferenceKeys.java`)

Added preference keys for all Ghost Mode features:
- Main ghost mode flags (ifl_ghost_seen, ifl_ghost_typing, etc.)
- Quick toggle settings (ifl_quick_toggle_seen, ifl_quick_toggle_typing, etc.)
- Master ghost mode enable flag

### 3. Patcher-Core Module - Ghost Mode Patches

Created three main patches in `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/`:

#### a. GhostSeen.kt
- Searches for methods containing "mark_thread_seen-" string
- Injects a check at the beginning of the method that returns early if ghost seen is enabled
- Prevents Instagram from sending "message read" notifications

#### b. GhostTyping.kt
- Searches for methods containing "is_typing_indicator_enabled" string
- Injects a check that prevents typing indicator from being sent when enabled
- Allows users to type without the other person knowing

#### c. GhostScreenshot.kt
- Searches for methods containing "ScreenshotNotificationManager" string
- Finds the screenshot notification method and blocks it when enabled
- Prevents Instagram from notifying users when you screenshot their content

#### d. GhostMode.kt (Patch Group)
- Groups all ghost mode patches together
- Allows users to apply all ghost features at once using the shortname "ghost_mode"

## How It Works

### Patching Process
1. Each patch uses DexKit-style searching to find the target methods in Instagram's smali code
2. The patches inject smali code that checks the corresponding static boolean flag in GhostModeManager
3. If the flag is true, the method returns early, preventing the tracking/notification behavior
4. Example injected code:
   ```smali
   # Ghost Mode check
   sget-boolean v0, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeen:Z
   if-eqz v0, :ghost_mode_off
   return-void
   :ghost_mode_off
   ```

### Runtime Behavior
1. On app initialization, GhostModeManager.loadFlags() should be called to load settings from SharedPreferences
2. User can enable/disable individual ghost features through the app UI
3. Quick toggle functionality allows rapid enable/disable of selected features
4. All changes are persisted to SharedPreferences via GhostModeManager.saveFlags()

## Usage

### For Users
1. Enable ghost features through the Instafel settings UI
2. Select which features to include in quick toggle
3. Use quick toggle to rapidly enable/disable ghost mode
4. Individual features can be toggled independently

### For Developers

#### Applying Patches
```bash
# Apply individual patches
./patcher run <wdir> ghost_seen
./patcher run <wdir> ghost_typing
./patcher run <wdir> ghost_screenshot

# Apply all ghost mode patches
./patcher run <wdir> ghost_mode
```

#### Integrating with App Initialization
The GhostModeManager needs to be initialized when the app starts:

```java
// In app initialization code
PreferenceManager prefManager = new PreferenceManager(context);
GhostModeManager.loadFlags(prefManager);
```

#### Toggling Ghost Mode
```java
// Toggle selected ghost features
GhostModeManager.toggleSelectedGhostOptions(context, prefManager);

// Check if any ghost mode is active
boolean isActive = GhostModeManager.isAnyGhostModeActive();
```

## Implementation Details

### Design Decisions
1. **Static Fields**: Used static public fields instead of instance methods to make them easily accessible from smali code without requiring object instantiation
2. **Modular Patches**: Each ghost feature is a separate patch, allowing users to apply only the features they want
3. **Search-based Patching**: Uses string searching instead of hardcoded class names to be more resilient to Instagram updates
4. **Early Returns**: Patches inject early return statements to minimize impact on Instagram's code flow

### Based On
This implementation is based on the InstaEclipse project by ReSo7200:
- Repository: https://github.com/ReSo7200/InstaEclipse
- Key files analyzed:
  - `app/src/main/java/ps/reso/instaeclipse/utils/ghost/GhostModeUtils.java`
  - `app/src/main/java/ps/reso/instaeclipse/utils/feature/FeatureFlags.java`
  - `app/src/main/java/ps/reso/instaeclipse/mods/ghost/SeenState.java`
  - `app/src/main/java/ps/reso/instaeclipse/mods/ghost/TypingStatus.java`
  - `app/src/main/java/ps/reso/instaeclipse/mods/ghost/ScreenshotDetection.java`

## Future Enhancements

Potential additions:
1. Ghost View Once - Prevent tracking of ephemeral media views
2. Ghost Story - Prevent story view tracking
3. Ghost Live - Prevent live video view tracking
4. UI components for easy toggling
5. Visual indicator (ghost emoji) when ghost mode is active
6. Per-chat ghost mode settings

## Testing

To verify the implementation:
1. Build the patcher: `./gradlew :patcher:build`
2. Build patcher-core: `./gradlew :patcher-core:build`
3. Verify patches compile without errors
4. Test patch application on a sample Instagram APK
5. Verify runtime behavior by checking if tracking is actually prevented

## Notes

- The patches search for specific strings in Instagram's code, so they may need updates when Instagram changes their implementation
- Ghost mode features may violate Instagram's Terms of Service - use at your own risk
- The implementation focuses on the core ghost features; UI integration is left for future work
