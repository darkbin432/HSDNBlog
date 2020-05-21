package com.hznu.lwb.persistence;

import com.hznu.lwb.model.File;

public interface FileDao {

    int deleteByPrimaryKey(String filePath);

    int insert(File record);

    int insertSelective(File record);

    File selectByPrimaryKey(String filePath);

    int updateByPrimaryKeySelective(File record);

    int updateByPrimaryKey(File record);
}