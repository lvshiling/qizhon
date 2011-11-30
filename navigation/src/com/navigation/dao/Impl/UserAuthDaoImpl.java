/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserAuthDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.domain.PageBean;
import com.navigation.pojo.UserAuth;

/**
 * @author zhuchuanyong
 */
@SuppressWarnings("unchecked")
public class UserAuthDaoImpl extends DaoSupport implements UserAuthDao {

	@Override
	public void delete(UserAuth record) {
		super.delete(record);
	}

	@Override
	public UserAuth get(Serializable id) {
		return super.get(UserAuth.class, id);
	}

	@Override
	public UserAuth save(UserAuth record) {
		super.save(record);
		return record;
	}

	@Override
	public void update(UserAuth record) {
		super.update(record);
	}

	@Override
	public List<UserAuth> getAwaitAuthList(Integer p, Integer pageSize) {
		String hql = "from UserAuth a where a.status=" + Constant.USER_AUTH_STATUS_NEW + " order by a.createTime desc";
		return super.find(hql, (p - 1) * pageSize, pageSize);
	}
	
	@Override
	public List<UserAuth> getAwaitAuthList() {
		String hql = "from UserAuth a where a.status=" + Constant.USER_AUTH_STATUS_NEW + " order by a.createTime desc";
		return super.find(hql);
	}

	@Override
	public PageBean getAwaitAuthPageBean(Integer p, Integer pageSize) {
		List<UserAuth> list = this.getAwaitAuthList(p, pageSize);
		Integer count = this.getAwaitAuthCount();

		PageBean pb = new PageBean();
		pb.setRecordList(list);
		pb.setRecordCount(count);
		pb.setCurrPage(p);
		pb.setPageSize(pageSize);
		return pb;
	}

	private Integer getAwaitAuthCount() {
		String hql = "select count(*) from UserAuth a where a.status=" + Constant.USER_AUTH_STATUS_NEW;
		return super.count(hql);
	}

	@Override
	public UserAuth getBy(Integer userId, Integer status) {
		String hql = "from UserAuth a where a.status=? and a.userId=?";
		Object[] params = new Object[] { status, userId };
		List<UserAuth> lst = super.find(hql, params, 0, 1);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}

	@Override
	public UserAuth getBy(Integer userId, Integer status, boolean notequal) {
		if (notequal) {
			String hql = "from UserAuth a where a.status<>? and a.userId=?";
			Object[] params = new Object[] { status, userId };
			List<UserAuth> lst = super.find(hql, params, 0, 1);
			if (lst == null || lst.isEmpty()) {
				return null;
			}
			return lst.get(0);
		} else {
			return this.getBy(userId, status);
		}
	}
	
	@Override
	public UserAuth getBy(Integer userId) {
		String hql = "from UserAuth a where a.userId=? order by a.updateTime desc";
		Object[] params = new Object[] { userId };
		List<UserAuth> lst = super.find(hql, params);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}
}
