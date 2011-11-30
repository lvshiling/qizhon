/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserPictureDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserPicture;

/**
 * @author WANGHUI Apr 8, 2011 11:21:36 AM
 */
@SuppressWarnings("unchecked")
public class UserPictureDaoImpl extends DaoSupport implements UserPictureDao {

	/**
	 * 创建对象
	 */
	public UserPicture save(UserPicture user) {
		super.save(user);
		return user;
	}

	/**
	 * 删除对象
	 */
	public void delete(UserPicture record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public UserPicture get(Serializable id) {
		return super.get(UserPicture.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(UserPicture record) {
		super.update(record);
	}

	@Override
	public List<UserPicture> getUserPics(Integer userId, Integer p, Integer pageSize) {
		String hql = "from UserPicture p where p.user.id = ? order by p.id desc";
		Object[] params = new Object[] { userId };
		return super.find(hql, params, (p - 1) * pageSize, pageSize);
	}

	@Override
	public Integer getUserPicsCount(Integer userId) {
		String hql = "select count(*) from UserPicture p where p.user.id=?";
		Object[] params = new Object[] { userId };
		return super.count(hql, params);
	}
}
