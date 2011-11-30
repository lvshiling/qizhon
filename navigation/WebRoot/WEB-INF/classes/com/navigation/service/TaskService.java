package com.navigation.service;

import java.util.List;

import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;

/**
 * @author Alex
 */
public interface TaskService {

	public Task getTask(Integer taskId);

	/**
	 * 获取新建任务列表
	 * 
	 * @param limit
	 * @return
	 */
	public List<Task> getNewTaskList(int limit);

	/**
	 * 根据任务id获取任务接受列表
	 * 
	 * @param taskId
	 * @return
	 */
	public List<TaskAccept> getAcceptList(Integer taskId);

	/**
	 * 获取用户提交的订单列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<TaskAccept> getAcceptListByUser(Integer userId);

	/**
	 * 根据任务id获取中标的接受请求
	 * 
	 * @param taskId
	 * @return
	 */
	public TaskAccept getWinnedAccept(Integer taskId);

	/**
	 * 接受任务
	 * 
	 * @param taskAccept
	 */
	public void acceptTask(TaskAccept taskAccept);

	/**
	 * 选择中标请求
	 * 
	 * @param acceptId
	 */
	public TaskAccept winAccept(Integer taskOwnerId, Integer acceptId);

	/**
	 * 发布任务
	 * 
	 * @param task
	 */
	public Task publishTask(Task task);

	/**
	 * 根据发布人获取任务列表
	 * 
	 * @return
	 */
	public List<Task> getTaskListByPublisher(Integer userId);

	/**
	 * 根据接受人获取任务列表
	 * 
	 * @return
	 */
	public List<Task> getTaskListByAcceptor(Integer userId);

	/**
	 * 获取当前任务数量
	 * 
	 * @return
	 */
	public Integer getAllTaskCount();

	/**
	 * 修改订单状态
	 * 
	 * @param acceptId
	 * @param status
	 * @return
	 */
	public TaskAccept updateAcceptStatus(Integer acceptId, Integer status);

	/**
	 * 根据状态获取订单列表
	 * 
	 * @param status
	 * @return
	 */
	public List<TaskAccept> getAcceptListByStatus(Integer status);

	/**
	 * 修改任务状态
	 * 
	 * @param taskId
	 * @param status
	 */
	public Task updateTaskStatus(Integer taskId, Integer status);

	/**
	 * 订单审核通过
	 * 
	 * @param acceptId
	 */
	public TaskAccept passAccept(Integer acceptId);

	/**
	 * 订单审核不通过
	 * 
	 * @param acceptId
	 * @return
	 */
	public TaskAccept unpassAccept(Integer acceptId);
}
