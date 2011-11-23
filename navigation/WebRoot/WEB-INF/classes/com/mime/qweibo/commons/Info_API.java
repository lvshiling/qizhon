package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 数据更新相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Info_API extends RequestAPI {
	/**
	 * 查看数据更新条数
	 * 
	 * @param oauth
	 * @param format
	 * @param op
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public String update(OauthKey oauth, String format, String op, String type)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("op", op));
		parameters.add(new QParameter("type", type));
		return getResource("http://open.t.qq.com/api/info/update", parameters,
				oauth);
	}
}
