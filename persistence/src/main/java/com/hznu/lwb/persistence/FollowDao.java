package com.hznu.lwb.persistence;

import com.hznu.lwb.model.FollowKey;

import java.util.List;

public interface FollowDao {

    Integer delete(FollowKey key);

    Integer insert(FollowKey record);

    List<String> selectFollowers(String noticer);

    List<String> selectNoticers(String follower);
}