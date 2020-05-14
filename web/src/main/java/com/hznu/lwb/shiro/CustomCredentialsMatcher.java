package com.hznu.lwb.shiro;

import com.hznu.utils.MD5Util;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

/**
 * 自定义 密码验证类 
 * @author q
 *
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {
     @Override  
        public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
            UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
  
            Object tokenCredentials = encrypt(String.valueOf(token.getPassword()));  
            Object accountCredentials = getCredentials(info);  
            //将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false
            return equals(tokenCredentials, accountCredentials.toString().toUpperCase().toCharArray());
        }  
  
        //将传进来密码加密方法  
        private String encrypt(String data) {
            String sha384Hex = MD5Util.md5Encrypt(data).toUpperCase();//这里可以选择自己的密码验证方式 比如 md5或者sha256等
            return sha384Hex;  
        }
}