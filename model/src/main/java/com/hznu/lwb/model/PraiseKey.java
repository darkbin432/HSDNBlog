package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class PraiseKey implements Serializable {
    /**
     * 用户ID
     */
    private String userId;

    /**
     * 博文编号
     */
    private Integer blogId;

    private static final long serialVersionUID = 1L;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }
}