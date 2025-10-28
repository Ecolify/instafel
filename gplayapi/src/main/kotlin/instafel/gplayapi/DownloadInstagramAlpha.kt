package instafel.gplayapi

import instafel.gplayapi.utils.Log
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import kotlin.system.exitProcess

/**
 * Downloads a single APK file from a URL
 */
fun downloadApkFile(client: OkHttpClient, url: String, outputPath: String, size: Long) {
    Log.println("I", "Downloading to: $outputPath (${size / 1024 / 1024} MB)")
    
    val request = Request.Builder()
        .url(url)
        .build()
    
    client.newCall(request).execute().use { response ->
        if (!response.isSuccessful) {
            throw Exception("Failed to download APK: HTTP ${response.code}")
        }
        
        val outputFile = File(outputPath)
        var downloadedBytes = 0L
        
        FileOutputStream(outputFile).use { output ->
            val inputStream = response.body.byteStream()
            val buffer = ByteArray(8192)
            var bytes: Int
            
            while (inputStream.read(buffer).also { bytes = it } != -1) {
                output.write(buffer, 0, bytes)
                downloadedBytes += bytes
                
                if (downloadedBytes % (1024 * 1024 * 10) == 0L) {
                    Log.println("I", "Downloaded ${downloadedBytes / 1024 / 1024} MB...")
                }
            }
        }
        
        Log.println("I", "Download complete! File saved as: ${outputFile.absolutePath}")
        Log.println("I", "File size: ${outputFile.length() / 1024 / 1024} MB")
    }
}

/**
 * Simple downloader for Instagram Alpha APK
 * Usage: java -jar gplayapi.jar <output-filename>
 * 
 * This downloads all APK splits and saves them to a directory.
 * The splits are then merged into a single APK using the merge-splits script.
 */
fun downloadInstagramAlpha(outputFilename: String = "instagram-alpha.apk") {
    try {
        Log.println("I", "Instafel GPlayAPI - Instagram Alpha Downloader")
        
        // Load email & aas token from config.properties
        Env.updateEnvironment()
        // Set device config
        Env.updateDeviceProp("gplayapi_px_3a.properties")
        
        Log.println("I", "Fetching Instagram Alpha APK information...")
        val instance = InstafelGplayapiInstance("com.instagram.android")
        val appInfo = instance.getIgApk()
        
        if (appInfo == null) {
            Log.println("E", "Could not find Instagram Alpha APK")
            exitProcess(-1)
        }
        
        Log.println("I", "Found Instagram ${appInfo.getVer_name()} (${appInfo.getVer_code()})")
        
        if (!appInfo.ifApkExist("base_apk")) {
            Log.println("E", "Base APK URL not found")
            exitProcess(-1)
        }
        
        val client = OkHttpClient()
        
        // Create a directory for splits
        val splitsDir = File("instagram-splits")
        if (splitsDir.exists()) {
            splitsDir.deleteRecursively()
        }
        splitsDir.mkdirs()
        
        // Get all split names from appInfo
        val rawJson = appInfo.getRawJson()
        val splitNames = mutableListOf<String>()
        
        rawJson.keys().forEach { key ->
            if (key.toString().endsWith("_apk") || key.toString().startsWith("config_") || key.toString() == "base_apk") {
                splitNames.add(key.toString())
            }
        }
        
        Log.println("I", "Found ${splitNames.size} APK splits to download")
        
        // Download all splits
        splitNames.forEach { splitName ->
            val url = appInfo.getApkUrl(splitName)
            val size = appInfo.getApkSize(splitName)
            val splitFilename = "${splitName}.apk"
            val splitPath = File(splitsDir, splitFilename).absolutePath
            
            Log.println("I", "Downloading split: $splitName")
            downloadApkFile(client, url, splitPath, size)
        }
        
        Log.println("I", "All splits downloaded successfully to: ${splitsDir.absolutePath}")
        Log.println("I", "Split APKs must be merged before installation to avoid INSTALL_FAILED_MISSING_SPLIT errors")
        
    } catch (e: Exception) {
        e.printStackTrace()
        Log.println("E", "Error during download: ${e.message}")
        exitProcess(-1)
    }
}

fun main(args: Array<String>) {
    val outputFilename = if (args.isNotEmpty()) args[0] else "instagram-alpha.apk"
    downloadInstagramAlpha(outputFilename)
}
