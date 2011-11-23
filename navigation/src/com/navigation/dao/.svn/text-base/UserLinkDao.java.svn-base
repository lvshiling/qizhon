/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserLink;

/**
 * @author Administrator
 *
 */
public interface UserLinkDao {

	/**
     * @param record
     * @return
     */
    public UserLink save(UserLink record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserLink get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserLink record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserLink record);

    /**
     * 取得对应的绑定 帐户 
     * @param userId
     * @param bindType
     * @return
     */
	public UserLink getUserLink(Integer userId, Integer bindType);

	/**
	 * 取得系统ID
	 * @return
	 */
	public UserLink getSinaDefaultUser();

	/**
	 * 巨人域用户修改密码
	 * @param email
	 * @param password
	 * @return
	 */
	public void changeAdMailPassword(String email, String password);

	/**
	 * 用户绑定 数据
	 * @param userId
	 * @param types
	 * @return
	 */
	public List<UserLink> getUserLinks(Integer userId, Integer[] types);


}
