package com.hznu.lwb.model.result;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * 统一返回格式
 *
 * @author qianxuefeng
 * @date 2016年2月19日
 * @copyright: copyright @ hznuTech 2016
 */
public class ApiResult implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer status;
    private String msg;

    //jQuery DataTables 参数
    private Integer draw;//请求数每次+1
    private Integer recordsTotal;// 总数
    private Integer recordsFiltered;// 搜索匹配总数


    private Integer totalCount;
    private Integer perPageCount;

    private String resourceUrl="";
    private String contextUrl="";

    private Object data;

    public ApiResult() {
        this.success();
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }


    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }


    public void fail(Integer status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public void fail(Integer status) {
        fail(404, "操作失败");
    }

    public void fail(String msg) {
        fail(404, msg);
    }


    public void fail() {
        fail(404);
    }

    public void success(Object data) {
        success(200);
        this.data = data;
    }

    public void success(Integer status) {
        this.status = status;
        this.msg = "success";
    }

    public void success() {
        success(200);
    }

    public void lackParams(String msg) {
        fail(401, msg);
    }

    public Integer getPerPageCount() {
        return perPageCount;
    }

    public void setPerPageCount(Integer perPageCount) {
        this.perPageCount = perPageCount;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public String toString() {
        return "status: " + String.valueOf(status) + " msg " + msg;
    }

    @SuppressWarnings("unchecked")
    public Object get(String key) {
        if (data == null) {
            return null;
        }

        if (data instanceof Map) {
            return ((Map<String, Object>) data).get(key);
        } else {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    public void put(String key, Object value) {
        if (key != null) {
            if (!(data instanceof Map)) {
                data = Maps.newHashMap();
            }
            ((Map<String, Object>) data).put(key, value);
        }
    }

    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl;
    }

    public String getContextUrl() {
        return contextUrl;
    }

    public void setContextUrl(String contextUrl) {
        this.contextUrl = contextUrl;
    }

    /**
     * jQuery DataTables 固定返回参数
     *
     * @param sEcho       每次访问＋1避免重复提交请求
     * @param total       记录总数
     * @param searchTotal 记录查询结果总数
     * @param data        数据
     */
    public void dataTable(Integer sEcho, Integer total, Integer searchTotal, Object data) {
        this.draw = sEcho + 1;
        this.recordsTotal = total;
        this.recordsFiltered = searchTotal;
        this.data = data;
        success();
    }

    /**
     * jQuery DataTables 固定返回参数
     *
     * @param sEcho       每次访问＋1避免重复提交请求
     * @param searchTotal 记录查询结果总数
     * @param data        数据
     */
    public void dataTable(Integer sEcho, Integer searchTotal, Object data) {
        dataTable(sEcho, searchTotal, searchTotal, data);
    }

    public boolean IsSuccess(){
        if(this.status==200)
            return true;
        else
            return false;
    }

    public boolean IsFail(){
        if(this.status!=200)
            return true;
        else
            return false;
    }



}
