package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 搜索相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

//注意：搜索相关API仅对腾讯合作方开放
public class Search_API extends RequestAPI {
	
	/**
	 * 搜索用户
	 * 
	 * @param oauth
	 * @param format
	 * @param keyword
	 * @param pagesize
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public String user(OauthKey oauth, String format, String keyword,
			String pagesize, String page) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("keyword", keyword));
		parameters.add(new QParameter("pagesize", pagesize));
		parameters.add(new QParameter("page", page));
		return getResource("http://open.t.qq.com/api/search/user", parameters,
				oauth);
	}

	/**
	 * 搜索广播
	 * 
	 * @param oauth
	 * @param format
	 * @param keyword
	 * @param pagesize
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public String tweet(OauthKey oauth, String format, String keyword,
			String pagesize, String page) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("keyword", keyword));
		parameters.add(new QParameter("pagesize", pagesize));
		parameters.add(new QParameter("page", page));
		return getResource("http://open.t.qq.com/api/search/tweet", parameters,
				oauth);
	}

	/**
	 * 搜索话题
	 * 
	 * @param oauth
	 * @param format
	 * @param keyword
	 * @param pagesize
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public String ht(OauthKey oauth, String format, String keyword,
			String pagesize, String page) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("keyword", keyword));
		parameters.add(new QParameter("pagesize", pagesize));
		parameters.add(new QParameter("page", page));
		return getResource("http://open.t.qq.com/api/search/ht", parameters,
				oauth);
	}
}
