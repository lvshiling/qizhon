/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserPicture;

/**
 * @author Administrator
 *
 */
public interface UserPictureDao {

	/**
	 * @param record
	 * @return
	 */
	public UserPicture save(UserPicture record);

	/**
	 * 通过主键获取实体.
	 * 
	 * @param <T> 被查询实体
	 * @param c 实体类型
	 * @param id 主键值
	 * @return the T 被查询实体
	 */
	public UserPicture get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record 实体对象
	 */
	public void update(UserPicture record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record 实体对象
	 */
	public void delete(UserPicture record);

	public List<UserPicture> getUserPics(Integer userId, Integer p, Integer pageSize);

	public Integer getUserPicsCount(Integer userId);
}
