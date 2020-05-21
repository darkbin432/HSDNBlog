package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.PraiseKey;
import com.hznu.lwb.model.param.BlogParam;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.BlogDao;
import com.hznu.lwb.persistence.PraiseDao;
import com.hznu.lwb.service.IBlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 斌
 */
@Service
public class BlogService implements IBlogService {

    @Resource
    BlogDao blogDao;

    @Resource
    PraiseDao praiseDao;

    @Override
    public ApiResult insert(Blog blog) {
        ApiResult apiResult = new ApiResult();
        try {
            blogDao.insert(blog);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增博客失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult delete(Integer blogId) {
        ApiResult apiResult = new ApiResult();
        try {
            blogDao.deleteByPrimaryKey(blogId);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("删除博客失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult update(Blog blog) {
        ApiResult apiResult = new ApiResult();
        try {
            blogDao.updateByPrimaryKeySelective(blog);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("更新博客失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectById(Integer blogId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(blogDao.selectByPrimaryKey(blogId));
        }catch(Exception e){
            apiResult.fail("获取博客失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult selectByCondition(BlogParam blogParam) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(blogDao.selectByCondition(blogParam));
        }catch(Exception e){
            apiResult.fail("搜索博客失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult insertPraise(PraiseKey praiseKey) {
        ApiResult apiResult = new ApiResult();
        try {
            praiseDao.insert(praiseKey);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("新增点赞失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult deletePraise(PraiseKey praiseKey) {
        ApiResult apiResult = new ApiResult();
        try {
            praiseDao.deleteByPrimaryKey(praiseKey);
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("删除点赞失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult countPraise(Integer blogId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.setData(praiseDao.count(blogId));
            apiResult.success();
        }catch(Exception e){
            apiResult.fail("获取点赞数失败");
        }
        return apiResult;
    }
}
