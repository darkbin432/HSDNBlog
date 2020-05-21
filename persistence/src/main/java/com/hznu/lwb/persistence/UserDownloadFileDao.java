package com.hznu.lwb.persistence;

import java.util.List;

import com.hznu.lwb.model.UserDownloadFileKey;

public interface UserDownloadFileDao {

    int deleteByPrimaryKey(UserDownloadFileKey key);

    int insert(UserDownloadFileKey record);

    int insertSelective(UserDownloadFileKey record);

}