package com.hznu.lwb.api;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.PraiseKey;
import com.hznu.lwb.model.param.BlogParam;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.service.IBlogService;
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
public class BlogController {

    @Resource
    private IBlogService blogService;

    @RequestMapping(value = "/selectBlogById",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectBlogById(Integer blogId){
        ApiResult apiResult = blogService.selectById(blogId);
        return apiResult;
    }

    @RequestMapping(value = "/insertBlog",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertBlog(Blog blog){
        ApiResult apiResult = blogService.insert(blog);
        return apiResult;
    }

    @RequestMapping(value = "/updateBlog",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult updateBlog(Blog blog){
        ApiResult apiResult = blogService.update(blog);
        return apiResult;
    }

    @RequestMapping(value = "/deleteBlog",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deleteBlog(Integer blogId){
        ApiResult apiResult = blogService.delete(blogId);
        return apiResult;
    }

    @RequestMapping(value = "/selectBlogByCondition",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectBlogByCondition(BlogParam blogParam){
        ApiResult apiResult = blogService.selectByCondition(blogParam);
        return apiResult;
    }

    @RequestMapping(value = "/insertPraise",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertPraise(PraiseKey praiseKey){
        ApiResult apiResult = blogService.insertPraise(praiseKey);
        return apiResult;
    }

    @RequestMapping(value = "/deletePraise",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deletePraise(PraiseKey praiseKey){
        ApiResult apiResult = blogService.deletePraise(praiseKey);
        return apiResult;
    }

    @RequestMapping(value = "/countPraise",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult countPraise(Integer blogId){
        ApiResult apiResult = blogService.countPraise(blogId);
        return apiResult;
    }
}
