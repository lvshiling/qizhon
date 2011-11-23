/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.UserNotice;

/**
 * @author Administrator
 *
 */
public interface UserNoticeDao {

	/**
     * @param record
     * @return
     */
    public UserNotice save(UserNotice record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public UserNotice get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(UserNotice record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(UserNotice record);

    /**
     * 取得贴子订阅
     * @param userId
     * @param topicId
     * @return
     */
	public UserNotice getTopicNotice(Integer userId, Integer topicId);

	/**
	 * 创建提醒 
	 * @param userId 
	 * @param noticeTypeTopic
	 * @param id
	 */
	public void updateTopicNotice(int noticeType, Integer refId, Integer userId);

	/**
	 * 取得用户 未读提醒
	 * @param userId
	 * @return
	 */
	public List<UserNotice> getUserNotice(Integer userId,Integer noticeTpye,boolean isUnRead);

	/**
	 * 设置所有已读
	 * @param userId
	 */
	public void setReadedAll(Integer userId);

	/**
	 * 取得用户 邮件通知行
	 * @param userId
	 * @param linktypeBindMail
	 * @return
	 */
	public UserNotice getUserMailNotice(Integer userId, Integer linktypeBindMail);    
}
