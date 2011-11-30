/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

	@Override
	public List<UserNews> getUserNewsList(Integer userId, Integer p, Integer pageSize) {
		String hql = "from UserNews where userId=? order by updateTime desc";
		return super.find(hql, new Object[] { userId }, (p - 1) * pageSize, pageSize);
	}

	@Override
	public List<UserNews> getUserNewsList(int limit, Integer[] types, Date afterTime) {
		List<Object> lst = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer();
		sb.append("from UserNews where 1=1 ");
		if (types != null && types.length > 0) {
			sb.append(" and type in (3, 5, 7, 8, 9) ");
		}
		if (afterTime != null) {
			sb.append(" and updateTime>? ");
			lst.add(afterTime);
		}
		sb.append(" order by updateTime desc");
		return super.find(sb.toString(), lst.toArray(), 0, limit);
	}
}
