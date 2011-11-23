/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserCreditLog;

/**
 * @author Administrator
 *
 */
public interface UserCreditLogDao {

	/**
     * @param record
     * @return
     */
    public UserCreditLog save(UserCreditLog record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserCreditLog get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserCreditLog record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserCreditLog record);

    /**
     * 创建支付记录
     * @param userId
     * @param amount
     * @return
     */
	public UserCreditLog createLog(Integer userId, Integer credit, Integer cash);

	/**
	 * 记录
	 * @param userId
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserCreditLog> getUserPayLog(Integer userId, int p, int pageSize);


}
