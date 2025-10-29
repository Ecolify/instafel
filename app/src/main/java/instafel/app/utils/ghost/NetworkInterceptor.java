package instafel.app.utils.ghost;

import java.lang.reflect.Field;
import java.net.URI;

/**
 * Network Interceptor for Ghost Mode features
 * Based on InstaEclipse Interceptor.java implementation
 * 
 * This class provides URI checking and interception logic using reflection
 * to dynamically access the URI field in request objects, similar to how
 * InstaEclipse does it with Xposed.
 */
public class NetworkInterceptor {
    
    // Cache the URI field name once found for better performance
    private static String cachedUriFieldName = null;
    private static boolean fieldSearchAttempted = false;
    
    /**
     * Check if a URI should be blocked based on ghost mode settings
     * 
     * NetworkInterceptor is a dependency/function that is activated when ghost mode is enabled.
     * It is NOT a separate toggle - it automatically activates when the ghost mode master switch is ON.
     * When ghost mode is OFF, this interceptor does nothing and all requests pass through normally.
     * 
     * @param uri The URI to check
     * @return true if the request should be blocked, false otherwise
     */
    public static boolean shouldBlockRequest(URI uri) {
        // First check: Ghost mode must be enabled for any interception to occur
        // This is the master switch - if it's off, NetworkInterceptor is inactive
        if (!GhostModeManager.isEnabled()) {
            return false;
        }
        
        if (uri == null || uri.getPath() == null) {
            return false;
        }
        
        String path = uri.getPath();
        String host = uri.getHost();
        String query = uri.getQuery();
        
        // Ghost Mode URI checks - matching InstaEclipse Interceptor.java
        // Each feature is checked using isFeatureActive() which verifies both:
        // 1. Ghost mode master toggle is ON (already checked above)
        // 2. The specific feature toggle is ON
        
        // Ghost Seen - blocks DM read receipt tracking
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostSeen)) {
            if (path.contains("/direct_v2/threads/") && path.endsWith("/items/") && query != null && query.contains("mark_as_seen")) {
                return true;
            }
        }
        
        // Ghost Typing - blocks typing indicator
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostTyping)) {
            if (path.contains("/direct_v2/threads/") && path.contains("/activity_indicator_seen/")) {
                return true;
            }
        }
        
        // Ghost Screenshot - blocks screenshot notification requests
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostScreenshot)) {
            if (path.endsWith("/screenshot/") || path.endsWith("/ephemeral_screenshot/")) {
                return true;
            }
        }
        
        // Ghost ViewOnce - blocks view once message tracking
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostViewOnce)) {
            if (path.endsWith("/item_replayed/")) {
                return true;
            }
            if (path.contains("/direct") && path.endsWith("/item_seen/")) {
                return true;
            }
        }
        
        // Ghost Story - blocks story view tracking
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostStory)) {
            if (path.contains("/api/v2/media/seen/")) {
                return true;
            }
        }
        
        // Ghost Live - blocks live video viewer tracking
        if (GhostModeManager.isFeatureActive(GhostModeManager.isGhostLive)) {
            if (path.contains("/heartbeat_and_get_viewer_count/")) {
                return true;
            }
        }
        
        return false;
    }
    
    /**
     * Create a fake URI to redirect blocked requests
     * This prevents the actual request from being sent
     * 
     * @return A URI pointing to localhost that will fail harmlessly
     */
    public static URI getFakeUri() {
        try {
            return new URI("https", "127.0.0.1", "/404", null);
        } catch (Exception e) {
            // If URI creation fails, return null and let the original request proceed
            return null;
        }
    }
    
    /**
     * Find the URI field name in a request object using reflection
     * Similar to InstaEclipse's dynamic field discovery
     * 
     * @param requestObj The request object to analyze
     * @return The name of the URI field, or null if not found
     */
    private static String findUriFieldName(Object requestObj) {
        if (requestObj == null) {
            return null;
        }
        
        try {
            Class<?> requestClass = requestObj.getClass();
            Field[] fields = requestClass.getDeclaredFields();
            
            for (Field field : fields) {
                if (field.getType().equals(URI.class)) {
                    field.setAccessible(true);
                    return field.getName();
                }
            }
        } catch (Exception e) {
            // Silently ignore reflection errors
        }
        
        return null;
    }
    
    /**
     * Extract URI from a request object using reflection
     * 
     * @param requestObj The request object
     * @return The URI from the request, or null if not found
     */
    public static URI extractUri(Object requestObj) {
        if (requestObj == null) {
            return null;
        }
        
        try {
            // Use cached field name if available
            if (cachedUriFieldName == null && !fieldSearchAttempted) {
                cachedUriFieldName = findUriFieldName(requestObj);
                fieldSearchAttempted = true;
            }
            
            if (cachedUriFieldName != null) {
                Field uriField = requestObj.getClass().getDeclaredField(cachedUriFieldName);
                uriField.setAccessible(true);
                return (URI) uriField.get(requestObj);
            }
        } catch (Exception e) {
            // Silently ignore reflection errors
        }
        
        return null;
    }
    
    /**
     * Set URI in a request object using reflection
     * 
     * @param requestObj The request object
     * @param newUri The new URI to set
     */
    public static void setUri(Object requestObj, URI newUri) {
        if (requestObj == null || cachedUriFieldName == null) {
            return;
        }
        
        try {
            Field uriField = requestObj.getClass().getDeclaredField(cachedUriFieldName);
            uriField.setAccessible(true);
            uriField.set(requestObj, newUri);
        } catch (Exception e) {
            // Silently ignore reflection errors
        }
    }
    
    /**
     * Main interceptor method called from smali patches
     * Uses reflection to extract and potentially modify the URI in a request object
     * 
     * @param requestObj The request object (first parameter of startRequest)
     */
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
}
