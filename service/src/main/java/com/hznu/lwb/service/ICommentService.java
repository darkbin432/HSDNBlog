package com.hznu.lwb.service;

import com.hznu.lwb.model.Comment;
import com.hznu.lwb.model.result.ApiResult;

public interface ICommentService {

    ApiResult insert(Comment comment);

    ApiResult delete(Integer commentId);

    ApiResult selectById(Integer commentId);

    ApiResult selectByBlogId(Integer blogId);

    ApiResult selectByUserId(String userId);
}
