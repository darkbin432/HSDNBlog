package com.hznu.lwb.persistence;

import com.hznu.lwb.model.Comment;

import java.util.List;

public interface CommentDao {

    Integer deleteByPrimaryKey(Integer commentId);

    Integer insert(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    List<Comment> selectByBlogId(Integer blogId);

    List<Comment> selectByUserId(String userId);

    Integer updateByPrimaryKeySelective(Comment record);

}