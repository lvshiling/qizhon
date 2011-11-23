/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.Date;

import com.navigation.pojo.UserVisitLog;

/**
 * @author Administrator
 * 
 */
public interface UserVisitLogDao {

	/**
	 * @param record
	 * @return
	 */
	public UserVisitLog save(UserVisitLog record);

	/**
	 * 通过主键获取实体.
	 */
	public UserVisitLog get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(UserVisitLog record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(UserVisitLog record);

	/**
	 * 通过ownerId、pageId和日期获取实体
	 * 
	 * @param owner
	 * @param page
	 * @param date
	 * @return
	 */
	public UserVisitLog get(Integer owner, Integer page, Date date);
}
