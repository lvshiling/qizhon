/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.TaskDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;

/**
 * @author Alex
 */
@SuppressWarnings("unchecked")
public class TaskDaoImpl extends DaoSupport implements TaskDao {

	/**
	 * 创建对象
	 */
	public Task save(Task record) {
		super.save(record);
		return record;
	}

	/**
	 * 删除对象
	 */
	public void delete(Task record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public Task get(Serializable id) {
		return super.get(Task.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(Task record) {
		super.update(record);
	}

	@Override
	public List<Task> getTaskList(int limit, Integer status) {
		String hql = "from Task where status=? order by updateTime desc";
		return super.find(hql, new Object[] { status }, 0, limit);
	}

	@Override
	public List<TaskAccept> getAcceptList(Integer taskId) {
		String hql = "from TaskAccept where taskId=? order by updateTime desc";
		return super.find(hql, new Object[] { taskId });
	}

	@Override
	public TaskAccept getWinnedAccept(Integer taskId) {
		String hql = "select a from TaskAccept a, Task t where a.id=t.taskAcptId and t.id=?";
		List<TaskAccept> lst = super.find(hql, new Object[] { taskId }, 0, 1);
		if (lst != null && !lst.isEmpty())
			return lst.get(0);
		return null;
	}

	@Override
	public List<Task> getTaskListByPublisher(Integer userId) {
		String hql = "from Task where userId=? order by updateTime desc";
		return super.find(hql, new Object[] { userId });
	}

	@Override
	public List<Task> getTaskListByAcceptor(Integer userId) {
		String hql = "select t from Task t, TaskAccept a where t.id=a.taskId and a.userId=? order by t.updateTime desc";
		return super.find(hql, new Object[] { userId });
	}

	@Override
	public Integer getTaskCount() {
		String hql = "select count(*) from Task";
		return super.count(hql);
	}
}
