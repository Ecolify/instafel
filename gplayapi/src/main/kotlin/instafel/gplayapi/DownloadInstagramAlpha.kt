package instafel.gplayapi

import instafel.gplayapi.utils.Log
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream
import kotlin.system.exitProcess

/**
 * Simple downloader for Instagram Alpha APK
 * Usage: java -jar gplayapi.jar <output-filename>
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
        val baseUrl = appInfo.getApkUrl("base_apk")
        val baseSize = appInfo.getApkSize("base_apk")
        
        Log.println("I", "Downloading base APK (${baseSize / 1024 / 1024} MB) to: $outputFilename")
        
        val request = Request.Builder()
            .url(baseUrl)
            .build()
        
        client.newCall(request).execute().use { response ->
            if (!response.isSuccessful) {
                throw Exception("Failed to download APK: HTTP ${response.code}")
            }
            
            val outputFile = File(outputFilename)
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
