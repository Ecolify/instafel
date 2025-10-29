package instafel.app.utils;

import android.view.View;

/**
 * Long-click listener that opens the Instafel menu.
 * 
 * This class is referenced by the AddLongClickEvent patch which modifies Instagram's
 * profile view to trigger the Instafel menu when long-pressing the username.
 * 
 * IMPORTANT: 
 * - This file must be located at app/utils/OpenIflMenu.smali in ifl_sources.zip
 *   to match the package path instafel.app.utils. If placed incorrectly, it will cause
 *   NoClassDefFoundError at runtime.
 * - This class MUST be placed in the primary DEX because it is referenced by
 *   UserDetailFragment, which is in the primary DEX. The CopyInstafelSources patch
 *   handles this automatically by moving OpenIflMenu to the primary DEX during patching.
 * 
 * @see instafel.patcher.core.patches.general.AddLongClickEvent
 * @see instafel.patcher.core.patches.general.CopyInstafelSources
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
