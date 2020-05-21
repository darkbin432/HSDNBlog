package com.hznu.lwb.persistence;

import com.hznu.lwb.model.FollowKey;

public interface FollowDao {

    int deleteByPrimaryKey(FollowKey key);

    int insert(FollowKey record);

    int insertSelective(FollowKey record);
}