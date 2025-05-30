package me.mamiiblt.instafel.patcher.core.utils.patch;

import java.util.List;

import me.mamiiblt.instafel.patcher.core.utils.Log;

public abstract class InstafelPatchGroup {
    public String name, author, description, shortname;
    public List<Class<? extends InstafelPatch>> patches;

    public InstafelPatchGroup() {
        try {
            PInfos.PatchGroupInfo patchInfo = this.getClass().getAnnotation(PInfos.PatchGroupInfo.class);
            if (patchInfo != null) {
                this.name = patchInfo.name();
                this.author = patchInfo.author();
                this.description = patchInfo.desc();
                this.shortname = patchInfo.shortname();
            } else {
                Log.severe("Please add PatchInfoGroup for creating patch groups.");
                System.exit(-1);
            }        
        } catch (Exception e) {
            e.printStackTrace();
            Log.severe("Error while creating InstafelPatchGroup");
            System.exit(-1);
        }
    }

    public abstract List<Class<? extends InstafelPatch>> initializePatches() throws Exception;

    public void loadPatches() throws Exception {
        patches = initializePatches();
    }
}
