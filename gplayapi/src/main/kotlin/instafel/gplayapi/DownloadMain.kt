package instafel.gplayapi

import instafel.gplayapi.utils.ExceptionHandler

/**
 * Main entry point for downloading Instagram Alpha APK
 * This is an alternative to the checker mode
 */
@Throws(Exception::class)
fun main() {
    Thread.setDefaultUncaughtExceptionHandler(ExceptionHandler())
    
    // Download Instagram APK files
    downloadInstagramApk()
}
