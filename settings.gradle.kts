import org.gradle.process.ExecResult
import org.gradle.api.tasks.Exec
import org.gradle.api.DefaultTask
import java.io.ByteArrayOutputStream
import java.io.File
import groovy.json.JsonSlurper

rootProject.name = "Instafel"

fun getGitCommitHash(): String {
    val output = ByteArrayOutputStream()
    exec {
        commandLine("git", "rev-parse", "--short", "HEAD")
        standardOutput = output
    }
    return output.toString().trim()
}

val configFile = File(rootDir, "config/ifl_config.json")
val fallbackConfigFile = File(rootDir, "config/example.ifl_config.json")

val jsonData: Map<*, *> = if (configFile.exists()) {
    JsonSlurper().parse(configFile) as Map<*, *>
} else {
    println("Warning: ifl_config.json not found, using example.ifl_config.json instead.")
    JsonSlurper().parse(fallbackConfigFile) as Map<*, *>
}

println("Loaded & exported Instafel project configuration file")

gradle.rootProject {
    extra["commitHash"] = getGitCommitHash()
    extra["instafelConfig"] = jsonData
    extra["patcherLibs"] = mapOf(
        "org-json" to "org.json:json:20240303",
        "commons-io" to "commons-io:commons-io:2.18.0",
        "okhttp" to "com.squareup.okhttp3:okhttp:4.12.0",
        "apktool-lib" to "org.apktool:apktool-lib:2.11.1",
        "classgraph" to "io.github.classgraph:classgraph:4.8.179",
        "jackson-databind" to "com.fasterxml.jackson.core:jackson-databind:2.18.3",
        "jackson-yaml" to "com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.18.3"
    )
}

pluginManagement {
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
}


include(":app")
include(":patcher:cli")
include(":patcher:core")
include(":patcher:mobile")
include(":updater")
include(":website")
include(":gplayapi")