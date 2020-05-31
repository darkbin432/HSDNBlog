package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.Letter;
import com.hznu.lwb.model.param.LetterParam;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.LetterDao;
import com.hznu.lwb.service.ILetterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Service
public class LetterService implements ILetterService {

    @Resource
    LetterDao letterDao;

    @Override
    public ApiResult insert(Letter letter) {
        ApiResult apiResult = new ApiResult();
        try {
            letterDao.insert(letter);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增私信失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult delete(Integer letterId) {
        ApiResult apiResult = new ApiResult();
        try {
            letterDao.deleteByPrimaryKey(letterId);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("删除私信失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectUserId(String senderId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(letterDao.selectUserId(senderId));
        }catch(Exception e){
            apiResult.fail("获取私信失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByBoth(LetterParam letterParam) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(letterDao.selectByBoth(letterParam));
        }catch(Exception e){
            apiResult.fail("获取私信失败");
        }
        return apiResult;
    }
}
