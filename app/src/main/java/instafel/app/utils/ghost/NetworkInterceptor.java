package instafel.app.utils.ghost;

import java.lang.reflect.Field;
import java.net.URI;

/**
 * Network Interceptor for Ghost Mode features
 * Based on InstaEclipse Interceptor.java implementation
 * 
 * This is NOT a user-facing toggle. The network interceptor is automatically
 * activated when the main Ghost Mode switch is enabled, and deactivated when
 * Ghost Mode is disabled. It's a background dependency that allows ghost
 * features to function by intercepting and blocking specific network requests.
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
     * Network interceptor only activates when ghost mode main switch is enabled
     * 
     * @param uri The URI to check
     * @return true if the request should be blocked, false otherwise
     */
    public static boolean shouldBlockRequest(URI uri) {
        // Network interceptor is only active when ghost mode is enabled
        if (!GhostModeManager.isGhostModeEnabled) {
            return false;
        }
        
        if (uri == null || uri.getPath() == null) {
            return false;
        }
        
        String path = uri.getPath();
        String host = uri.getHost();
        String query = uri.getQuery();
        
        // Ghost Mode URI checks - matching InstaEclipse Interceptor.java
        
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
        
        // Ghost Story
        if (GhostModeManager.isGhostStory) {
            if (path.contains("/api/v2/media/seen/")) {
                return true;
            }
        }
        
        // Ghost Live
        if (GhostModeManager.isGhostLive) {
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
