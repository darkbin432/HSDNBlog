package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.Notice;
import com.hznu.lwb.model.UserViewNoticeKey;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.NoticeDao;
import com.hznu.lwb.service.INoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Service
public class NoticeService implements INoticeService {

    @Resource
    NoticeDao noticeDao;

    @Override
    public ApiResult insertNotice(Notice notice) {
        ApiResult apiResult = new ApiResult();
        try {
            noticeDao.insert(notice);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增公告失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult insertRelation(UserViewNoticeKey userViewNoticeKey) {
        ApiResult apiResult = new ApiResult();
        try {
            noticeDao.insertRelation(userViewNoticeKey);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增用户公告关系失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult deleteNotice(Integer noticeId) {
        ApiResult apiResult = new ApiResult();
        try {
            noticeDao.deleteByPrimaryKey(noticeId);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("删除公告失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult updateNotice(Notice notice) {
        ApiResult apiResult = new ApiResult();
        try {
            noticeDao.updateByPrimaryKeySelective(notice);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("更新公告失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByPrimaryKey(Integer noticeId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(noticeDao.selectByPrimaryKey(noticeId));
        }catch(Exception e){
            apiResult.fail("获取公告失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByAdmin(String userId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(noticeDao.selectByAdmin(userId));
        }catch(Exception e){
            apiResult.fail("管理员获取公告失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByUser(String userId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(noticeDao.selectByUser(userId));
        }catch(Exception e){
            apiResult.fail("用户获取公告失败");
        }
        return apiResult;
    }
}
