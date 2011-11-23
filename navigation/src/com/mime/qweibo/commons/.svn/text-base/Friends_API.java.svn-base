package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 关系链相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Friends_API extends RequestAPI {

	/**
	 * 我的听众列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @return
	 * @throws Exception
	 */
	public String fanslist(OauthKey oauth, String format, String reqnum,
			String startindex) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));

		return getResource("http://open.t.qq.com/api/friends/fanslist",
				parameters, oauth);
	}

	/**
	 * 我收听的人列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @return
	 * @throws Exception
	 */
	public String idollist(OauthKey oauth, String format, String reqnum,
			String startindex) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));

		return getResource("http://open.t.qq.com/api/friends/idollist",
				parameters, oauth);
	}

	/**
	 * 黑名单列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @return
	 * @throws Exception
	 */
	public String blacklist(OauthKey oauth, String format, String reqnum,
			String startindex) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));

		return getResource("http://open.t.qq.com/api/friends/blacklist",
				parameters, oauth);
	}

	/**
	 * 特别收听列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @return
	 * @throws Exception
	 */
	// TODO 腾讯官方API错误，此方法尚未确认
	public String specaillist(OauthKey oauth, String format, String reqnum,
			String startindex) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));

		return getResource("http://open.t.qq.com/api/friends/specaillist",
				parameters, oauth);
	}

	/**
	 * 收听某个用户
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String add(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/add", parameters,
				oauth);
	}

	/**
	 * 取消收听某个用户
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String del(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/del", parameters,
				oauth);
	}
	
	/**
	 * 特别收听某个用户
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String addspecail(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/addspecail", parameters,
				oauth);
	}
	
	/**
	 * 取消特别收听某个用户
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String delspecial(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/delspecial", parameters,
				oauth);
	}
	
	/**
	 * 添加某个用户到黑名单
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String addblacklist(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/addblacklist", parameters,
				oauth);
	}
	
	/**
	 * 从黑名单中删除某个用户
	 * 
	 * @param oauth
	 * @param format
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String delblacklist(OauthKey oauth, String format, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("name", name));

		return postContent("http://open.t.qq.com/api/friends/delblacklist", parameters,
				oauth);
	}
	
	/**
	 * 检测是否我的听众或我收听的人
	 * 
	 * @param oauth
	 * @param format
	 * @param names
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public String check(OauthKey oauth, String format, String names,String flag) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("names", names));
		parameters.add(new QParameter("flag", flag));

		return getResource("http://open.t.qq.com/api/friends/check", parameters,
				oauth);
	}
	
	/**
	 * 获取其他用户听众列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String user_fanslist(OauthKey oauth, String format, String reqnum,
			String startindex,String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));
		parameters.add(new QParameter("name", name));

		return getResource("http://open.t.qq.com/api/friends/user_fanslist",
				parameters, oauth);
	}

	/**
	 * 我收听的人列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String user_idollist(OauthKey oauth, String format, String reqnum,
			String startindex,String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));
		parameters.add(new QParameter("name", name));

		return getResource("http://open.t.qq.com/api/friends/user_idollist",
				parameters, oauth);
	}
	
	/**
	 * 其他帐户特别收听的人列表
	 * 
	 * @param oauth
	 * @param format
	 * @param reqnum
	 * @param startindex
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String user_speciallist(OauthKey oauth, String format, String reqnum,
			String startindex,String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("startindex", startindex));
		parameters.add(new QParameter("name", name));

		return getResource("http://open.t.qq.com/api/friends/user_speciallist",
				parameters, oauth);
	}
}
