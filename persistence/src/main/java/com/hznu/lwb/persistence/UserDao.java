package com.hznu.lwb.persistence;

import java.util.List;

import com.hznu.lwb.model.User;

public interface UserDao {

    Integer deleteByPrimaryKey(String userId);

    Integer insert(User record);

    Integer insertSelective(User record);

    User selectByPrimaryKey(String userId);

    Integer updateByPrimaryKeySelective(User record);

    Integer updateByPrimaryKey(User record);

    User login(String userId);
}