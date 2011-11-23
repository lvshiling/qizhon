/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.TopicReply;

/**
 * @author Administrator
 *
 */
public interface TopicReplyDao {

	/**
     * @param record
     * @return
     */
    public TopicReply save(TopicReply record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public TopicReply get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(TopicReply record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(TopicReply record);

    /**
     * 取得回复 支持增量取得
     * @param topicId
     * @param lastReplyId
     * @return
     */
	public List<TopicReply> getReplyListByTopicIdAndLastReplyId(
			Integer topicId, Integer lastReplyId);    
}
