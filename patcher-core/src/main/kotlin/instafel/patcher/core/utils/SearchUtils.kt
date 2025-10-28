package instafel.patcher.core.utils

import instafel.patcher.core.utils.modals.FileSearchResult
import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel
import org.apache.commons.io.FileUtils
import org.apache.commons.io.filefilter.SuffixFileFilter
import org.apache.commons.io.filefilter.TrueFileFilter
import java.io.File
import java.util.concurrent.atomic.AtomicInteger

object SearchUtils {

    fun getXIterators(smaliFolders: Array<File>): List<Collection<File>> {
        return smaliFolders.mapNotNull { smaliFolder ->
            if (smaliFolder.exists() && smaliFolder.isDirectory) {
                FileUtils.listFiles(
                    File(smaliFolder, "X"),
                    SuffixFileFilter(".smali"),
                    TrueFileFilter.INSTANCE
                )
            } else {
                null
            }
        }
    }

    /**
     * Find a file by its class path (e.g., "com/instagram/api/tigon/TigonServiceLayer")
     * Searches across all smali folders for non-obfuscated classes
     * 
     * @param smaliUtils The SmaliUtils instance with smali folders
     * @param classPath The class path to search for (e.g., "com/instagram/api/tigon/TigonServiceLayer")
     * @return FileSearchResult with the found file or error
     */
    fun findFileByClassPath(
        smaliUtils: SmaliUtils,
        classPath: String
    ): FileSearchResult {
        val fileName = "$classPath.smali"
        val foundFiles = mutableListOf<File>()

        // Search in all smali folders
        for (smaliFolder in smaliUtils.smaliFolders) {
            val targetFile = File(smaliFolder, fileName)
            if (targetFile.exists() && targetFile.isFile) {
                foundFiles.add(targetFile)
            }
        }

        return when {
            foundFiles.isEmpty() -> {
                Log.severe("File not found for class path: $classPath")
                FileSearchResult.NotFound(0)
            }
            foundFiles.size == 1 -> {
                Log.info("Class file found: ${Utils.makeSmaliPathShort(foundFiles[0])}")
                FileSearchResult.Success(foundFiles[0])
            }
            else -> {
                Log.severe("Multiple files found for class path $classPath: ${foundFiles.size}")
                FileSearchResult.MultipleFound(foundFiles)
            }
        }
    }

    suspend fun getFileContainsAllCords(
        smaliUtils: SmaliUtils,
        searchConditions: List<List<String>>
    ): FileSearchResult = withContext(Dispatchers.IO) {

        val threadCount = Utils.getSuggestedThreadCount()
        val startTime = System.currentTimeMillis()
        val foundFiles = Channel<File>(Channel.UNLIMITED)
        val allFiles = mutableListOf<File>()
        getXIterators(smaliUtils.smaliFolders).forEach { fileCollection ->
            allFiles.addAll(fileCollection)
        }

        val totalFiles = allFiles.size
        Log.info("Totally $totalFiles file got listed in X folder(s)")

        val chunkSize = (totalFiles / threadCount) + 1
        val chunks = allFiles.chunked(chunkSize)

        val processedFiles = AtomicInteger(0)
        val foundCount = AtomicInteger(0)

        val jobs = chunks.mapIndexed { chunkIndex, chunk ->
            async {
                var chunkFoundCount = 0
                var chunkProcessedCount = 0

                chunk.forEach { file ->
                    try {
                        val fContent = smaliUtils.getSmaliFileContent(file.absolutePath)
                        val passStatuses = BooleanArray(searchConditions.size)

                        for (line in fContent) {
                            searchConditions.forEachIndexed { i, lineConditions ->
                                if (lineConditions.all { condition ->
                                        line.contains(condition)
                                    }) {
                                    passStatuses[i] = true
                                }
                            }
                            if (passStatuses.all { it }) break
                        }

                        if (passStatuses.all { it }) {
                            Log.info("Found a file, ${Utils.makeSmaliPathShort(file)} by T$chunkIndex")
                            foundFiles.send(file)
                            chunkFoundCount++
                            foundCount.incrementAndGet()
                        }

                    } catch (e: Exception) {
                        Log.severe("IO/Read Error [Thread $chunkIndex]: ${file.absolutePath} - ${e.message}")
                    }

                    chunkProcessedCount++
                    processedFiles.incrementAndGet()
                }
                chunkFoundCount
            }
        }

        jobs.awaitAll()
        foundFiles.close()

        val resultFiles = mutableListOf<File>()
        for (file in foundFiles) {
            resultFiles.add(file)
        }

        val totalTime = (System.currentTimeMillis() - startTime) / 1000.0
        Log.info("Search process ran with $threadCount threads in ${totalTime}s totally ($totalFiles file processed)")

        when {
            resultFiles.isEmpty() -> {
                Log.severe("No files found for apply patch.")
                return@withContext FileSearchResult.NotFound(0)
            }
            resultFiles.size == 1 -> {
                Log.info("Class ${Utils.makeSmaliPathShort(resultFiles[0])} meets all requirements")
                return@withContext FileSearchResult.Success(resultFiles[0])
            }
            else -> {
                Log.severe("Found more files than one (${resultFiles.size}) for apply patch, add more condition for find correct file.")
                return@withContext FileSearchResult.MultipleFound(resultFiles)
            }
        }
    }
}