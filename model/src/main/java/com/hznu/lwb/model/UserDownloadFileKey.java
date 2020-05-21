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
    private String filePath;

    private static final long serialVersionUID = 1L;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}