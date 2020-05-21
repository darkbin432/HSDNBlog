package com.hznu.lwb.persistence;

import com.hznu.lwb.model.UserViewNoticeKey;

import java.util.List;

public interface UserViewNoticeDao {
    int deleteByPrimaryKey(UserViewNoticeKey key);

    int insert(UserViewNoticeKey record);

    int insertSelective(UserViewNoticeKey record);

}