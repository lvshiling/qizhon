/**
 * 
 */
package com.navigation.action.topic;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.domain.PageBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Topic;
import com.navigation.pojo.TopicReply;
import com.navigation.pojo.TopicSort;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;
import com.navigation.service.TopicService;
import com.navigation.service.UserService;
import com.navigation.utils.Constants;
import com.navigation.utils.FileUtil;
import com.navigation.utils.StringUtil;
import com.navigation.utils.TopicUtil;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndFeedImpl;
import com.sun.syndication.io.SyndFeedOutput;

/**
 * @author WANGHUI
 * Apr 9, 2011 12:45:14 PM
 */
public class TopicAction extends BaseAction{

	/**
	 * 帖子相关
	 */
	private static final long serialVersionUID = 301122116660052991L;
	@Resource
	public TopicService topicService;
	@Resource
	public UserService userService;
	
	public Integer topicId;
	public Integer lastReplyId = 0;
	public String title;
	public String content;
	public Integer targetUserId;
	public String sendSinaFlag;
	public Integer topicSortId;
	public Integer isFake;
	
	public Integer sendGpassFlag;
	private Integer areaId = 1;
	
	/**
	 * 讨论区首页
	 * @return
	 */
	public String index(){
		PageBean pageBean = this.topicService.getTopicListBean(p, pageSize,targetUserId,null,areaId);
		this.getRequest().setAttribute("topicPageBean", pageBean);
		
		if(SessionUtil.isLogon()){
			try {
				Integer userId = SessionUtil.getLogonUID();
				UserLink sinaLink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_SINA);
				this.getRequest().setAttribute("sinaLink", sinaLink);
				//TODO:只有管理员才有隐藏论坛
				List<TopicSort> userSortList = this.topicService.getTopicSort(userId,areaId);
				this.getRequest().setAttribute("userSortList", userSortList);
			} catch (SessionException e) {
			}
		}
		List<TopicSort> publicSortList = this.topicService.getPublicTopicSort(areaId);
		//讨论区版块
		this.getRequest().setAttribute("publicSortList", publicSortList);
		return "index";
	}
	
	/**
	 * 按分页取得帖子列表
	 * @return
	 */
	public String ajaxGetTopicList(){
		PageBean pageBean = topicService.getTopicListBean(p, pageSize,targetUserId,topicSortId,areaId);
		this.getRequest().setAttribute("topicPageBean", pageBean);
		return "ajaxGetTopicList";
	}
	
	/**
	 * 取得帖子的回复
	 * @return
	 */
	public String ajaxGetTopicReply(){
		try {
			List<TopicReply> replyList = new ArrayList<TopicReply>();
			Topic topic = new Topic();
			if(null == lastReplyId || lastReplyId ==0){
				topic = this.topicService.getTopicByIdFetchUserOrRandom(topicId);
				if(null == topic) throw new Exception("帖子不存在");
				this.getRequest().setAttribute("topic", topic);
				replyList = this.topicService.getTopicReplyList(topic,lastReplyId);
				topicId = topic.getId();
				topic.setContent(TopicUtil.parseEmote(topic.getContent()));
			}else{
				topic = new Topic(topicId);
				replyList = this.topicService.getTopicReplyList(topic,lastReplyId);
			}
			this.getRequest().setAttribute("topicReplyList", replyList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ajaxGetTopicReply";
	}
	
	/**
	 * 创建帖子
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxCreateTopic() throws AjaxJsonException{
		Integer userId = null;
		if(StringUtil.isNullOrEmpty(title))throw new AjaxJsonException("标题不得为空");
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			userId = 1;	//匿名发表
		}
		Topic topic = this.topicService.createNewTopic(userId, title, content,sendSinaFlag,topicSortId,isFake,areaId);
		
		//创建贴子GPASS
		if(sendGpassFlag != null  && sendGpassFlag == 1 && topic!=null){
			List<TopicReply> replyList = this.topicService.getTopicReplyList(topic, lastReplyId);
			this.createGpassTopic(topic,replyList);
		}
		
		//订阅
		if(_.equalsIgnoreCase("true") && userId.intValue() != 1) this.userService.subTopic(userId, topic.getId(), topic.getTitle());
		this.setJson(AjaxData.getSuccessJson("创建成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 创建Gpass 贴子
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxCreateGpassTopic() throws AjaxJsonException{
		if(topicId==null) throw new  AjaxJsonException("贴子ID不得为空");
		Topic topic = this.topicService.getTopicById(topicId);
		if(topic==null) throw new AjaxJsonException("贴子不存在");
		Integer authorId = topic.getUserByAuthorId().getId();
		try {
			Integer userId = SessionUtil.getLogonUID();
			List<TopicReply> replyList = this.topicService.getTopicReplyList(topic, lastReplyId);
			//if(authorId.intValue() == userId.intValue())
				this.createGpassTopic(topic,replyList);
		} catch (SessionException e) {
			throw new AjaxJsonException(e.getMessage());
		}
		setJson(AjaxData.getSuccessJson("操作成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 创建贴子
	 * @param topic
	 */
	public static void createGpassTopic(Topic topic,List<TopicReply> replyList) {
		String target = topic.getTitle()+" 趣乐";
		String filePath = Constants.getInstance().path_gpass+File.separator+target;
		FileUtil.createDir(filePath, true);
		File file = new File(filePath+File.separator+"内详.txt");
		FileOutputStream f;
		try {
			f = new FileOutputStream(file);
			StringBuffer content = new StringBuffer();
			content.append(topic.getTitle());
			content.append("\r\n");
			content.append(topic.getContent());
			
			if(topic.getId() != null){
				content.append("\r\n\r\n如回复请跟帖：");
				content.append(Constant.getDomainPath());
				content.append("/topic/index.do?topicId=");
				content.append(topic.getId());
			}
			content.append("\r\n\r\n");
			content.append("如需联系，请说是在趣乐上看到的，谢谢！");
			
			if(replyList != null && replyList.size()>0){
				int i=1;
				content.append("\r\n\r\n（以下是原贴回复：由趣乐系统自动生成，请至原贴回复）");
				for (TopicReply topicReply : replyList) {
					content.append("\r\n\r\n====== "+i+" 楼 ======\r\n");
					content.append(topicReply.getContent());
					i++;
				}
			}
			f.write(content.toString().getBytes());
			f.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 创建回复
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxCreateReply() throws AjaxJsonException{
		Integer userId = null;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			userId = 1;
		}
		this.topicService.createNewReply(userId, topicId, content,isFake);
		Map<String, String> value = new HashMap<String, String>();
		value.put("topicId", topicId.toString());
		this.setJson(AjaxData.getSuccessJson("回复成功", value));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 删除帖子
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxDeleteTopic() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
			this.topicService.deleteTopic(userId,topicId);
			this.setJson(AjaxData.getSuccessJson("删除成功", null));
		}catch (SessionException e) {
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		}catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * RSS 阅读器
	 * @return
	 */
	public String rss() {
		List<Topic> topicList = this.topicService.getTopicList(p, 20, targetUserId, topicSortId,areaId);
		List<SyndEntry> entries = new ArrayList<SyndEntry>(); 
		int maxLength = 500;
		SyndEntry entry;
		SyndContentImpl description;
		for (Topic topic : topicList) {
			entry = new SyndEntryImpl();
			entry.setTitle(topic.getTitle());
			entry.setLink(Constant.getDomainPath().concat("/topic/index.do?topicId="+topic.getId()));
			entry.setPublishedDate(topic.getAddTime());
			String name = topic.getUserByAuthorId().getName();
			if(topic.getIsFake() == Constant.TOPIC_FAKE_FLAG) name = "匿名";
			if(topic.getUserByAuthorId().getId() == 1) name = "匿名";
			entry.setAuthor(name);
			entry.setUpdatedDate(topic.getLastReplyTime());
			description = new SyndContentImpl(); 
			description.setType("text/html"); 
			String content = topic.getContent();
			if(content != null && topic.getContent().length()>maxLength){ 
				description.setValue(topic.getContent().substring(0,maxLength)+"<br/><br/>【内容太长,只显示了前"+maxLength+"字，更多内容请看全文】"); 
			}else description.setValue(topic.getContent()); 
			entry.setDescription(description);
			entries.add(entry);
		}
		SyndFeed feed = new SyndFeedImpl(); 
		feed.setFeedType("rss_2.0"); 
		feed.setTitle("趣乐"); 
		feed.setLink("http://www.qule.com/topic/index.do"); 
		feed.setDescription("您身边的工作生活小帮手"); 
		feed.setEncoding("UTF-8");  
		feed.setEntries(entries);
		try { 
	        SyndFeedOutput output = new SyndFeedOutput(); 
	        this.setTarget(output.outputString(feed)); 
	    } catch (Exception ex){ 
	        ex.printStackTrace(); 
	    }
		return "RSS";
	}

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	
	
}
