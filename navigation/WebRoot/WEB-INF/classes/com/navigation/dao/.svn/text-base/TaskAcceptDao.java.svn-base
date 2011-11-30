/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.TaskAccept;

/**
 * @author Administrator
 * 
 */
public interface TaskAcceptDao {

	/**
	 * @param record
	 * @return
	 */
	public TaskAccept save(TaskAccept record);

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
	public TaskAccept get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(TaskAccept record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(TaskAccept record);

	/**
	 * 根据用户id获取订单列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<TaskAccept> getAcceptListByUser(Integer userId);

	/**
	 * 根据状态获取订单列表
	 * 
	 * @param status
	 * @return
	 */
	public List<TaskAccept> getAcceptListByStatus(Integer status);
}
