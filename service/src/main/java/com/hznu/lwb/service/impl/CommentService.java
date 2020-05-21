package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.Comment;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.CommentDao;
import com.hznu.lwb.service.ICommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Service
public class CommentService implements ICommentService {

    @Resource
    CommentDao commentDao;

    @Override
    public ApiResult insert(Comment comment) {
        ApiResult apiResult = new ApiResult();
        try {
            commentDao.insert(comment);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增评论失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult delete(Integer commentId) {
        ApiResult apiResult = new ApiResult();
        try {
            commentDao.deleteByPrimaryKey(commentId);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("删除评论失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectById(Integer commentId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(commentDao.selectByPrimaryKey(commentId));
        }catch(Exception e){
            apiResult.fail("获取评论失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByBlogId(Integer blogId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(commentDao.selectByBlogId(blogId));
        }catch(Exception e){
            apiResult.fail("获取评论失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByUserId(String userId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(commentDao.selectByUserId(userId));
        }catch(Exception e){
            apiResult.fail("获取评论失败");
        }
        return apiResult;
    }
}
