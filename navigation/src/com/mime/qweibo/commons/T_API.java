package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 微博相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class T_API extends RequestAPI {

	/**
	 * 获取一条微博数据
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String show(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return getResource("http://open.t.qq.com/api/t/show", parameters, oauth);
	}

	/**
	 * 发表一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @return
	 * @throws Exception
	 */
	public String add(OauthKey oauth, String format, String content,
			String clientip) throws Exception {
		return this.add(oauth, format, content, clientip, "", "");
	}

	/**
	 * 发表一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param jing
	 * @param wei
	 * @return
	 * @throws Exception
	 */
	public String add(OauthKey oauth, String format, String content,
			String clientip, String jing, String wei) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("content", content));
		parameters.add(new QParameter("clientip", clientip));
		parameters.add(new QParameter("jing", jing));
		parameters.add(new QParameter("wei", wei));
		return postContent("http://open.t.qq.com/api/t/add", parameters, oauth);
	}

	/**
	 * 删除一条微博数据
	 * 
	 * @param oauth
	 * @param format
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public String del(OauthKey oauth, String format, String id) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("id", id));
		return postContent("http://open.t.qq.com/api/t/del", parameters, oauth);
	}

	/**
	 * 转播一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String re_add(OauthKey oauth, String format, String content,
			String clientip, String reid) throws Exception {
		return this.re_add(oauth, format, content, clientip, "", "", reid);
	}

	/**
	 * 转播一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param jing
	 * @param wei
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String re_add(OauthKey oauth, String format, String content,
			String clientip, String jing, String wei, String reid)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("content", content));
		parameters.add(new QParameter("clientip", clientip));
		parameters.add(new QParameter("jing", jing));
		parameters.add(new QParameter("wei", wei));
		parameters.add(new QParameter("reid", reid));
		return postContent("http://open.t.qq.com/api/t/re_add", parameters, oauth);
	}

	/**
	 * 点评一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String comment(OauthKey oauth, String format, String content,
			String clientip, String reid) throws Exception {
		return this.comment(oauth, format, content, clientip, "", "", reid);
	}

	/**
	 * 点评一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param jing
	 * @param wei
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String comment(OauthKey oauth, String format, String content,
			String clientip, String jing, String wei, String reid)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("content", content));
		parameters.add(new QParameter("clientip", clientip));
		parameters.add(new QParameter("jing", jing));
		parameters.add(new QParameter("wei", wei));
		parameters.add(new QParameter("reid", reid));
		return postContent("http://open.t.qq.com/api/t/comment", parameters,
				oauth);
	}
	
	/**
	 * 回复一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String reply(OauthKey oauth, String format, String content,
			String clientip, String reid) throws Exception {
		return this.reply(oauth, format, content, clientip, "", "", reid);
	}

	/**
	 * 回复一条微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param jing
	 * @param wei
	 * @param reid
	 * @return
	 * @throws Exception
	 */
	public String reply(OauthKey oauth, String format, String content,
			String clientip, String jing, String wei, String reid)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("content", content));
		parameters.add(new QParameter("clientip", clientip));
		parameters.add(new QParameter("jing", jing));
		parameters.add(new QParameter("wei", wei));
		parameters.add(new QParameter("reid", reid));
		return postContent("http://open.t.qq.com/api/t/reply", parameters,
				oauth);
	}

	/**
	 * 发表一条带图片的微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param picpath
	 * @return
	 * @throws Exception
	 */
	public String add_pic(OauthKey oauth, String format, String content,
			String clientip, String picpath) throws Exception {
		return this.add_pic(oauth, format, content, clientip, "", "", picpath);
	}

	/**
	 * 发表一条带图片的微博
	 * 
	 * @param oauth
	 * @param format
	 * @param content
	 * @param clientip
	 * @param jing
	 * @param wei
	 * @param picpath
	 * @return
	 * @throws Exception
	 */
	public String add_pic(OauthKey oauth, String format, String content,
			String clientip, String jing, String wei, String picpath)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("content", content));
		parameters.add(new QParameter("clientip", clientip));
		parameters.add(new QParameter("jing", jing));
		parameters.add(new QParameter("wei", wei));
		
		List<QParameter> pic = new ArrayList<QParameter>();
		pic.add(new QParameter("pic", picpath));
		return postFile("http://open.t.qq.com/api/t/add_pic", parameters, pic,
				oauth);
	}

	/**
	 * 获取微博当前已被转播次数
	 * 
	 * @param oauth
	 * @param format
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public String re_count(OauthKey oauth, String format, String ids)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("ids", ids));
		return getResource("http://open.t.qq.com/api/t/re_count", parameters,
				oauth);
	}

	/**
	 * 获取单条微博的转播理由/点评列表
	 * 
	 * @param oauth
	 * @param format
	 * @param rootid
	 * @param pageflag
	 * @param pagetime
	 * @return
	 * @throws Exception
	 */
	public String re_list(OauthKey oauth, String format, String rootid,
			String pageflag, String pagetime,String reqnum) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("rootid", rootid));
		parameters.add(new QParameter("pageflag", pageflag));
		parameters.add(new QParameter("pagetime", pagetime));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("flag", "2"));
		return getResource("http://open.t.qq.com/api/t/re_list", parameters,
				oauth);
	}
}
