/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.Topic;

/**
 * @author Administrator
 *
 */
public interface TopicDao {

	/**
     * @param record
     * @return
     */
    public Topic save(Topic record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public Topic get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(Topic record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(Topic record);

    /**
     * 取得帖子列表
     * @param p
     * @param pageSize
     * @param targetUserId 
     * @param topicSortId 
     * @param areaId 
     * @return
     */
	public List<Topic> getTopicList(int p, int pageSize, Integer targetUserId, Integer topicSortId, Integer areaId);

	/**
	 * 取得总数
	 * @param targetUserId 
	 * @param topicSortId 
	 * @param areaId 
	 * @return
	 */
	public Integer getTopicListCount(Integer targetUserId, Integer topicSortId, Integer areaId);

	/**
	 * 取得帖子 取得USER
	 * @param topicId
	 * @return
	 */
	public Topic getTopicByIdFetchUser(Integer topicId);

	/**
	 * 取得同步过的贴子，以免重复
	 * @param ids
	 * @return
	 */
	public List<Topic> getSyncTopicByIds(Long[] ids);

	/**
	 * 取得最后的同步ID
	 * @return
	 */
	public long getLastSyncId(Integer areaId);

	/**
	 * 取得随机贴子
	 * @return
	 */
	public Topic getRandomTopic();

	/**
	 * 更改订阅数
	 * @param topicId
	 * @param i
	 */
	public void updateTopicSubscribeCount(Integer topicId, int i);

	/**
	 * 搜索
	 * @param keyWord
	 * @param pageSize
	 * @param p
	 * @return
	 */
	public List<Topic> searchTopoic(String keyWord, Integer pageSize, Integer p, Integer areaId);    
}
