/**
 * 
 */
package com.navigation.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;

import weibo4j.Status;
import weibo4j.Weibo;
import weibo4j.WeiboException;

import com.navigation.dao.TopicDao;
import com.navigation.dao.TopicReplyDao;
import com.navigation.dao.TopicSortDao;
import com.navigation.dao.UserDao;
import com.navigation.dao.UserLinkDao;
import com.navigation.dao.UserNoticeDao;
import com.navigation.domain.Constant;
import com.navigation.domain.PageBean;
import com.navigation.domain.StatusBean;
import com.navigation.exception.ServiceException;
import com.navigation.pojo.Area;
import com.navigation.pojo.Topic;
import com.navigation.pojo.TopicReply;
import com.navigation.pojo.TopicSort;
import com.navigation.pojo.User;
import com.navigation.pojo.UserTopicSort;
import com.navigation.security.SessionUtil;
import com.navigation.service.TopicService;
import com.navigation.utils.StringUtil;
import com.navigation.utils.WeiBoUtil;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:35:15 AM
 */
public class TopicServiceImpl implements TopicService {

	@Resource
	public UserDao userDao;
	@Resource
	public UserNoticeDao userNoticeDao;
	@Resource
	public TopicDao topicDao;
	@Resource
	public TopicReplyDao topicReplyDao;
	@Resource
	public UserLinkDao userLinkDao;
	@Resource
	public TopicSortDao topicSortDao;
	
	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#createNewReply(com.navigation.pojo.TopicReply)
	 */
	public TopicReply createNewReply(TopicReply topicReply) {
		//创建提醒
		User replyer = topicReply.getUser();
		Integer userId = replyer.getId();
		this.userNoticeDao.updateTopicNotice(Constant.NOTICE_TYPE_TOPIC,topicReply.getTopic().getId(),userId);
		//同步新浪
		Topic topic = topicReply.getTopic();
		if(topic.getSyncId()!= null){
			Weibo weibo = WeiBoUtil.getBindWeibo(userId);
			try {
				String url = " 来自:"+Constant.getDomainPath()+"/topic/index.do?topicId="+topic.getId();
				String content = "//◎"+replyer.getName()+":"+topicReply.getContent()+url;
				weibo.updateComment(content, topic.getSyncId().toString(), null);
			} catch (WeiboException e) {
				e.printStackTrace();
				throw new ServiceException("绑定新浪帐户错误，或微博已不存在");
			}
		}
		//保存回复
		return this.topicReplyDao.save(topicReply);
	}

	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#createNewReply(java.lang.Integer, java.lang.Integer, java.lang.String)
	 */
	public TopicReply createNewReply(Integer userId, Integer topicId,
			String content, Integer isFake) {
		User user = this.userDao.get(userId);
		if(null == user ) throw new ServiceException("用户不存在");
		Topic topic = this.topicDao.get(topicId);
		if(null == topic) throw new ServiceException("贴子不存在");
		TopicReply reply = new TopicReply();
		reply.setTopic(topic);
		reply.setUser(user);
		reply.setContent(content);
		reply.setReplyUserName(user.getName());
		reply.setAddTime(new Date());
		//匿名
		if(isFake != null && isFake == Constant.TOPIC_FAKE_FLAG) reply.setIsFake(isFake);
		else reply.setIsFake(Constant.TOPIC_FAKE_NOMAL_FLAG);
		try {
			String ip = SessionUtil.getCurrentUser().getClientIp();	//设置IP
			if(ip.length()>20) ip = ip.substring(0,19);
			reply.setIpAddress(ip);
		} catch (Exception e) {}
		this.createNewReply(reply);
		topic.setUserByLastReplyUserId(user);
		if(isFake != null && isFake == Constant.TOPIC_FAKE_FLAG){
			topic.setLastReplyAuthorName("匿名");
		}else topic.setLastReplyAuthorName(user.getName());
		
		topic.setLastReplyTime(new Date());
		Integer replyCount = topic.getReplyCount();
		if(replyCount == null) replyCount = 0;
		topic.setReplyCount(replyCount+1);
		this.topicDao.update(topic);
		return reply;
	}

	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#createNewTopic(com.navigation.pojo.Topic)
	 */
	public Topic createNewTopic(Topic topic) {
		return this.topicDao.save(topic);
	}
	
	public Topic createNewTopic(Integer userId, String title, String content,
			String sendSinaFlag,Integer topicSortId, Integer isFake,Integer areaId) {
		User user = this.userDao.get(userId);
		if(null == user ) throw new ServiceException("用户不存在");
		Topic topic = new Topic();
		topic.setState(Constant.NOMAL_STATE);
		if(topicSortId!=null){
			TopicSort sort = this.topicSortDao.get(topicSortId);
			topic.setTopicSort(sort);
			if(sort.getState() == Constant.TOPIC_SORT_STATE_HIDDEN){
				//如果版块是隐藏的，则贴子也设置隐藏状态
				topic.setState(Constant.NOMAL_HIDDEN);
			}
		}
		topic.setUserByAuthorId(user);
		topic.setAddTime(new Date());
		topic.setTitle(title);
		topic.setContent(content);
		topic.setAuthorName(user.getName());
		topic.setLastReplyTime(new Date());
		//同步到新浪
		if(!StringUtil.isNullOrEmpty(sendSinaFlag) && sendSinaFlag.equalsIgnoreCase("true")){	//同步到新浪微博
			Weibo weibo = WeiBoUtil.getBindWeibo(userId);
			try {
				Status sinaStatus = weibo.updateStatus(title+"，"+content);
				topic.setSyncId(sinaStatus.getId());
			} catch (WeiboException e) {
				throw new RuntimeException("同步到 新浪出错");
			}
		}
		//匿名
		if(isFake != null && isFake == Constant.TOPIC_FAKE_FLAG) topic.setIsFake(isFake);
		else topic.setIsFake(Constant.TOPIC_FAKE_NOMAL_FLAG);
		try {
			String ip = SessionUtil.getCurrentUser().getClientIp();	//设置IP
			if(ip.length()>20) ip = ip.substring(0,19);
			topic.setIpAddress(ip);
		} catch (Exception e) {}
		topic.setArea(new Area(areaId));
		this.topicDao.save(topic);
		return topic;
	}

	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#deleteTopic(java.lang.Integer)
	 */
	public void deleteTopic(Integer userId,Integer topicId) {
		Topic topic = this.topicDao.get(topicId);
		if(null == topic) throw new ServiceException("贴子不存在");
		Integer ownerId = topic.getUserByAuthorId().getId();
		if(ownerId.intValue() != userId) throw new ServiceException("不能删除别人的帖子");
		Integer nowState = topic.getState();
		if(nowState == Constant.NOMAL_STATE){
			topic.setState(Constant.DELETE_STATE); 
		}else topic.setState(Constant.NOMAL_STATE);
		this.topicDao.update(topic);
	}

	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#getTopicById(java.lang.Integer)
	 */
	public Topic getTopicById(Integer topicId) {
		return this.topicDao.get(topicId);
	}

	/* (non-Javadoc)
	 * @see com.navigation.service.TopicService#getTopicList(int, int)
	 */
	public PageBean getTopicListBean(int p, int pageSize,Integer targetUserId,Integer topicSortId,Integer areaId) {
		PageBean pageBean = new PageBean();
		List<Topic> topicList = this.topicDao.getTopicList(p,pageSize,targetUserId,topicSortId,areaId);
		pageBean.setRecordList(topicList);
		Integer count = this.topicDao.getTopicListCount(targetUserId,topicSortId,areaId);
		pageBean.setRecordCount(count);
		return pageBean;
	}

	public List<TopicReply> getTopicReplyList(Integer topicId,Integer lastReplyId) {
		if(null == topicId) throw new ServiceException("贴子ID为空");
		Topic topic = this.topicDao.get(topicId);
		if(null == topic) throw new ServiceException("贴子不存在");
		return this.topicReplyDao.getReplyListByTopicIdAndLastReplyId(topicId,lastReplyId);
	}

	public List<TopicReply> getTopicReplyList(Topic topic, Integer lastReplyId) {
		return this.topicReplyDao.getReplyListByTopicIdAndLastReplyId(topic.getId(),lastReplyId);
	}

	public Topic getTopicByIdFetchUser(Integer topicId) {
		return this.topicDao.getTopicByIdFetchUser(topicId);
	}

	/**
	 * 同步微博
	 */
	public Integer syncWeibo(List<Status> statusList,Integer areaId) {
		//整理
		Map<Long,StatusBean> map = new TreeMap<Long,StatusBean>();
		Long[] ids = new Long[statusList.size()];
		for (int i = 0; i < statusList.size(); i++) {
			Status st = statusList.get(i);
			//取引用的帖子	
			map.put(st.getId(),StatusBean.initBean(st));
			ids[i] = st.getId();
		}
		//已经同步过的贴子
		List<Topic> topicList = this.topicDao.getSyncTopicByIds(ids);
		for (Topic topic : topicList) {
			Long syncId = topic.getSyncId();
			map.remove(syncId);
		}
		
		//插入数据库
		Set<Long> keySet = map.keySet();
		for (Long syncId : keySet) {
			StatusBean sb = map.get(syncId);
			if(null!=sb)this.addTopic(sb,areaId);
		}
		return keySet.size();
	}

	/**
	 * 微博 插入数据库
	 * @param sb
	 * @param areaId 
	 */
	private void addTopic(StatusBean sb, Integer areaId) {
		weibo4j.User author = sb.getAuthor();
		Status st = sb.getStatus();
		User user = this.userDao.getSinaUser(author);
		Topic topic = new Topic();
		topic.setSyncId(st.getId());
		topic.setTitle(st.getText());
		topic.setAddTime(st.getCreatedAt());
		topic.setUserByAuthorId(user);
		topic.setAuthorName(user.getName());
		topic.setState(Constant.NOMAL_STATE_FROM_SINA);
		topic.setLastReplyTime(st.getCreatedAt());
		Status stc = st.getRetweetDetails();
		if(null != stc && null!= stc.getText()){	//是否转发
			String content = "@"+stc.getUser().getScreenName()+":"+stc.getText();
			//缓存图片
			String smallPic = stc.getThumbnail_pic();
			if(!StringUtil.isNullOrEmpty(smallPic)){
				content += "<a href='"+stc.getOriginal_pic()+"' target='_blank'><img src='"+smallPic+"' class='thumbNailPic'></a>";
			}
			topic.setContent(content);
		}else{
			String smallPic = st.getThumbnail_pic();
			String content = "";
			if(!StringUtil.isNullOrEmpty(smallPic)){
				content += "<a href='"+st.getOriginal_pic()+"' target='_blank'><img src='"+smallPic+"' class='thumbNailPic'></a>";
			}
			topic.setContent(content);
		}
		topic.setArea(new Area(areaId));
		this.topicDao.save(topic);
	}

	public long getMaxSyncId(Integer areaId) {
		return this.topicDao.getLastSyncId(areaId);
	}

	public Topic getTopicByIdFetchUserOrRandom(Integer topicId) {
		if(topicId!=null) return this.getTopicByIdFetchUser(topicId);
		return this.topicDao.getRandomTopic();
	}

	public List<TopicSort> getPublicTopicSort(Integer areaId) {
		return this.topicSortDao.getPublicTopicSort(areaId);
	}

	
	public List<TopicSort> getTopicSort(Integer userId,Integer areaId) {
		List<TopicSort> list = new ArrayList<TopicSort>();
		if(null != userId){
			User user = this.userDao.get(userId);
			Set<UserTopicSort> userTopicSortList = user.getUserTopicSorts();
			if(userTopicSortList!=null){
				for (UserTopicSort userTopicSort : userTopicSortList) {
					TopicSort sort = userTopicSort.getTopicSort();
					sort.getSortName();
					list.add(sort);
				}
			}
		}
		return list;
	}

	public List<Topic> getTopicList(int p, int pageSize, Integer targetUserId,
			Integer topicSortId,Integer areaId) {
		return this.topicDao.getTopicList(p,pageSize,targetUserId,topicSortId,areaId);
	}

	public Topic createNewTopic(Integer userId, String content,
			Integer topicSortId, Status status,Integer areaId) {
		User user = this.userDao.get(userId);
		if(null == user ) throw new ServiceException("用户不存在");
		Topic topic = new Topic();
		topic.setState(Constant.NOMAL_STATE);
		if(topicSortId!=null){
			TopicSort sort = this.topicSortDao.get(topicSortId);
			topic.setTopicSort(sort);
			if(sort.getState() == Constant.TOPIC_SORT_STATE_HIDDEN){
				//如果版块是隐藏的，则贴子也设置隐藏状态
				topic.setState(Constant.NOMAL_HIDDEN);
			}
		}
		topic.setUserByAuthorId(user);
		topic.setAddTime(new Date());
		topic.setTitle(content);
		topic.setAuthorName(user.getName());
		topic.setLastReplyTime(new Date());
		topic.setIsFake(Constant.TOPIC_FAKE_NOMAL_FLAG);
		if(status!=null)topic.setSyncId(status.getId());
		try {
			String ip = SessionUtil.getCurrentUser().getClientIp();	//设置IP
			if(ip.length()>20) ip = ip.substring(0,19);
			topic.setIpAddress(ip);
		} catch (Exception e) {}
		topic.setArea(new Area(areaId));
		this.topicDao.save(topic);
		return topic;
	}

	public List<Topic> searchTopic(String keyWord, Integer pageSize, Integer p,Integer areaId) {
		return this.topicDao.searchTopoic(keyWord,pageSize,p,areaId);
	}



}
