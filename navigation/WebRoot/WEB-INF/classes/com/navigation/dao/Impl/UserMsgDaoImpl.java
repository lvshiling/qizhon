/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserMsgDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserMsg;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserMsgDaoImpl extends DaoSupport implements UserMsgDao {

	/**
	 * 创建对象
	 */
	public UserMsg save(UserMsg user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserMsg record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserMsg get(Serializable id) {
        return super.get(UserMsg.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserMsg record) {
		super.update(record);
	}

	public List<UserMsg> getUserMsg(Integer userId, Integer p,
			Integer pageSize, boolean isUnRead) {
		String hql = "from UserMsg m where m.userId = ?";
		if(isUnRead) hql += " and m.state = 0";
		return super.find(hql, new Object[]{userId}, (p-1)*pageSize, pageSize);
	}


}
