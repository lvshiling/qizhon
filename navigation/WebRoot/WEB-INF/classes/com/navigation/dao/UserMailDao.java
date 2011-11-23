/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserMail;

/**
 * @author Administrator
 *
 */
public interface UserMailDao {

	/**
     * @param record
     * @return
     */
    public UserMail save(UserMail record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserMail get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserMail record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserMail record);

    /**
     * 是否插邮件
     * @param userMail
     */
	public UserMail saveOrNot(UserMail userMail);

	/**
	 * 取得新近邮件
	 * @param userId
	 * @param link
	 * @return
	 */
	public List<UserMail> getUserMail(Integer userId, UserLink link);
	public List<UserMail> getUserMail(Integer userId, Integer p,
			Integer pageSize);

	/**
	 * 搜索邮件
	 * @param userId
	 * @param keyWord
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<UserMail> searchMail(Integer userId, String keyWord, Integer p,
			Integer pageSize);
}
