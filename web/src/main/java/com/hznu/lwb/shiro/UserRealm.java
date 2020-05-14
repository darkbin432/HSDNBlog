package com.hznu.lwb.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;


/**
 * @author 钱雪峰
 * @date 2015年9月16日-下午4:21:18
 */
public class UserRealm extends AuthorizingRealm {
	@Resource
	private UserDao userDao;
//	@Autowired
//	private hznuLoginUserDao loginUserDao;
//
//	@Autowired
//	private hznuRoleDao roleDao;
//	@Autowired
//	private hznuPermissionDao permissionDao;
//	// @Autowired
//	// private PasswordService passwordService;
//
	/**
	 * 设定Password校验.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		//该句作用是重写shiro的密码验证，让shiro用我自己的验证
		setCredentialsMatcher(new CustomCredentialsMatcher());

	}
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//		LoginUser imUser = (LoginUser) principals.getPrimaryPrincipal();
//
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//
//		List<String> roleList = roleDao.findRolesByUser(imUser.getId());
//		Set<String> roles = new HashSet<String>(roleList);
//		authorizationInfo.setRoles(roles);
//
//		List<String> permissionList = permissionDao.findPermissionsByUser(imUser.getId());
//		Set<String> permissions = new HashSet<String>(permissionList);
//		authorizationInfo.setStringPermissions(permissions);

		return authorizationInfo;
	}
	
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		String username = token.getUsername();
		char[] password = token.getPassword();
//		String password = new String(token.getPassword());
//		String password = MD5Util.md5Encrypt( new String(token.getPassword()));
		User user = null;
		// 判断是否填写用户名／密码
		if(StringUtils.isNotBlank(username) && password != null){
			user = userDao.login(username);
		}
		
		if (user == null) {
			 throw new UnknownAccountException("账号密码错误");//没找到帐号
		}
		
		return new SimpleAuthenticationInfo(user, user.getPassword(), user.getUsername());
	}

	private static final String OR_OPERATOR = " or ";
	private static final String AND_OPERATOR = " and ";
	private static final String NOT_OPERATOR = "not ";
	/**
	 * 支持or and not 关键词  不支持and or混用
	 * @param principals
	 * @param permission
	 * @return
	 */
	@Override
	public boolean isPermitted(PrincipalCollection principals, String permission) {
		if(permission.contains(OR_OPERATOR)) {
			String[] permissions = permission.split(OR_OPERATOR);
			for(String orPermission : permissions) {
				if(isPermittedWithNotOperator(principals, orPermission)) {
					return true;
				}
			}
			return false;
		} else if(permission.contains(AND_OPERATOR)) {
			String[] permissions = permission.split(AND_OPERATOR);
			for(String orPermission : permissions) {
				if(!isPermittedWithNotOperator(principals, orPermission)) {
					return false;
				}
			}
			return true;
		} else {
			return isPermittedWithNotOperator(principals, permission);
		}
	}

	private boolean isPermittedWithNotOperator(PrincipalCollection principals, String permission) {
		if(permission.startsWith(NOT_OPERATOR)) {
			return !super.isPermitted(principals, permission.substring(NOT_OPERATOR.length()));
		} else {
			return super.isPermitted(principals, permission);
		}
	}
}
