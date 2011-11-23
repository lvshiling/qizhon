/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserScoreLogDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserScoreLog;

/**
 * @author WANGHUI Apr 8, 2011 11:21:36 AM
 */
@SuppressWarnings("unchecked")
public class UserScoreLogDaoImpl extends DaoSupport implements UserScoreLogDao {

	/**
	 * 创建对象
	 */
	public UserScoreLog save(UserScoreLog user) {
		super.save(user);
		return user;
	}

	/**
	 * 删除对象
	 */
	public void delete(UserScoreLog record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public UserScoreLog get(Serializable id) {
		return super.get(UserScoreLog.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(UserScoreLog record) {
		super.update(record);
	}

	@Override
	public Double getUserAvgScore(Integer userId) {
		String hql = "select avg(score) from UserScoreLog where userId=?";
		List<Double> lst = super.find(hql, new Object[] { userId }, 0, 1);
		if (lst == null || lst.isEmpty())
			return null;
		return lst.get(0);
	}
}
