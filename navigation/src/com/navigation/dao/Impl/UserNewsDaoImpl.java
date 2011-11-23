/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;

import com.navigation.dao.UserNewsDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserNews;

/**
 * @author zhuchuanyong
 */
@SuppressWarnings("unchecked")
public class UserNewsDaoImpl extends DaoSupport implements UserNewsDao {

	@Override
	public void delete(UserNews record) {
		super.delete(record);
	}

	@Override
	public UserNews get(Serializable id) {
		return super.get(UserNews.class, id);
	}

	@Override
	public UserNews save(UserNews record) {
		super.save(record);
		return record;
	}

	@Override
	public void update(UserNews record) {
		super.update(record);
	}
}
