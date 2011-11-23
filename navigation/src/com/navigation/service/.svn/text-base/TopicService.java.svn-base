/**
 * 
 */
package com.navigation.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import weibo4j.Status;

import com.navigation.domain.PageBean;
import com.navigation.pojo.Topic;
import com.navigation.pojo.TopicReply;
import com.navigation.pojo.TopicSort;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:29:09 AM
 */
public interface TopicService {

	/**
	 * 取得帖子
	 * @param topicId
	 * @return
	 */
	public Topic getTopicById(Integer topicId);
	public Topic getTopicByIdFetchUser(Integer topicId);
	
	/**
	 * 创建新的帖子
	 * @param topic
	 * @return
	 */
	public Topic createNewTopic(Topic topic);
	@Transactional
	public Topic createNewTopic(Integer userId,String title,String content, String sendSinaFlag, Integer topicSortId, Integer isFake,Integer areaId);
	
	/**
	 * 删除帖子
	 * @param userId
	 * @param topicId 
	 */
	public void deleteTopic(Integer userId, Integer topicId);
	
	/**
	 * 创建新的回复
	 * @param topicReply
	 * @return
	 */
	@Transactional
	public TopicReply createNewReply(TopicReply topicReply);
	public TopicReply createNewReply(Integer userId,Integer topicId,String content, Integer isFake);
	
	/**
	 * 取得贴子列表
	 * @param p
	 * @param pageSize
	 * @param targetUserId 
	 * @param topicSortId 
	 * @return
	 */
	public List<Topic> getTopicList(int p,int pageSize, Integer targetUserId, Integer topicSortId,Integer areaId);
	public PageBean getTopicListBean(int p,int pageSize, Integer targetUserId, Integer topicSortId, Integer areaId);
	
	/**
	 * 取得某贴子的回复 
	 * @param topicId
	 * @param lastReplyId 
	 * @return
	 */
	public List<TopicReply> getTopicReplyList(Integer topicId, Integer lastReplyId);
	public List<TopicReply> getTopicReplyList(Topic topic, Integer lastReplyId);
	
	/**
	 * 从微博同步	检查SYNC_ID
	 * @param statusList
	 */
	public Integer syncWeibo(List<Status> statusList,Integer areaId);
	
	/**
	 * 上次同步过后最大的ID
	 * @return
	 */
	public long getMaxSyncId(Integer areaId);
	
	/**
	 * 取得指定帖子，如果无指定则随机
	 * @param topicId
	 * @return
	 */
	public Topic getTopicByIdFetchUserOrRandom(Integer topicId);
	
	/**
	 * 取得公开的帖子分类
	 * @param areaId 
	 * @return
	 */
	public List<TopicSort> getPublicTopicSort(Integer areaId);
	
	/**
	 * 取得用户贴子分类 
	 * @param areaId 
	 * @return
	 */
	@Transactional
	public List<TopicSort> getTopicSort(Integer userId, Integer areaId);
	
	/**
	 * 发微博 时发贴
	 * @param userId
	 * @param content
	 * @param topicSortId
	 * @param status
	 */
	public Topic createNewTopic(Integer userId, String content,
			Integer topicSortId, Status status,Integer areaId);
	
	/**
	 * 关键字索引贴子
	 * @param keyWord
	 * @param pageSize
	 * @param p
	 * @param areaId
	 * @return
	 */
	public List<Topic> searchTopic(String keyWord, Integer pageSize, Integer p,Integer areaId);
	
	
}
