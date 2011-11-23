/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.dao.UserCreditLogDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.UserCreditLog;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserCreditLogDaoImpl extends DaoSupport implements UserCreditLogDao {

	/**
	 * 创建对象
	 */
	public UserCreditLog save(UserCreditLog user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserCreditLog record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserCreditLog get(Serializable id) {
        return super.get(UserCreditLog.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserCreditLog record) {
		super.update(record);
	}

	public UserCreditLog createLog(Integer userId, Integer credit, Integer cash) {
		UserCreditLog log = new UserCreditLog();
		log.setUserId(userId);
		log.setCredit(credit);
		log.setType(Constant.CREDIT_TYPE_PAY);
		log.setScore(0);
		log.setState(0);
		log.setAddTime(new Date());
		log.setCash(cash);
		return this.save(log);
	}

	public List<UserCreditLog> getUserPayLog(Integer userId, int p, int pageSize) {
		String hql = "from UserCreditLog cl where cl.userId = ? order by cl.id desc";
		Object[] params = new Object[]{userId};
		return super.find(hql, params, (p-1)*pageSize,pageSize);
	}


}
