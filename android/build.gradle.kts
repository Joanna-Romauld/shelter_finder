allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
plugins {
    id("com.android.application") version "8.4.0" apply false  // Android build tools
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false  // Kotlin support
    id("com.google.gms.google-services") version "4.4.3" apply false  // Firebase plugin

}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
