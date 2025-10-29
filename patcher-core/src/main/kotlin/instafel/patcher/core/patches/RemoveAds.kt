package instafel.patcher.core.patches

import instafel.patcher.core.utils.SearchUtils
import instafel.patcher.core.utils.modals.FileSearchResult
import instafel.patcher.core.utils.patch.InstafelPatch
import instafel.patcher.core.utils.patch.InstafelTask
import instafel.patcher.core.utils.patch.PInfos
import kotlinx.coroutines.runBlocking
import org.apache.commons.io.FileUtils
import java.io.File

/**
 * Remove Ads - Blocks sponsored content from appearing in Instagram feed
 * 
 * REFERENCE: InstaEclipse AdBlocker.java
 * - Hooks methods containing "SponsoredContentController.insertItem" string
 * - Returns false to prevent ad insertion
 * 
 * IMPLEMENTATION:
 * This patch finds the method containing "SponsoredContentController.insertItem" 
 * and injects an early return with false value to block ads from being inserted.
 * 
 * Thanks to ReVanced developers for making this patch possible!
 */
@PInfos.PatchInfo(
    name = "Remove Ads",
    shortname = "remove_ads",
    desc = "Remove Ads in Instagram",
    isSingle = true
)
class RemoveAds: InstafelPatch() {

    lateinit var removeAdsFile: File

    override fun initializeTasks() = mutableListOf(
        @PInfos.TaskInfo("Find source file")
        object: InstafelTask() {
            override fun execute() {
                when (val result = runBlocking {
                    SearchUtils.getFileContainsAllCords(smaliUtils,
                        listOf(
                            listOf("SponsoredContentController.insertItem"),
                        ))
                }) {
                    is FileSearchResult.Success -> {
                        removeAdsFile = result.file
                        success("Remove ads source class found successfully")
                    }
                    is FileSearchResult.NotFound -> {
                        failure("Patch aborted because no any classes found.")
                    }
                    is FileSearchResult.MultipleFound -> {
                        failure("Patch aborted: Found ${result.files.size} candidate files. Need more specific search conditions.")
                    }
                }
            }
        },
        @PInfos.TaskInfo("Change method return to block ads")
        object: InstafelTask() {
            override fun execute() {
                val fContent = smaliUtils.getSmaliFileContent(removeAdsFile.absolutePath).toMutableList()
                var methodLine = -1

                fContent.forEachIndexed { index, line ->
                    if (line.contains("SponsoredContentController.insertItem")) {
                        for (i in index downTo 0) {
                            if (fContent[i].contains(".method")) {
                                methodLine = i
                                break
                            }
                        }
                        if (methodLine != -1) return@forEachIndexed
                    }
                }

                if (methodLine != -1) {
                    // CRITICAL FIX: Return false (0x0) instead of true (0x1) to block ads
                    // This matches InstaEclipse's AdBlocker.java which uses param.setResult(false)
                    val lines = listOf(
                        "",
                        "    # Remove Ads - Block sponsored content insertion",
                        "    # Return false to prevent ad from being inserted",
                        "    const/4 v0, 0x0",
                        "",
                        "    return v0"
                    )

                    fContent.add(methodLine + 2, lines.joinToString("\n"))
                    FileUtils.writeLines(removeAdsFile, fContent)
                    success("Ad blocking return successfully applied (returns false to block ads)")
                } else {
                    failure("Required method cannot be found.")
                }
            }
        }
    )
}