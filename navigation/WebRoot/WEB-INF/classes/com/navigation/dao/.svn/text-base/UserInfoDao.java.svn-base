/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;

import com.navigation.pojo.UserInfo;

/**
 * @author Administrator
 *
 */
public interface UserInfoDao {

	/**
     * @param record
     * @return
     */
    public UserInfo save(UserInfo record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserInfo get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserInfo record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserInfo record);

    /**
     * 取得用户 其它信息
     * @param id
     * @return
     */
	public UserInfo initUserInfo(Integer id);

	public UserInfo getUserInfo(Integer userId);


}
