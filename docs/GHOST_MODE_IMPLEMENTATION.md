# Ghost Mode Implementation Documentation

## Overview

Ghost Mode is a comprehensive privacy feature set in Instafel that allows users to browse Instagram anonymously by blocking various tracking mechanisms. This implementation is based on and inspired by InstaEclipse.

## Architecture

### Components

1. **GhostModeManager** (`app/src/main/java/instafel/app/utils/ghost/GhostModeManager.java`)
   - Central management for all Ghost Mode features
   - Static fields accessible from smali patches
   - Preference persistence
   - Quick toggle functionality

2. **Ghost Mode Patches** (`patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/`)
   - Smali code injection patches
   - Each patch targets specific Instagram functionality
   - Implements early-return pattern to block tracking

3. **GhostEmojiManager** (`app/src/main/java/instafel/app/utils/ghost/GhostEmojiManager.java`)
   - Visual indicator (👻) in Instagram UI
   - Shows when Ghost Mode is active
   - Integrates with Instagram's action bar

4. **Interceptor** (`app/src/main/java/instafel/app/mods/network/Interceptor.java`)
   - Reference implementation for network-level blocking
   - Documents URI patterns for each feature
   - Future Xposed integration support

## Ghost Mode Features

### 1. Ghost Seen
**Purpose**: Hide read receipts in Direct Messages

**Implementation**:
- **Patch**: `GhostSeen.kt`
- **Search String**: `"mark_thread_seen-"`
- **Target Method**: `static final void method(?, ?, ?, ...)` with ≥3 parameters
- **Action**: Early return when `GhostModeManager.isGhostSeenEnabled()` is true
- **InstaEclipse Reference**: `SeenState.java`

**Technical Details**:
```smali
# Injected at method start (after .locals)
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostSeenEnabled()Z
move-result v0
if-eqz v0, :ghost_seen_continue
return-void
:ghost_seen_continue
# Original method code continues...
```

### 2. Ghost Typing
**Purpose**: Hide typing indicator in Direct Messages

**Implementation**:
- **Patch**: `GhostTyping.kt`
- **Search String**: `"is_typing_indicator_enabled"`
- **Target Method**: `static final void method(?, boolean)` - exactly 2 parameters
- **Action**: Early return when `GhostModeManager.isGhostTypingEnabled()` is true
- **InstaEclipse Reference**: `TypingStatus.java`

### 3. Ghost Screenshot
**Purpose**: Prevent screenshot detection notifications

**Implementation**:
- **Patch**: `GhostScreenshot.kt`
- **Search String**: `"ScreenshotNotificationManager"`
- **Target Method**: `void method(long)` - single long parameter
- **Action**: Early return when `GhostModeManager.isGhostScreenshotEnabled()` is true
- **Network URIs Blocked**: `/screenshot/`, `/ephemeral_screenshot/`
- **InstaEclipse Reference**: `ScreenshotDetection.java`

### 4. Ghost ViewOnce
**Purpose**: View once messages without marking as seen

**Implementation**:
- **Patch**: `GhostViewOnce.kt`
- **Search String**: `"visual_item_seen"`
- **Target Method**: `void method(?, ?, ?)` - exactly 3 parameters
- **Action**: Early return when `GhostModeManager.isGhostViewOnceEnabled()` is true
- **Network URIs Blocked**: `/item_replayed/`, `/direct/.../item_seen/`
- **InstaEclipse Reference**: `ViewOnce.java`

**Notes**: InstaEclipse uses runtime parameter inspection to verify the third parameter contains "visual_item_seen" or "send_visual_item_seen_marker". Instafel's smali approach blocks earlier in the call chain.

### 5. Ghost Story
**Purpose**: View stories anonymously

**Implementation**:
- **Patch**: `GhostStory.kt`
- **Search String**: `"media/seen/"` (exact match, no format strings)
- **Target Method**: `final void method()` - no parameters
- **Action**: Early return when `GhostModeManager.isGhostStoryEnabled()` is true
- **Network URIs Blocked**: `/api/v2/media/seen/`
- **InstaEclipse Reference**: `StorySeen.java`

### 6. Ghost Live
**Purpose**: Watch live videos anonymously

**Implementation**:
- **Patch**: `GhostLive.kt`
- **Search String**: `"live_viewer_invite"`
- **Target Method**: `static/final method` containing the search string
- **Action**: Early return when `GhostModeManager.isGhostLiveEnabled()` is true
- **Network URIs Blocked**: `/heartbeat_and_get_viewer_count/`
- **InstaEclipse Reference**: Network interceptor only (no dedicated patch)

**Notes**: This patch was developed through reverse engineering as InstaEclipse primarily uses network-level blocking for live viewer tracking.

## Patch Application Process

### Search and Filter Strategy

Each patch follows a multi-stage filtering approach to handle Instagram's complex code structure:

1. **Initial Search**: Find all files containing the target string
2. **Size Filtering**: Filter by file size (typically 50-2000 lines for implementation files)
3. **Signature Matching**: Verify method signature matches InstaEclipse specification
4. **Selection**: Take first matching candidate if multiple exist (matches InstaEclipse behavior)

### Example: GhostSeen Patch Flow

```kotlin
// Stage 1: Find files with "mark_thread_seen-"
searchPattern = ["mark_thread_seen-", "invoke-"]

// Stage 2: Filter by size (50-2000 lines)
candidates = files.filter { lineCount in 50..2000 }

// Stage 3: Verify method signature
candidates = candidates.filter {
    hasMethod("static final void") with paramCount >= 3
}

// Stage 4: Select first candidate
selectedFile = candidates.first()
```

### Injection Pattern

All Ghost Mode patches follow this consistent pattern:

1. Find target method in selected file
2. Locate `.locals` directive (or use method start)
3. Inject check after `.locals`:
   ```smali
   invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostXxxEnabled()Z
   move-result v0
   if-eqz v0, :continue_label
   return-void
   :continue_label
   ```
4. Original method code continues

## Preference Management

### Preference Keys

Defined in `PreferenceKeys.java`:

```java
// Main enable flags
ifl_ghost_mode_enabled = "34"
ifl_ghost_seen = "35"
ifl_ghost_typing = "36"
ifl_ghost_screenshot = "37"
ifl_ghost_view_once = "38"
ifl_ghost_story = "39"
ifl_ghost_live = "40"

// Quick toggle flags
ifl_quick_toggle_seen = "41"
ifl_quick_toggle_typing = "42"
ifl_quick_toggle_screenshot = "43"
ifl_quick_toggle_view_once = "44"
ifl_quick_toggle_story = "45"
ifl_quick_toggle_live = "46"
```

### Quick Toggle Logic

The quick toggle feature allows users to rapidly enable/disable selected Ghost Mode features:

1. User selects which features should be quick-toggleable
2. When toggling:
   - If all selected features are enabled → disable all
   - If any selected feature is disabled → enable all
3. Provides "all or nothing" toggle behavior

## Network-Level Blocking Reference

While Instafel uses smali patching, InstaEclipse also implements network-level blocking via the TigonServiceLayer interceptor. This approach is documented in `Interceptor.java` for reference.

### URI Patterns Blocked

| Feature | URI Pattern |
|---------|------------|
| Ghost Screenshot | `/screenshot/`, `/ephemeral_screenshot/` |
| Ghost ViewOnce | `/item_replayed/`, `/direct/.../item_seen/` |
| Ghost Story | `/api/v2/media/seen/` |
| Ghost Live | `/heartbeat_and_get_viewer_count/` |

### How InstaEclipse Intercepts

1. Find `TigonServiceLayer.startRequest(?, ?, ?)` method
2. Extract URI from first parameter
3. Check URI path against feature flags
4. If blocked, replace URI with `https://127.0.0.1/404`

## UI Integration

### Ghost Emoji Indicator

`GhostEmojiManager` provides visual feedback when Ghost Mode is active:

1. Searches for inbox button using resource IDs:
   - `action_bar_inbox_button`
   - `direct_tab`
2. Creates TextView with ghost emoji (👻)
3. Adds it next to inbox button
4. Shows/hides based on Ghost Mode status

### Integration Points

UI integration should:
1. Call `GhostModeManager.loadFlags()` on app start
2. Call `GhostEmojiManager.addGhostEmojiNextToInbox()` when showing main activity
3. Update emoji visibility when Ghost Mode settings change

## Differences from InstaEclipse

### Implementation Approach

| Aspect | InstaEclipse | Instafel |
|--------|-------------|----------|
| Hooking | Xposed runtime hooks | Smali patching |
| Method Finding | DexKit at runtime | Static analysis during build |
| Network Blocking | TigonServiceLayer hook | Method-level blocking |
| Distribution | Requires Xposed | Standalone APK |

### Patch Behavior

- **InstaEclipse**: Hooks first matching method at runtime, returns null to block
- **Instafel**: Injects return-void at compile time in first matching method

Both approaches achieve the same result but through different mechanisms.

## Testing Recommendations

To verify Ghost Mode patches are working:

1. **Ghost Seen**: Send a DM, verify no read receipt shows
2. **Ghost Typing**: Type in DM, verify no typing indicator shows
3. **Ghost Screenshot**: Take screenshot of DM/Story, verify no notification sent
4. **Ghost ViewOnce**: View once message, verify can view multiple times
5. **Ghost Story**: View story, verify not in viewer list
6. **Ghost Live**: Join live video, verify not in viewer count

## Troubleshooting

### Multiple Candidates Error

If patches fail with "Found X candidate files":
1. Check Instagram version compatibility
2. Verify search strings match current Instagram code
3. Review Instagram smali structure changes
4. May need to add more specific filtering criteria

### Patch Not Applied

If a feature doesn't work:
1. Verify patch was successfully applied during build
2. Check smali syntax in injected code
3. Ensure GhostModeManager method names match exactly
4. Verify feature flag is enabled in preferences

### UI Integration Issues

If ghost emoji doesn't appear:
1. Check resource ID resolution for inbox button
2. Verify Instagram UI structure hasn't changed
3. Check Activity lifecycle integration
4. Review exception handling in GhostEmojiManager

## Future Enhancements

Potential improvements:

1. **Dynamic Method Resolution**: Like InstaEclipse, use runtime analysis
2. **Network Interceptor**: Implement TigonServiceLayer hook for additional safety
3. **Auto-Update Signatures**: Fetch method signatures from server
4. **Enhanced Logging**: Debug mode to verify patches are executing
5. **Configuration UI**: Per-feature enable/disable in settings

## References

- InstaEclipse Ghost Mode: `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/ghost/`
- InstaEclipse Interceptor: `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- Smali Documentation: https://github.com/JesusFreke/smali/wiki
- Instagram APK Analysis: Use apktool to decompile and analyze structure

## Maintainers

This implementation was created based on InstaEclipse's approach and adapted for Instafel's smali patching architecture.

For issues or improvements, please reference both the Instafel patches and InstaEclipse implementations to ensure compatibility.
