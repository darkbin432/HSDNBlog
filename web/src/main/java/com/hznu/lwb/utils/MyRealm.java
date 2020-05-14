package com.hznu.lwb.utils;

import com.hznu.lwb.model.User;
import com.hznu.lwb.persistence.UserDao;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

/**
 * @author 斌
 */
public class MyRealm extends AuthorizingRealm {

    @Resource
    private UserDao userDao;

    String password;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        Object principal = authenticationToken.getPrincipal();
        User user = userDao.getUser((String)principal);
        if(user!=null){
            password=user.getPassword();
        }else{
            return null;
        }
        String credentials = password;
        String salt=user.getUsername();
        ByteSource credentialsSalt = new Md5Hash(salt);
        String realmName = getName();
        SimpleAuthenticationInfo info =
                new SimpleAuthenticationInfo(principal, credentials,
                        credentialsSalt, realmName);
        return info;
    }
    public void setCredentialMatcher(){
        HashedCredentialsMatcher  credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName("MD5");
        credentialsMatcher.setHashIterations(1024);
        setCredentialsMatcher(credentialsMatcher);
    }
}
