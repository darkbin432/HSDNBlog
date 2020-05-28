package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.File;
import com.hznu.lwb.model.UserDownloadFileKey;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.FileDao;
import com.hznu.lwb.service.IFileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Service
public class MyFileService implements IFileService {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    FileDao fileDao;

    @Override
    public ApiResult insert(File file) {
        ApiResult apiResult = new ApiResult();
        try {
            fileDao.insert(file);
            apiResult.success();
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            apiResult.fail("新增上传文件失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByPrimaryKey(String fileName) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(fileDao.selectByPrimaryKey(fileName));
        }catch (Exception e){
            apiResult.fail("获取上传文件失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByUploader(String uploaderId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(fileDao.selectByUploader(uploaderId));
        }catch (Exception e){
            apiResult.fail("获取文件失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult delete(String fileName) {
        ApiResult apiResult = new ApiResult();
        try {
            fileDao.deleteByPrimaryKey(fileName);
            apiResult.success();
        }catch (Exception e){
            apiResult.fail("删除上传文件失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult insertRecord(UserDownloadFileKey userDownloadFileKey) {
        ApiResult apiResult = new ApiResult();
        try {
            fileDao.insertRecord(userDownloadFileKey);
            apiResult.success();
        }catch (Exception e){
            apiResult.fail("新增下载文件记录失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectRecord(String userId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(fileDao.selectRecord(userId));
        }catch (Exception e){
            apiResult.fail("获取下载文件记录失败");
        }
        return apiResult;
    }
}
