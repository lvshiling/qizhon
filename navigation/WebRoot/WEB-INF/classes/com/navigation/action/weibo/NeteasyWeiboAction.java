/**
 * 
 */
package com.navigation.action.weibo;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import t4j.TBlog;
import t4j.TBlogException;
import t4j.http.AccessToken;
import t4j.http.RequestToken;

import com.navigation.action.BaseAction;
import com.navigation.exception.SessionException;
import com.navigation.security.SessionUtil;
import com.navigation.service.UserService;

/**
 * @author wanghui2
 *
 * Jun 24, 2011 8:42:00 AM
 */
public class NeteasyWeiboAction extends BaseAction{

	/**
	 * 网易微博
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	public UserService userService;
	
	/**
	 * 网易微博 认证
	 * @return
	 * @throws SessionException 
	 * @throws IOException 
	 */
	public String index() throws SessionException{
		HttpServletRequest request = this.getRequest();
		SessionUtil.getLogonUID();
		if("1".equals(request.getParameter("opt"))){
			String domain = ServletActionContext.getServletContext().getInitParameter("domain");
			TBlog tblog = new TBlog();
			String goUrl = null;
			try {
				RequestToken requestToken = tblog.getOAuthRequestToken();
				if(requestToken!=null){
					this.getSession().setAttribute("163RequestToken",requestToken);
					goUrl = requestToken.getAuthenticationURL(domain+"/weibo/163/bindPage.do");
					try {
						this.getResponse().sendRedirect(goUrl);
					} catch (IOException e) {
						this.getRequest().setAttribute("goUrl", goUrl);
						e.printStackTrace();
					}
				}else System.out.println("request error");
			} catch (TBlogException e) {
				e.printStackTrace();
			}
		}
		return "index";
	}
	
	/**
	 * 绑定
	 * @return
	 * @throws SessionException 
	 */
	public String bind() throws SessionException{
		Integer userId = SessionUtil.getLogonUID();
		RequestToken requestToken = (RequestToken) this.getSession().getAttribute("163RequestToken");
		if(requestToken!= null){
			TBlog tblog = new TBlog();
			try {
				AccessToken accessToken = tblog.getOAuthAccessToken(requestToken);
				userService.bind163User(userId,accessToken);
			} catch (TBlogException e) {
				e.printStackTrace();
			}
		}
		return "bind";
	}

}
