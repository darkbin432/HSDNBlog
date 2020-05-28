package com.hznu.lwb.api;

import com.hznu.lwb.model.File;
import com.hznu.lwb.model.UserDownloadFileKey;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.service.IFileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Controller
@RequestMapping("/api")
public class MyFileController {

    @Resource
    private IFileService myfileService;

    @RequestMapping(value = "/selectFileByName",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectFileByName(String fileName){
        ApiResult apiResult = myfileService.selectByPrimaryKey(fileName);
        return apiResult;
    }

    @RequestMapping(value = "/selectFileByUploader",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectFileByUploader(String uploaderId){
        ApiResult apiResult = myfileService.selectByUploader(uploaderId);
        return apiResult;
    }

    @RequestMapping(value = "/insertFile",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertFile(File file){
        ApiResult apiResult = myfileService.insert(file);
        return apiResult;
    }

    @RequestMapping(value = "/deleteFile",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deleteFile(String fileName){
        ApiResult apiResult = myfileService.delete(fileName);
        return apiResult;
    }

    @RequestMapping(value = "/insertDownloadRecord",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertDownloadRecord(UserDownloadFileKey userDownloadFileKey){
        ApiResult apiResult = myfileService.insertRecord(userDownloadFileKey);
        return apiResult;
    }

    @RequestMapping(value = "/selectDownloadRecord",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectDownloadRecord(String userId){
        ApiResult apiResult = myfileService.selectRecord(userId);
        return apiResult;
    }

}
