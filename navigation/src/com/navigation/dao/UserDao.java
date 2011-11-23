/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.User;

/**
 * @author Administrator
 * 
 */
public interface UserDao {

	/**
	 * @param record
	 * @return
	 */
	public User save(User record);

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
	public User get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(User record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(User record);

	/**
	 * 用EMAIL取得用户
	 * 
	 * @param email
	 * @return
	 */
	public User getUserByEmail(String email);

	/**
	 * 取得新浪ID注册的用户，不存在则创建
	 * 
	 * @param author
	 * @return
	 */
	public User getSinaUser(weibo4j.User author);

	/**
	 * 取得在线的用户列表
	 * 
	 * @param num
	 * @return
	 */
	public List<Integer> getLiveUserIdList(int limit);

	/**
	 * 取得排名前N位的用户
	 * 
	 * @param limit
	 * @param orderby
	 * @return
	 */
	public List<User> getUserCreditList(int limit, String orderby);

	/**
	 * 获得用户打分列表
	 * 
	 * @param num
	 * @return
	 */
	public List<Object[]> getUserScoreList(int num);

	/**
	 * 随机获得有默认照片的用户
	 * 
	 * @param num
	 * @return
	 */
	public List<User> randUsersWithPic(Integer userId, int num);

	/**
	 * 随机获得若干用户
	 * 
	 * @param num
	 * @return
	 */
	public List<User> randUsers(Integer userId, int num);
}
