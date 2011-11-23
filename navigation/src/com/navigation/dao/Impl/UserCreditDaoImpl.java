/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserCreditDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.User;
import com.navigation.pojo.UserCredit;

/**
 * @author zhuchuanyong
 */
@SuppressWarnings("unchecked")
public class UserCreditDaoImpl extends DaoSupport implements UserCreditDao {

	/**
	 * 创建对象
	 */
	public UserCredit save(UserCredit user) {
		super.save(user);
		return user;
	}

	/**
	 * 删除对象
	 */
	public void delete(UserCredit record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public UserCredit get(Serializable id) {
		return super.get(UserCredit.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(UserCredit record) {
		super.update(record);
	}

	public UserCredit getCredit(Integer userId) {
		String hql = "from UserCredit c where c.user.id = ?";
		Object[] params = new Object[] { userId };
		List<UserCredit> list = super.find(hql, params, 0, 1);
		if (list != null && list.size() > 0)
			return list.get(0);
		UserCredit userCredit = new UserCredit();
		userCredit.setUser(new User(userId));
		userCredit.setScore(0d);
		userCredit.setCredit(0);
		userCredit.setEarnCredit(0);
		userCredit.setSpendCredit(0);
		userCredit.setStarGrade(0);
		userCredit.setRichGrade(0);
		this.save(userCredit);
		return userCredit;
	}

	public List<UserCredit> getUserCreditList(int limit, String orderby) {
		String hql = "from UserCredit c join fetch c.user order by c." + orderby + " desc";
		List<UserCredit> list = super.find(hql, null, 0, limit);
		return list;
	}
}
