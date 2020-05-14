package com.hznu.lwb.shiro;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 加密工具
 * 
 * @author 钱雪峰
 * @date 2015年9月16日-下午4:34:07
 */
public class PasswordHelper {

	private static RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private static String algorithmName = "md5";
	private static int hashIterations = 2;

//	public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
//		this.randomNumberGenerator = randomNumberGenerator;
//	}
//
//	public void setAlgorithmName(String algorithmName) {
//		this.algorithmName = algorithmName;
//	}
//
//	public void setHashIterations(int hashIterations) {
//		this.hashIterations = hashIterations;
//	}

	public static ShiroPassword encryptPassword(String username, String password) {
		String salt = randomNumberGenerator.nextBytes().toHex();
		String newPassword = new SimpleHash(algorithmName, password, ByteSource.Util.bytes(username + salt),
				hashIterations).toHex();

		ShiroPassword shiroPassword = new ShiroPassword();
		shiroPassword.setSalt(salt);
		shiroPassword.setPassword(newPassword);
		return shiroPassword;
	}
}
