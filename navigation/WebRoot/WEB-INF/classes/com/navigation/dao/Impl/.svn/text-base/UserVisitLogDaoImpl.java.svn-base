package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.dao.UserVisitLogDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserVisitLog;

public class UserVisitLogDaoImpl extends DaoSupport implements UserVisitLogDao {

	@Override
	public void delete(UserVisitLog record) {
		super.delete(record);
	}

	@Override
	public UserVisitLog get(Serializable id) {
		return super.get(UserVisitLog.class, id);
	}

	@Override
	public UserVisitLog save(UserVisitLog record) {
		super.save(record);
		return record;
	}

	@Override
	public void update(UserVisitLog record) {
		super.update(record);
	}

	@Override
	@SuppressWarnings("unchecked")
	public UserVisitLog get(Integer owner, Integer page, Date date) {
		String hql = "from UserVisitLog where owner=? and page=? and date=?";
		Object[] params = new Object[] { owner, page, date };
		List<UserVisitLog> logList = super.find(hql, params, 0, 1);
		if (logList.size() > 0)
			return logList.get(0);
		return null;
	}
}
