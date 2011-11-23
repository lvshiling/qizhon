/**
 * 
 */
package com.navigation.utils;

import t4j.TBlog;
import weibo4j.Weibo;

import com.navigation.dao.UserLinkDao;
import com.navigation.domain.Constant;
import com.navigation.exception.ServiceException;
import com.navigation.pojo.UserLink;

/**
 * @author wanghui2
 *
 * Apr 12, 2011 4:17:03 PM
 */
public class WeiBoUtil {

	public static UserLinkDao userLinkDao;
	
	/**
	 * 取得绑定好的 新浪帐号
	 * @param userId
	 * @return
	 */
	public static Weibo getBindWeibo(Integer userId){
		UserLink userLink = null;
		if(userId != null){
			userLink = userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_SINA);
		}
		if(null == userLink) userLink = getSystemAccount();
		if(null == userLink) throw new ServiceException("系统SYSTEMID获取失败");
		//获取accessToken
		System.setProperty("weibo4j.oauth.consumerKey", Weibo.CONSUMER_KEY);
		System.setProperty("weibo4j.oauth.consumerSecret", Weibo.CONSUMER_SECRET);
		String token = userLink.getLinkField2();
		String tokenSecret = userLink.getLinkField3();
		Weibo weibo = new Weibo();
		weibo.setOAuthAccessToken(token, tokenSecret);
		return weibo;
	}
	
	/**
	 * 网易微博
	 * @param userId
	 * @return
	 */
	public static TBlog getUserTblog(Integer userId){
		UserLink userLink = null;
		if(userId != null){
			userLink = userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_163WEIBO);
		}
		if(null == userLink) return null;
		//获取accessToken
		TBlog tBlog = new TBlog();
		tBlog.setToken(userLink.getLinkField2(), userLink.getLinkField3());
		return tBlog;
	}
	
	/**
	 * 取得用户 绑定的新浪帐号
	 * @param userId
	 * @return
	 */
	public static Weibo getUserWeibo(Integer userId){
		UserLink userLink = null;
		if(userId != null){
			userLink = userLinkDao.getUserLink(userId, Constant.LINKTYPE_BIND_SINA);
		}
		if(null == userLink) return null;
		//获取accessToken
		System.setProperty("weibo4j.oauth.consumerKey", Weibo.CONSUMER_KEY);
		System.setProperty("weibo4j.oauth.consumerSecret", Weibo.CONSUMER_SECRET);
		String token = userLink.getLinkField2();
		String tokenSecret = userLink.getLinkField3();
		Weibo weibo = new Weibo();
		weibo.setOAuthAccessToken(token, tokenSecret);
		return weibo;
	}
	
	public static UserLink getSystemAccount(){
		UserLink systemUser = userLinkDao.getSinaDefaultUser();
		return systemUser;
	}
	

	public UserLinkDao getUserLinkDao() {
		return userLinkDao;
	}

	public static void setUserLinkDao(UserLinkDao userLinkDao) {
		WeiBoUtil.userLinkDao = userLinkDao;
	}
}
