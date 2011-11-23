package com.mime.qweibo.commons;

import java.util.ArrayList;
import java.util.List;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;

/**
 * 其他相关API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class Other_API extends RequestAPI {
	
	/**
	 * 我可能认识的人
	 * 
	 * @param oauth
	 * @param format
	 * @param ip
	 * @param country_code
	 * @param province_code
	 * @param city_code
	 * @return
	 * @throws Exception
	 */
	public String kownperson(OauthKey oauth, String format, String ip,
			String country_code, String province_code, String city_code)
			throws Exception {
		List<QParameter> parameters = new ArrayList<QParameter>();
		parameters.add(new QParameter("format", format));
		parameters.add(new QParameter("ip", ip));
		parameters.add(new QParameter("country_code", country_code));
		parameters.add(new QParameter("province_code", province_code));
		parameters.add(new QParameter("city_code", city_code));
		return getResource("http://open.t.qq.com/api/other/kownperson",
				parameters, oauth);
	}
}
