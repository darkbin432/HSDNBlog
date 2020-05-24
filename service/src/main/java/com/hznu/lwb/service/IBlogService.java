package com.hznu.lwb.service;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.PraiseKey;
import com.hznu.lwb.model.param.BlogParam;
import com.hznu.lwb.model.result.ApiResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface IBlogService {

    ApiResult insert(Blog blog);

    ApiResult delete(Integer blogId);

    ApiResult update(Blog blog);

    ApiResult selectById(Integer blogId);

    ApiResult selectByCondition(BlogParam blogParam);

    ApiResult insertPraise(PraiseKey praiseKey);

    ApiResult deletePraise(PraiseKey praiseKey);

    ApiResult countPraise(Integer blogId);

    ApiResult selectMost3Praise(String type);
}
