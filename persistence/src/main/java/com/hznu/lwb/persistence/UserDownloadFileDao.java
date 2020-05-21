package com.hznu.lwb.persistence;

import java.util.List;

import com.hznu.lwb.model.UserDownloadFileKey;

public interface UserDownloadFileDao {

    Integer deleteByPrimaryKey(UserDownloadFileKey key);

    Integer insert(UserDownloadFileKey record);

    Integer insertSelective(UserDownloadFileKey record);

}