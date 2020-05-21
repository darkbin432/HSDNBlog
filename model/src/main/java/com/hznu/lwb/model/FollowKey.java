package com.hznu.lwb.model;

import java.io.Serializable;

/**
 * @author 
 */
public class FollowKey implements Serializable {
    /**
     * 关注者的用户ID
     */
    private String noticer;

    /**
     * 被关注者的用户ID
     */
    private String follower;

    private static final long serialVersionUID = 1L;

    public String getNoticer() {
        return noticer;
    }

    public void setNoticer(String noticer) {
        this.noticer = noticer;
    }

    public String getFollower() {
        return follower;
    }

    public void setFollower(String follower) {
        this.follower = follower;
    }
}