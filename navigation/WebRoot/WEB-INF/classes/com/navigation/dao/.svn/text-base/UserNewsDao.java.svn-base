/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.pojo.UserNews;

/**
 * @author Administrator
 * 
 */
public interface UserNewsDao {

	/**
	 * @param record
	 * @return
	 */
	public UserNews save(UserNews record);

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
	public UserNews get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(UserNews record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(UserNews record);

	public List<UserNews> getUserNewsList(Integer userId, Integer p, Integer pageSize);
	
	public List<UserNews> getUserNewsList(int limit, Integer[] types, Date afterTime);
}
