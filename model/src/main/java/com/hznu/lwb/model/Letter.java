package com.hznu.lwb.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Letter implements Serializable {
    /**
     * 私信ID
     */
    private Integer letterId;

    /**
     * 私信内容
     */
    private String content;

    /**
     * 收件人ID
     */
    private String recipientId;

    /**
     * 发件人ID
     */
    private String senderId;

    /**
     * 私信发送时间
     */
    private Date time;

    private static final long serialVersionUID = 1L;

    public Integer getLetterId() {
        return letterId;
    }

    public void setLetterId(Integer letterId) {
        this.letterId = letterId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRecipientId() {
        return recipientId;
    }

    public void setRecipientId(String recipientId) {
        this.recipientId = recipientId;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}