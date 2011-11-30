/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.PageBean;
import com.navigation.pojo.UserAuth;

/**
 * @author Administrator
 * 
 */
public interface UserAuthDao {

	/**
	 * @param record
	 * @return
	 */
	public UserAuth save(UserAuth record);

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
	public UserAuth get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(UserAuth record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(UserAuth record);

	/**
	 * 获取待认证的请求列表
	 * 
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserAuth> getAwaitAuthList(Integer p, Integer pageSize);

	public PageBean getAwaitAuthPageBean(Integer p, Integer pageSize);

	public UserAuth getBy(Integer userId, Integer status);
	
	public UserAuth getBy(Integer userId, Integer status, boolean notequal);

	public UserAuth getBy(Integer userId);

	public List<UserAuth> getAwaitAuthList();
}
