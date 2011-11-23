/**
 * 
 */
package com.navigation.action.bind;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;

import com.navigation.action.BaseAction;
import com.navigation.dao.UserLinkDao;
import com.navigation.domain.Constant;
import com.navigation.exception.SessionException;
import com.navigation.pojo.User;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;

/**
 * @author wanghui2
 *
 * Apr 13, 2011 12:27:35 PM
 */
public class GiantSso extends BaseAction{

	/**
	 * 绑定巨人公司 域帐户
	 */
	private static final long serialVersionUID = 1L;
	
	public Integer userId;
	public String ssoDomainName;
	@Resource
	public UserLinkDao userLinkDao;
	
	/**
	 * 验证域帐户跳转
	 * @return
	 * @throws SessionException 
	 * @throws IOException 
	 */
	public String  index() throws SessionException, IOException{
		Integer userId_login = SessionUtil.getLogonUID();
		String url = "http://passport.ztgame.com/passport/login/login2.php?userId="+userId_login+"&backUrl="+Constant.getDomainPath()+"/bind/giant/ajaxBindReturn.do";
		//System.out.println(url);
		this.getResponse().sendRedirect(url);
		this.getRequest().setAttribute("redirectUrl", url);
		return "index";
	}
	/**
	 * 返回地址
	 * http://192.168.82.87/bind/giant/ajaxBindReturn.do?userId=XX&ssoDomainName=XX
	 * http://passport.ztgame.com/passport/login/login2.php?userId=XX&backUrl=http://192.168.82.87/bind/giant/ajaxBindReturn.do
	 * http://192.168.32.253/service/dealWebService?wsdl
	 * http://passport.ztgame.com/passport/login/loginAMT.php?ssoDomainName=XXX
	 * 等他们给我接口文档吧
	 * 地址都订下俩了
	 * 登录:http://passport.ztgame.com/passport/login/login2.php?userId=xxxx
	 * 待办:http://passport.ztgame.com/passport/login/loginAMT.php?ssoDomainName=xxx
	 * @return
	 * @throws SessionException 
	 */
	public String ajaxBindReturn() throws SessionException{
		System.out.println("####################");
		System.out.println("userId:"+userId);
		System.out.println("ssoDomainName:"+ssoDomainName);
		System.out.println("####################");
		UserLink userLink = this.userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_GIANT);
		if(null == userLink) {
			userLink = new UserLink();
			userLink.setUser(new User(userId));
			userLink.setLinkType(Constant.LINKTYPE_BIND_GIANT);
			userLink.setLinkField1(ssoDomainName);
			userLink.setUpdateTime(new Date());
			this.userLinkDao.save(userLink);
			return "ajaxBindReturn";
		}
		userLink.setLinkField1(ssoDomainName);
		userLink.setUpdateTime(new Date());
		this.userLinkDao.update(userLink);
		return "ajaxBindReturn";
	}

	
}
