/**
 * 
 */
package com.navigation.action.weibo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import t4j.TBlog;
import t4j.TBlogException;
import weibo4j.Comment;
import weibo4j.Paging;
import weibo4j.Status;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.org.json.JSONArray;
import weibo4j.org.json.JSONException;
import weibo4j.org.json.JSONObject;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.commons.Statuses_API;
import com.mime.qweibo.commons.T_API;
import com.navigation.action.BaseAction;
import com.navigation.action.topic.TopicAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.Topic;
import com.navigation.pojo.TopicSort;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;
import com.navigation.service.TopicService;
import com.navigation.service.UserService;
import com.navigation.utils.StringUtil;
import com.navigation.utils.WeiBoUtil;

/**
 * @author wanghui2
 *
 * May 25, 2011 4:49:25 PM
 */
public class WeiboAction extends BaseAction{

	/**
	 * 微博功能	1.0
	 * 绑定新浪微博
	 * 可以发表微博
	 * 读到自己的微博	TIMELINE
	 * 可以读取评论
	 * 可以发表评论
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	public UserService userService;
	@Resource
	public TopicService topicService;

	public Integer createFlag = 0;
	public String sid;
	public String cid;
	public String content;
	public Integer is_comment = 0;	//评论方式 是否在转发的同时发表评论。0表示不发表评论，1表示发表评论给当前微博，2表示发表评论给原微博，3是1、2都发表。默认为0。 
	public Integer topicSortId;
	public String maxId;
	
	public Integer bindType = -1;	//取微博的种类
	
	public Integer postSinaFlag = 0;//推送到新浪
	public Integer postQqFlag = 0;	//推送到腾讯
	public Integer postTopic = 0;	//发贴子
	public Integer postNeteasyFlag = 0;	//推送到网易
	public Integer postGpassFlag = 0;	//推送GPASS
	
	/**
	 * 没有登录的提示登录
	 * 登录的提示绑定
	 * 绑定了的获取 TIMELINE
	 * @return
	 * @throws SessionException 
	 */
	public String index() throws SessionException{
		Integer userId = SessionUtil.getLogonUID();
		
		//用户绑定 微博IDs
		List<UserLink> userLinks = this.userService.getUserLinks(userId,new Integer[]{
				Constant.LINKTYPE_BIND_SINA,Constant.LINKTYPE_BIND_QQWEIBO,Constant.LINKTYPE_BIND_163WEIBO});
		if(userLinks != null && userLinks.size()>0){
			for (UserLink userLink : userLinks) {
				Integer type = userLink.getLinkType();
				switch (type) {
				case Constant.LINKTYPE_BIND_SINA:	//绑定ID 新浪
					this.getRequest().setAttribute("sinaUserLink", userLink);
					bindType = Constant.LINKTYPE_BIND_SINA;
					break;
				case Constant.LINKTYPE_BIND_QQWEIBO:	//绑定ID 腾讯
					this.getRequest().setAttribute("qqUserLink", userLink);
					bindType = Constant.LINKTYPE_BIND_QQWEIBO;
					break;
				case Constant.LINKTYPE_BIND_163WEIBO:	//绑定ID 网易
					this.getRequest().setAttribute("NeteasyUserLink", userLink);
					bindType = Constant.LINKTYPE_BIND_163WEIBO;
					break;
				default:
					break;
				}
			}
		}
		//取贴子分类
		if(bindType != -1){
			List<TopicSort> publicSortList = this.topicService.getPublicTopicSort(areaId);
			this.getRequest().setAttribute("publicSortList", publicSortList);
		}
		return "index";
	}
	
	/**
	 * 新浪微博，首页
	 * @return
	 * @throws SessionException 
	 */
	public String ajaxSinaWeibo() throws SessionException{
		Integer userId;
		userId = SessionUtil.getLogonUID();
		Paging paging = new Paging();
		pageSize = 20;
		paging.setCount(pageSize);
		List<Status> weiboList = null;
		try {
			weiboList = getSinaStatus(userId, paging);
		} catch (AjaxJsonException e) {
			e.printStackTrace();
		}
		this.getRequest().setAttribute("weiboList", weiboList);
		return "ajaxSinaWeibo";
	}
	
	/**
	 * 腾讯微博，首页
	 * @return
	 * @throws SessionException
	 */
	public String ajaxQqWeibo()throws SessionException{
		Integer userId;
		userId = SessionUtil.getLogonUID();
		Paging paging = new Paging();
		pageSize = 20;
		paging.setCount(pageSize);
		paging.setPage(p);
		List<Status> weiboList = null;
		weiboList = getQQweiboStatus(userId, paging);
		this.getRequest().setAttribute("weiboList", weiboList);
		return "ajaxQqWeibo";
	}

	/**
	 * 网易微博，首页
	 * @return
	 * @throws SessionException
	 */
	public String ajaxNeteasyWeibo()throws SessionException{
		Integer userId;
		userId = SessionUtil.getLogonUID();
		pageSize = 20;
		List<t4j.data.Status> weiboList = getNeteasyWeiboStatus(userId, pageSize,target,maxId);
		this.getRequest().setAttribute("weiboList", weiboList);
		return "ajaxNeteasyWeibo";
	}
	
	/**
	 * 取网易微博时间线
	 * @param userId
	 * @param maxId2 
	 * @param sinceId 
	 * @param pageSize 
	 * @return
	 */
	private List<t4j.data.Status> getNeteasyWeiboStatus(Integer userId, Integer pageSize, String sinceId, String maxId2) {
		List<t4j.data.Status> weiboList = null;
		t4j.data.Paging paging = new t4j.data.Paging();
		paging.setSinceId(sinceId);
		paging.setMaxId(maxId);
		paging.setCount(pageSize);
		try {
			weiboList = WeiBoUtil.getUserTblog(userId).getHomeTimeline(paging);
		} catch (TBlogException e) {
			e.printStackTrace();
		}
		return weiboList;
	}

	/**
	 * 取得TIMELINE 接口
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxGetStatus() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		
		pageSize = 20;
		switch (bindType) {
		case Constant.LINKTYPE_BIND_SINA:
			Paging paging = new Paging();
			paging.setCount(pageSize);
			paging.setPage(p);
			if(!StringUtil.isNullOrEmpty(target)){paging.setSinceId(Long.valueOf(target));}
			List<Status> weiboList = this.getSinaStatus(userId,paging);
			this.getRequest().setAttribute("weiboList", weiboList);
			break;
		case Constant.LINKTYPE_BIND_QQWEIBO:
			Paging pagingQQ = new Paging();
			pagingQQ.setCount(pageSize);
			pagingQQ.setPage(p);
			if(!StringUtil.isNullOrEmpty(target)){pagingQQ.setSinceId(Long.valueOf(target));}
			List<Status> qqWeiboList = this.getQQweiboStatus(userId,pagingQQ);
			this.getRequest().setAttribute("weiboList", qqWeiboList);
			break;
		case Constant.LINKTYPE_BIND_163WEIBO:
			List<t4j.data.Status> neweasyWeiboList = this.getNeteasyWeiboStatus(userId,pageSize,target,maxId);
			this.getRequest().setAttribute("weiboList", neweasyWeiboList);
			break;
		default:
			break;
		}
		return "ajaxGetStatus";
	}
	
	/**
	 * 取QQ微博 分页
	 * @param userId
	 * @param paging
	 * @return
	 */
	private List<Status> getQQweiboStatus(Integer userId, Paging paging) {
		List<Status> weiboList = new ArrayList<Status>();
		UserLink userlink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		Statuses_API api = new Statuses_API();
		OauthKey oauth = new OauthKey();
		oauth.customKey = Constant.QweiboAppKey;
		oauth.customSecrect = Constant.QweiboAppSecret;
		oauth.tokenKey = userlink.getLinkField2();
		oauth.tokenSecrect = userlink.getLinkField3();
		try {
			String pageFlag = paging.getPage()==1?"0":"1";	//0第一页，1往前翻页
			if(paging.getPage()==1 && paging.getSinceId() != -1){pageFlag = "2";}//刷新前页
			String str = api.home_timeline(oauth,"json",pageFlag,
					String.valueOf(paging.getSinceId()),String.valueOf(paging.getCount()));
			JSONObject obj = new JSONObject(str);
			if(!obj.isNull("data")){
				JSONObject info = obj.getJSONObject("data");
				JSONArray status = info.getJSONArray("info");
				for (int i = 0; i < status.length(); i++) {
					JSONObject json = status.getJSONObject(i);
					weiboList.add(new Status(json,"qq"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return weiboList;
	}

	/**
	 * 取新浪微博 分页
	 * @param userId
	 * @param paging
	 * @return
	 * @throws AjaxJsonException
	 */
	private List<Status> getSinaStatus(Integer userId, Paging paging) throws AjaxJsonException {
		List<Status> weiboList = new ArrayList<Status>();
		try {
			Weibo weibo = WeiBoUtil.getUserWeibo(userId);
			if(null == weibo) throw new AjaxJsonException("请先绑定微博帐户");
			weiboList = weibo.getHomeTimeline(paging);
		} catch (WeiboException e) {
			e.printStackTrace();
		}
		return weiboList;
	}

	/**
	 * 发表评论 
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxPostComment() throws AjaxJsonException{
		if(StringUtil.isNullOrEmpty(content)) throw new AjaxJsonException("评论不得为空");
		if(null == sid) throw new AjaxJsonException("评论对象为空");
		
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		Weibo weibo = WeiBoUtil.getUserWeibo(userId);
		if(null == weibo) throw new AjaxJsonException("请先绑定微博帐户");
		if(null != createFlag && createFlag == 0){
			//默认评论
			try {
				weibo.updateComment(content, sid, cid);
			} catch (WeiboException e) {
				throw new AjaxJsonException(e.getMessage());
			}
		}else if(createFlag == 1) {
			//转发
			try {
				weibo.repostAndComment(sid, content,1);
			} catch (WeiboException e) {
				e.printStackTrace();
				throw new AjaxJsonException("出错了");
			}
		}
		Map<String,String> values = new HashMap<String,String>();
		values.put("sid", sid);
		this.setJson(AjaxData.getSuccessJson("发送成功", values));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 发表 新的微博
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxPostStatus() throws AjaxJsonException, TBlogException{
		Integer userId;
		try {userId = SessionUtil.getLogonUID();} catch (SessionException e) {throw new AjaxJsonException("请先登录");}
		Status status = null;
		Topic topic = null;
		Map<String,String> result = new HashMap<String, String>();
		if(StringUtil.isNullOrEmpty(content)) throw new AjaxJsonException("内容不得为空");
		if(postSinaFlag == 0 && postQqFlag == 0 && postTopic == 0 && postNeteasyFlag==0)
			throw new AjaxJsonException("请选择发表到 ... !");
		
		//新浪微博
		if(null != postSinaFlag && postSinaFlag == 1 ){
			Weibo weibo = WeiBoUtil.getUserWeibo(userId);
			if(null == weibo) throw new AjaxJsonException("请先绑定微博帐户");
			try {
				status = weibo.updateStatus(content);
				result.put("sina", "新浪微博 发表成功!");
			} catch (WeiboException e) {
				result.put("sina", "新浪 "+e.getMessage());
			}
		}
		
		//腾讯微博
		if(null != postQqFlag && postQqFlag == 1 ){
			try {
				this.createQqWeibo(userId,content);
				result.put("qq", "腾讯微博 发表成功!");
			} catch (Exception e) {
				result.put("qq", "腾讯 "+e.getMessage());
			}
		}
		
		//发表贴子
		if(null != postTopic && postTopic == 1){
			try {
				topic = this.topicService.createNewTopic(userId, content, topicSortId,status,areaId);
				result.put("local", "讨论区贴子 发表成功!");
			} catch (Exception e) {
				result.put("local", e.getMessage());
			}
		}

		//网易微博
		if(null != postNeteasyFlag && postNeteasyFlag == 1){
			try {
				WeiBoUtil.getUserTblog(userId).updateStatus(content);
				result.put("163", "网易微博 发表成功!");
			} catch (TBlogException e) {
				e.printStackTrace();
				result.put("163", e.getMessage());
			}
		}

		//GPASS
		if(null != postGpassFlag && postGpassFlag == 1){
			if(topic == null){
				topic = new Topic();
				topic.setTitle(content);
				topic.setContent(content);
			}
			TopicAction.createGpassTopic(topic, null);
			result.put("gpass", "GPASS 发表成功!");
		}
		
		this.setJson(AjaxData.getSuccessJson("发送成功", result));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 创建 腾讯微博
	 * @param userId
	 * @param content2
	 * @throws AjaxJsonException
	 */
	private void createQqWeibo(Integer userId, String content2) throws AjaxJsonException {
		UserLink userlink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		T_API api = new T_API();
		OauthKey oauth = new OauthKey();
		oauth.customKey = Constant.QweiboAppKey;
		oauth.customSecrect = Constant.QweiboAppSecret;
		oauth.tokenKey = userlink.getLinkField2();
		oauth.tokenSecrect = userlink.getLinkField3();
		
		if(StringUtil.isNullOrEmpty(content2)) throw new AjaxJsonException("内容不得为空");
		String str = "";
		
		try {
			str = api.add(oauth, "json", content, userToken.getClientIp());
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		
		try {
			JSONObject json = new JSONObject(str);
			if(!json.isNull("msg")){
				String msg = json.getString("msg");
			}else throw new AjaxJsonException("评论出错");
		} catch (JSONException e) {
			throw new AjaxJsonException("返回格式有误");
		}
	}

	/**
	 * 取得腾讯 回复
	 * @return
	 */
	public String ajaxGetQqReply() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		Paging paging = new Paging();
		paging.setCount(pageSize);
		paging.setPage(p);
		if(!StringUtil.isNullOrEmpty(target)){
			paging.setSinceId(Long.valueOf(target));
		}
		List<Comment> list = this.getQQweiboComment(userId,sid,paging);
		this.getRequest().setAttribute("commentList", list);
		return "ajaxGetQqReply";
	}

	/**
	 * 取评论 腾讯
	 * @param userId
	 * @param statusId
	 * @param paging
	 * @return
	 */
	private List<Comment> getQQweiboComment(Integer userId, String statusId,
			Paging paging) {
		List<Comment> commentList = new ArrayList<Comment>();
		UserLink userlink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		T_API api = new T_API();
		OauthKey oauth = new OauthKey();
		oauth.customKey = Constant.QweiboAppKey;
		oauth.customSecrect = Constant.QweiboAppSecret;
		oauth.tokenKey = userlink.getLinkField2();
		oauth.tokenSecrect = userlink.getLinkField3();
		try {
			String pageFlag = paging.getPage()==1?"0":"1";
			String str = api.re_list(oauth,"json",statusId,pageFlag,
					String.valueOf(paging.getSinceId()),String.valueOf(paging.getCount()));
			JSONObject obj = new JSONObject(str);
			if(!obj.isNull("data")){
				JSONObject info = obj.getJSONObject("data");
				JSONArray commons = info.getJSONArray("info");
				for (int i = 0; i < commons.length(); i++) {
					JSONObject json = commons.getJSONObject(i);
					commentList.add(new Comment(json,"qq"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return commentList;
	}
	
	/**
	 * QQ 评论
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxPostQqComment() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		if(sid == null) throw new AjaxJsonException("ID不得为空");
		
		UserLink userlink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		T_API api = new T_API();
		OauthKey oauth = new OauthKey();
		oauth.customKey = Constant.QweiboAppKey;
		oauth.customSecrect = Constant.QweiboAppSecret;
		oauth.tokenKey = userlink.getLinkField2();
		oauth.tokenSecrect = userlink.getLinkField3();
		
		String str = "";
		if(null != createFlag && createFlag == 0){
			//默认评论
			try {
				str = api.comment(oauth, "json", content, userToken.getClientIp(), sid);
			} catch (Exception e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			}
		}else if(createFlag == 1) {
			//转发
			try {
				str = api.re_add(oauth, "json", content, userToken.getClientIp(), sid);
			} catch (Exception e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			}
		}
		try {
			JSONObject json = new JSONObject(str);
			if(!json.isNull("msg")){
				String msg = json.getString("msg");
			}else throw new AjaxJsonException("评论出错");
		} catch (JSONException e) {
			throw new AjaxJsonException("返回格式有误");
		}
		
		Map<String,String> values = new HashMap<String,String>();
		values.put("sid", sid);
		this.setJson(AjaxData.getSuccessJson("发送成功", values));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 腾讯 新的微博
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxPostQqStatus() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		this.createQqWeibo(userId, content);
		this.setJson(AjaxData.getSuccessJson("发送成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 发表网易微博评论
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxPostNeteasyComment() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e) {
			throw new AjaxJsonException("请先登录");
		}
		if(sid == null) throw new AjaxJsonException("ID不得为空");
		//发表
		TBlog tBlog = WeiBoUtil.getUserTblog(userId);
		
		if(null != createFlag && createFlag == 0){
			//默认评论
			try {
				tBlog.reply(Long.valueOf(sid), content,false,false);
			} catch (Exception e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			}
		}else if(createFlag == 1) {
			//转发
			try {
				tBlog.retweet(Long.valueOf(sid), content, true, true);
			} catch (Exception e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			}
		}
		
		Map<String,String> values = new HashMap<String,String>();
		values.put("sid", sid);
		this.setJson(AjaxData.getSuccessJson("发送成功", values));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 取得网易微博 回复
	 * @return
	 */
	public String ajaxGetNeteasyReply() throws AjaxJsonException{
		Integer userId;
		try {userId = SessionUtil.getLogonUID();} catch (SessionException e) {throw new AjaxJsonException("请先登录");}
		if(sid == null) throw new AjaxJsonException("ID不得为空");
		t4j.data.Paging paging = new t4j.data.Paging();
		paging.setCount(pageSize);
		paging.setMaxId(maxId);
		paging.setSinceId(target);
		
		List<t4j.data.Comment> commentList = null;
		try {
			commentList = WeiBoUtil.getUserTblog(userId).getComments(Long.valueOf(sid), paging);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (TBlogException e) {
			e.printStackTrace();
		}
		this.getRequest().setAttribute("commentList", commentList);
		return "ajaxGetNeteasyReply";
	}
	
}
