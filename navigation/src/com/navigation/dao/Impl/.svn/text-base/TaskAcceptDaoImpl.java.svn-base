/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.TaskAcceptDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.TaskAccept;

/**
 * @author Alex
 */
@SuppressWarnings("unchecked")
public class TaskAcceptDaoImpl extends DaoSupport implements TaskAcceptDao {

	/**
	 * 创建对象
	 */
	public TaskAccept save(TaskAccept record) {
		super.save(record);
		return record;
	}

	/**
	 * 删除对象
	 */
	public void delete(TaskAccept record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public TaskAccept get(Serializable id) {
		return super.get(TaskAccept.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(TaskAccept record) {
		super.update(record);
	}

	@Override
	public List<TaskAccept> getAcceptListByUser(Integer userId) {
		String hql = "from TaskAccept where userId=? order by updateTime desc";
		return super.find(hql, new Object[] { userId });
	}

	@Override
	public List<TaskAccept> getAcceptListByStatus(Integer status) {
		String hql = "from TaskAccept where status=? order by updateTime desc";
		return super.find(hql, new Object[] { status });
	}
}
