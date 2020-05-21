package com.hznu.lwb.api;

import com.hznu.lwb.model.Comment;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.service.ICommentService;
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
public class CommentController {
    
    @Resource
    private ICommentService commentService;  

    @RequestMapping(value = "/selectCommentById",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectCommentById(Integer commentId){
        ApiResult apiResult = commentService.selectById(commentId);
        return apiResult;
    }

    @RequestMapping(value = "/insertComment",method = RequestMethod.POST)
    @ResponseBody
    public ApiResult insertComment(Comment comment){
        ApiResult apiResult = commentService.insert(comment);
        return apiResult;
    }

    @RequestMapping(value = "/deleteComment",method = RequestMethod.DELETE)
    @ResponseBody
    public ApiResult deleteComment(Integer commentId){
        ApiResult apiResult = commentService.delete(commentId);
        return apiResult;
    }

    @RequestMapping(value = "/selectCommentByUserId",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectCommentByUserId(String userId){
        ApiResult apiResult = commentService.selectByUserId(userId);
        return apiResult;
    }

    @RequestMapping(value = "/selectCommentByBlogId",method = RequestMethod.GET)
    @ResponseBody
    public ApiResult selectCommentByBlogId(Integer blogId){
        ApiResult apiResult = commentService.selectByBlogId(blogId);
        return apiResult;
    }
}
