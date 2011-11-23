package com.mime.qweibo.commons;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import com.mime.qweibo.OauthKey;
import com.mime.qweibo.QParameter;
import com.mime.qweibo.QWeiboRequest;

/**
 * Request Remote Server API
 * 
 * @author <a href="http://blog.javawind.net">Xuefang Xu</a>
 * @Data 2010-01-21
 * @Version 1.0.0
 */

public class RequestAPI {

	/**
	 * get json or xml resource from remote api
	 * 
	 * @param url
	 * @param params
	 * @param oauth
	 * @return
	 * @throws Exception
	 */
	public String getResource(String url, List<QParameter> parameters,
			OauthKey oauth) throws Exception {
		QWeiboRequest request = new QWeiboRequest();
		return request.syncRequest(url, "GET", oauth, parameters, null);
	}

	/**
	 * submit a post request to remote api
	 * 
	 * @param url
	 * @param parameters
	 * @param oauth
	 * @return
	 * @throws Exception
	 */
	public String postContent(String url, List<QParameter> parameters,
			OauthKey oauth) throws Exception {

		QWeiboRequest request = new QWeiboRequest();
		return request.syncRequest(url, "POST", oauth, parameters, null);
	}

	/**
	 * submit a post request with a file to remote api
	 * 
	 * @param url
	 * @param parameters
	 * @param filePath
	 * @param oauth
	 * @return
	 * @throws Exception
	 */
	public String postFile(String url, List<QParameter> parameters,
			List<QParameter> files, OauthKey oauth) throws Exception {
		QWeiboRequest request = new QWeiboRequest();
		return request.syncRequest(url, "POST", oauth, parameters, files);
	}

	public String[] message(String result) {
		String[] arr = new String[2];

		try {
			SAXReader saxReader = new SAXReader();
			Document xml = saxReader.read(new ByteArrayInputStream(result
					.getBytes("UTF-8")));
			arr[0] = xml.selectSingleNode("root/ret").getText();
			// arr[1] = xml.selectSingleNode("root/msg").getText();
			switch (Integer.parseInt(arr[0])) {
			case 0:
				arr[1] = "操作成功";
				break;
			case 1:
				arr[1] = "参数错误";
				break;
			case 2:
				arr[1] = "频率受限";
				break;
			case 3:
				arr[1] = "鉴权失败";
				break;
			case 4:
				arr[1] = "服务器内部错误";
				break;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			arr[0] = "4";
			arr[1] = e.toString();
		} catch (DocumentException e) {
			e.printStackTrace();
			arr[0] = "4";
			arr[1] = e.toString();
		}

		return arr;
	}
}
