package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class File implements Serializable {
    /**
     * 博客资源文件路径
     */
    private String filePath;

    /**
     * 博客资源文件上传者ID
     */
    private String uploaderId;

    private static final long serialVersionUID = 1L;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getUploaderId() {
        return uploaderId;
    }

    public void setUploaderId(String uploaderId) {
        this.uploaderId = uploaderId;
    }
}