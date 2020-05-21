package com.hznu.lwb.service;

import com.hznu.lwb.model.FollowKey;
import com.hznu.lwb.model.User;
import com.hznu.lwb.model.result.ApiResult;

/**
 * ISourceService
 *
 * @author xuzou
 * @date 16/6/14
 * @copyright: copyright @ hznuTech 2016
 */
public interface IUserService {

    ApiResult login(User user);

    ApiResult updatePersonalInfo(User user);

    ApiResult getUser(String userId);

    ApiResult insertFollow(FollowKey followKey);

    ApiResult deleteFollow(FollowKey followKey);

    ApiResult selectFollowers(String noticer);

    ApiResult selectNoticers(String follower);
}
