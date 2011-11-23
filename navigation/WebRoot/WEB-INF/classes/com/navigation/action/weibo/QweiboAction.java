/**
 * 
 */
package com.navigation.action.weibo;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import weibo4j.org.json.JSONArray;
import weibo4j.org.json.JSONObject;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.commons.Statuses_API;
import com.mime.qweibo.examples.QWeiboSyncApi;
import com.navigation.action.BaseAction;
import com.navigation.domain.Constant;
import com.navigation.exception.SessionException;
import com.navigation.pojo.UserLink;
import com.navigation.security.SessionUtil;
import com.navigation.service.UserService;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Jun 7, 2011 1:52:32 PM
 */
public class QweiboAction extends BaseAction{

	/**
	 * 腾讯微博
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	public UserService userService;
	
	/**
	 * 跳转 去腾讯
	 * @return
	 * @throws SessionException
	 * @throws IOException
	 */
	public String index() throws SessionException, IOException{
		HttpServletRequest request = this.getRequest();
		Integer userId = SessionUtil.getLogonUID();
		if("1".equals(request.getParameter("opt"))){
			String domain = ServletActionContext.getServletContext().getInitParameter("domain")+"/weibo/qq/bindPage.do";
			//1
			String requestToken = new QWeiboSyncApi().getRequestToken(Constant.QweiboAppKey, Constant.QweiboAppSecret,domain);
			OauthKey oauthKey = parseRequestKey(requestToken);
			oauthKey.callbackUrl = domain;
			this.getSession().setAttribute("QQWEIBO_KEY", oauthKey);
			String url = "http://open.t.qq.com/cgi-bin/authorize?oauth_token="+ oauthKey.tokenKey;
			this.getResponse().sendRedirect(url);
			return "index";
		}
		//test
		UserLink userlink = this.userService.getUserLink(userId, Constant.LINKTYPE_BIND_QQWEIBO);
		System.out.println(userlink.getLinkField1());
		Statuses_API api = new Statuses_API();
		OauthKey oauth = new OauthKey();
		oauth.customKey = Constant.QweiboAppKey;
		oauth.customSecrect = Constant.QweiboAppSecret;
		oauth.tokenKey = userlink.getLinkField2();
		oauth.tokenSecrect = userlink.getLinkField3();
		try {
			String str = api.home_timeline(oauth, "json", "0", "0", "20");
			JSONObject obj = new JSONObject(str);
			JSONObject info = obj.getJSONObject("data");
			JSONArray status = info.getJSONArray("info");
			for (int i = 0; i < status.length(); i++) {
				JSONObject o = status.getJSONObject(i);
				System.out.println((i+1)+o.get("origtext").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
	
	/**
	 * 跳转回来 绑定
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
			OauthKey oauthKey = (OauthKey) session.getAttribute("QQWEIBO_KEY");
			String accessTokenString = new QWeiboSyncApi().getAccessToken(
					oauthKey.customKey, oauthKey.customSecrect, 
					oauthKey.tokenKey, oauthKey.tokenSecrect, verifier);
			if(!StringUtil.isNullOrEmpty(accessTokenString)){
				OauthKey oauth = parseRequestKey(accessTokenString);
				if(null != oauth){
					userService.bindTencentUser(userId,oauth);
					_ = "绑定成功!";
				}
			}
		}
		return "bind";
	}
	
	private OauthKey parseRequestKey(String response){
		OauthKey oauthKey = new OauthKey();
		String[] tokenArray = response.split("&");
		if (tokenArray.length < 2) return null;
		String strTokenKey = tokenArray[0];
		String strTokenSecrect = tokenArray[1];
		String[] token1 = strTokenKey.split("=");
		if (token1.length < 2) return null;
		oauthKey.tokenKey = token1[1];
		String[] token2 = strTokenSecrect.split("=");
		if (token2.length < 2) return null;
		oauthKey.tokenSecrect = token2[1];
		
		if(tokenArray.length>2){
			String[] token3 = tokenArray[2].split("=");
			if (token3.length < 2) return null;
			oauthKey.userName = token3[1];
		}
		oauthKey.customKey = Constant.QweiboAppKey;
		oauthKey.customSecrect = Constant.QweiboAppSecret;
		return oauthKey;
	}

}
