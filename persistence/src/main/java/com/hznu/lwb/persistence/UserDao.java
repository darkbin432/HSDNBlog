package com.hznu.lwb.persistence;

import com.hznu.lwb.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    Integer deleteByPrimaryKey(String userId);

    Integer insert(User record);

    User selectByPrimaryKey(String userId);

    Integer updateByPrimaryKeySelective(User record);

    User login(String userId);

    String isUserIdUnique(@Param("userId")String userId);
}