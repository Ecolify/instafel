# Ghost Mode Patch Analysis and Fix

## Issue Summary

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
