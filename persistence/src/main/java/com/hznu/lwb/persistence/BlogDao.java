package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Blog;
import com.hznu.lwb.model.param.BlogParam;

import java.util.List;

public interface BlogDao {

    int deleteByPrimaryKey(Integer blogId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(Integer blogId);

    List<Blog> selectByCondition(BlogParam blogParam);

    int updateByPrimaryKeySelective(Blog record);
}