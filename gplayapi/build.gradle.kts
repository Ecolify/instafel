import IFLProjectManager.Config

plugins {
    java
    application
    alias(libs.plugins.shadowjar)
    alias(libs.plugins.kotlin.jvm)
}

group = "gplayapi"
version = "v${Config.gplayapi.version}-${Config.gplayapi.tag}"

dependencies {
    implementation(libs.kotlin.stdlib)
    implementation(libs.gplayapi)
    implementation(libs.org.json)
    implementation(libs.okhttp)
}

application {
    mainClass = "instafel.gplayapi.MainKt"
}

tasks.shadowJar {
    archiveBaseName = "ifl-gplayapi"
    archiveClassifier = ""
    destinationDirectory.set(file("${rootProject.rootDir}/.output"))

    doLast {
        println("JAR generated.")
    }
}

tasks.register<com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar>("downloadJar") {
    group = "ifl-gplayapi"
    description = "Builds downloader JAR file"
    
    archiveBaseName = "ifl-gplayapi-downloader"
    archiveClassifier = ""
    destinationDirectory.set(file("${rootProject.rootDir}/.output"))
    
    manifest {
        attributes["Main-Class"] = "instafel.gplayapi.DownloadMainKt"
    }
    
    from(sourceSets.main.get().output)
    configurations = listOf(project.configurations.runtimeClasspath.get())
}

tasks.register("build-jar") {
    group = "ifl-gplayapi"
    description = "Builds JAR file"

    dependsOn("shadowJar")

    doLast {
        println("All tasks completed successfully")
    }
}

tasks.register("build-downloader") {
    group = "ifl-gplayapi"
    description = "Builds downloader JAR file"
    
    dependsOn("downloadJar")
    
    doLast {
        println("Downloader JAR built successfully")
    }
}

tasks.withType<JavaCompile> {
    options.compilerArgs.add("-Xlint:deprecation")
}