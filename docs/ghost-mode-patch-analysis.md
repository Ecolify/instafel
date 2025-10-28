# Ghost Mode Patch Analysis and Fix

## Network Interceptor Patch Fix (2025-10-28)

### Issue Summary

The Network Interceptor patch was failing with the error:

```
Network Interceptor
Intercept network requests for ghost mode features
I: Loading tasks..
I: 2 task loaded
I: Executing tasks...
I: Execute: Find TigonServiceLayer class
I: Totally 133529 file got listed in X folder(s)
S: No files found for apply patch.
I: Search process ran with 4 threads in 4.879s totally (133529 file processed)
I: FAILURE: Patch aborted: TigonServiceLayer class not found
```

### Root Cause Analysis

**Incorrect Search Strategy:**
- The original implementation used `SearchUtils.getFileContainsAllCords()` which only searches in "X" folders (obfuscated classes)
- Search pattern: `.class` + `TigonServiceLayer` + `startRequest`
- This approach works for obfuscated classes like `X/4lp.smali`, `X/84f.smali`, etc.

**Actual Class Location:**
- `TigonServiceLayer` is NOT an obfuscated class
- Location: `com/instagram/api/tigon/TigonServiceLayer.smali`
- This is a non-obfuscated Instagram API class with a stable name

**InstaEclipse Reference:**
From `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`:
```java
// Locate the TigonServiceLayer class dynamically
Class<?> tigonClass = classLoader.loadClass("com.instagram.api.tigon.TigonServiceLayer");
```

### Solution Implemented

#### 1. New Search Method for Non-Obfuscated Classes

Added `SearchUtils.findFileByClassPath()` method:

```kotlin
fun findFileByClassPath(
    smaliUtils: SmaliUtils,
    classPath: String
): FileSearchResult {
    val fileName = "$classPath.smali"
    val foundFiles = mutableListOf<File>()

    // Search in all smali folders
    for (smaliFolder in smaliUtils.smaliFolders) {
        val targetFile = File(smaliFolder, fileName)
        if (targetFile.exists() && targetFile.isFile) {
            foundFiles.add(targetFile)
        }
    }

    return when {
        foundFiles.isEmpty() -> FileSearchResult.NotFound(0)
        foundFiles.size == 1 -> FileSearchResult.Success(foundFiles[0])
        else -> FileSearchResult.MultipleFound(foundFiles)
    }
}
```

**Why this works:**
- Searches all smali folders (smali, smali_classes2, smali_classes3, etc.)
- Uses direct file system lookup instead of content scanning
- Much faster and more reliable for non-obfuscated classes

#### 2. Updated NetworkInterceptor.kt

**Before:**
```kotlin
val searchPattern = listOf(
    listOf(".class", "TigonServiceLayer"),
    listOf("startRequest")
)

when (val result = runBlocking {
    SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
}) {
    // ... complex filtering logic
}
```

**After:**
```kotlin
val classPath = "com/instagram/api/tigon/TigonServiceLayer"

when (val result = SearchUtils.findFileByClassPath(smaliUtils, classPath)) {
    is FileSearchResult.Success -> {
        tigonServiceLayerFile = result.file
        
        // Verify the file contains the startRequest method
        val content = smaliUtils.getSmaliFileContent(tigonServiceLayerFile.absolutePath)
        val hasStartRequest = content.any { line ->
            line.contains(".method") && line.contains("startRequest")
        }
        
        if (hasStartRequest) {
            success("TigonServiceLayer class found with startRequest method")
        } else {
            failure("TigonServiceLayer found but does not contain startRequest method")
        }
    }
    is FileSearchResult.NotFound -> {
        failure("Patch aborted: TigonServiceLayer class not found at path $classPath")
    }
    // ...
}
```

**Benefits:**
- Direct path lookup (no need to scan 133,529 files)
- Removed unnecessary `runBlocking` coroutine wrapper
- Clearer and more maintainable code
- Verification that `startRequest` method exists

### Expected Behavior

The patch should now:
1. ✅ Quickly find `TigonServiceLayer.smali` at `com/instagram/api/tigon/TigonServiceLayer`
2. ✅ Verify the class contains the `startRequest` method
3. ✅ Inject the network interceptor code at the beginning of `startRequest`
4. ✅ Block ghost mode requests by redirecting them to localhost

### Key Differences: Obfuscated vs Non-Obfuscated Classes

| Aspect | Obfuscated (e.g., Ghost Story) | Non-Obfuscated (Network Interceptor) |
|--------|-------------------------------|-------------------------------------|
| Class Name | Random (e.g., `X/84f.smali`) | Stable (e.g., `com/instagram/api/tigon/TigonServiceLayer.smali`) |
| Location | X folders only | Package structure folders |
| Search Method | `getFileContainsAllCords()` + pattern matching | `findFileByClassPath()` + direct lookup |
| Search Time | Slow (scans all X files) | Fast (direct file check) |
| Reliability | Needs filtering logic | Direct and reliable |

### Testing Recommendations

To test this fix:
1. Run the patcher with Instagram APK decompiled
2. Verify that TigonServiceLayer class is found
3. Check that the patch is applied to the correct method
4. Test that ghost mode features work correctly

---

## Ghost Story Patch Fix (Previous)

### Issue Summary

The Ghost Story patch was finding multiple candidate files during the search process, causing the patch to fail with the error:

```
S: Found more files than one (2) for apply patch, add more condition for find correct file.
I: FAILURE: Patch aborted: Found 2 candidate files after filtering: [4lp.smali, 6RT.smali]
```

## Root Cause Analysis

The original search pattern was too broad:
- Search pattern: `listOf("media/seen/")` and `listOf("invoke-")`
- Filtering: Only checked line count range (50-2000 lines)

This resulted in:
1. Finding files that may not contain the exact "media/seen/" endpoint
2. Including files with format strings like "media/seen/?reel=%s&live_vod=0"
3. Not verifying the correct method signature

## Solution

### 1. InstaEclipse Reference

Analyzed `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/ghost/StorySeen.java`:

InstaEclipse searches for methods containing "media/seen/" with:
- Modifier: `final`
- Return type: `void`
- Parameters: 0 (signature: `()V`)

### 2. Instagram Smali Analysis

Found two files containing "media/seen/":

| File | Lines | Pattern | Method Signature | Verdict |
|------|-------|---------|------------------|---------|
| `smali_classes2/X/1b4.smali` | 1598 | `"media/seen/?reel=%s&live_vod=0"` | `.method public final A00(Lcom/instagram/common/session/UserSession;)LX/5sQ;` | ❌ FAIL |
| `smali_classes5/X/84f.smali` | 364 | `"media/seen/"` | `.method public final A00()V` | ✅ PASS |

**Correct target:** `84f.smali`
- Line 97: `const-string v12, "media/seen/"` (exact match, no format params)
- Line 65: `.method public final A00()V` (final void with 0 params)
- 364 lines (within 100-1000 range)

### 3. Improved Filtering Logic

**Updated Search Pattern:**
```kotlin
val searchPattern = listOf(
    listOf("const-string", "\"media/seen/\""),  // Exact match
    listOf(".method")  // Must have methods
)
```

**Enhanced Filtering Criteria:**
1. **Line count range:** 100-1000 (narrowed from 50-2000)
2. **Exact string match:** Must have `"media/seen/"` without `?` character
3. **Method signature:** Must have `final` + `()V` (void with 0 params)

## Patch Application Logic

The patch correctly identifies and modifies the target method:

1. **Find const-string line** (line 97): `const-string v12, "media/seen/"`
2. **Search backward for method** (line 65): `.method public final A00()V`
3. **Verify method signature:** `final` + `()V` ✓
4. **Find .locals line** (line 66): `.locals 17`
5. **Insert patch at line 67** (after .locals)

**Patch content inserted:**
```smali
# Ghost Story - Block story seen tracking
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostStoryEnabled()Z
move-result v0
if-eqz v0, :ghost_story_continue
return-void
:ghost_story_continue
```

## Testing Results

### Filtering Test Results

```
--- 1b4.smali ---
  Lines: 1598
  ✗ No exact 'media/seen/' (has format params: "media/seen/?reel=%s&live_vod=0")
  ✓ Has final void method with 0 params
  ✗ Line count out of range [100-1000]
  ❌ VERDICT: FAIL - This file should be filtered out

--- 84f.smali ---
  Lines: 364
  ✓ Has exact 'media/seen/' without format params
  ✓ Has final void method with 0 params  
  ✓ Line count in range [100-1000]
  ✅ VERDICT: PASS - This file should be selected
```

### Patch Application Test Results

```
✅ Patch application logic verified successfully
   - Correct method identified at line 65
   - .locals found at line 66
   - Patch will be inserted at line 67
```

## Changes Made

### File: `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostStory.kt`

1. **Updated line count constants:**
   - `MIN_IMPLEMENTATION_LINES`: 50 → 100
   - `MAX_IMPLEMENTATION_LINES`: 2000 → 1000

2. **Improved search pattern:**
   - Changed to search for exact `const-string` with `"media/seen/"`
   - Added `.method` requirement

3. **Enhanced filtering logic:**
   - Check for exact "media/seen/" without format parameters (exclude `?`)
   - Verify presence of final void method with 0 parameters
   - More robust candidate selection

## Conclusion

The Ghost Story patch has been successfully fixed to:
- ✅ Correctly identify the target smali file (84f.smali)
- ✅ Filter out files with format strings or incorrect signatures
- ✅ Apply the patch at the correct location in the method
- ✅ Match the InstaEclipse implementation approach

The patch is now more robust and automatic, properly handling the Instagram smali structure and avoiding multiple candidate errors.

## Build Status

✅ Code compiles successfully with Gradle
✅ Filtering logic validated against actual smali files
✅ Patch application logic verified

---

**Date:** 2025-10-28  
**Issue:** Analizar y corregir parches Ghost Mode en Instafel
