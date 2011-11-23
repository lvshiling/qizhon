/**
 * 
 */
package com.navigation.service.Impl;

import javax.annotation.Resource;

import com.navigation.dao.UserDao;
import com.navigation.pojo.User;
import com.navigation.service.WebService;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Jul 15, 2011 10:44:09 AM
 */
public class WebServiceImpl implements WebService {

	@Resource
	public UserDao userDao;
	
	/* (non-Javadoc)
	 * @see com.navigation.service.WebService#checkUser(java.lang.String, java.lang.String)
	 */
	public boolean checkUser(String email, String password) {
		System.out.println(userDao+"####################"); 
		User user = userDao.getUserByEmail(email);
		password = StringUtil.md5(password);
		if(password.equalsIgnoreCase(user.getPassword())) return true;
		return false;
	}

}
