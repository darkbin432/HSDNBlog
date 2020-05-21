package com.hznu.lwb.service;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.param.BlogParam;
import com.hznu.lwb.model.result.ApiResult;

public interface IBlogService {

    ApiResult insert(Blog blog);

    ApiResult delete(Integer blogId);

    ApiResult update(Blog blog);

    ApiResult selectById(Integer blogId);

    ApiResult selectByCondition(BlogParam blogParam);
}
