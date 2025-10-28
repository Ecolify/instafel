# Network Interceptor Implementation

## Overview

The Network Interceptor is a comprehensive ghost mode implementation that intercepts network requests at the TigonServiceLayer level, similar to InstaEclipse's Interceptor.java. This provides a more robust and centralized approach to blocking ghost mode related requests.

## Problem Statement

The original issue requested implementing the missing patch from InstaEclipse:
- **Reference:** `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- **Goal:** Implement network-level interception for ghost mode features
- **Challenge:** Translate Xposed runtime hooks to smali patches

## Implementation Strategy

### InstaEclipse Approach (Xposed Framework)

InstaEclipse uses the Xposed framework to hook into methods at runtime:

1. **Runtime Hook:** Uses `XposedHelpers.findAndHookMethod()` to hook `TigonServiceLayer.startRequest`
2. **Dynamic Discovery:** Uses reflection to find parameter types and URI field name
3. **URI Modification:** Uses `XposedHelpers.setObjectField()` to replace URIs
4. **Blocked Endpoints:** Redirects blocked requests to `127.0.0.1/404`

### Instafel Approach (Smali Patching)

Instafel modifies the APK bytecode directly without requiring Xposed:

1. **Smali Injection:** Injects code at the start of `TigonServiceLayer.startRequest`
2. **Reflection at Runtime:** Uses Java reflection to handle obfuscated field names
3. **URI Modification:** Uses `Field.set()` to replace URIs in request objects
4. **Same Blocking Logic:** Redirects to `127.0.0.1/404` like InstaEclipse

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│ TigonServiceLayer.startRequest(requestObj, param2, param3) │
├─────────────────────────────────────────────────────────────┤
│ ↓ Injected smali code                                       │
│ invoke-static NetworkInterceptor.interceptRequest(p1)       │
│                                                              │
│ ↓ NetworkInterceptor.java (reflection)                     │
│ 1. Extract URI using reflection                            │
│ 2. Check against ghost mode patterns                       │
│ 3. Replace with fake URI if blocked                        │
│                                                              │
│ ↓ Original TigonServiceLayer code continues                │
│ ... rest of startRequest method ...                        │
└─────────────────────────────────────────────────────────────┘
```

## Files Created/Modified

### Created Files

1. **`app/src/main/java/instafel/app/utils/ghost/NetworkInterceptor.java`**
   - Runtime reflection-based URI interceptor
   - Extracts URI from obfuscated request objects
   - Checks URIs against ghost mode patterns
   - Replaces blocked URIs with fake URI

2. **`patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/NetworkInterceptor.kt`**
   - Finds TigonServiceLayer class
   - Locates startRequest method with 3 parameters
   - Injects call to NetworkInterceptor.interceptRequest()

### Modified Files

1. **`patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/GhostMode.kt`**
   - Added NetworkInterceptor to patch group
   - Runs before other ghost mode patches

## Key Features

### 1. Dynamic Field Discovery

The NetworkInterceptor uses reflection to find the URI field at runtime:

```java
private static String findUriFieldName(Object requestObj) {
    Class<?> requestClass = requestObj.getClass();
    Field[] fields = requestClass.getDeclaredFields();
    
    for (Field field : fields) {
        if (field.getType().equals(URI.class)) {
            field.setAccessible(true);
            return field.getName();
        }
    }
    return null;
}
```

### 2. Field Name Caching

For performance, the field name is cached after first discovery:

```java
private static String cachedUriFieldName = null;
private static boolean fieldSearchAttempted = false;
```

### 3. URI Blocking Logic

Matches InstaEclipse's blocking patterns:

```java
// Ghost Screenshot
if (GhostModeManager.isGhostScreenshot) {
    if (path.endsWith("/screenshot/") || path.endsWith("/ephemeral_screenshot/")) {
        return true;
    }
}

// Ghost ViewOnce
if (GhostModeManager.isGhostViewOnce) {
    if (path.endsWith("/item_replayed/")) {
        return true;
    }
    if (path.contains("/direct") && path.endsWith("/item_seen/")) {
        return true;
    }
}

// ... and more
```

### 4. Safe Error Handling

All reflection operations are wrapped in try-catch to prevent crashes:

```java
public static void interceptRequest(Object requestObj) {
    try {
        URI uri = extractUri(requestObj);
        if (uri != null && shouldBlockRequest(uri)) {
            URI fakeUri = getFakeUri();
            if (fakeUri != null) {
                setUri(requestObj, fakeUri);
            }
        }
    } catch (Exception e) {
        // Silently ignore any errors to prevent crashes
    }
}
```

## Blocked Endpoints

The NetworkInterceptor blocks the following endpoints when ghost mode features are enabled:

### Ghost Screenshot
- `/screenshot/`
- `/ephemeral_screenshot/`

### Ghost ViewOnce
- `/item_replayed/`
- `/direct.../item_seen/`

### Ghost Story
- `/api/v2/media/seen/`

### Ghost Live
- `/heartbeat_and_get_viewer_count/`

## Comparison: InstaEclipse vs Instafel

| Aspect | InstaEclipse | Instafel |
|--------|--------------|----------|
| **Framework** | Xposed Framework | Direct APK modification |
| **Installation** | Requires Xposed/LSPosed | Works standalone |
| **Hook Method** | Runtime (XposedBridge) | Compile-time (smali) |
| **Field Discovery** | Reflection at runtime | Reflection at runtime |
| **URI Modification** | XposedHelpers.setObjectField | Field.set() |
| **Performance** | Slight overhead from Xposed | No framework overhead |
| **Compatibility** | Requires rooted device | Works on non-rooted devices |
| **Update Process** | Module update | APK rebuild |

## Advantages of This Approach

1. **Centralized Logic:** All ghost mode network blocking in one place
2. **Comprehensive Coverage:** Catches requests that individual patches might miss
3. **Easier Maintenance:** One place to add new blocked endpoints
4. **Reference Compatibility:** Closely matches InstaEclipse implementation
5. **Graceful Degradation:** Continues to work even if field discovery fails

## Integration with Existing Patches

The NetworkInterceptor **complements** the existing individual ghost mode patches:

- **NetworkInterceptor:** Blocks network requests before they're sent
- **Individual Patches:** Block local method execution (screenshot detection, etc.)

Both layers work together to provide comprehensive ghost mode coverage.

## Testing Requirements

To test the NetworkInterceptor patch:

1. **Build Verification:**
   ```bash
   ./gradlew :app:assemble :patcher-core:assemble
   ```

2. **Patch Application:**
   - Run `copilot-custom-setup` to clone instaeclipse and decompile Instagram
   - Apply patcher to Instagram APK
   - Verify NetworkInterceptor patch is in GhostMode patch group

3. **Runtime Testing:**
   - Enable ghost mode features in Instafel settings
   - Test screenshot detection (should not notify)
   - Test view once messages (should not mark as seen)
   - Test story viewing (should not mark as viewed)
   - Test live video viewing (should not show in viewer list)

4. **Network Monitoring:**
   - Use a proxy (mitmproxy, Charles) to monitor network traffic
   - Verify blocked endpoints are not being called
   - Verify redirected requests go to 127.0.0.1/404

## Troubleshooting

### Issue: Patch doesn't apply

**Possible Causes:**
- TigonServiceLayer class not found in Instagram APK
- startRequest method signature changed

**Solution:**
- Check Instagram version compatibility
- Review patch search patterns in NetworkInterceptor.kt

### Issue: Ghost mode features still send requests

**Possible Causes:**
- URI field name changed in Instagram update
- Reflection failing to find URI field

**Solution:**
- Add logging to NetworkInterceptor.interceptRequest()
- Verify field discovery is working
- Check if Instagram changed request structure

### Issue: App crashes when using ghost mode

**Possible Causes:**
- Reflection error not being caught
- Invalid URI replacement

**Solution:**
- Verify all try-catch blocks are in place
- Check getFakeUri() is creating valid URIs
- Validate Field.set() is not throwing exceptions

## Future Enhancements

Potential improvements for the NetworkInterceptor:

1. **Extended Blocking:** Add more endpoint patterns from InstaEclipse
   - Analytics blocking
   - Ad blocking
   - Distraction-free mode endpoints

2. **Performance Optimization:** Cache more reflection results
   - Cache Field objects, not just names
   - Use WeakHashMap for multiple request types

3. **Logging Mode:** Add developer option to log blocked requests
   - Help users understand what's being blocked
   - Aid in debugging new Instagram versions

4. **Pattern Configuration:** Allow users to add custom blocking patterns
   - Advanced users can block additional endpoints
   - Support for regex patterns

## References

- **InstaEclipse Interceptor:** `instaeclipse/app/src/main/java/ps/reso/instaeclipse/mods/network/Interceptor.java`
- **Original Issue:** GitHub issue requesting this implementation
- **Related Patches:** All patches in `patcher-core/src/main/kotlin/instafel/patcher/core/patches/ghost/`

## Contributing

When modifying the NetworkInterceptor:

1. **Maintain Compatibility:** Keep reflection-based approach for obfuscation
2. **Test Thoroughly:** Verify on multiple Instagram versions
3. **Document Changes:** Update this file with new blocked endpoints
4. **Follow Patterns:** Match InstaEclipse's blocking logic when possible
5. **Safe Coding:** Always wrap reflection in try-catch blocks

## Conclusion

The NetworkInterceptor successfully implements the missing ghost mode patch from InstaEclipse using a reflection-based approach that works with Instafel's smali patching system. It provides comprehensive network-level blocking while maintaining compatibility with Instagram's obfuscated code structure.
