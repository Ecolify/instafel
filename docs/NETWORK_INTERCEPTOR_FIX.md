# Network Interceptor Patch Fix

## Overview
This document describes the fix applied to the Ghost Mode Network Interceptor patch that was failing with "No files found for apply patch" error.

## Problem Description

### Error Message
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

### Root Cause
The patch was searching only in the `X/` subdirectories of smali folders, which contain obfuscated classes. However, `TigonServiceLayer` is **not obfuscated** and is located at:
```
smali/com/instagram/api/tigon/TigonServiceLayer.smali
```

This class is part of Instagram's public API and follows the standard Java package structure, unlike the obfuscated classes in the `X/` folders that have names like `3ww.smali`, `3xq.smali`, etc.

## Solution

### Changes Made

#### 1. SearchUtils.kt - New Search Methods
Added two new methods to support searching in all smali folders:

```kotlin
/**
 * Get all smali files from all smali folders (not just X directory)
 * Use this for non-obfuscated classes like com/instagram/api/tigon/TigonServiceLayer
 */
fun getAllSmaliFilesIterators(smaliFolders: Array<File>): List<Collection<File>>

/**
 * Search for files in all smali folders (not just X directory)
 * Use this for non-obfuscated classes that are not in the X (obfuscated) directory
 */
suspend fun getFileContainsAllCordsInAllFolders(
    smaliUtils: SmaliUtils,
    searchConditions: List<List<String>>
): FileSearchResult
```

#### 2. NetworkInterceptor.kt - Updated Search Pattern
Changed from:
```kotlin
val searchPattern = listOf(
    listOf(".class", "TigonServiceLayer"),
    listOf("startRequest")
)
SearchUtils.getFileContainsAllCords(smaliUtils, searchPattern)
```

To:
```kotlin
val searchPattern = listOf(
    listOf(".class", "Lcom/instagram/api/tigon/TigonServiceLayer;"),
    listOf(".method", "startRequest")
)
SearchUtils.getFileContainsAllCordsInAllFolders(smaliUtils, searchPattern)
```

### Key Improvements
1. **Comprehensive Search**: Now searches all ~150,000 smali files instead of just the ~133,000 in X folders
2. **Precise Matching**: Uses exact class path `Lcom/instagram/api/tigon/TigonServiceLayer;` to avoid false matches
3. **Backward Compatibility**: Existing patches continue to use X folder search for obfuscated classes

## Technical Background

### Instagram APK Structure
Instagram APKs contain multiple smali folders:
- `smali/` - Main dex with non-obfuscated public APIs
- `smali_classes2/` through `smali_classes17/` - Additional dex files
- `X/` subdirectories - Obfuscated internal classes

### TigonServiceLayer
TigonServiceLayer is part of Instagram's networking layer based on Facebook's Tigon HTTP client. It's located in the public API namespace `com.instagram.api.tigon` and is not obfuscated because it's part of the Facebook SDK integration.

The method signature found:
```smali
.method public startRequest(LX/3ww;LX/3xq;LX/3yx;)LX/4lc;
```

Even though the parameter types (LX/3ww, etc.) are obfuscated, the class itself and method name remain unobfuscated.

### InstaEclipse Reference
InstaEclipse uses Xposed to hook this method at runtime:
```java
Class<?> tigonClass = classLoader.loadClass("com.instagram.api.tigon.TigonServiceLayer");
XposedHelpers.findAndHookMethod("com.instagram.api.tigon.TigonServiceLayer", 
    classLoader, "startRequest", ...);
```

Our patch injects bytecode directly into the smali file to achieve similar functionality without requiring Xposed.

## Testing

### Verification Steps
1. ✅ Build patcher-core module successfully
2. ✅ Confirm TigonServiceLayer.smali exists at expected location
3. ✅ Verify file contains exact class declaration
4. ✅ Verify file contains startRequest method
5. ✅ No security vulnerabilities (CodeQL)

### Expected Behavior After Fix
When the patch runs, it should:
1. Search all smali folders (not just X)
2. Find exactly one file matching the pattern
3. Successfully inject the network interceptor code
4. Log: "TigonServiceLayer class found successfully: TigonServiceLayer.smali"

## Future Improvements
- Consider refactoring search methods to reduce code duplication
- Add automated tests for patch application
- Document other non-obfuscated classes that may need similar fixes

## References
- InstaEclipse Interceptor: `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- Instagram smali: `instagram/smali/com/instagram/api/tigon/TigonServiceLayer.smali`
- Issue: #[issue_number] - "Fux" (Ghost Mode patch error)
