package com.hznu.lwb.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.commons.lang3.StringUtils;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Entity
 *
 * @author xuzou
 * @date 16/6/12
 * @copyright: copyright @ HeleTech 2016
 */

//@JsonInclude(JsonInclude.Include.NON_NULL)
public class Entity {
    private Integer id;
    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
    private Date createdTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
    private Date updatedTime;
    private String version;

    private String contentText;

    public String getContentText() {
        return contentText;
    }

    public void setContentText(String contentText) {
        this.contentText = contentText;
    }

    protected void createContentText(String content) {
        if (StringUtils.isNotBlank(content)) {
            //去除所有的标签
            String regexStr = "(<[^>]*>)|&nbsp;";
            Pattern p_w = Pattern.compile(regexStr, Pattern.CASE_INSENSITIVE);
            Matcher m_w = p_w.matcher(content);
            String str1 = m_w.replaceAll("");

            regexStr = "&gt;";
            p_w = Pattern.compile(regexStr, Pattern.CASE_INSENSITIVE);
            m_w = p_w.matcher(str1);
            String tmpStr = m_w.replaceAll(">");
            setContentText(tmpStr);
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
}
