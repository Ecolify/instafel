plugins {
    alias(libs.plugins.android.application)
}

/************************************************/
/* BUILD CONFIG INITIALIZATION PASHE */

var config = rootProject.extra["instafelConfig"] as Map<*, *>
val projectConfig = config[project.name] as Map<*, *>
val androidConfig = projectConfig["androidConfig"] as Map<*, *>
val keystoreConfig = androidConfig["keystore"] as Map<*, *>

val commitHash: String by rootProject.extra

group = "me.mamiiblt.instafel"

/************************************************/

repositories {
    google {
        content {
            includeGroupByRegex("com\\.android.*")
            includeGroupByRegex("com\\.google.*")
            includeGroupByRegex("androidx.*")
        }
    }
    mavenCentral()
    gradlePluginPortal()
    maven("https://jitpack.io")
}

android {
    namespace = "me.mamiiblt.instafel"
    compileSdk = 34

    defaultConfig {
        applicationId = "me.mamiiblt.instafel"
        minSdk = 28
        targetSdk = 34
        versionCode = 1 // it doesn't matter
        versionName = "$commitHash" // it doesn't matter

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    signingConfigs{
        create("release") {
            storeFile = File(rootDir, keystoreConfig["ksPath"] as String)
            storePassword = keystoreConfig["ksKeyPass"] as String
            keyAlias = keystoreConfig["ksAlias"] as String
            keyPassword = keystoreConfig["ksPass"] as String
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("release")
        }
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
}

tasks.register("generate-app-debug") {
    dependsOn("clear-cache", "assembleDebug")

    doLast {
        val outputName = "ifl-app-$commitHash-debug.apk"
        file("${project.projectDir}/build/outputs/apk/debug/instafel.app-debug.apk")
            .copyTo(file("${project.projectDir}/output/$outputName"), overwrite = true)
        println("APK successfully copied: $outputName")

        delete("${project.projectDir}/build")
        println("Build caches cleared.")
        println("All tasks completed succesfully")
    }
}

tasks.register("generate-app-release") {
    dependsOn("clear-cache", "assembleRelease")

    doLast {
        val outputName = "ifl-app-$commitHash-release.apk"
        file("${project.projectDir}/build/outputs/apk/release/instafel.app-release.apk")
            .copyTo(file("${project.projectDir}/output/$outputName"), overwrite = true)
        println("APK successfully copied: $outputName")

        delete("${project.projectDir}/build")
        println("Build caches cleared.")
        println("All tasks completed succesfully")
    }
}

tasks.register("clear-cache") {
    val filesToDelete = listOf(
        file("${project.projectDir}/build"),
        file("${project.projectDir}/output"),
    )

    delete(filesToDelete)
    doLast {
        println("Cache successfully deleted.")
    }
}

dependencies {
    implementation(libs.appcompat)
    implementation(libs.material)
    implementation(libs.activity)
    implementation(libs.constraintlayout)
    testImplementation(libs.junit)
    androidTestImplementation(libs.ext.junit)
    androidTestImplementation(libs.espresso.core)
}