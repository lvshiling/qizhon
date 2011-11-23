/**
 * 
 */
package weibo4j.examples.statuses;

import java.util.List;

import weibo4j.Comment;
import weibo4j.Status;
import weibo4j.Weibo;

/**
 * @author sina
 *
 */
public class Reply {

	/**
	 * 对一条微博评论信息进行回复
	 * @param args
	 */
	public static void main(String[] args) {
		System.setProperty("weibo4j.oauth.consumerKey", Weibo.CONSUMER_KEY);
    	System.setProperty("weibo4j.oauth.consumerSecret", Weibo.CONSUMER_SECRET);
        try {
        	Weibo weibo = getWeibo(false,args);
        	List<Status> list = weibo.getUserTimeline(args[2]);
        	if(list.size() > 0) {
        		//最新一条微博信息id
        		String sid = list.get(0).getId()+"";
        		List<Comment> comments = weibo.getComments(sid);
        		if(comments.size() > 0) {
        			String cid = comments.get(0).getId()+"";//评论的id
        			Status status = weibo.reply(sid, cid, "回复内容");//args[3]：回复内容
        			System.out.println(status.toString());
        		}
        	}
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
