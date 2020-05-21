package com.hznu.lwb.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Notice implements Serializable {
    /**
     * 公告ID
     */
    private Integer noticeId;

    /**
     * 公告内容
     */
    private String content;

    /**
     * 发表该公告的管理员ID
     */
    private String userId;

    /**
     * 公告发布时间
     */
    private Date time;

    private static final long serialVersionUID = 1L;

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}