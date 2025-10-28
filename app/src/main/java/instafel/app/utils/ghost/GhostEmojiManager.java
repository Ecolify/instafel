package instafel.app.utils.ghost;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Manages the Ghost Mode emoji indicator in the Instagram UI.
 * Based on InstaEclipse implementation (ps.reso.instaeclipse.mods.ghost.ui.GhostEmojiManager)
 * 
 * Displays a ghost emoji (👻) next to the inbox button when Ghost Mode is active,
 * providing visual feedback to users that they are browsing anonymously.
 */
public class GhostEmojiManager {

    @SuppressLint("StaticFieldLeak")
    private static TextView ghostEmojiView;

    /**
     * Adds or updates the ghost emoji indicator next to the inbox button.
     * 
     * @param activity The current Activity context
     * @param showGhost True to show the ghost emoji, false to hide it
     */
    @SuppressLint("DiscouragedApi")
    public static void addGhostEmojiNextToInbox(Activity activity, boolean showGhost) {
        try {
            // Find the inbox button by trying multiple possible IDs
            int inboxButtonId1 = activity.getResources().getIdentifier("action_bar_inbox_button", "id", activity.getPackageName());
            int inboxButtonId2 = activity.getResources().getIdentifier("direct_tab", "id", activity.getPackageName());

            View inboxButton1 = activity.findViewById(inboxButtonId1);
            View inboxButton2 = activity.findViewById(inboxButtonId2);

            View inboxButton = inboxButton1 != null ? inboxButton1 : inboxButton2;

            if (inboxButton != null) {
                ViewGroup parent = (ViewGroup) inboxButton.getParent();

                if (showGhost) {
                    // Remove existing ghost emoji if present
                    if (ghostEmojiView != null && ghostEmojiView.getParent() != null) {
                        ((ViewGroup) ghostEmojiView.getParent()).removeView(ghostEmojiView);
                    }
                    
                    // Create new ghost emoji view if needed
                    if (ghostEmojiView == null || ghostEmojiView.getParent() == null) {
                        ghostEmojiView = new TextView(activity);
                        ghostEmojiView.setText("👻");
                        ghostEmojiView.setTextSize(18);
                        ghostEmojiView.setTextColor(android.graphics.Color.WHITE);
                        ghostEmojiView.setPadding(0, inboxButton.getPaddingTop(), 0, inboxButton.getPaddingBottom());
                        ghostEmojiView.setTranslationY(inboxButton.getTranslationY());

                        // Add ghost emoji next to inbox button
                        int index = parent.indexOfChild(inboxButton);
                        parent.addView(ghostEmojiView, index + 1);
                    }
                    ghostEmojiView.setVisibility(View.VISIBLE);
                } else {
                    // Hide ghost emoji when ghost mode is disabled
                    if (ghostEmojiView != null) {
                        ghostEmojiView.setVisibility(View.GONE);
                    }
                }
            }
        } catch (Exception ignored) {
            // Silently ignore errors to prevent crashes
            // Instagram UI structure may vary across versions
        }
    }

    /**
     * Removes the ghost emoji indicator completely.
     * Called when exiting the activity or cleaning up.
     */
    public static void removeGhostEmoji() {
        try {
            if (ghostEmojiView != null && ghostEmojiView.getParent() != null) {
                ((ViewGroup) ghostEmojiView.getParent()).removeView(ghostEmojiView);
                ghostEmojiView = null;
            }
        } catch (Exception ignored) {
            // Silently ignore errors
        }
    }
}
