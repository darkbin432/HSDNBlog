package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class File implements Serializable {
    /**
     * 博客资源文件路径
     */
    private String fileName;

    private String realName;

    private String description;

    /**
     * 博客资源文件上传者ID
     */
    private String uploaderId;

    private static final long serialVersionUID = 1L;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUploaderId() {
        return uploaderId;
    }

    public void setUploaderId(String uploaderId) {
        this.uploaderId = uploaderId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}