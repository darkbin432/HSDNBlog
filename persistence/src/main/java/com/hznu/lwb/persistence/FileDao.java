package com.hznu.lwb.persistence;

import com.hznu.lwb.model.File;

public interface FileDao {

    Integer deleteByPrimaryKey(String filePath);

    Integer insert(File record);

    Integer insertSelective(File record);

    File selectByPrimaryKey(String filePath);

    Integer updateByPrimaryKeySelective(File record);

    Integer updateByPrimaryKey(File record);
}