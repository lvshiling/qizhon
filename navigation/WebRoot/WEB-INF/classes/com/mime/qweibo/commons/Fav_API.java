package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OAuth;
import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 数据收藏相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Fav_API extends RequestAPI {
	
	/**
	 * 收藏一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String addt(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return postContent("http://open.t.qq.com/api/fav/addt", parameters,
				oauth);
	}
	
	/**
	 * 取消收藏一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String delt(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return postContent("http://open.t.qq.com/api/fav/delt", parameters,
				oauth);
	}
	
	/**
	 * 获取收藏的微博列表
	 * 
	 * @param oauth
	 * @param format
	 * @param pageflag
	 * @param pagetime
	 * @param reqnum
	 * @return
	 * @throws Exception
	 */
	public String list_t(OauthKey oauth, String format, String pageflag,
			String pagetime, String reqnum) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		return getResource("http://open.t.qq.com/api/fav/list_t",
				parameters, oauth);
	}
	
	/**
	 * 收藏话题
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String addht(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return postContent("http://open.t.qq.com/api/fav/addht", parameters,
				oauth);
	}
	
	/**
	 * 取消收藏话题
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String delht(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return postContent("http://open.t.qq.com/api/fav/delht", parameters,
				oauth);
	}
	
	/**
	 * 获取用户已收藏的话题列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param pageflag
	 * @param pagetime
	 * @param lastid
	 * @return
	 * @throws Exception
	 */
	public String list_ht(OauthKey oauth, String format, String reqnum,
			String pageflag, String pagetime,String lastid) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));		
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("lastid", lastid));
		return getResource("http://open.t.qq.com/api/fav/list_ht",
				parameters, oauth);
	}
}
