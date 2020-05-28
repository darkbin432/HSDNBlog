package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class UserDownloadFileKey implements Serializable {
    /**
     * 用户ID
     */
    private String userId;

    /**
     * 博客资源文件路径
     */
    private String fileName;

    private static final long serialVersionUID = 1L;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}