/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserCredit;

/**
 * @author Administrator
 * 
 */
public interface UserCreditDao {

	/**
	 * @param record
	 * @return
	 */
	public UserCredit save(UserCredit record);

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
	public UserCredit get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(UserCredit record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(UserCredit record);

	/**
	 * 取得用户帐户
	 * 
	 * @param userId
	 * @return
	 */
	public UserCredit getCredit(Integer userId);

	/**
	 * 取得按<code>orderby</code>排名前<code>limit</code>位的用户
	 * 
	 * @param limit
	 * @param orderby
	 * @return
	 */
	public List<UserCredit> getUserCreditList(int limit, String orderby);
}
