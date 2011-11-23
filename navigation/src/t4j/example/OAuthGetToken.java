package t4j.example;

import java.io.IOException;
import java.util.List;

import t4j.TBlog;
import t4j.TBlogException;
import t4j.data.Status;
import t4j.data.User;
import t4j.http.AccessToken;
import t4j.http.RequestToken;

/**
 * 
 * 这个例子演示了如何获取 access token，是使用API的第一步。
 * 务必看懂这个例子的代码，熟悉oauth协议
 * 
 * @author gcwang
 *
 */
public class OAuthGetToken {
	
	public static void main(String[] args) throws TBlogException{

		// 设置 consumer key, consumer secret
		// 也可以在 t4j.properties 中设置，这个文件应当放置在：源代码目录的根目录
		System.setProperty("tblog4j.oauth.consumerKey", "D9XycG1wwGblticD");
    	System.setProperty("tblog4j.oauth.consumerSecret", "stdWw4EuNFN7Hr3sa7SkImZzyPdaVjhu");
    	
    	// 暂时把debug关了。减少干扰信息
    	//System.setProperty("tblog4j.debug", "false");
    	
		TBlog tblog = new TBlog();
		
		RequestToken requestToken = tblog.getOAuthRequestToken();
		
		// 因为request token是临时生成的。授权后就没有保存的必要了
		// 这里演示一下
		System.out.println("这是request token: " + requestToken.getToken());
		System.out.println("这是token secret: " + requestToken.getTokenSecret());
		
		// 这个url很重要，就是你需要授权的页面，在浏览器中打开这个页面，完成授权
		System.out.println("在浏览器中打开这个页面授权：" + requestToken.getAuthenticationURL());
				
		// 这里停一下，等授权完成后，继续进行
		System.out.println("授权完成后，才能输入回车继续 ...");
		try {
			System.in.read();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		AccessToken accessToken = tblog.getOAuthAccessToken(requestToken);
		System.out.println("授权后的access token和 secret， 可以保存下来长久使用");
		System.out.println("access token: " + accessToken.getToken());
		System.out.println("access token secret: " + accessToken.getTokenSecret());
		
		// 基本功能的演示
		System.out.println("基本功能的演示, 回车继续 ...");
		try {
			System.in.read();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 以后使用的时候，授权过的用户，只需要读取已经保存的 access token，就可以重复使用
		tblog.setToken(accessToken.getToken(), accessToken.getTokenSecret());
		
		// 检查登录的用户
		User user = tblog.verifyCredentials();
		System.out.println("登录的用户： " + user.getName());
		System.out.println("");
		
		System.out.println("我的主页 home timeline： " + user.getName());
		// 读取我的微博主页
		List<Status> statuses = tblog.getHomeTimeline();
		for(Status status: statuses){
			System.out.println(status.getUser().getName() + ": " + status.getText());
		}
		
		// 发微博
		tblog.updateStatus("update status from JAVA SDK");
	}
}
