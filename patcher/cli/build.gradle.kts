plugins {
    java
    application
    id("com.gradleup.shadow") version "8.3.6"
    id("maven-publish")
}

val libs = rootProject.extra["patcherLibs"] as Map<*, *>
var config = rootProject.extra["instafelConfig"] as Map<*, *>
val projectConfig = config["patcher"] as Map<*, *>
val cliVersion = projectConfig["cli_version"] as String
val projectTag = projectConfig["tag"] as String

val commitHash: String by rootProject.extra

group = "me.mamiiblt.instafel"
version = "v$cliVersion-$commitHash-$projectTag"

repositories {
    mavenCentral()
    google()
    maven("https://jitpack.io")
}

dependencies {
    implementation(libs["org-json"]!!)
    implementation(libs["commons-io"]!!)
    implementation(libs["okhttp"]!!)
    implementation(libs["apktool-lib"]!!)
    implementation(libs["classgraph"]!!)
    implementation(libs["jackson-databind"]!!)
    implementation(libs["jackson-yaml"]!!)
}

application {
    mainClass = "me.mamiiblt.instafel.patcher.cli.Main"
}

tasks.register("clear-cache") {
    val filesToDelete = listOf(
        file("${project.projectDir}/bin"),
        file("${project.projectDir}/build"),
    )

    delete(filesToDelete)
    doLast {
        println("Cache successfully deleted.")
    }
}

tasks.shadowJar {
    archiveBaseName = "ifl-patcher"
    archiveClassifier = ""
    destinationDirectory.set(file("${rootProject.rootDir}/patcher/output"))
    manifest {
        attributes(
            "Patcher-Cli-Version" to cliVersion,
            "Patcher-Cli-Commit" to commitHash,
            "Patcher-Cli-Branch" to "main",
            "Patcher-Cli-Tag" to projectTag
        )
    }

    mustRunAfter("clear-cache")
}

tasks.withType<JavaCompile> {
    options.compilerArgs.add("-Xlint:deprecation")
}

tasks.register("build-jar") {
    dependsOn("clear-cache", "shadowJar")

    doLast {
        delete(file("${project.projectDir}/build"))
        delete(file("${project.projectDir}/bin"))
        println("Temp build caches cleared.")
        println("All build tasks completed successfully")
    }
}