//package com.hznu.utils;
//
//import net.coobird.thumbnailator.Thumbnails;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//import java.io.IOException;
//
///**
// * {NAME}
// *
// * @author hanb
// * @date 03/10/2019
// * @copyright: copyright @ hznuTech 2016
// */
//public class FileUtils {
//
//    public static String saveFile(MultipartFile multipartFile, String dirPath, String fileName) throws IOException {
//        File file = new File(dirPath);
//        if (!file.exists() && !file.isDirectory()) {
//            file.mkdir();
//        }
//        String orginFileName = multipartFile.getOriginalFilename();
//        String fileType = orginFileName.substring(orginFileName.lastIndexOf("."), orginFileName.length());
//
//        String realFileName = fileName + fileType;
//        String realPath = dirPath + File.separator + realFileName;
//        try {
//            multipartFile.transferTo(new File(realPath));
//        } catch (IOException ex) {
//            ex.printStackTrace();
//            throw ex;
//        }
//        return realFileName;
//    }
//
//    public static String saveImageThumb(String realImagePath, String realThumbDir, String thumbName, int width, int height) throws IOException {
//        File file = new File(realThumbDir);
//        if (!file.exists() && !file.isDirectory()) {
//            file.mkdir();
//        }
//        Thumbnails.of(realImagePath).size(width, height).toFile(realThumbDir + File.separator + thumbName);
//        return thumbName;
//    }
//
//    private static boolean checkFilePath(String dirPath) {
//        File filePath = new File(dirPath);
//        return filePath.exists() || filePath.isDirectory() || filePath.mkdirs();
//    }
//}
