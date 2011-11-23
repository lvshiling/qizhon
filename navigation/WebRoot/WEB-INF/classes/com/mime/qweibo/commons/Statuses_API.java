package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OAuth;
import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 时间线相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Statuses_API extends RequestAPI {

	/**
	 * 主页时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param pageflag
	 * @param pagetime
	 * @param reqnum
	 * @return
	 * @throws Exception
	 */
	public String home_timeline(OauthKey oauth, String format, String pageflag,
			String pagetime, String reqnum) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("Contenttype", "4"));
		return getResource("http://open.t.qq.com/api/statuses/home_timeline",
				parameters, oauth);
	}

	/**
	 * 广播大厅时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param pos
	 * @param reqnum
	 * @return
	 * @throws Exception
	 */
	public String public_timeline(OauthKey oauth, String format, String pos,
			String reqnum) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pos", pos));
		parameters.add(new QParameter("reqnum", reqnum));
		return getResource("http://open.t.qq.com/api/statuses/public_timeline",
				parameters, oauth);
	}

	/**
	 * 其他用户发表时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param pageflag
	 * @param pagetime
	 * @param reqnum
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String user_timeline(OauthKey oauth, String format, String pageflag,
			String pagetime, String reqnum, String name) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("name", name));
		return getResource("http://open.t.qq.com/api/statuses/user_timeline",
				parameters, oauth);
	}

	/**
	 * 用户提及时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param pageflag
	 * @param pagetime
	 * @param reqnum
	 * @param lastid
	 * @return
	 * @throws Exception
	 */
	public String mentions_timeline(OauthKey oauth, String format,
			String pageflag, String pagetime, String reqnum, String lastid)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("lastid", lastid));
		return getResource(
				"http://open.t.qq.com/api/statuses/mentions_timeline",
				parameters, oauth);
	}

	/**
	 * 话题时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param httext
	 * @param pageflag
	 * @param pageinfo
	 * @param reqnum
	 * @return
	 * @throws Exception
	 */
	public String ht_timeline(OauthKey oauth, String format, String httext,
			String pageflag, String pageinfo, String reqnum) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("httext", httext));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pageinfo", pageinfo));
		parameters.add(new QParameter("reqnum", reqnum));
		return getResource("http://open.t.qq.com/api/statuses/ht_timeline",
				parameters, oauth);
	}

	/**
	 * 我发表时间线
	 * 
	 * @param oauth
	 * @param format
	 * @param pageflag
	 * @param pagetime
	 * @param reqnum
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String broadcast_timeline(OauthKey oauth, String format,
			String pageflag, String pagetime, String reqnum, String name)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("name", name));
		return getResource(
				"http://open.t.qq.com/api/statuses/broadcast_timeline",
				parameters, oauth);
	}
}
