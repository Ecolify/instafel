package instafel.patcher.core.utils.modals

import java.io.File

sealed class FileSearchResult {
    data class Success(val file: File) : FileSearchResult()
    data class NotFound(val scannedFiles: Int) : FileSearchResult()
    data class MultipleFound(val files: List<File>) : FileSearchResult()
}
