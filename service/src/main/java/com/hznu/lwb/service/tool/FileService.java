package com.hznu.lwb.service.tool;

import com.hznu.lwb.model.result.ApiResult;
import com.hznu.utils.GsonUtil;
import com.hznu.utils.UUIDGenerator;
import com.hznu.utils.constant.FileType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import java.io.*;
import java.util.HashMap;

/**
 * @author hanbing
 * @date 16/4/26
 */
@Service
public class FileService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /*config.properties配置路径*/

    @Value("#{config['staticResourceDir']}")
    private String staticResourceDir;
    @Value("#{config['uploadPath']}")
    private String uploadPath;

    private String generatorFileName(MultipartFile file) {

        String fileName = file.getOriginalFilename();
        String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        return UUIDGenerator.getUUID() + fileType;
    }

    public ApiResult fileUpload2(String fileType, MultipartFile file) {

        ApiResult apiResult = new ApiResult();

        try {
            //文件名
            String fileName = generatorFileName(file);

            String uploadType;

            //文件类型
            switch (fileType) {
                case FileType.UPLOAD_TYPE_IMAGE:
                    uploadType = FileType.PATH_IMAGE;
                    break;
                case FileType.UPLOAD_TYPE_AUDIO:
                    uploadType=FileType.PATH_VIDEO;
                    break;
                case FileType.UPLOAD_TYPE_MAIL:
                    uploadType=FileType.PATH_MAIL;
                    break;
                case FileType.UPLOAD_TYPE_PDF:
                    uploadType=FileType.PATH_PDF;
                    break;
                case FileType.UPLOAD_TYPE_OTHERS:
                    uploadType=FileType.PATH_OTHERS;
                    break;
                default:
                    throw new Exception("上传类型未定义");
            }

            /*相对路径*/
            String relativePath = uploadPath + uploadType;

            /*绝对路径*/
            String dirPath = staticResourceDir + relativePath;

            /*路径检测*/
            checkDirPath(dirPath);

            /*文件路径*/
            String realFilePath = dirPath + fileName;
            File targetFile = new File(realFilePath);


            /*保存*/
            file.transferTo(targetFile);

            if (targetFile.isFile()) {
                logger.debug("原始文件上传成功");
            } else {
                throw new Exception("原始文件上传失败");
            }

            HashMap<String, Object> param = new HashMap<>(1);
            param.put("fileName", fileName);
            /*返回文件名*/
            apiResult.success(param);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            apiResult.fail("上传失败");
            return apiResult;
        }

        return apiResult;
    }

    private void checkDirPath(String dirPath) throws Exception {
        File dirFile = new File(dirPath);

        if (!dirFile.exists() && !dirFile.isDirectory()) {
            if (!dirFile.mkdirs()) {
                throw new Exception("上传目录创建失败");
            }
        }
    }

    /**
     * 上传base64图片
     *
     * @param fileName  文件名
     * @param imgBase64 base64数据
     * @return 图片绝对路径
     */
    public String uploadImgBase64(String fileName, String imgBase64, String dirPath) {
        String relativeImagePath = uploadPath + dirPath;
        String realDirPath = staticResourceDir + relativeImagePath;
        String realFilePath = realDirPath + fileName;

        try {

            checkDirPath(realDirPath);
            logger.debug(relativeImagePath);

            //Base64解码
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] b = decoder.decodeBuffer(imgBase64);
            for (int i = 0; i < b.length; ++i) {
                //调整异常数据
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            //生成图片
            OutputStream out = new FileOutputStream(realFilePath);
            out.write(b);
            out.flush();
            out.close();

            return relativeImagePath + fileName;
        } catch (Exception ex) {
            logger.error("图片保存失败", ex);
        }
        return null;
    }
}

