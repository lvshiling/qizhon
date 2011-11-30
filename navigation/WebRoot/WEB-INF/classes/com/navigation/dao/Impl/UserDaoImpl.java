/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.navigation.dao.UserDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.User;
import com.navigation.pojo.UserCredit;
import com.navigation.utils.StringUtil;

/**
 * @author WANGHUI Apr 8, 2011 11:21:36 AM
 */
@SuppressWarnings("unchecked")
public class UserDaoImpl extends DaoSupport implements UserDao {

	/**
	 * 创建对象
	 */
	public User save(User user) {
		user.setIcon("/images/default.jpg");
		user.setPoster("/images/poster.jpg");
		// user.setIcon("http://tp4.sinaimg.cn/1792442423/50/0/1");
		// String hql = "from User u order by u.id desc";
		// Integer userId = 1;
		// List<User> userList = super.find(hql, 0,1);
		// if(userList!=null && userList.size()>0) userId =
		// userList.get(0).getId()+1;
		// user.setId(userId);
		super.save(user);
		return user;
	}

	/**
	 * 删除对象
	 */
	public void delete(User record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public User get(Serializable id) {
		return super.get(User.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(User record) {
		super.update(record);
	}

	public User getUserByEmail(String email) {
		String hql = "from User u where u.mail = ?";
		Object[] params = new Object[] { email };
		List<User> userList = super.find(hql, params);
		if (userList.size() > 0)
			return userList.get(0);
		return null;
	}

	public User getSinaUser(weibo4j.User author) {
		String authorName = author.getScreenName();
		String mail = String.valueOf(author.getId());
		User user = this.getUserByEmail(mail);
		URL url = author.getProfileImageURL();
		String icon = url.getProtocol() + "://" + url.getHost() + url.getPath();
		if (null != user) {
			if (!icon.equals(user.getIcon())) {
				user.setIcon(icon);
				this.update(user);
			}
			return user;
		}
		// 创建用户
		user = new User();
		user.setMail(mail);
		user.setName("@" + authorName);
		user.setIcon(icon);
		user.setPassword(StringUtil.md5(new Date().toString()));
		this.save(user);
		return user;
	}

	@Override
	public List<Integer> getLiveUserIdList(int num) {
		String hql = "select s.userId from UserLogState s where s.lastLiveTime is not null order by s.lastLiveTime desc";
		List<Integer> list = super.find(hql, 0, num);
		return list;
	}

	@Override
	public List<User> getUserCreditList(int num, String orderby) {
		String hql = "from User u left join fetch u.userCredits c order by c." + orderby + " desc";
		List<User> list = super.find(hql, 0, num);
		for (User user : list) {
			Set<UserCredit> set = user.getUserCredits();
			if (set != null && !set.isEmpty()) {
				user.setUserCredit(set.iterator().next());
			}
		}
		return list;
	}

	@Override
	public List<Object[]> getUserScoreList(int num) {
		String hql = "select u.id, u.name, c.score, c.scoreNum from User u,UserCredit c where u.id=c.user.id and u.isAuth="
				+ Constant.USER_IS_AUTH_YES + " order by c.score desc";
		List<Object[]> list = (List<Object[]>) super.find(hql, 0, num);
		return list;
	}

	@Override
	public List<User> randUsersWithPic(Integer userId, int num) {
		String hql = "from User where id<>? and pic is not null order by rand()";
		return super.find(hql, new Object[] { userId }, 0, num);
	}

	@Override
	public List<User> randUsers(Integer userId, int num) {
		String hql = "from User where id<>? order by rand()";
		return super.find(hql, new Object[] { userId }, 0, num);
	}

	@Override
	public List<User> randUsers(int num) {
		String hql = "from User order by rand()";
		return super.find(hql, 0, num);
	}

	@Override
	public List<User> randUsersWithPic(int num) {
		String hql = "from User where pic is not null order by rand()";
		return super.find(hql, 0, num);
	}

	@Override
	public User getByHashid(String hashid) {
		String hql = "from User where hashid=?";
		List<User> lst = super.find(hql, new Object[] { hashid }, 0, 1);
		if (lst != null && !lst.isEmpty())
			return lst.get(0);
		return null;
	}
}
