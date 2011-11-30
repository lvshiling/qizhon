package com.navigation.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.navigation.dao.TaskAcceptDao;
import com.navigation.dao.TaskDao;
import com.navigation.domain.Constant;
import com.navigation.exception.ServiceException;
import com.navigation.pojo.Task;
import com.navigation.pojo.TaskAccept;
import com.navigation.service.TaskService;

/**
 * @author Alex
 */
public class TaskServiceImpl implements TaskService {

	@Resource
	public TaskDao taskDao;
	@Resource
	public TaskAcceptDao taskAcceptDao;

	@Override
	public List<Task> getNewTaskList(int limit) {
		return this.taskDao.getTaskList(limit, Constant.TASK_STATUS_NEW);
	}

	@Override
	public Task getTask(Integer taskId) {
		return this.taskDao.get(taskId);
	}

	@Override
	public List<TaskAccept> getAcceptList(Integer taskId) {
		return this.taskDao.getAcceptList(taskId);
	}

	@Override
	public TaskAccept getWinnedAccept(Integer taskId) {
		return this.taskDao.getWinnedAccept(taskId);
	}

	@Override
	public void acceptTask(TaskAccept taskAccept) {
		if (taskAccept != null) {
			Task task = this.taskDao.get(taskAccept.getTaskId());
			if (task == null)
				throw new ServiceException("不存在该任务");
			if (task.getUserId().equals(taskAccept.getUserId()))
				throw new ServiceException("不能接受自己的任务");

			Date now = new Date();
			taskAccept.setCreateTime(now);
			taskAccept.setUpdateTime(now);
			taskAccept.setStatus(Constant.TASK_ACCEPT_STATUS_NEW);
			taskAccept.setTaskName(task.getName());
			this.taskAcceptDao.save(taskAccept);
		}
	}

	@Override
	public TaskAccept winAccept(Integer taskOwnerId, Integer acceptId) {
		if (acceptId != null) {
			Date now = new Date();
			TaskAccept accept = this.taskAcceptDao.get(acceptId);

			if (accept != null) {
				Integer taskId = accept.getTaskId();
				Task task = this.taskDao.get(taskId);

				if (task != null) {
					if (!task.getUserId().equals(taskOwnerId))
						throw new ServiceException("对不起，您没有权限");
					task.setTaskAcptId(acceptId);
					task.setWinnerId(accept.getUserId());
					task.setWinnerName(accept.getUserName());
					task.setStatus(Constant.TASK_STATUS_BIDDED);
					task.setUpdateTime(now);
					this.taskDao.update(task);

					accept.setStatus(Constant.TASK_ACCEPT_STATUS_WIN);
					accept.setUpdateTime(now);
					this.taskAcceptDao.update(accept);

					return accept;
				}
			}
		}
		return null;
	}

	@Override
	public Task publishTask(Task task) {
		Date now = new Date();
		task.setCreateTime(now);
		task.setUpdateTime(now);
		task.setStatus(Constant.TASK_STATUS_NEW);
		return this.taskDao.save(task);
	}

	@Override
	public List<TaskAccept> getAcceptListByUser(Integer userId) {
		List<TaskAccept> list = this.taskAcceptDao.getAcceptListByUser(userId);
		if (list != null) {
			for (TaskAccept accept : list) {
				Task task = this.taskDao.get(accept.getTaskId());
				Integer taskStatus = task.getStatus();
				Integer winAcptId = task.getTaskAcptId();
				if (taskStatus != null && !accept.getId().equals(winAcptId)) {
					if (taskStatus.intValue() == Constant.TASK_STATUS_BIDDED) {
						accept.setStatus(Constant.TASK_ACCEPT_STATUS_FAIL);
					} else if (taskStatus.intValue() == Constant.TASK_STATUS_FINISH) {
						accept.setStatus(Constant.TASK_ACCEPT_STATUS_EXPIRED);
					}
				}
				accept.setTask(task);
			}
		}
		return list;
	}

	@Override
	public List<Task> getTaskListByAcceptor(Integer userId) {
		return this.taskDao.getTaskListByAcceptor(userId);
	}

	@Override
	public List<Task> getTaskListByPublisher(Integer userId) {
		return this.taskDao.getTaskListByPublisher(userId);
	}

	@Override
	public Integer getAllTaskCount() {
		return this.taskDao.getTaskCount();
	}

	@Override
	public TaskAccept updateAcceptStatus(Integer acceptId, Integer status) {
		TaskAccept accept = this.taskAcceptDao.get(acceptId);
		if (accept == null)
			throw new ServiceException("不存在该订单");
		accept.setStatus(status);
		this.taskAcceptDao.update(accept);
		return accept;
	}
	
	@Override
	public Task updateTaskStatus(Integer taskId, Integer status) {
		Task task = this.taskDao.get(taskId);
		if (task == null)
			throw new ServiceException("不存在该任务");
		task.setStatus(status);
		this.taskDao.update(task);
		return task;
	}

	@Override
	public List<TaskAccept> getAcceptListByStatus(Integer status) {
		return this.taskAcceptDao.getAcceptListByStatus(status);
	}

	@Override
	public TaskAccept passAccept(Integer acceptId) {
		TaskAccept accept = this.taskAcceptDao.get(acceptId);
		if (accept == null)
			throw new ServiceException("不存在该订单");
		Task task = this.taskDao.get(accept.getTaskId());
		if(task == null)
			throw new ServiceException("不存在该任务");
		accept.setStatus(Constant.TASK_ACCEPT_STATUS_PAYED);
		this.taskAcceptDao.update(accept);
		task.setStatus(Constant.TASK_STATUS_PAYED);
		this.taskDao.update(task);
		return accept;
	}
	
	@Override
	public TaskAccept unpassAccept(Integer acceptId) {
		TaskAccept accept = this.taskAcceptDao.get(acceptId);
		if (accept == null)
			throw new ServiceException("不存在该订单");
		Task task = this.taskDao.get(accept.getTaskId());
		if(task == null)
			throw new ServiceException("不存在该任务");
		accept.setStatus(Constant.TASK_ACCEPT_STATUS_NOT_PAYED);
		this.taskAcceptDao.update(accept);
		task.setStatus(Constant.TASK_STATUS_NOT_PAYED);
		this.taskDao.update(task);
		return accept;
	}
}
