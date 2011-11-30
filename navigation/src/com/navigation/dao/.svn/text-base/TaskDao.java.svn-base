/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;

/**
 * @author Alex
 */
public interface TaskDao {

	/**
	 * @param record
	 * @return
	 */
	public Task save(Task record);

	/**
	 * 通过主键获取实体.
	 * 
	 * @param <T>
	 *            被查询实体
	 * @param c
	 *            实体类型
	 * @param id
	 *            主键值
	 * @return the T 被查询实体
	 */
	public Task get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(Task record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(Task record);

	/**
	 * 获取任务列表
	 * 
	 * @param limit
	 * @param status
	 * @return
	 */
	public List<Task> getTaskList(int limit, Integer status);

	/**
	 * 根据任务id获取任务接受列表
	 * 
	 * @param taskId
	 * @return
	 */
	public List<TaskAccept> getAcceptList(Integer taskId);

	/**
	 * 根据任务id获取中标的接受请求
	 * 
	 * @param taskId
	 * @return
	 */
	public TaskAccept getWinnedAccept(Integer taskId);

	public List<Task> getTaskListByPublisher(Integer userId);

	public List<Task> getTaskListByAcceptor(Integer userId);

	public Integer getTaskCount();
}
