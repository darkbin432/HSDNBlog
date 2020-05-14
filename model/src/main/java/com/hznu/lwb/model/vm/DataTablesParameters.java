package com.hznu.lwb.model.vm;

import com.hznu.utils.GsonUtil;

import java.util.List;


/**
 * jQuery dataTables 配置参数对象
 *
 * @author yoo
 * @date 2016年10月13日
 */
public class DataTablesParameters {

    // private String statName = null;
    private Integer sEcho = 0;// 记录操作的次数 每次加1
    private Integer start = 0;// 起始
    private Integer rows = 10;// size
    // int count = 0; // 查询出来的数量
    private String search;//搜索关键字

    private String sortCol = null;// 排序字段
    private String sortDir = null;// 排序类型

    public Integer getsEcho() {
        return sEcho;
    }

    public void setsEcho(Integer sEcho) {
        this.sEcho = sEcho;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getSortCol() {
        return sortCol;
    }

    public void setSortCol(String sortCol) {
        this.sortCol = sortCol;
    }

    public String getSortDir() {
        return sortDir;
    }

    public void setSortDir(String sortDir) {
        this.sortDir = sortDir;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    /**
     * 将jQuery dataTable配置参数 json 解析成 Model
     *
     * @param aoData
     * @return
     */
    public static DataTablesParameters fromJson(String aoData) {
        DataTablesParameters tablesParameters = new DataTablesParameters();

        // 获取jquery datatable当前配置参数
        List<ParameterVM> list = GsonUtil.jsonToList(aoData, ParameterVM.class);
        for (ParameterVM param : list) {
            if ("sEcho".equals(param.getName()))
                tablesParameters.sEcho = Double.valueOf(param.getValue().toString()).intValue();
            else if ("iDisplayStart".equals(param.getName())){
                tablesParameters.start = Double.valueOf(param.getValue().toString()).intValue();
            }
            else if ("iDisplayLength".equals(param.getName()))
                tablesParameters.rows = Double.valueOf(param.getValue().toString()).intValue();
                // else if ("statId".equals(param.getName()))
                // statName = param.getValue().toString();
            else if ("iSortCol_0".equals(param.getName())) {
                int cols = Double.valueOf(param.getValue().toString()).intValue();
                for (ParameterVM para : list) {
                    if (("mDataProp_" + cols).equals(para.getName())) {
                        tablesParameters.sortCol = para.getValue().toString();
                    }
                    if (("sSortDir_0").equals(para.getName())) {
                        tablesParameters.sortDir = para.getValue().toString();
                    }
                }
            }
            else if ("sSearch".equals(param.getName()))
                tablesParameters.search = param.getValue().toString();
        }

        return tablesParameters;
    }
}
