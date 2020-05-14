package com.hznu.lwb.shiro;

import org.apache.shiro.authc.AuthenticationException;

/**
 * @author 钱雪峰
 * @date 2015年9月16日-下午4:21:39
 */
public class IncorrectException extends AuthenticationException {

	private static final long serialVersionUID = 1L;

	public IncorrectException() {
		super();
	}

	public IncorrectException(String message, Throwable cause) {
		super(message, cause);
	}

	public IncorrectException(String message) {
		super(message);
	}

	public IncorrectException(Throwable cause) {
		super(cause);
	}
}
