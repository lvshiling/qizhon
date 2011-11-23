/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserMsg;

/**
 * @author Administrator
 *
 */
public interface UserMsgDao {

	/**
     * @param record
     * @return
     */
    public UserMsg save(UserMsg record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserMsg get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserMsg record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserMsg record);

    /**
     * 读取用户站内信
     * @param userId
     * @param p
     * @param pageSize
     * @param isUnRead
     * @return
     */
	public List<UserMsg> getUserMsg(Integer userId, Integer p,
			Integer pageSize, boolean isUnRead);



}
