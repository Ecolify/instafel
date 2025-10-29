package instafel.app.utils;

import android.view.View;

/**
 * Long-click listener that opens the Instafel menu.
 * 
 * This class is referenced by the AddLongClickEvent patch which modifies Instagram's
 * profile view to trigger the Instafel menu when long-pressing the username.
 * 
 * IMPORTANT: This file must be located at app/utils/OpenIflMenu.smali in ifl_sources.zip
 * to match the package path instafel.app.utils. If placed incorrectly, it will cause
 * NoClassDefFoundError at runtime.
 * 
 * @see instafel.patcher.core.patches.general.AddLongClickEvent
 */
public class OpenIflMenu implements View.OnLongClickListener {
    public OpenIflMenu() {
        super();
    }

    @Override
    public boolean onLongClick(View view) {
        InitializeInstafel.startInstafel();
        return true;
    }
}
