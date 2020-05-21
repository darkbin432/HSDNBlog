package com.hznu.lwb.persistence;

import com.hznu.lwb.model.UserViewNoticeKey;

import java.util.List;

public interface UserViewNoticeDao {
    Integer deleteByPrimaryKey(UserViewNoticeKey key);

    Integer insert(UserViewNoticeKey record);

    Integer insertSelective(UserViewNoticeKey record);

}