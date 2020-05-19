package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.User;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.UserDao;
import com.hznu.lwb.service.IUserService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;

/**
 * UserService
 *
 * @author xuzou
 * @date 8/5/16
 * @copyright: copyright @ hznuTech 2016
 */
@Service
public class UserService implements IUserService {
    @Resource
    UserDao userDao;

    @Override
    public ApiResult login(User user) {
        ApiResult apiResult = new ApiResult();
        try {
            User temp = userDao.selectByPrimaryKey(user.getUserId());
            if (temp != null) {
                temp.setPassword("***********");
                apiResult.success(temp);
            } else{
                apiResult.fail("帐号或密码错误");
            }
        }catch(Exception e){
            apiResult.fail("数据库获取失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult updatePersonalInfo(User user){
        ApiResult apiResult = new ApiResult();
//        try {
//            User temp = userDao.getUser(user.getUsername());
//            if (temp != null){
//                userDao.updateInfo(user);
//                //                    更新用户信息
//                OrganizationMember userSession=(OrganizationMember) SecurityUtils.getSubject().getPrincipal();
//                userSession.setMobile(user.getMobile());
//                if (user.getNewPassword() != null) {
//                    if (temp.getPassword().equals(MD5Util.md5Encrypt(user.getPassword()))){
//                        userDao.updatePassword(user.getUsername(), MD5Util.md5Encrypt(user.getNewPassword()));
//                    }else{
//                        apiResult.fail("原密码错误");
//                        return apiResult;
//                    }
//                }
//                apiResult.success();
//            }
//        }catch(Exception e){
//            apiResult.fail("修改个人信息失败");
//        }
        return apiResult;
    }

    @Override
    public ApiResult getUser(String userId) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(userDao.selectByPrimaryKey(userId));
        }catch (Exception e){
            apiResult.fail();
        }
        return apiResult;
    }
}

