# Ghost ViewOnce Patch Fix - Technical Documentation

## Problem Statement

The Ghost ViewOnce patch was failing with the following error:

```
I: Found a file, 'smali/X/5zl.smali' by T0
I: Found a file, 'smali/X/000.smali' by T0
I: Found a file, 'smali/X/6gx.smali' by T0
S: Found more files than one (or no any file found) for apply patch
I: FAILURE: Patch aborted because no classes found for ghost viewonce. Found 3 candidate files.
```

The original implementation searched for files containing both `visual_item_seen` and `send_visual_item_seen_marker` strings, but this approach found multiple files without a way to distinguish the correct target.

## Analysis of Instagram's Decompiled Code

### File Analysis

After analyzing the decompiled Instagram smali code, we identified the following files:

1. **000.smali** (11,818 lines)
   - String constants definition class
   - Contains only `const-string` declarations
   - Not executable code - just a lookup table
   - Example: `const-string/jumbo p0, "send_visual_item_seen_marker"`

2. **5zl.smali** (124 lines)
   - Small utility class
   - Does not contain the target functionality

3. **6gx.smali** (554 lines)
   - Another utility class
   - Does not contain the target functionality

4. **5nb.smali** (149 lines)
   - Data class extending `LX/5mu`
   - Implements `LX/5lz` interface
   - Method `A03()` returns `"send_visual_item_seen_marker"` string
   - Not the execution point - just a data holder

5. **5nc.smali** (264 lines) ✅ **TARGET FILE**
   - Implementation class implementing `LX/5fh` interface
   - Contains method `Fe3(LX/2vp;LX/Qff;LX/5eh;)V` at line 88
   - This method:
     - Takes a parameter of type `LX/5nb` (cast at line 92)
     - Contains `const-string/jumbo v4, "visual_item_seen"` (line 200)
     - Calls `LX/KHI;->A00(...)` to send the marker to Instagram servers (line 234)
   - **This is the method that needs to be patched**

## InstaEclipse Reference Implementation

InstaEclipse uses a different approach with Xposed framework:

```java
// InstaEclipse approach (ps.reso.instaeclipse.mods.ghost.ViewOnce)
public void handleViewOnceBlock(DexKitBridge bridge) {
    // 1. Find methods containing "visual_item_seen" string
    List<MethodData> methods = bridge.findMethod(
        FindMethod.create().matcher(
            MethodMatcher.create().usingStrings("visual_item_seen")
        )
    );
    
    // 2. Filter by signature: (?,?,AbstractClassType) -> void
    for (MethodData method : methods) {
        if (paramTypes.size() == 3 && returnType.contains("void")) {
            // 3. Hook the method and check runtime values
            XposedBridge.hookMethod(reflectMethod, new XC_MethodHook() {
                protected void beforeHookedMethod(MethodHookParam param) {
                    Object rw = param.args[2]; // Third parameter
                    // Check if method returns "visual_item_seen" or "send_visual_item_seen_marker"
                    if (containsMarkerStrings(rw)) {
                        param.setResult(null); // Block the call
                    }
                }
            });
        }
    }
}
```

**Key Insight**: InstaEclipse dynamically finds methods at runtime using DexKit and hooks them. For smali patching, we need a static approach that identifies the correct file and method during build time.

## Solution Implementation

### 1. Enhanced FileSearchResult

Added `MultipleFound` case to distinguish between "no files" and "too many files":

```kotlin
sealed class FileSearchResult {
    data class Success(val file: File) : FileSearchResult()
    data class NotFound(val scannedFiles: Int) : FileSearchResult()
    data class MultipleFound(val files: List<File>) : FileSearchResult()  // NEW
}
```

### 2. Updated SearchUtils

Modified to return `MultipleFound` when multiple candidates are found:

```kotlin
when {
    resultFiles.isEmpty() -> FileSearchResult.NotFound(0)
    resultFiles.size == 1 -> FileSearchResult.Success(resultFiles[0])
    else -> FileSearchResult.MultipleFound(resultFiles)  // NEW
}
```

### 3. Intelligent File Selection in GhostViewOnce

Implemented a multi-stage filtering approach:

#### Stage 1: Initial Search
Search for files containing:
- `"visual_item_seen"` - the marker string
- `"invoke-static"` - indicates actual method calls (not just constants)

This filters out:
- String constant files (000.smali) - no invoke statements
- Simple data classes that only return strings

#### Stage 2: Size Filtering
Filter candidates by file size (50-2000 lines):
- Excludes tiny utility classes (< 50 lines)
- Excludes massive utility files like 6oh.smali (135,064 lines)
- Targets implementation classes (5nc.smali = 264 lines)

#### Stage 3: KHI Reference Check
Look for `LX/KHI;` reference:
- KHI is Instagram's internal API for sending markers
- Only implementation files that actually send markers will reference this class
- This is the final discriminator to find the correct file

### 4. Method Patching Logic

Once the correct file is identified, find the target method:

```kotlin
// Find method containing "visual_item_seen" const-string that also calls KHI
fContent.forEachIndexed { index, line ->
    if (line.contains("const-string") && line.contains("visual_item_seen")) {
        // Search backwards to find method declaration
        // Verify method contains LX/KHI; reference
        // This ensures we patch the right method
    }
}
```

Then inject the ghost mode check:

```smali
# Ghost ViewOnce - Block view once seen markers
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z
move-result v0
if-eqz v0, :ghost_viewonce_continue
return-void
:ghost_viewonce_continue
```

This code:
1. Checks if Ghost ViewOnce is enabled
2. Returns early (blocks the marker) if enabled
3. Continues normal execution if disabled

## Comparison: InstaEclipse vs Instafel

| Aspect | InstaEclipse | Instafel |
|--------|--------------|----------|
| **Approach** | Runtime hooking with Xposed | Build-time smali patching |
| **Detection** | DexKit dynamic method search | Static pattern matching |
| **Flexibility** | Can adapt to any method signature | Requires specific patterns |
| **Performance** | Runtime overhead for hooks | No runtime overhead |
| **Robustness** | Works across versions (if signature matches) | Needs adjustment for major changes |
| **Blocking Method** | Hook intercepts and returns null | Injected early return |

## Testing the Fix

To verify the patch works correctly:

1. **Build the patcher**:
   ```bash
   ./gradlew :patcher-core:build
   ```

2. **Expected behavior**:
   - Search should find 5nc.smali as the target file
   - Method Fe3 should be patched with ghost mode check
   - No errors about multiple candidates

3. **Runtime verification**:
   - Enable Ghost ViewOnce in settings
   - View a "view once" message
   - Sender should NOT see "Seen" status
   - Message should remain viewable

## Files Modified

1. **patcher-core/src/main/kotlin/instafel/patcher/core/utils/modals/FileSearchResult.kt**
   - Added `MultipleFound` case

2. **patcher-core/src/main/kotlin/instafel/patcher/core/utils/SearchUtils.kt**
   - Returns `MultipleFound` instead of `NotFound` for multiple matches

3. **patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostViewOnce.kt**
   - Implemented intelligent multi-stage filtering
   - Updated method detection to find KHI-calling methods
   - Improved documentation

4. **Other patches** (GhostLive, GhostScreenshot, GhostSeen, GhostStory, GhostTyping, etc.)
   - Added `MultipleFound` handling for consistency

## Future Improvements

1. **Dynamic Pattern Learning**: Could analyze successful patches to learn patterns
2. **Version-Specific Patterns**: Maintain patterns for different Instagram versions
3. **AST-Based Analysis**: Use smali AST parsing for more robust method detection
4. **Automated Testing**: Create test suite with sample smali files
5. **Logging Enhancement**: Add more detailed logging of filtering stages

## References

- InstaEclipse ViewOnce implementation: `ps.reso.instaeclipse.mods.ghost.ViewOnce`
- Instagram decompiled smali: `instagram/smali*/X/*.smali`
- DexKit documentation: https://github.com/LuckyPray/DexKit
