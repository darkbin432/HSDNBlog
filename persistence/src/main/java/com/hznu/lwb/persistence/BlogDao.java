package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.param.BlogParam;

import java.util.List;

public interface BlogDao {

    Integer deleteByPrimaryKey(Integer blogId);

    Integer insert(Blog record);

    Blog selectByPrimaryKey(Integer blogId);

    Integer getTotalCount(BlogParam blogParam);

    List<Blog> selectByCondition(BlogParam blogParam);

    Integer updateByPrimaryKeySelective(Blog record);

    List<Blog> selectMost3Praise(String type);
}