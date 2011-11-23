/**
 * 
 */
package com.navigation.action.bind;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import weibo4j.Comment;
import weibo4j.Paging;
import weibo4j.Status;
import weibo4j.User;
import weibo4j.Weibo;
import weibo4j.WeiboException;
import weibo4j.examples.WebOAuth;
import weibo4j.http.AccessToken;
import weibo4j.http.RequestToken;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;
import com.navigation.service.TopicService;
import com.navigation.service.UserService;
import com.navigation.utils.StringUtil;
import com.navigation.utils.WeiBoUtil;

/**
 * @author wanghui2
 *
 */
public class SinaAction extends BaseAction{

	/**
	 * 绑定新浪ID
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	public UserService userService;
	@Resource
	public TopicService topicService;
	
	public Integer topicId;
	public String sid;
	
	/**
	 * 新浪用户登录
	 * @return
	 */
	public String sinaLogin(){
		if(SessionUtil.isLogon()) _ = "您已经登录了";
		else{
			HttpServletRequest request = this.getRequest();
			if("1".equals(request.getParameter("opt"))){
				RequestToken resToken = WebOAuth.request(Constant.getDomainPath()+"/bind/sina/backLoginPage.do");
				if(resToken!=null){
					this.getSession().setAttribute("resToken",resToken);
					String url = resToken.getAuthorizationURL();
					
					try {
						this.getResponse().sendRedirect(url);
					} catch (IOException e) {
					}
					_ = "正在跳转中，请稍候...";
					request.setAttribute("toUrl", url);
				}else _ = "request error";
			}
		}
		return "sinaLogin";
	}
	
	/**
	 * 新浪登录	如果没有用户则创建用户，如果有用户，则帮忙登录
	 * @return
	 */
	public String backLogin(){
		HttpServletRequest request = this.getRequest();
		String verifier=request.getParameter("oauth_verifier");
		_ = "登录出错,请重试!";
		if(verifier!=null){
			HttpSession session = request.getSession();
			RequestToken resToken=(RequestToken) session.getAttribute("resToken");
			if(resToken!=null){
				AccessToken accessToken=WebOAuth.requstAccessToken(resToken,verifier);
				if(accessToken!=null){
					session.setAttribute("accessToken", accessToken);
					session.setMaxInactiveInterval(-1);
					//绑定USERLINK
					com.navigation.pojo.User dbUser = this.userService.sinaUserLogin(accessToken);
					
					//记住登录时间	一天
					String userId = StringUtil.encode(dbUser.getId().toString());
					Cookie cookie = new Cookie(Constant.COOKIE_KEY, StringUtil.encode(userId));
					cookie.setMaxAge(86400);	//86400 	COOKIE 一天
					cookie.setPath("/");
					HttpServletResponse response = this.getResponse();
					response.addCookie(cookie);
					
					String toUrl = Constant.getDomainPath()+"/";
					try {
						response.sendRedirect(toUrl);	//跳转
					} catch (IOException e) {
					}
					request.setAttribute("toUrl", toUrl);
					
					_ = "登录成功!";
				}else _=("access token request error");
			}else _=("request token session error");
		}
		return "backLogin";
	}
	
	/**
	 * 绑定跳转
	 * @return
	 * @throws IOException 
	 * @throws SessionException 
	 */
	public String index() throws IOException, SessionException{
		HttpServletRequest request = this.getRequest();
		Integer userId = SessionUtil.getLogonUID();
		if("1".equals(request.getParameter("opt"))){
			String domain = ServletActionContext.getServletContext().getInitParameter("domain");
			RequestToken resToken = WebOAuth.request(domain+"/bind/sina/bindPage.do");
			if(resToken!=null){
				this.getSession().setAttribute("resToken",resToken);
				this.getResponse().sendRedirect(resToken.getAuthorizationURL());
			}else System.out.println("request error");
		}
		return "bindSina";
	}
	
	/**
	 * 绑定 返回 提示绑定成功
	 * @return
	 * @throws SessionException 
	 */
	public String bind() throws SessionException{
		Integer userId = SessionUtil.getLogonUID();
		HttpServletRequest request = this.getRequest();
		String verifier=request.getParameter("oauth_verifier");
		_ = "绑定出错，请与管理员联系!";
		if(verifier!=null){
			HttpSession session = request.getSession();
			RequestToken resToken=(RequestToken) session.getAttribute("resToken");
			if(resToken!=null){
				AccessToken accessToken=WebOAuth.requstAccessToken(resToken,verifier);
				if(accessToken!=null){
					session.setAttribute("accessToken", accessToken);
					session.setMaxInactiveInterval(-1);
					//绑定USERLINK
					this.userService.bindSinaUser(userId,accessToken);
					//this.getResponse().sendRedirect("/user/index.do");	跳转
					_ = "绑定成功!";
				}else System.out.println("access token request error");
			}else System.out.println("request token session error");
		}
		return "bind";
	}
	
	/**
	 * 同步微博
	 * http://zt-2005935.ztgame.com/bind/sina/ajaxSyncWeiboApi.do
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxSyncWeibo() throws AjaxJsonException{
		Integer userId = null;
		try {
			userId = SessionUtil.getLogonUID();
		} catch (SessionException e1) {
			e1.printStackTrace();
			this.setJson(AjaxData.getNotLoginErrorJson(e1.getMessage(), target, null));
		}
		Weibo weibo = WeiBoUtil.getBindWeibo(null);
		try {
			Paging paging = new Paging();
			Long sinceId = topicService.getMaxSyncId(areaId);
			System.out.println(sinceId+"#########sinceId"); 
			paging.setCount(pageSize);
			if(null!= sinceId)paging.setSinceId(sinceId);
			List<Status> statusList = weibo.getHomeTimeline(paging);
			int statusCount = statusList.size();	//取到的条目数量
			Integer syncCount = 0;					//真实同步的数字
			if(statusCount>0) syncCount = this.topicService.syncWeibo(statusList,areaId);
			Map<String,String> values = new HashMap<String, String>();
			values.put("getNum", new String().valueOf(statusCount));
			values.put("insert", new String().valueOf(syncCount));
			setJson(AjaxData.getSuccessJson("同步成功", values));
		} catch (WeiboException e) {
			e.printStackTrace();
			throw new AjaxJsonException("同步失败");
		}
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 取得新浪评论 targetId!=null
	 * 
	 * @return
	 */
	public String ajaxGetSinaReply(){
		List<Comment> list = new ArrayList<Comment>();
		if(null != sid) {
			Weibo weibo = WeiBoUtil.getBindWeibo(null);
			try {
				list = weibo.getComments(sid,pageSize,p);
				this.getRequest().setAttribute("commentList", list);
			} catch (WeiboException e) {
				e.printStackTrace();
			}
		}
		return "ajaxGetSinaReply";
	}
	
	/**
	 * 测试
	 * @return
	 * @throws SessionException 
	 */
	public String test() throws SessionException{
		System.out.println("###########");
		Integer userId = SessionUtil.getLogonUID();
		//com.navigation.pojo.User user = this.userService.getUser(userId);
		UserLink link = this.userService.getUserLink(userId,0);
		String token = link.getLinkField2();
		System.out.println(token);
		String tokenSecret = link.getLinkField3();
		System.out.println(tokenSecret);
		Weibo weibo = new Weibo();
		try {
			System.setProperty("weibo4j.oauth.consumerKey", Weibo.CONSUMER_KEY);
			System.setProperty("weibo4j.oauth.consumerSecret", Weibo.CONSUMER_SECRET);
			weibo.setOAuthAccessToken(token, tokenSecret);
			System.out.println(weibo.CONSUMER_KEY);
			//weibo.getOAuthRequestToken();
//			User userInSina = weibo.endSession();
//			System.out.println(userInSina.getScreenName());
//			List<Status> list = weibo.getHomeTimeline();
//			for (Status status : list) {
//				System.out.println("##################");
//				User author = status.getUser();
//				System.out.println(status.getId());
//				System.out.println("作者："+author.getScreenName());
//				System.out.println("头像："+author.getProfileImageURL());
//				System.out.println("文字："+status.getText());
//				System.out.println("是否转发："+status.getRetweetDetails());
//				System.out.println("##################");
//			}
//			List<DirectMessage> list2 = weibo.getSentDirectMessages();
//			for (DirectMessage directMessage : list2) {
//				System.out.println(directMessage.getText());
//			}
			System.out.println("##################");
			//weibo.updateStatus("hello world!");
			System.out.println("##################");
			System.out.println("##################");
			List<Comment> list = weibo.getComments("9028205399");
			System.out.println(list.size());
			for (Comment comment : list) {
				System.out.println(comment.getText());
			}
			System.out.println("##################");
		} catch (WeiboException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AJAX_JSON_RESULT;
	}
	
	
}
