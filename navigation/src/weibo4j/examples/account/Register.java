/**
 *
 */
package weibo4j.examples.account;


import java.net.InetAddress;

import weibo4j.Weibo;
import weibo4j.org.json.JSONObject;

/**
 * @author sina
 *
 */
public class Register {

	/**
	 * 注册新浪微博用户接口
	 * @param args
	 */
	public static void main(String[] args) {
		System.setProperty("weibo4j.oauth.consumerKey", Weibo.CONSUMER_KEY);
    	System.setProperty("weibo4j.oauth.consumerSecret", Weibo.CONSUMER_SECRET);
        try {
        	Weibo weibo = getWeibo(false,args);
        	//IP必须被平台列入白名单方可执行注册接口
        	String IP = InetAddress.getLocalHost().getHostAddress();
        	//args参数从第三个开始为昵称、性别、密码、邮箱；
        	JSONObject object = weibo.register(IP,"","","nick","m","passwd","email@126.com");
        	System.out.println("Your ID:"+object.getString("uid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static Weibo getWeibo(boolean isOauth,String ... args) {
		Weibo weibo = new Weibo();
		if(isOauth) {//oauth验证方式 args[0]:访问的token；args[1]:访问的密匙
			weibo.setToken(args[0], args[1]);
			
		}else {//用户登录方式
    		weibo.setUserId(args[0]);//用户名/ID
    		weibo.setPassword(args[1]);//密码
		}
		return weibo;
	}

}
