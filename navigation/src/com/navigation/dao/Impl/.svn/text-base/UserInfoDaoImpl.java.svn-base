/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserInfoDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.User;
import com.navigation.pojo.UserInfo;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserInfoDaoImpl extends DaoSupport implements UserInfoDao {

	/**
	 * 创建对象
	 */
	public UserInfo save(UserInfo user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserInfo record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserInfo get(Serializable id) {
        return super.get(UserInfo.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserInfo record) {
		super.update(record);
	}

	public UserInfo initUserInfo(Integer id) {
		String hql = "from UserInfo i where i.user.id = ?";
		List<UserInfo> list = super.find(hql, new Object[]{id},0,1);
		if(list != null && list.size() >0) return list.get(0);
		
		UserInfo userInfo = new UserInfo();
		userInfo.setUser(new User(id));
		this.save(userInfo);
		return userInfo;
	}

	public UserInfo getUserInfo(Integer userId) {
		String hql = "from UserInfo i left join fetch i.user where i.user.id = ?";
		List<UserInfo> list = super.find(hql, new Object[]{userId},0,1);
		if(list != null && list.size() >0) return list.get(0);
		return null;
	}


}
