/**
 * 
 */
package com.navigation.action.mail;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.AuthenticationFailedException;

import org.apache.struts2.ServletActionContext;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.Constant;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserMail;
import com.navigation.security.SessionUtil;
import com.navigation.service.UserService;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Apr 12, 2011 9:09:00 PM
 */
public class MailAction extends BaseAction {

	/**
	 * 邮件功能
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	public UserService userService;
	
	public String protocol;
	public String host;
	public String account;
	public String password;
	public String mailMode;

	/**
	 * 邮件首页
	 * @return
	 * @throws SessionException 
	 * @throws IOException 
	 */
	public String index() throws SessionException, IOException{
		Integer userId = SessionUtil.getLogonUID();
		if(_.equals("un") && targetId!= null){
			this.userService.unBindId(userId,targetId);
			String domain = ServletActionContext.getServletContext().getInitParameter("domain");
			this.getResponse().sendRedirect(domain+"/mail/index.do");
			return "index";
		}
		
		UserLink link = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_MAIL);
		if(null!=link) {
			this.getRequest().setAttribute("mailLink", link);
			//取邮件
			List<UserMail> mailList = this.userService.getUserMail(userId,link);
			this.getRequest().setAttribute("mailList", mailList);
			//拼邮件地址
			String domain = link.getLinkField3();
			if(domain.indexOf(":")!=-1)domain = domain.split(":")[0];
			domain = domain.substring(domain.indexOf(".")+1);
			this.getRequest().setAttribute("userMailAddress", link.getLinkField1()+"@"+domain);
		}
		return "index";
	}
	
	/**
	 * 绑定邮箱
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxBindMail() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
			this.userService.bindUserMail(userId, account, password, host, protocol);
			this.setJson(AjaxData.getSuccessJson("绑定成功", null));
		}catch (SessionException e) {
			e.printStackTrace();
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (AuthenticationFailedException e) {
			e.printStackTrace();
			throw new AjaxJsonException("用户名密码有误!");
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 检查邮件
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxCheckMail() throws AjaxJsonException{
		Integer userId;
		try {
			userId = SessionUtil.getLogonUID();
			List<UserMail> mailList = this.userService.checkUserMail(userId);
			this.getRequest().setAttribute("mailList", mailList);
			this.setJson(AjaxData.getSuccessJson("成功", null));
		}catch (SessionException e) {
			e.printStackTrace();
			this.setJson(AjaxData.getNotLoginErrorJson(e.getMessage(), target, null));
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 重定向
	 * @return
	 */
	public String ajaxLoadMail(){
		UserLink link = this.userService.getUserLink(targetId);
		//mail.domain.com
		String domain = link.getLinkField3();
		if(domain.indexOf(":")!=-1)domain = domain.split(":")[0];
		domain = domain.substring(domain.indexOf(".")+1);
		try {
			Integer userId = SessionUtil.getLogonUID();
			if(link.getUser().getId() == userId.intValue()){
				String pro = link.getLinkField4().equalsIgnoreCase("SSL")?"https://":"http://";
				if(!domain.equalsIgnoreCase("ztgame.com")){
					this.getResponse().sendRedirect(pro+"mail."+domain);
					return "none";
				}else {
					link.setLinkField2(StringUtil.decode(link.getLinkField2()));
					this.getRequest().setAttribute("l",link);
					this.getRequest().setAttribute("action",pro+"mail."+domain);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SessionException e) {
			e.printStackTrace();
		}
		return "ajaxLoadMail";
	}
	
	/**
	 * 收邮件
	 * @return
	 */
	public String ajaxGetUserMail(){
		try {
			Integer userId = SessionUtil.getLogonUID();
			List<UserMail> mailList = this.userService.getUserMail(userId,p,pageSize);
			this.getRequest().setAttribute("mailList", mailList);
		} catch (Exception e) {
			
		}
		return "ajaxGetUserMail";
	}
	
}
