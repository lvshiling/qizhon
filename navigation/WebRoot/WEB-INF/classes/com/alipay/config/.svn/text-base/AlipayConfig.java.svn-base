/* *
 *功能：设置帐户有关信息及返回路径（基础配置页面）
 *版本：3.0
 *日期：2010-06-18
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
 *提示：如何获取安全校验码和合作身份者ID
 *1.访问支付宝首页(www.alipay.com)，然后用您的签约支付宝账号登陆.
 *2.点击导航栏中的“商家服务”，即可查看
	
 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 * */
package com.alipay.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class AlipayConfig {
	// partner和key提取方法：登陆签约支付宝账户--->点击“商家服务”就可以看到
	public static String partnerID ; 
	public static String key; 
	public static String sellerEmail;
	public static String notify_url;
	public static String return_url;
	public static String show_url;
	public static String path_gpass;
	
	public static String antiphishing = "0";//防钓鱼功能开关，'0'表示该功能关闭，'1'表示该功能开启。默认为关闭
	//一旦开启，就无法关闭，根据商家自身网站情况请慎重选择是否开启。
	//申请开通方法：联系我们的客户经理或拨打商户服务电话0571-88158090，帮忙申请开通。
	//开启防钓鱼功能后，服务器、本机电脑必须支持远程XML解析，请配置好该环境。
	//若要使用防钓鱼功能，建议使用POST方式请求数据

	public static String CharSet = "UTF-8"; // 页面编码
	public static String sign_type = "MD5"; // 加密方式 不需修改
	public static String transport = "http";//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
	
	public static String mainname = "得票网";//收款方名称，如：公司名称、网站名称、收款人姓名等	

	public static String getNotify_url() {
		return notify_url;
	}

	@Value("#{constant.alipayNotifyUrl}")
	public void setNotify_url(String notifyUrl) {
		notify_url = notifyUrl;
	}

	@Value("#{constant.partnerString}")
	public void setPartnerID(String partnerID) {
		AlipayConfig.partnerID = partnerID;
	}

	@Value("#{constant.partnerCode}")
	public void setKey(String key) {
		AlipayConfig.key = key;
	}

	@Value("#{constant.partnerId}")
	public void setSellerEmail(String sellerEmail) {
		AlipayConfig.sellerEmail = sellerEmail;
	}
	
	@Value("#{constant.alipayReturnUrl}")
	public void setReturn_url(String returnUrl) {
		return_url = returnUrl;
	}

	@Value("#{constant.showUrl}")
	public void setShow_url(String showUrl) {
		show_url = showUrl;
	}

	public static String getPath_gpass() {
		return path_gpass;
	}

	@Value("#{constant.gpass}")
	public void setPath_gpass(String path_gpass) {
		AlipayConfig.path_gpass = path_gpass;
	}
}
