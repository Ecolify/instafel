# Ghost Mode Implementation in Instafel

## Overview

Ghost Mode is a privacy feature that allows users to browse Instagram without sending tracking signals like read receipts, typing indicators, screenshot notifications, and story view tracking.

This implementation is based on the ghost mode features from [InstaEclipse](https://github.com/ReSo7200/InstaEclipse.git).

## Architecture Comparison

### InstaEclipse Architecture
- **Runtime Hooking**: Uses Xposed Framework with DexKit
- **Method**: Hooks Instagram methods at runtime to block tracking calls
- **Components**:
  - `GhostModeUtils.java`: Main utility class for toggling ghost features
  - Individual modules for each feature (SeenState, TypingStatus, ScreenshotDetection, etc.)
  - Uses `FeatureFlags` class to store state
  - Integrates with Instagram UI via UIHookManager

### Instafel Architecture
- **Patching System**: APK patching tool with UI for managing settings
- **Method**: Provides preference management and UI components
- **Components**:
  - `GhostModeManager.java`: Main manager class for ghost mode features
  - `PreferenceKeys.java`: Preference key definitions
  - `PreferenceManager.java`: Preference storage system

## Ghost Mode Features

### 1. Ghost Seen (DM Read Receipts)
**InstaEclipse Implementation:**
- Hooks methods containing `"mark_thread_seen-"` string
- Matches: `static final void method(?, ?, ?, ...)`
- Blocks execution when `isGhostSeen` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_seen`
- Quick toggle key: `ifl_quick_toggle_seen`
- Stores boolean state in SharedPreferences

### 2. Ghost Typing (Typing Indicators)
**InstaEclipse Implementation:**
- Hooks methods containing `"is_typing_indicator_enabled"` string
- Matches: `static final void method(ClassType, boolean)`
- Blocks typing status pings when `isGhostTyping` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_typing`
- Quick toggle key: `ifl_quick_toggle_typing`

### 3. Ghost Screenshot (Screenshot Notifications)
**InstaEclipse Implementation:**
- Finds class containing `"ScreenshotNotificationManager"`
- Hooks: `void method(long)`
- Blocks screenshot notifications when `isGhostScreenshot` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_screenshot`
- Quick toggle key: `ifl_quick_toggle_screenshot`

### 4. Ghost ViewOnce (View Once Message Tracking)
**InstaEclipse Implementation:**
- Hooks methods containing `"visual_item_seen"` string
- Matches: `(?,?,AbstractClassType) -> void`
- Blocks view once tracking when `isGhostViewOnce` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_view_once`
- Quick toggle key: `ifl_quick_toggle_view_once`

### 5. Ghost Story (Story View Tracking)
**InstaEclipse Implementation:**
- Hooks methods containing `"media/seen/"` string
- Matches: `final void method()` with no parameters
- Blocks story view tracking when `isGhostStory` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_story`
- Quick toggle key: `ifl_quick_toggle_story`

### 6. Ghost Live (Live Video View Tracking)
**InstaEclipse Implementation:**
- Similar hooking mechanism for live video tracking
- Blocks when `isGhostLive` is true

**Instafel Implementation:**
- Preference key: `ifl_ghost_live`
- Quick toggle key: `ifl_quick_toggle_live`

## Key Differences

1. **Execution Model**:
   - InstaEclipse: Runtime hooking via Xposed (modifies Instagram behavior in memory)
   - Instafel: Preference storage (requires separate patching/hooking implementation)

2. **State Management**:
   - InstaEclipse: Static fields in `FeatureFlags` class
   - Instafel: SharedPreferences via `PreferenceManager`

3. **UI Integration**:
   - InstaEclipse: Injects UI elements into Instagram's interface
   - Instafel: Standalone app with its own UI

4. **Quick Toggle**:
   - InstaEclipse: Toggle button in Instagram's inbox
   - Instafel: Can be implemented in Instafel's settings UI

## Implementation Notes

### Files Modified
1. `app/src/main/java/instafel/app/utils/types/PreferenceKeys.java`
   - Added 13 new preference keys for ghost mode settings

2. `app/src/main/java/instafel/app/utils/ghost/GhostModeManager.java` (NEW)
   - Main manager class for ghost mode functionality
   - Provides methods to check and toggle ghost features
   - Convenience methods for each individual feature

### Files to Create (Future Work)
1. UI components for ghost mode settings
2. Integration with existing Instafel settings screens
3. Localization strings for ghost mode features
4. Patcher-core patches for actual hooking logic (if implementing as Xposed module)

## Usage Example

```java
// Create manager
GhostModeManager ghostManager = new GhostModeManager(context);

// Enable ghost seen (read receipts)
ghostManager.setGhostSeen(true);
ghostManager.setQuickToggle(PreferenceKeys.ifl_quick_toggle_seen, true);

// Check if ghost mode is active
boolean isActive = ghostManager.isGhostModeActive();

// Toggle all selected features
ghostManager.toggleSelectedGhostOptions();
```

## Next Steps for Full Implementation

1. **Create UI Components**:
   - Settings screen for ghost mode configuration
   - Individual toggles for each feature
   - Quick toggle button (optional)

2. **Add Localization**:
   - English strings for all ghost mode features
   - Spanish translations (as requested in issue)

3. **Implement Hooking Logic** (if creating Xposed module):
   - Create patcher-core patches based on InstaEclipse's hooks
   - Use DexKit to find Instagram methods
   - Hook methods to block tracking calls

4. **Testing**:
   - Unit tests for GhostModeManager
   - Integration tests for preference storage
   - Manual testing of each ghost feature

## Technical Considerations

### Maintenance
- Instagram updates may break hooks (similar to InstaEclipse)
- DexKit signatures may need updates
- String literals used for hooking may change

### Performance
- Minimal impact on Instafel app (just preference storage)
- Runtime hooking (if implemented) has negligible performance impact

### Privacy
- All preferences stored locally in SharedPreferences
- No data sent to external servers
- User has full control over each feature

## References

- [InstaEclipse Repository](https://github.com/ReSo7200/InstaEclipse.git)
- InstaEclipse Ghost Mode Files:
  - `utils/ghost/GhostModeUtils.java`
  - `mods/ghost/SeenState.java`
  - `mods/ghost/TypingStatus.java`
  - `mods/ghost/ScreenshotDetection.java`
  - `mods/ghost/ViewOnce.java`
  - `mods/ghost/StorySeen.java`
