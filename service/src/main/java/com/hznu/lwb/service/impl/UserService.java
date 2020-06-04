package com.hznu.lwb.service.impl;

import com.hznu.lwb.model.FollowKey;
import com.hznu.lwb.model.User;
import com.hznu.lwb.model.result.ApiResult;
import com.hznu.lwb.persistence.FollowDao;
import com.hznu.lwb.persistence.UserDao;
import com.hznu.lwb.service.IUserService;
import com.hznu.utils.MD5Util;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;


/**
 * @author 斌
 */
@Service
public class UserService implements IUserService {

    @Resource
    UserDao userDao;

    @Resource
    FollowDao followDao;

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

    @Override
    public ApiResult register(User user) {
        ApiResult apiResult = new ApiResult();
        try {
            if (userDao.isUserIdUnique(user.getUserId()) != null){
                apiResult.fail(444,"该用户名已存在");
            }else{
                if (user.getNickname() == null){
                    user.setNickname(user.getUserId().substring(0, 1).toUpperCase() + user.getUserId().substring(1));
                }
                if (user.getPassword() != null){
                    user.setPassword(MD5Util.md5Encrypt(user.getPassword()).toUpperCase());
                }
                userDao.insert(user);
                apiResult.success();
            }
        }catch (Exception e){
            apiResult.fail("新增用户失败");
        }
        return apiResult;
    }

    @Override
    public ApiResult insertFollow(FollowKey followKey) {
        ApiResult apiResult = new ApiResult();
        try {
            followDao.insert(followKey);
            apiResult.success();
        }catch (Exception e){
            apiResult.fail();
        }
        return apiResult;
    }

    @Override
    public ApiResult deleteFollow(FollowKey followKey) {
        ApiResult apiResult = new ApiResult();
        try {
            followDao.delete(followKey);
            apiResult.success();
        }catch (Exception e){
            apiResult.fail();
        }
        return apiResult;
    }

    @Override
    public ApiResult selectFollowers(String noticer) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(followDao.selectFollowers(noticer));
        }catch (Exception e){
            apiResult.fail();
        }
        return apiResult;
    }

    @Override
    public ApiResult selectNoticers(String follower) {
        ApiResult apiResult = new ApiResult();
        try {
            apiResult.success(followDao.selectNoticers(follower));
        }catch (Exception e){
            apiResult.fail();
        }
        return apiResult;
    }


}

