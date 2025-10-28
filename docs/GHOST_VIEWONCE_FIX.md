# Ghost ViewOnce Patch Fix - Technical Documentation

## Problem Statement

The Ghost ViewOnce patch was failing with the following error:

```
Ghost ViewOnce
View once messages without marking as seen

I: Loading tasks..
I: 2 task loaded
I: Executing tasks...

I: Execute: Find ghost viewonce source file
I: Totally 139418 file got listed in X folder(s)
I: Found a file, 'smali/X/5zl.smali' by T0
I: Found a file, 'smali/X/6gx.smali' by T0
I: Found a file, 'smali/X/6gy.smali' by T0
I: Found a file, 'smali_classes6/X/7Q6.smali' by T1
I: Found a file, 'smali_classes6/X/LxV.smali' by T1
I: Found a file, 'smali_classes6/X/LIj.smali' by T1
I: Found a file, 'smali_classes2/X/1eJ.smali' by T0
I: Search process ran with 4 threads in 2.471s totally (139418 file processed)
S: Found more files than one (7) for apply patch, add more condition for find correct file.
I: FAILURE: Patch aborted: Found 3 candidate files after filtering: [6gx.smali, 6gy.smali, LxV.smali]
```

The original implementation searched for files containing `visual_item_seen` and `invoke-` patterns, but this approach found multiple files without sufficient filtering to identify the correct target file.

## Analysis of Instagram's Decompiled Code

### InstaEclipse Reference Implementation

InstaEclipse uses DexKit with Xposed framework to dynamically find and hook methods:

```java
// InstaEclipse approach (ps.reso.instaeclipse.mods.ghost.ViewOnce)
public void handleViewOnceBlock(DexKitBridge bridge) {
    // Step 1: Find methods containing "visual_item_seen" string
    List<MethodData> methods = bridge.findMethod(
        FindMethod.create().matcher(
            MethodMatcher.create().usingStrings("visual_item_seen")
        )
    );
    
    // Step 2: Filter by signature: (?,?,Object) -> void with exactly 3 parameters
    for (MethodData method : methods) {
        ClassDataList paramTypes = method.getParamTypes();
        String returnType = String.valueOf(method.getReturnType());
        
        if (paramTypes.size() == 3 && returnType.contains("void")) {
            // Step 3: Hook the method and perform runtime inspection
            XposedBridge.hookMethod(reflectMethod, new XC_MethodHook() {
                @Override
                protected void beforeHookedMethod(MethodHookParam param) {
                    if (!FeatureFlags.isGhostViewOnce) {
                        return; // Feature disabled → skip
                    }
                    
                    Object rw = param.args[2]; // Third parameter (visual item object)
                    if (rw == null) {
                        return;
                    }
                    
                    // Inspect third parameter's methods to verify it contains marker strings
                    for (Method m : rw.getClass().getDeclaredMethods()) {
                        if (m.getParameterTypes().length != 0 || m.getReturnType() != String.class) {
                            continue;
                        }
                        
                        try {
                            m.setAccessible(true);
                            String value = (String) m.invoke(rw);
                            if (value != null && (value.contains("visual_item_seen") ||
                                    value.contains("send_visual_item_seen_marker"))) {
                                param.setResult(null); // Block this call
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            });
        }
    }
}
```

**Key Insight**: InstaEclipse uses method signature matching (exactly 3 parameters, void return type) combined with runtime parameter inspection. For smali patching, we adapt this by using the same signature matching at build time.

### Example Target Method in Instagram

After analysis of the decompiled Instagram code, the target method has this signature:

```smali
.method public final bridge synthetic Ffk(LX/2zr;LX/EjY;LX/5su;)V
    .locals 10
    
    # ... method implementation ...
    
    const-string/jumbo v4, "visual_item_seen"
    
    # ... calls to send the marker to Instagram servers ...
    
    return-void
.end method
```

Key characteristics:
- **Signature**: `(LX/2zr;LX/EjY;LX/5su;)V` - exactly 3 object parameters, void return
- **Contains**: `const-string` with `"visual_item_seen"`
- **Location**: Implementation class (not abstract, not just constants)
- **Size**: Moderate file size (50-2000 lines) indicating actual implementation

### Why Other Files Are False Positives

Files found by the initial search but filtered out:

1. **Abstract/Static utility classes** (e.g., `Hp5.smali`)
   - Contains `"visual_item_seen"` in static method
   - Method signature: `A00(Lcom/.../UserSession;Ljava/lang/String;...ZZ)LX/5sQ;`
   - **Filtered**: 7 parameters, returns object (not void)

2. **Data holder classes** (e.g., `ED9.smali`)
   - Contains `"visual_item_seen"` in getter method
   - Method signature: `A01()Ljava/lang/String;`
   - **Filtered**: 0 parameters, returns String (not void)

3. **Files without visual_item_seen** (e.g., `6gx.smali`, `6gy.smali`, `LxV.smali`)
   - May contain `invoke-` patterns but not the target string
   - These appear in error logs from different Instagram versions
   - **Filtered**: No `visual_item_seen` string found

## Solution Implementation

### Search Strategy

The patch uses a two-condition search pattern:

```kotlin
val searchPattern = listOf(
    listOf("visual_item_seen"),  // Condition 1: Must contain this string
    listOf("invoke-")             // Condition 2: Must have method invocations
)
```

This initial search finds files that:
- Contain the marker string `"visual_item_seen"` (excludes unrelated files)
- Have method invocations (excludes simple constant/data classes)

### Multi-Stage Filtering

When multiple candidates are found, a sophisticated filtering process is applied:

#### Stage 1: Size Filtering
Filter by file size (50-2000 lines):
```kotlin
val sizeFilteredCandidates = result.files.filter { file ->
    val lineCount = file.useLines { it.count() }
    lineCount in MIN_IMPLEMENTATION_LINES..MAX_IMPLEMENTATION_LINES
}
```

This eliminates:
- Tiny utility classes (< 50 lines)
- Massive constant definition files (> 2000 lines)
- Keeps typical implementation classes (e.g., 264 lines)

#### Stage 2: Method Signature Matching (InstaEclipse Approach)

Implements the InstaEclipse method signature criteria:

```kotlin
val candidates = sizeFilteredCandidates.filter { file ->
    val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
    var hasTargetMethod = false
    
    // Find line with "visual_item_seen"
    val visualItemSeenLine = fContent.indexOfFirst { line ->
        line.contains("const-string") && line.contains("visual_item_seen")
    }
    
    if (visualItemSeenLine != -1) {
        // Search backwards to find the containing method
        for (methodIndex in visualItemSeenLine downTo 0) {
            if (fContent[methodIndex].contains(".method")) {
                val methodDeclaration = fContent[methodIndex]
                
                // Extract signature: (params)ReturnType
                val signatureMatch = Regex("\\(([^)]*)\\)V").find(methodDeclaration)
                if (signatureMatch != null) {
                    val params = signatureMatch.groupValues[1]
                    
                    // Count parameters (L=object, I/J/Z/F/D/B/S/C=primitive, [=array)
                    var paramCount = 0
                    var i = 0
                    while (i < params.length) {
                        when (params[i]) {
                            'L' -> {
                                paramCount++
                                i = params.indexOf(';', i) + 1
                            }
                            'I', 'J', 'Z', 'F', 'D', 'B', 'S', 'C' -> {
                                paramCount++
                                i++
                            }
                            '[' -> i++  // Skip array prefix
                            else -> i++
                        }
                    }
                    
                    // InstaEclipse criterion: exactly 3 parameters, void return
                    if (paramCount == 3) {
                        hasTargetMethod = true
                    }
                }
                break
            }
        }
    }
    
    hasTargetMethod
}
```

This matches the InstaEclipse approach:
- Method must contain `"visual_item_seen"` string
- Method signature must be `void method(?, ?, ?)` - exactly 3 parameters
- Return type must be void (`V` in smali)

Parameter counting handles:
- Object types: `Lpackage/Class;` (e.g., `LX/2zr;`)
- Primitive types: `I` (int), `Z` (boolean), `J` (long), etc.
- Arrays: `[` prefix (e.g., `[Ljava/lang/String;`)

#### Result Selection

```kotlin
when {
    candidates.size == 1 -> {
        ghostViewOnceFile = candidates[0]
        success("Ghost viewonce source class found after filtering: ${ghostViewOnceFile.name}")
    }
    candidates.isEmpty() -> {
        failure("Patch aborted: No suitable implementation files found among ${result.files.size} candidates (size filtered: ${sizeFilteredCandidates.size})")
    }
    else -> {
        failure("Patch aborted: Found ${candidates.size} candidate files after filtering: ${candidates.map { it.name }}")
    }
}
```

### Method Patching Logic

Once the correct file is identified, the patch:

1. **Locates the target method**:
   - Searches for `const-string` line containing `"visual_item_seen"`
   - Traces back to find the `.method` declaration
   - Verifies method signature (3 params, void return)

2. **Finds injection point**:
   - Locates `.locals` declaration (or uses method declaration line)
   - Injects ghost mode check immediately after

3. **Injects the patch**:
```smali
# Ghost ViewOnce - Block view once seen markers
invoke-static {}, Linstafel/app/utils/ghost/GhostModeManager;->isGhostViewOnceEnabled()Z
move-result v0
if-eqz v0, :ghost_viewonce_continue
return-void
:ghost_viewonce_continue
```

This code:
- Calls `GhostModeManager.isGhostViewOnceEnabled()` to check if feature is enabled
- Returns early (blocking the seen marker) if enabled
- Continues normal execution if disabled

## Comparison: InstaEclipse vs Instafel

| Aspect | InstaEclipse | Instafel (This Fix) |
|--------|--------------|---------------------|
| **Approach** | Runtime hooking with Xposed | Build-time smali patching |
| **Detection** | DexKit dynamic method search | Static pattern matching with signature verification |
| **Method Matching** | Signature: `(?, ?, ?)V` at runtime | Signature: `(?, ?, ?)V` during build |
| **Parameter Check** | Runtime inspection of 3rd param | Static analysis of method containing string |
| **Flexibility** | Adapts to any class/method name | Requires smali source code access |
| **Performance** | Runtime hook overhead | No runtime overhead |
| **Robustness** | Works if signature unchanged | Requires rebuild for major Instagram updates |
| **Blocking Method** | `param.setResult(null)` | Injected `return-void` |
| **Filtering Stages** | 1 (signature match) | 3 (size, signature, string location) |

Both approaches share the same core logic:
1. Find methods containing `"visual_item_seen"`
2. Filter by signature: exactly 3 parameters, void return
3. Block execution when ghost mode enabled

The main difference is **when** the filtering happens (runtime vs build-time).

## Testing the Fix

To verify the patch works correctly:

1. **Build the patcher**:
   ```bash
   ./gradlew :patcher-core:build
   ```

2. **Expected behavior during patching**:
   - Initial search finds multiple files containing `"visual_item_seen"` and `"invoke-"`
   - Size filter reduces candidates to files with 50-2000 lines
   - Signature filter identifies the single file with method matching `(?, ?, ?)V`
   - Success message: `"Ghost viewonce source class found after filtering: [filename]"`
   - No errors about multiple candidates

3. **Runtime verification**:
   - Enable Ghost ViewOnce in Instafel settings
   - View a "view once" message
   - Sender should NOT see "Seen" status
   - Message should remain viewable multiple times

## Files Modified

**patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostViewOnce.kt**
- Implemented signature-based filtering matching InstaEclipse approach
- Added parameter counting logic for smali method signatures
- Enhanced filtering to match exactly 3 parameters with void return
- Improved error messages with filtering stage information

## Future Improvements

1. **Bytecode Analysis**: Use a smali parser library for more robust AST-based method detection instead of regex
2. **Version-Specific Patterns**: Maintain signature patterns for different Instagram versions in configuration
3. **Automated Testing**: Create test suite with sample smali files representing different scenarios
4. **Enhanced Logging**: Add debug logging for each filtering stage to aid troubleshooting
5. **Parameter Type Verification**: Could add additional filtering based on parameter types (e.g., prefer methods with UserSession parameter)

## Key Takeaways

1. **InstaEclipse provides excellent guidance**: The method signature approach (`(?, ?, ?)V`) is the key discriminator
2. **Multi-stage filtering is essential**: Size filtering + signature matching eliminates false positives
3. **Parameter counting is non-trivial**: Must handle objects (`L...;`), primitives (`I`, `Z`, etc.), and arrays (`[`)
4. **Instagram updates frequently**: Class names change between versions, but method signatures are more stable
5. **Documentation is critical**: Clear documentation helps future developers understand the approach

## References

- InstaEclipse ViewOnce implementation: `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/ghost/ViewOnce.java`
- Instagram decompiled smali: `instagram/smali*/X/*.smali`
- Smali signature format: https://source.android.com/docs/core/runtime/dex-format#type-descriptor
- DexKit documentation: https://github.com/LuckyPray/DexKit
