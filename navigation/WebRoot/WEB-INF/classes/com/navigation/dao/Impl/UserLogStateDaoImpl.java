/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserLogStateDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserLogState;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserLogStateDaoImpl extends DaoSupport implements UserLogStateDao {

	/**
	 * 创建对象
	 */
	public UserLogState save(UserLogState user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserLogState record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserLogState get(Serializable id) {
        return super.get(UserLogState.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserLogState record) {
		super.update(record);
	}

	public void updateUserLogState(Integer userId) {
		// TODO Auto-generated method stub
		
	}

	public UserLogState getByHashCode(String hashCode) {
		String hql = "from UserLogState s where s.logHashCode = ?";
		List<UserLogState> list = super.find(hql, new Object[]{hashCode}, 0, 1);
		if(list != null && list.size()>0) return list.get(0);
		return null;
	}

	public UserLogState getByUserId(Integer userId) {
		String hql = "from UserLogState s where s.userId = ?";
		List<UserLogState> list = super.find(hql, new Object[]{userId}, 0, 1);
		if(list != null && list.size()>0) return list.get(0);
		return null;
	}
}
