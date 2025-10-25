package instafel.gplayapi

import instafel.gplayapi.utils.AppInfo
import instafel.gplayapi.utils.Log
import okhttp3.OkHttpClient
import okhttp3.Request
import java.io.File
import java.io.FileOutputStream

/**
 * Download Instagram Alpha APK files
 * Usage: Run this with config.properties in the current directory
 */
@Throws(Exception::class)
fun downloadInstagramApk() {
    Log.println("I", "Instagram Alpha APK Downloader")
    
    // Initialize environment
    Env.updateEnvironment()
    Env.updateDeviceProp("gplayapi_px_3a.properties")
    
    // Get Instagram APK info
    val instance = InstafelGplayapiInstance("com.instagram.android")
    val appInfo: AppInfo? = instance.getIgApk()
    
    if (appInfo == null) {
        Log.println("E", "Failed to get Instagram APK information")
        throw Exception("Failed to get Instagram APK information")
    }
    
    Log.println("I", "Instagram version: ${appInfo.getVer_name()}")
    Log.println("I", "Version code: ${appInfo.getVer_code()}")
    
    val client = OkHttpClient()
    
    // Download base APK
    if (appInfo.ifApkExist("base_apk")) {
        val baseUrl = appInfo.getApkUrl("base_apk")
        val baseSize = appInfo.getApkSize("base_apk")
        Log.println("I", "Downloading base APK ($baseSize bytes)...")
        downloadFile(client, baseUrl, "instagram-base.apk")
        Log.println("I", "✓ Base APK saved to instagram-base.apk")
    }
    
    // Download config APK
    if (appInfo.ifApkExist("rconf_apk")) {
        val rconfUrl = appInfo.getApkUrl("rconf_apk")
        val rconfSize = appInfo.getApkSize("rconf_apk")
        Log.println("I", "Downloading config APK ($rconfSize bytes)...")
        downloadFile(client, rconfUrl, "instagram-config.apk")
        Log.println("I", "✓ Config APK saved to instagram-config.apk")
    }
    
    Log.println("I", "Download completed successfully!")
}

private fun downloadFile(client: OkHttpClient, url: String, outputPath: String) {
    val request = Request.Builder().url(url).build()
    
    client.newCall(request).execute().use { response ->
        if (!response.isSuccessful) {
            throw Exception("Failed to download file: HTTP ${response.code}")
        }
        
        val body = response.body ?: throw Exception("Empty response body")
        
        FileOutputStream(File(outputPath)).use { output ->
            body.byteStream().copyTo(output)
        }
    }
}
