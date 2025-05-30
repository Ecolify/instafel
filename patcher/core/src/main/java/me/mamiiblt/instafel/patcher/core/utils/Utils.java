package me.mamiiblt.instafel.patcher.core.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;

public class Utils {

    public static String mergePaths(String basePath, String... args) {
        return Paths.get(basePath, args).toString();
    }

    public static void copyResourceToFile(String resourcePath, File destFile) throws IOException {
        try (InputStream inputStream = Utils.class.getResourceAsStream(resourcePath);
            FileOutputStream outputStream = new FileOutputStream(destFile)) {

            if (inputStream == null) {
                throw new FileNotFoundException("Resource not found: " + resourcePath);
            }

            byte[] buffer = new byte[1024];
            int length;
            while ((length = inputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }
        }
    }

    public static class OSDedector {
        private static String OS = System.getProperty("os.name").toLowerCase();
    
        public static boolean isWindows() {
            return OS.contains("win");
        } 
    
        public static boolean isMac() {
            return OS.contains("mac");
        }
    
        public static boolean isUnix() {
            return OS.contains("nix") || OS.contains("nux") || OS.contains("aix") || OS.contains("sunos");
        }
    
        public static String getOS() {
            return OS;
        }
    }  

    public static void deleteDirectory(String path) throws IOException{
        File file = new File(path);
        if (file.exists()) {
            FileUtils.deleteDirectory(file);
        }
    }

    public static void unzipFromResources(boolean showLog, String zipFilePath, String destDirectory) throws IOException {
        File destDir = new File(destDirectory);
        if (!destDir.exists()) destDir.mkdirs();

        try (ZipInputStream zipIn = new ZipInputStream(Utils.class.getResourceAsStream(zipFilePath))) {
            ZipEntry entry;
            while ((entry = zipIn.getNextEntry()) != null) {
                File file = new File(destDirectory, entry.getName());
                if (entry.isDirectory()) {
                    file.mkdirs();
                } else {
                    file.getParentFile().mkdirs();
                    try (BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file))) {
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = zipIn.read(buffer)) != -1) {
                            bos.write(buffer, 0, bytesRead);
                        }
                    }
                }
                if (showLog == true) {
                    Log.info("Copying " + file.getName());
                }
                zipIn.closeEntry();
            }
        }
    }

    public static String getFileMD5(File file) {
        try (InputStream fis = new FileInputStream(file)) {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                md.update(buffer, 0, bytesRead);
            }

            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (Exception e) {
            e.printStackTrace();
            Log.info("Error while creating MD5 hash for " + file.getName());
            return null;
        }
    }

    public static void zipDirectory(Path sourceDir, Path zipFilePath) throws IOException {
        try (ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zipFilePath.toFile()))) {
            Files.walk(sourceDir)
                 .forEach(path -> {
                     String zipEntryName = sourceDir.relativize(path).toString().replace("\\", "/");
                     try {
                         if (Files.isDirectory(path)) {
                             if (!zipEntryName.isEmpty()) {
                                 zipOutputStream.putNextEntry(new ZipEntry(zipEntryName + "/"));
                                 zipOutputStream.closeEntry();
                             }
                         } else {
                             zipOutputStream.putNextEntry(new ZipEntry(zipEntryName));
                             Files.copy(path, zipOutputStream);
                             zipOutputStream.closeEntry();
                         }
                     } catch (IOException e) {
                         e.printStackTrace();
                     }
                 });
        }
    }

}
