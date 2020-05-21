package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class UserViewNoticeKey implements Serializable {
    /**
     * 用户ID
     */
    private String userId;

    /**
     * 公告ID
     */
    private Integer noticeId;

    private static final long serialVersionUID = 1L;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }
}