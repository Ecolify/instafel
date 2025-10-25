import IFLProjectManager.Config
import com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar

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

tasks.register("build-jar") {
    group = "ifl-gplayapi"
    description = "Builds JAR file"

    dependsOn("shadowJar")

    doLast {
        println("All tasks completed successfully")
    }
}

tasks.register<ShadowJar>("downloaderJar") {
    group = "ifl-gplayapi"
    description = "Builds downloader JAR with DownloadInstagramAlpha main class"
    
    archiveBaseName.set("ifl-gplayapi-downloader")
    archiveClassifier.set("")
    destinationDirectory.set(file("${rootProject.rootDir}/.output"))
    
    manifest {
        attributes["Main-Class"] = "instafel.gplayapi.DownloadInstagramAlphaKt"
    }
    
    from(sourceSets.main.get().output)
    
    configurations = listOf(project.configurations.runtimeClasspath.get())
    
    mergeServiceFiles()
}

tasks.withType<JavaCompile> {
    options.compilerArgs.add("-Xlint:deprecation")
}