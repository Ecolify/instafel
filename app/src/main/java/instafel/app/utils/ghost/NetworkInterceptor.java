package instafel.app.utils.ghost;

import java.net.URI;

/**
 * Network Interceptor for Ghost Mode features
 * Based on InstaEclipse Interceptor.java implementation
 * 
 * This class provides URI checking logic that is called from smali patches
 * injected into TigonServiceLayer.startRequest to intercept network requests.
 */
public class NetworkInterceptor {
    
    /**
     * Check if a URI should be blocked based on ghost mode settings
     * 
     * @param uri The URI to check
     * @return true if the request should be blocked, false otherwise
     */
    public static boolean shouldBlockRequest(URI uri) {
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
     * Main interceptor method called from smali patches
     * Checks if a URI should be blocked and returns a replacement URI if needed
     * 
     * @param uri The original request URI
     * @return The fake URI if blocked, null if the request should proceed normally
     */
    public static URI interceptRequest(URI uri) {
        if (shouldBlockRequest(uri)) {
            return getFakeUri();
        }
        return null;
    }
}
