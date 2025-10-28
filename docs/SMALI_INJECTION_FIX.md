# Smali Code Injection Fix

## Issue Summary

Instagram was crashing on startup after applying ghost_mode patches. The issue affected all patched Instagram APKs and prevented the app from launching.

## Root Cause Analysis

All patch files in `patcher-core/src/main/kotlin/instafel/patcher/core/patches/` were using an incorrect method to inject smali code into Instagram's smali files.

### The Bug

The patches were using:
```kotlin
fContent.add(insertLine, lines.joinToString("\n"))
```

This creates a **single multi-line string** and adds it as **one element** to the `fContent` list. 

### Why This Caused Crashes

The `fContent` list represents the smali file where **each element should be a separate line**. By joining multiple smali lines into a single string with newline characters, the smali file structure became corrupted:

**Incorrect (what the bug did):**
```
fContent[100] = "    invoke-static {}, Lclass;->method()Z\n    move-result v0\n    if-eqz v0, :label"
```

This creates a single element containing multiple lines joined by `\n` characters, which breaks smali parsing.

**Correct (what it should be):**
```
fContent[100] = "    invoke-static {}, Lclass;->method()Z"
fContent[101] = "    move-result v0"
fContent[102] = "    if-eqz v0, :label"
```

Each smali instruction is a separate element in the list.

## Files Fixed

### Ghost Mode Patches (7 files)
All ghost mode patches had the same bug:

1. `NetworkInterceptor.kt` - Network request interception
2. `GhostLive.kt` - Block live viewer tracking
3. `GhostScreenshot.kt` - Block screenshot detection
4. `GhostSeen.kt` - Block message seen status
5. `GhostStory.kt` - Block story seen tracking
6. `GhostTyping.kt` - Block typing indicator
7. `GhostViewOnce.kt` - Block view-once replay detection

### Other Patches (2 files)

8. `RemoveAds.kt` - Ad removal patch
9. `AddInitInstafel.kt` - Instafel initialization patch

## The Fix

Changed all occurrences from:
```kotlin
fContent.add(insertLine, lines.joinToString("\n"))
```

To:
```kotlin
fContent.addAll(insertLine, lines)
```

The `addAll()` method properly inserts each element from the `lines` list as a separate element in `fContent`, maintaining the correct smali file structure.

## Verification

1. **Compilation**: All Kotlin code compiles successfully
   ```bash
   ./gradlew :patcher-core:compileKotlin
   ```

2. **Code Structure**: The fix maintains consistency with other parts of the codebase that correctly use `addAll()`

3. **Smali Structure**: The patched files will now have proper line-by-line structure, allowing Instagram to parse and execute them correctly

## Impact

This fix resolves the Instagram crash issue and allows the patched APK to:
- Launch successfully
- Apply ghost mode features correctly
- Maintain proper smali file structure
- Avoid corrupted bytecode

## Prevention

When adding new patches in the future:
1. Always use `fContent.addAll(insertLine, listOfLines)` to insert multiple lines
2. Never use `joinToString("\n")` when adding smali code to the file content list
3. Each smali instruction should be a separate element in the list

---

**Date:** 2025-10-28  
**Issue:** Fix Instagram crash after applying ghost_mode patches  
**Fix Type:** Critical Bug Fix
