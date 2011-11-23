/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;

import com.navigation.pojo.UserLogState;

/**
 * @author Administrator
 *
 */
public interface UserLogStateDao {

	/**
     * @param record
     * @return
     */
    public UserLogState save(UserLogState record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserLogState get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserLogState record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserLogState record);

    /**
     * 更新用户在线状态
     * @param userId
     */
	public void updateUserLogState(Integer userId);

	/**
	 * 取在线状态 HASHCODE
	 * @param hashCode
	 * @return
	 */
	public UserLogState getByHashCode(String hashCode);

	/**
	 * 根据userId取实体
	 * @param userId
	 * @return
	 */
	public UserLogState getByUserId(Integer userId);
}
