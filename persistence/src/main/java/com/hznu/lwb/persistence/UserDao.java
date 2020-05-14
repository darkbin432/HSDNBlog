package com.hznu.lwb.persistence;

import com.hznu.lwb.model.User;

/**
 * UserDao
 *
 * @author xuzou
 * @date 8/5/16
 * @copyright: copyright @ hznuTech 2016
 */
public interface UserDao {
    int insert(User model);

    int getMaxId();

    User getUser(String username);

    void updateInfo(User user);

    void updatePassword(String username, String password);

    User login(String username);

//    User findOne(HashMap<String, Object> search);
}
