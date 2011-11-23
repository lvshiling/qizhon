/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;

import com.navigation.pojo.UserScoreLog;

/**
 * @author Administrator
 * 
 */
public interface UserScoreLogDao {

	/**
	 * @param record
	 * @return
	 */
	public UserScoreLog save(UserScoreLog record);

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
	public UserScoreLog get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(UserScoreLog record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(UserScoreLog record);

	/**
	 * 获得用户平均打分
	 * 
	 * @param userId
	 * @return
	 */
	public Double getUserAvgScore(Integer userId);
}
