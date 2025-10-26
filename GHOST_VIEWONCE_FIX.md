# Ghost ViewOnce Patch - Fix Documentation

## Problem Summary

The Ghost ViewOnce patch was failing with the error:
```
S: Found more files than one (or no any file found) for apply patch, add more condition for find correct file.
I: FAILURE: Patch aborted because no classes found for ghost viewonce. Found 3 candidate files.
```

The patch found 3 candidate files:
- `smali/X/000.smali`
- `smali/X/5zl.smali` (later replaced by 5nb.smali)
- `smali/X/6gx.smali` (later replaced by 6oh.smali)

## Root Cause Analysis

### Original Search Strategy (INCORRECT)
The original implementation searched for files containing **both** strings:
1. `visual_item_seen`
2. `send_visual_item_seen_marker`

This approach was fundamentally flawed because:

### Instagram's ViewOnce Architecture

After analyzing the decompiled Instagram smali code, the architecture is:

1. **Message Class** (`LX/5nb.smali`):
   - Extends `LX/5mu`
   - Implements `LX/5lz` interface
   - Contains field `A01:LX/GTu;` (the message type)
   - Has method `A03()` returning `"send_visual_item_seen_marker"`
   - This is the **message definition**, NOT the handler

2. **Message Type Class** (`LX/GTu.smali`):
   - Has method `A01()` returning `"visual_item_seen"`
   - Defines the message type constant

3. **Handler Class** (`LX/5nc.smali`) **← THIS IS THE TARGET**:
   - Implements `LX/5fh` interface
   - Contains method `Fe3(LX/2vp;LX/Qff;LX/5eh;)V`
   - This method:
     - Takes 3 parameters, returns void
     - Casts third parameter: `check-cast p3, LX/5nb;`
     - Contains string `"visual_item_seen"`
     - Calls `LX/KHI;->A00(...)` to send the seen marker
   - **This is where we need to inject the patch**

4. **Utility Classes**:
   - `000.smali`: String constant lookup table (packed-switch)
   - `6oh.smali`: Abstract utility methods
   - Neither of these should be patched

### Why Original Search Failed

The search looked for files with **both** strings, but:
- The **handler** (`5nc.smali`) only contains `"visual_item_seen"`, NOT `"send_visual_item_seen_marker"`
- The **message class** (`5nb.smali`) contains `"send_visual_item_seen_marker"` but not exactly `"visual_item_seen"`
- The utility classes contain unrelated string constants

This meant the search would find the wrong files and couldn't uniquely identify the handler.

## Solution

### New Search Strategy

Based on InstaEclipse's approach (which uses DexKit to find methods by signature), we now:

1. **Search for Handler Classes**, not message classes:
   ```kotlin
   Pattern 1: "# interfaces" + ".implements" + "\"visual_item_seen\""
   Pattern 2: "implements" + "\"visual_item_seen\""
   Pattern 3: "\"visual_item_seen\"" + "check-cast"
   ```

2. **Key Improvements**:
   - Search for `"visual_item_seen"` with quotes to match exact string (not substring of `send_visual_item_seen_marker`)
   - Look for classes that implement interfaces (handlers typically implement handler interfaces)
   - Look for `check-cast` instruction (handlers cast the message parameter)

### New Method Detection

Once the handler class is found, we identify the correct method by:

1. **Method Signature**: Exactly 3 parameters, void return `()V`
   ```
   .method public final bridge synthetic Fe3(LX/2vp;LX/Qff;LX/5eh;)V
   ```

2. **Contains `"visual_item_seen"` string** in the method body

3. **Contains `check-cast` instruction** for third parameter:
   ```smali
   check-cast p3, LX/5nb;
   ```

### Patch Injection

The patch is injected at the beginning of the method (after `.locals`):

```smali
.method public final bridge synthetic Fe3(LX/2vp;LX/Qff;LX/5eh;)V
    .locals 10

    # Ghost ViewOnce - Block view once seen markers
    invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z
    move-result v0
    if-eqz v0, :ghost_viewonce_continue
    return-void
    :ghost_viewonce_continue

    # Original method body continues...
    check-cast p3, LX/5nb;
    ...
```

This causes the method to return early (do nothing) when Ghost ViewOnce is enabled, preventing the visual item seen marker from being sent.

## Comparison with InstaEclipse

### InstaEclipse Approach (Runtime Hooking)
```java
// Find methods containing "visual_item_seen"
List<MethodData> methods = bridge.findMethod(
    FindMethod.create().matcher(
        MethodMatcher.create().usingStrings("visual_item_seen")
    )
);

// Filter by signature: (?,?,AbstractClassType) -> void
if (paramTypes.size() == 3 && returnType.contains("void")) {
    // Hook method and check third parameter at runtime
    XposedBridge.hookMethod(reflectMethod, new XC_MethodHook() {
        @Override
        protected void beforeHookedMethod(MethodHookParam param) {
            Object rw = param.args[2]; // Third argument
            // Check if it's a visual_item_seen message
            if (value.contains("visual_item_seen") || 
                value.contains("send_visual_item_seen_marker")) {
                param.setResult(null); // Block call
            }
        }
    });
}
```

### Our Approach (Static Smali Patching)
```kotlin
// 1. Find handler class (implements interface + contains "visual_item_seen")
// 2. Find method with 3 params, void return, contains "visual_item_seen", has check-cast
// 3. Inject static check at method entry
```

Both approaches achieve the same goal:
- InstaEclipse: Runtime hook that checks message type and blocks execution
- Instafel: Static patch that checks feature flag and blocks execution

Our approach is simpler because we patch the method directly, while InstaEclipse inspects the third parameter at runtime to determine the message type.

## Files Modified

- `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostViewOnce.kt`
  - Rewrote search logic to find handler class instead of message class
  - Added exact string matching with quotes to avoid substring matches
  - Improved method detection with signature validation
  - Added check-cast validation
  - Enhanced documentation with architecture analysis

## Testing

The fix can be verified by:

1. Checking that `5nc.smali` matches our search patterns:
   ```bash
   grep "# interfaces" smali/X/5nc.smali  # ✓ Found
   grep "\.implements" smali/X/5nc.smali   # ✓ Found  
   grep '"visual_item_seen"' smali/X/5nc.smali  # ✓ Found
   ```

2. Verifying the method signature:
   ```bash
   grep "\.method.*\(.*\)V" smali/X/5nc.smali | grep -v constructor
   # Result: .method public final bridge synthetic Fe3(LX/2vp;LX/Qff;LX/5eh;)V
   # 3 parameters (3 semicolons), void return ✓
   ```

3. Confirming check-cast instruction:
   ```bash
   grep "check-cast p3" smali/X/5nc.smali
   # Result: check-cast p3, LX/5nb; ✓
   ```

4. Verifying other files DON'T match:
   - `000.smali`: No interfaces, no implements ✗
   - `5nb.smali`: Has `"send_visual_item_seen_marker"` but not `"visual_item_seen"` ✗
   - `6oh.smali`: No interfaces, no implements ✗

## Benefits

1. **Precision**: Uniquely identifies the handler method, avoiding false positives
2. **Robustness**: Based on architectural understanding, less likely to break with Instagram updates
3. **Maintainability**: Clear documentation of what we're looking for and why
4. **Alignment**: Follows the same logic as InstaEclipse but adapted for smali patching

## Future Improvements

If Instagram's architecture changes, the search patterns can be adjusted:
- Add more fallback patterns if needed
- Adjust method signature detection
- Consider adding class hierarchy checks
- Could use method name patterns (Fe3, etc.) as additional hints

However, the current approach is robust because it's based on:
1. Fundamental architecture (handlers implement interfaces)
2. Method signatures (3 params, void return)
3. String constants that are unlikely to change (`"visual_item_seen"`)
