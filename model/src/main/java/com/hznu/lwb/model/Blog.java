package com.hznu.lwb.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Blog implements Serializable {
    /**
     * 博文编号
     */
    private Integer blogId;

    /**
     * 博文内容
     */
    private String content;

    /**
     * 发表该博文的用户ID
     */
    private String userId;

    private String userName;

    /**
     * 博文的发表时间
     */
    private Date time;

    /**
     * 博文的标题
     */
    private String title;

    /**
     * 博文的类型
     */
    private String type;

    private Integer praiseCount;

    private static final long serialVersionUID = 1L;

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getPraiseCount() {
        return praiseCount;
    }

    public void setPraiseCount(Integer praiseCount) {
        this.praiseCount = praiseCount;
    }
}