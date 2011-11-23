package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 热度，趋势相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Trends_API extends RequestAPI {
	/**
	 * 话题热榜
	 * 
	 * @param oauth
	 * @param format
	 * @param type
	 * @param reqnum
	 * @param pos
	 * @return
	 * @throws Exception
	 */
	public String ht(OauthKey oauth, String format, String type,
			String reqnum, String pos) throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("type", type));
		parameters.add(new QParameter("reqnum", reqnum));
		parameters.add(new QParameter("pos", pos));
		return getResource("http://open.t.qq.com/api/trends/ht",
				parameters, oauth);
	}
}
