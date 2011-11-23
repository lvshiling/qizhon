/*
Copyright (c) 2007-2009, Yusuke Yamamoto
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Yusuke Yamamoto nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Yusuke Yamamoto ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Yusuke Yamamoto BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package t4j;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import t4j.data.Comment;
import t4j.data.DirectMessage;
import t4j.data.PagableResponseList;
import t4j.data.Paging;
import t4j.data.RecommendTopic;
import t4j.data.Status;
import t4j.data.User;
import t4j.data.Venue;
import t4j.http.AccessToken;
import t4j.http.PostParameter;
import t4j.http.RequestToken;
import t4j.http.Response;
import t4j.org.json.JSONArray;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

/**
 * 
 * @author gcwang
 *
 */
public class TBlog extends TBlogSupport{
	
	public static final String CONSUMER_KEY = "";
	public static final String CONSUMER_SECRET = "";

    private String baseURL = Configuration.getScheme() + "api.t.163.com/";
    private String searchBaseURL = Configuration.getScheme() + "api.t.163.com/";

	public TBlog() {
        
    	super();
        
        format.setTimeZone(TimeZone.getTimeZone("GMT"));

        http.setRequestTokenURL(Configuration.getScheme() + "api.t.163.com/oauth/request_token");
        http.setAccessTokenURL(Configuration.getScheme() + "api.t.163.com/oauth/access_token");
    }
    
    public void setToken(String token, String tokenSecret) {
        http.setToken(token, tokenSecret);
    }
    
    public void setBaseURL(String baseURL) {
        this.baseURL = baseURL;
    }
    
    public String getBaseURL() {
        return this.baseURL;
    }
    
    public String getSearchBaseURL() {
		return searchBaseURL;
	}

	public void setSearchBaseURL(String searchBaseURL) {
		this.searchBaseURL = searchBaseURL;
	}
	
    public synchronized void setOAuthConsumer(String consumerKey, String consumerSecret){
        this.http.setOAuthConsumer(consumerKey, consumerSecret);
    }
    
    public RequestToken getOAuthRequestToken() throws TBlogException {
        return http.getOAuthRequestToken();
    }
    
    public synchronized AccessToken getOAuthAccessToken(RequestToken requestToken) throws TBlogException {
        return http.getOAuthAccessToken(requestToken);
    }
    
    public synchronized AccessToken getOAuthAccessToken(String token, String tokenSecret) throws TBlogException {
        AccessToken accessToken = http.getOAuthAccessToken(token, tokenSecret);
        setUserId(accessToken.getScreenName());
        return accessToken;
    }
    
    public AccessToken getXAuthAccessToken(String passport, String password) throws TBlogException {
    	return this.http.getXAuthAccessToken(passport, password, false);
    }
    
    public AccessToken getXAuthAccessToken(String passport, String password, boolean isMD5) throws TBlogException {
    	return this.http.getXAuthAccessToken(passport, password, isMD5);
    }
    
    //SDK request method wrapper begin
  
    /**
     * 获取当前登录用户的微博列表 
     * @return
     * @throws TBlogException
     */
    public List<Status> getHomeTimeline() throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/home_timeline.json", true));
	}
    
    /**
     * 获取当前登录用户的微博列表
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getHomeTimeline(Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/home_timeline.json", paging, true));
    }
    
    /**
     * 获取最新的公共微博列表(随便看看),返回最新的20条微博。 
     * 
     * @return 
     * @throws TBlogException
     */
    public List<Status> getPublicTimeline() throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/public_timeline.json", true));
    }
    
    /**
     * 获取@评论当前登录用户的微博列表 
     * @return
     * @throws TBlogException
     */
    public List<Status> getMentions() throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/mentions.json", true));
    }
    
    /**
     * 获取@评论当前登录用户的微博列表 
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getMentions(Paging paging) throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/mentions.json", paging, true));
    }
    
    /**
     * 获取指定用户的微博列表 
     * @param userId 用户id
     * @return
     * @throws TBlogException
     */
    public List<Status> getUserTimeline(long userId) throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/user_timeline.json?user_id=" + String.valueOf(userId), true));
    }
    
    /**
     * 获取指定用户的微博列表 
     * @param screenName 可以传user_id或screen_name
     * @return
     * @throws TBlogException
     */
    public List<Status> getUserTimeline(String screenName) throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/user_timeline.json?screen_name=" + screenName, true));
    }
    
    /**
     * 获取指定用户的微博列表 
     * @param userId 用户id
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getUserTimeline(long userId, Paging paging) throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/user_timeline.json?user_id=" + String.valueOf(userId), paging, true));
    }
    
    /**
     * 获取指定用户的微博列表 
     * @param screenName 可以传user_id或screen_name
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getUserTimeline(String screenName, Paging paging) throws TBlogException {
    	return Status.constructStatuses(get(getBaseURL() + "statuses/user_timeline.json?screen_name=" + screenName, paging, true));
    }
    
    /**
     * 获取当前登录用户所发微博被转发的列表 
     * @return
     * @throws TBlogException
     */
    public List<Status> getRetweetsOfMe() throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/retweets_of_me.json", true));
    }
    
    /**
     * 发布一条微博
     * @param status 微博内容，不得超过163个字符
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status) throws TBlogException{
    	return new Status(http.post(getBaseURL() + "statuses/update.json", new PostParameter[]{new PostParameter("status", status)}, true));    	    	
    }
    
    /**
     * 发布一条微博，带地理信息
     * @param status 微博内容，不得超过163个字符
     * @param latitude 纬度
     * @param longitude 经度
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status, double latitude, double longitude) throws TBlogException{
    	PostParameter[] params = new PostParameter[]{
    			new PostParameter("status", status),
    			new PostParameter("lat", String.valueOf(latitude)),
    			new PostParameter("long", String.valueOf(longitude)),
    		};
    	return new Status(http.post(getBaseURL() + "statuses/update.json", params, true));
    }
    
    /**
     * 发布一条微博，带地理信息
     * @param status 微博内容，不得超过163个字符
     * @param vid poi_id
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status, long vid) throws TBlogException{
    	PostParameter[] params = new PostParameter[]{
    			new PostParameter("status", status),
    			new PostParameter("vid", String.valueOf(vid)),
    		};
    	return new Status(http.post(getBaseURL() + "statuses/update.json", params, true));
    }
    
    /**
     * 发布一条微博
     * @param status 微博内容，不得超过163个字符
     * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
     * @param dispatchToFollowers 不发送给其他关注着者
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status, long inReplyStatusId, boolean dispatchToFollowers) throws TBlogException{
    	
    	PostParameter[] postParams = new PostParameter[]{
    		new PostParameter("status", status),
    		new PostParameter("in_reply_to_status_id", String.valueOf(inReplyStatusId)),
    		new PostParameter("dispatch_to_followers", dispatchToFollowers?1:0)
    	};
    	return new Status(http.post(getBaseURL() + "statuses/update.json", postParams, true));
    }
    
    /**
     * 发布一条微博，带地理信息
     * @param status 微博内容，不得超过163个字符
     * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
     * @param dispatchToFollowers 不发送给其他关注着者
     * @param latitude 纬度
     * @param longitude 经度
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status, long inReplyStatusId, boolean dispatchToFollowers, double latitude, double longitude) throws TBlogException{
    	
    	PostParameter[] postParams = new PostParameter[]{
    		new PostParameter("status", status),
    		new PostParameter("in_reply_to_status_id", String.valueOf(inReplyStatusId)),
    		new PostParameter("dispatch_to_followers", dispatchToFollowers?1:0),
    		new PostParameter("lat", String.valueOf(latitude)),
			new PostParameter("long", String.valueOf(longitude)),
    	};
    	return new Status(http.post(getBaseURL() + "statuses/update.json", postParams, true));
    }
    
    /**
     * 发布一条微博，带地理信息
     * @param status 微博内容，不得超过163个字符
     * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
     * @param dispatchToFollowers 不发送给其他关注着者
     * @param vid poi_id
     * @return
     * @throws TBlogException
     */
    public Status updateStatus(String status, long inReplyStatusId, boolean dispatchToFollowers, long vid) throws TBlogException{
    	
    	PostParameter[] postParams = new PostParameter[]{
    		new PostParameter("status", status),
    		new PostParameter("in_reply_to_status_id", String.valueOf(inReplyStatusId)),
    		new PostParameter("dispatch_to_followers", dispatchToFollowers?1:0),
    		new PostParameter("vid", String.valueOf(vid)),
    	};
    	return new Status(http.post(getBaseURL() + "statuses/update.json", postParams, true));
    }
    
    /**
     * 转发一条微博 （默认内容是“转发微博”）
     * @param statusId 微博ID
     * @return
     * @throws TBlogException
     */
	public Status retweet(long statusId) throws TBlogException {
		JSONObject json = http.post(getBaseURL() + "statuses/retweet/" + String.valueOf(statusId) + ".json", true).asJSONObject();
		try{
			if(!json.isNull("retweeted_status")){
				return new Status(json.getJSONObject("retweeted_status"));
			}else{
				return null;
			}
		}catch (JSONException e) {
			throw new TBlogException(e);
		}
	}
	
	/**
	 * 转发一条微博 
	 * @param statusId 被转发微博id
	 * @param status 转发内容
	 * @return
	 * @throws TBlogException
	 */
	public Status retweet(long statusId, String status) throws TBlogException{
		String url = getBaseURL() + "statuses/retweet/" + String.valueOf(statusId) + ".json";
		PostParameter[] params = new PostParameter[]{
			new PostParameter("status", status),
		};
		return new Status(http.post(url, params, true));
	}
    
	/**
	 * 转发一条微博 
	 * @param statusId 被转发微博id
	 * @param status 转发内容
	 * @param is_comment 是否评论
	 * @param is_comment_to_root 是否评论原始微博
	 * @return
	 * @throws TBlogException
	 */
	public Status retweet(long statusId, String status, boolean is_comment, boolean is_comment_to_root) throws TBlogException{
		String url = getBaseURL() + "statuses/retweet/" + String.valueOf(statusId) + ".json";
		PostParameter[] params = new PostParameter[]{
			new PostParameter("status", status),
			new PostParameter("is_comment", is_comment?1:0),
			new PostParameter("is_comment_to_root", is_comment_to_root?1:0),
		};
		return new Status(http.post(url, params, true));
	}
	
    /**
     * 获取单条微博信息
     * @param statusId 微博的ID
     * @return
     * @throws TBlogException
     */
    public Status showStatus(long statusId) throws TBlogException{
    	return new Status(http.get(getBaseURL() + "statuses/show/" + String.valueOf(statusId) + ".json", true));
    }
    
    /**
     * 查看指定微博的所有评论
     * @param id 微博id
     * @return
     * @throws TBlogException
     */
    public List<Comment> getComments(long id) throws TBlogException{
    	return Comment.constructStatuses(get(getBaseURL()+"statuses/comments/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 查看指定微博的所有评论
     * @param id 微博 id
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Comment> getComments(long id, Paging paging) throws TBlogException{
    	return Comment.constructStatuses(get(getBaseURL()+"statuses/comments/" + String.valueOf(id) + ".json", paging, true));
    }
    
    /**
     * 査看指定微博的所有转发
     * @param id 微博id
     * @return
     * @throws TBlogException
     */
    public List<Status> getRetweets(long id) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/retweets/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 査看指定微博的所有转发
     * @param id 微博id
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getRetweets(long id, Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/retweets/" + String.valueOf(id) + ".json", paging, true));
    }
    
    /**
     * 
     * @param type
     * @return
     * @throws TBlogException
     */
    public List<Status> getTopRetweets(TopRetweetsType type) throws TBlogException{
    	Response res = get(getBaseURL() + "statuses/topRetweets/" + type + ".json", true);
    	JSONArray array = res.asJSONArray();
    	List<Status> statuses = new ArrayList<Status>(array.length());
    	for(int i=0; i<array.length(); i++){
    		try {
				statuses.add(new Status(array.getJSONObject(i).getJSONObject("status")));
			} catch (JSONException e) {
				return statuses;
			}
    	}
    	return statuses;
    }
    
    /**
     * 热门话题
     * @return
     * @throws TBlogException
     */
    public List<RecommendTopic> getRecommendedTopics() throws TBlogException{
    	Response res = get(getBaseURL() + "trends/recommended.json", true);
    	JSONArray trends;
		try {
			trends = res.asJSONObject().getJSONArray("trends");
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
    	return RecommendTopic.constructTopics(trends);
    }
    
    /**
     * 删除指定的微博，也可以撤销已转发的微博
     * @param statusId 删除或撤销转发微博的ID
     * @return
     * @throws TBlogException
     */
    public Status destroy(long statusId) throws TBlogException{
    	return new Status(http.post(getBaseURL() + "statuses/destroy/" + String.valueOf(statusId) + ".json", true));
    }
    
    /**
     * 获取指定用户信息
     * @param userId 用户ID
     * @return
     * @throws TBlogException
     */
    public User showUser(long userId) throws TBlogException{
    	return new User(http.get(getBaseURL() + "users/show.json?id=" + String.valueOf(userId), true));
    }
    
    /**
     * 获取指定用户信息
     * @param screenName 用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User showUser(String screenName) throws TBlogException{
    	return new User(http.get(getBaseURL() + "users/show.json?screen_name=" + screenName, true));
    }
    
    /**
     * 获取指定用户的关注用户列表
     * @param userId 用户ID
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> friends(long userId) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/friends.json?user_id=" + String.valueOf(userId), true));
    }
    
    /**
     * 获取指定用户的关注用户列表
     * @param userId 用户ID
     * @param cursor 分页参数
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> friends(long userId, long cursor) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/friends.json?user_id=" + String.valueOf(userId) + "&cursor=" + String.valueOf(cursor), true));
    }
    
    /**
     * 获取指定用户的关注用户列表
     * @param screenName 用户的个性网址
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> friends(String screenName) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/friends.json?screen_name=" + screenName, true));
    }
    
    /**
     * 获取指定用户的关注用户列表
     * @param screenName 用户的个性网址
     * @param cursor 分页参数
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> friends(String screenName, long cursor) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/friends.json?screen_name=" + screenName + "&cursor=" + String.valueOf(cursor), true));
    }
    
    /**
     * 获取指定被关注用户列表
     * @param userId 用户ID
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> followers(long userId) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/followers.json?user_id=" + String.valueOf(userId), true));
    }
    
    /**
     * 获取指定被关注用户列表
     * @param userId 用户ID
     * @param cursor 分页参数
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> followers(long userId, long cursor) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/followers.json?user_id=" + String.valueOf(userId)+ "&cursor=" + String.valueOf(cursor), true));
    }
    
    /**
     * 获取指定被关注用户列表
     * @param screenName 用户的个性网址
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> followers(String screenName) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/followers.json?screen_name=" + String.valueOf(screenName), true));
    }
    
    /**
     * 获取指定被关注用户列表
     * @param screenName 用户的个性网址
     * @param cursor 分页参数
     * @return
     * @throws TBlogException
     */
    public PagableResponseList<User> followers(String screenName, long cursor) throws TBlogException{
    	return User.createPagableUserList(http.get(getBaseURL() + "statuses/followers.json?screen_name=" + String.valueOf(screenName)+ "&cursor=" + String.valueOf(cursor), true));
    }

    /**
     * 关注指定用户
     * @param userId 用户ID
     * @return
     * @throws TBlogException
     */
    public User createFriendship(long userId) throws TBlogException{
    	return new User(http.post(getBaseURL() + "friendships/create.json?user_id=" + String.valueOf(userId), true));
    }
    
    /**
     * 关注指定用户 
     * @param screenName 用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User createFriendship(String screenName) throws TBlogException{
    	return new User(http.post(getBaseURL() + "friendships/create.json?screen_name=" + String.valueOf(screenName), true));
    }
    
    /**
     * 取消关注指定用户
     * @param userId 用户ID
     * @return
     * @throws TBlogException
     */
    public User destroyFriendship(long userId) throws TBlogException{
    	return new User(http.post(getBaseURL() + "friendships/destroy.json?user_id=" + String.valueOf(userId), true));
    }
    
    /**
     * 取消关注指定用户
     * @param screenName 用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User destroyFriendship(String screenName) throws TBlogException{
    	return new User(http.post(getBaseURL() + "friendships/destroy.json?screen_name=" + String.valueOf(screenName), true));
    }
    
    /**
     * 获取两个用户的相互关注关系
     * @param sourceId 关注者用户的userId
     * @param targetId 被关注用户的userId
     * @return
     * @throws TBlogException
     */
    public JSONObject showFriendship(long sourceId, long targetId) throws TBlogException{
    	return get(getBaseURL() + "friendships/show.json?source_id=" + String.valueOf(sourceId) + "&target_id=" + String.valueOf(targetId), true).asJSONObject();
    }
    
    /**
     * 获取两个用户的相互关注关系，当前登录者为关注用户
     * @param targetId 被关注用户的id
     * @return
     * @throws TBlogException
     */
    public JSONObject showFriendship(long targetId) throws TBlogException{
    	return get(getBaseURL() + "friendships/show.json?target_id=" + String.valueOf(targetId), true).asJSONObject();
    }
    
    /**
     * 获取两个用户的相互关注关系，当前登录者为关注用户
     * @return
     * @throws TBlogException
     */
    public List<DirectMessage> getDirectMessages() throws TBlogException{
    	return DirectMessage.createDirectMessageList(get(getBaseURL() + "direct_messages.json", true));
    }
    
    /**
     * 获取当前用户私信列表
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<DirectMessage> getDirectMessages(Paging paging) throws TBlogException{
    	return DirectMessage.createDirectMessageList(get(getBaseURL() + "direct_messages.json", paging,  true));
    }
    
    /**
     * 发送一条私信
     * @param user 收信用户的昵称
     * @param text 私信内容
     * @return
     * @throws TBlogException
     */
    public DirectMessage sendDirectMessage(String user, String text) throws TBlogException{
    	PostParameter[] params = new PostParameter[]{
    		new PostParameter("user", user),
    		new PostParameter("text", text)
    	};
    	return new DirectMessage(http.post(getBaseURL() + "direct_messages/new.json", params, true));
    }
    
    /**
     * 删除一条私信
     * @param id 删除的私信id
     * @return
     * @throws TBlogException
     */
    public DirectMessage destroyDirectMessage(long id) throws TBlogException{
    	return new DirectMessage(http.post(getBaseURL() + "direct_messages/destroy/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 获取当前用户发送的私信列表
     * @return
     * @throws TBlogException
     */
    public List<DirectMessage> getSentDirectMessages() throws TBlogException{
    	return DirectMessage.createDirectMessageList(get(getBaseURL() + "direct_messages/sent.json", true));
    }

    /**
     * 获取指定用户的收藏
     * @param id 用户的id
     * @return
     * @throws TBlogException
     */
    public List<Status> getFavorites(long id) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "favorites/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 获取指定用户的收藏
     * @param id 用户的id
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getFavorites(long id, Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "favorites/" + String.valueOf(id) + ".json", paging, true));
    }
    
    /**
     * 添加收藏
     * @param id 要收藏的微博ID
     * @return
     * @throws TBlogException
     */
    public Status createFavorite(long id) throws TBlogException{
    	return new Status(http.post(getBaseURL() + "favorites/create/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 删除当前用户的收藏
     * @param id 要删除收藏的微博ID
     * @return
     * @throws TBlogException
     */
    public Status destroyFavorite(long id) throws TBlogException{
    	return new Status(http.post(getBaseURL() + "favorites/destroy/" + String.valueOf(id) + ".json", true));
    }
    
    /**
     * 判断当前用户是否验证成功并返回该用户信息
     * @return
     * @throws TBlogException
     */
    public User verifyCredentials() throws TBlogException {
    	return new User(get(getBaseURL() + "account/verify_credentials.json", true));
    }
    
    /**
     * 阻止指定用户，即将该用户添加进黑名单。
     * @param id 用户ID
     * @return
     * @throws TBlogException
     */
    public User createBlock(long id) throws TBlogException{
    	return new User(http.post(getBaseURL() + "blocks/create.json?user_id=" + String.valueOf(id), true));
    }
    
    /**
     * 阻止指定用户，即将该用户添加进黑名单。
     * @param screenName 该用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User createBlock(String screenName) throws TBlogException{
    	return new User(http.post(getBaseURL() + "blocks/create.json?screen_name=" + screenName, true));
    }
    
    /**
     * 取消已阻止的用户，即将该用户添移除黑名单
     * @param id 用户ID
     * @return
     * @throws TBlogException
     */
    public User destroyBlock(long id) throws TBlogException{
    	return new User(http.post(getBaseURL() + "blocks/destroy.json?user_id=" + String.valueOf(id), true));
    }
    
    /**
     * 取消已阻止的用户，即将该用户添移除黑名单
     * @param screenName 该用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User destroyBlock(String screenName) throws TBlogException{
    	return new User(http.post(getBaseURL() + "blocks/destroy.json?screen_name=" + screenName, true));
    }
    
    /**
     * 判断是否已经阻止用户,如已阻止此用户则返回用户信息
     * @param id 用户ID
     * @return
     * @throws TBlogException
     */
    public User existsBlock(long id) throws TBlogException{
    	return new User(get(getBaseURL() + "blocks/exists.json?user_id=" + String.valueOf(id), true));
    }
    
    /**
     * 判断是否已经阻止用户,如已阻止此用户则返回用户信息
     * @param screenName 该用户的个性网址
     * @return
     * @throws TBlogException
     */
    public User existsBlock(String screenName) throws TBlogException{
    	return new User(get(getBaseURL() + "blocks/exists.json?screen_name=" + String.valueOf(screenName),true));
    }
    
    /**
     * 返回当前登录用户屏蔽的用户列表
     * @return
     * @throws TBlogException
     */
    public List<User> getBlockUsers() throws TBlogException{
    	return User.createUserList(get(getBaseURL() + "blocks/blocking.json", true));
    }
    
    /**
     * 返回当前登录用户屏蔽的用户id数组
     * @return 
     * @throws TBlogException
     */
    public long[] getBlockUserIds() throws TBlogException{
    	JSONArray list = get(getBaseURL() + "blocks/blocking/ids.json", true).asJSONArray();
    	long[] result = new long[list.length()];
    	for(int i=0; i<list.length(); i++){
    		try{
    			result[i] = list.getLong(i);
    		}catch(JSONException jsone){
    			throw new TBlogException(jsone);
    		}
    	}
    	return result;
    }
    
    /**
     * 上传图片文件并返回图片地址
     * @param file 支持jpg、png、bmp、gif这四种图片格式
     * @return
     * @throws TBlogException
     */
    public String updateImage(File file) throws TBlogException{
    	JSONObject json = http.multPartURL("pic", getBaseURL() + "statuses/upload.json", new PostParameter[0], file, true).asJSONObject();
    	try{
	    	if(!json.isNull("upload_image_url")){
	    		return json.getString("upload_image_url");
	    	}else{
	    		return null;
	    	}
    	}catch (JSONException jsone) {
			throw new TBlogException(jsone);
		}
    }
    
    /**
     * 返回当前登录用户未读的消息数量
     * @return
     * @throws TBlogException
     */
    public JSONObject getLatestMessages() throws TBlogException{
    	return get(getBaseURL() + "reminds/message/latest.json", true).asJSONObject();
    }
    
    /**
     * 搜索微博
     * 
     * @param query 关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @return
     * @throws TBlogException
     */
    public List<Status> searchStatus(String query) throws TBlogException{
    	try {
    		JSONObject json = get(getBaseURL() + "search.json?q=" + query, true).asJSONObject();
    		if(json.isNull("results")){
    			return new ArrayList<Status>(0);
    		}
			return Status.constructStatuses(json.getJSONArray("results"));
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
    }
    
    /**
     * 搜索
     * @param query
     * @return
     * @throws TBlogException
     */
    public List<Status> search(String query, int page, int perPage) throws TBlogException {
    	String url = String.format(getBaseURL() + "statuses/search.json?q=%s&page=%s&perPage=%s", query, page, perPage);
		JSONArray json = get(url, true).asJSONArray();
		return Status.constructStatuses(json);
    }
    
    /**
     * 搜索微博
     * 
     * @param query 关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @param page 可选参数，当前页数，默认为第一页 
     * @param pageSize 可选参数，返回数量,最大20 
     * @return
     * @throws TBlogException
     */
    public List<Status> searchStatus(String query, int page, int pageSize) throws TBlogException{
    	try {
    		JSONObject json = get(getBaseURL() + "search.json?q=" + query + "&page=" + String.valueOf(page) + "&per_page=" + String.valueOf(pageSize), true).asJSONObject();
    		if(json.isNull("results")){
    			return new ArrayList<Status>(0);
    		}
			return Status.constructStatuses(json.getJSONArray("results"));
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
    }
    
    /**
     * 搜索用户
     *  
     * @param query 必选参数，关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @return
     * @throws TBlogException
     */
    public List<User> searchUser(String query) throws TBlogException{
    	return User.createUserList(get(getBaseURL() + "users/search.json?" + "q=" + query, true));
    }
    
    /**
     * 搜索用户
     *  
     * @param query 必选参数，关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @param page 可选参数，当前页数，默认为第一页 
     * @param pageSize 可选参数，返回数量,最大20
     * @return
     * @throws TBlogException
     */
    public List<User> searchUser(String query, int page, int pageSize) throws TBlogException{
    	return User.createUserList(get(getBaseURL() + "users/search.json?" + "q=" + query + "&page=" + String.valueOf(page) + "&per_page=" + String.valueOf(pageSize), true));
    }
    
    /**
     * 获取地点列表
     * @param latitude 纬度
     * @param longitude 经度
     * @return
     * @throws TBlogException
     */
    public List<Venue> getVenues(double latitude, double longitude) throws TBlogException{
    	return Venue.createVenueList(get(getBaseURL() + String.format("location/venues.json?lat=%s&long=%s", 
    			String.valueOf(latitude), String.valueOf(longitude)), true));
    }
    
    /**
     * 获取地点列表
     * @param latitude 纬度
     * @param longitude 经度
     * @param query 查询关键词
     * @return
     * @throws TBlogException
     */
    public List<Venue> getVenues(double latitude, double longitude, String query) throws TBlogException{
    	return Venue.createVenueList(get(getBaseURL() + String.format("location/venues.json?lat=%s&long=%s&q=%s", 
    			String.valueOf(latitude), 
    			String.valueOf(longitude),
    			query), true));
    }
    
    /**
     * 获取地点列表
     * @param latitude 纬度
     * @param longitude 经度
     * @param count 返回数量
     * @return
     * @throws TBlogException
     */
    public List<Venue> getVenues(double latitude, double longitude, int count) throws TBlogException{
    	return Venue.createVenueList(get(getBaseURL() + String.format("location/venues.json?lat=%s&long=%s&count=%s", 
    			String.valueOf(latitude), 
    			String.valueOf(longitude),
    			String.valueOf(count)), true));
    }
    
    /**
     * 获取地点列表
     * @param latitude 纬度
     * @param longitude 经度
     * @param count 返回数量
     * @param query 查询关键词
     * @return
     * @throws TBlogException
     */
    public List<Venue> getVenues(double latitude, double longitude, int count, String query) throws TBlogException{
    	return Venue.createVenueList(get(getBaseURL() + String.format("location/venues.json?lat=%s&long=%s&count=%s&q=%s", 
    			String.valueOf(latitude), 
    			String.valueOf(longitude),
    			String.valueOf(count),
    			query), true));
    }
    
    /**
     * 获得地理位置的微博列表
     * @param latitude 纬度
     * @param longitude 经度
     * @return
     * @throws TBlogException
     */
    public List<Status> getLocationTimeline(double latitude, double longitude) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + String.format("statuses/location_timeline.json?lat=%s&long=%s", String.valueOf(latitude), String.valueOf(longitude)), true));
    }
    
    /**
     * 获得地理位置的微博列表
     * @param latitude 纬度
     * @param longitude 经度
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getLocationTimeline(double latitude, double longitude, Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + String.format("statuses/location_timeline.json?lat=%s&long=%s", String.valueOf(latitude), String.valueOf(longitude)), paging, true));
    }
    
    /**
     * 获得地理位置的微博列表
     * @param vid poi_id
     * @return
     * @throws TBlogException
     */
    public List<Status> getLocationTimeline(long vid) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + String.format("statuses/location_timeline.json?vid=%s", String.valueOf(vid)), true));
    }
    
    /**
     * 获得地理位置的微博列表
     * @param vid poi_id
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getLocationTimeline(long vid, Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + String.format("statuses/location_timeline.json?vid=%s", String.valueOf(vid)), paging, true));
    }
    
    /**
     * 上传图片并发布微博
     * @param status 微博正文
     * @param file 图片文件
     * @return
     * @throws TBlogException
     */
    public Status updateImage(String status, File file) throws TBlogException{
    	String url = updateImage(file);
    	String text = status + url;
    	return updateStatus(text);
    }
    
    /**
     * 修改密码
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return
     * @throws TBlogException
     */
    public User updatePassword(String oldPassword, String newPassword) throws TBlogException{
		String url = "account/update_password.json";
		PostParameter[] params = new PostParameter[]{
			new PostParameter("old_password", oldPassword),
			new PostParameter("new_password", newPassword),
		};
		return new User(http.post(getBaseURL() + url, params, true));
    }
    
    /**
     * 查看我对别人的评论
     * @return
     * @throws TBlogException
     */
    public List<Status> getCommentsByMe() throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/comments_by_me.json", true));
    }
    
    /**
     * 查看我对别人的评论
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getCommentsByMe(Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/comments_by_me.json", paging, true));
    }
    
    /**
     * 查看别人对我的评论
     * @return
     * @throws TBlogException
     */
    public List<Status> getCommentsToMe() throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/comments_to_me.json", true));
    }
    
    /**
     * 查看别人对我的评论
     * @param paging 分页参数
     * @return
     * @throws TBlogException
     */
    public List<Status> getCommentsToMe(Paging paging) throws TBlogException{
    	return Status.constructStatuses(get(getBaseURL() + "statuses/comments_to_me.json", paging, true));
    }
    
    /**
     * 回复一条微博
     * @param id 被回复的微博id
     * @param status 回复内容
     * @return
     * @throws TBlogException
     */
    public Status reply(long id, String status) throws TBlogException{
    	PostParameter[] params = new PostParameter[]{
    		new PostParameter("id", String.valueOf(id)),
    		new PostParameter("status", status),
    	};
    	return new Status(http.post(getBaseURL()+"statuses/reply.json", params, true));
    }
    
    /**
     * 回复一条微博
     * @param id 被回复的微博id
     * @param status 回复内容
     * @param is_retweet 是否转发
     * @param is_comment_to_root 是否评论原始微博
     * @return
     * @throws TBlogException
     */
    public Status reply(long id, String status, boolean is_retweet, boolean is_comment_to_root) throws TBlogException{
    	PostParameter[] params = new PostParameter[]{
    		new PostParameter("id", String.valueOf(id)),
    		new PostParameter("status", status),
    		new PostParameter("is_retweet", is_retweet?1:0),
    		new PostParameter("is_comment_to_root", is_comment_to_root?1:0),
    	};
    	return new Status(http.post(getBaseURL()+"statuses/reply.json", params, true));
    }
    
    /**
     * 猜你喜欢
     * @param count 返回用户个数
     * @return
     * @throws TBlogException
     */
    public List<User> suggestedUsers(int count) throws TBlogException{
    	Response res = http.get(getBaseURL() + "users/suggestions.json?count="+String.valueOf(count), true);
    	JSONArray users = null;
		try {
			users = res.asJSONObject().getJSONArray("users");
		} catch (JSONException e) {
			return new ArrayList<User>(0);
		}
		if(users == null){
			return new ArrayList<User>(0);
		}
    	return User.createUserList(users);
    }
    
    /**
     * 推荐i达人
     * @return
     * @throws TBlogException
     */
    public List<User> suggestedIFollowers() throws TBlogException {
    	return suggestedIFollowers(0);
    }
    
    /**
     * 推荐i达人
     * @param cursor 分页参数
     * @return
     * @throws TBlogException
     */
    public List<User> suggestedIFollowers(int cursor) throws TBlogException{
    	Response res = http.get(getBaseURL() + "users/suggestions_i_followers.json?cursor=" + cursor, true);
    	JSONArray users = null;
    	try {
			users = res.asJSONObject().getJSONArray("users");
		} catch (JSONException e) {
			return new ArrayList<User>(0);
		}
		if(users == null){
			return new ArrayList<User>(0);
		}
    	return User.createUserList(users);
    }
    
    /**
     * 好友的名单
     * @return
     * @throws TBlogException
     */
    public List<String> friendsNames() throws TBlogException{
    	Response result = http.get(getBaseURL() + "friends/names.json", true);
    	JSONArray array = result.asJSONArray();
    	List<String> names = new ArrayList<String>();
    	for(int i=0; i<array.length(); i++){
    		try {
				names.add(array.getString(i));
			} catch (JSONException e) {
				return names;
			}
    	}
    	return names;
    }
    
    /**
     * 激活开通微博帐号（必须有网易通行证）
     * @param nickName 昵称 必填
     * @param realName 真实姓名 选填
     * @param mobile 手机号码 选填
     * @param idNum 身份证号码 选填
     * @return
     * @throws TBlogException 
     */
    public long activateAccount(String nickName, String realName, String mobile, String idNum) throws TBlogException{
    	List<PostParameter> params = new ArrayList<PostParameter>();
    	params.add(new PostParameter("nick_name", nickName));
    	if(realName != null && !realName.isEmpty()){
    		params.add(new PostParameter("real_name", realName));
    	}
    	if(mobile!=null && !mobile.isEmpty()){
    		params.add(new PostParameter("mobile", mobile));
    	}
    	if(idNum!=null && !idNum.isEmpty()){
    		params.add(new PostParameter("id_num", idNum));
    	}
    	long id;
		try {
			id = http.post(getBaseURL() + "account/activate.json", params.toArray(new PostParameter[params.size()]), true).asJSONObject().getLong("id");
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
    	return id;
    }
    
    /**
     * 修改用户信息
     * @param nickName 昵称
     * @param realName 真实姓名
     * @param description 个人信息
     * @param province 省
     * @param city 市
     * @return
     * @throws TBlogException
     */
    public User updateProfile(String nickName, String realName, String description, String province, String city) throws TBlogException{
    	String[] args = new String[]{"nick_name", "real_name", "description", "province", "city"};
    	String[] values = new String[]{nickName, realName, description, province, city};
    	List<PostParameter> params = new ArrayList<PostParameter>();
    	for(int i=0; i<values.length; i++){
    		if(values[i] != null && !values[i].isEmpty()){
    			params.add(new PostParameter(args[i], values[i]));
    		}
    	}
    	Response res = http.post(getBaseURL() + "account/update_profile.json", params.toArray(new PostParameter[params.size()]), true);
    	return new User(res);
    }
    
    /**
     * 修改头像
     * @param file 头像文件 jpg, gif, png
     * @return
     * @throws TBlogException
     */
    public User updateProfileImage(File file) throws TBlogException{
    	Response res = http.multPartURL("img", getBaseURL() + "account/update_profile_image.json", new PostParameter[0], file, true);
    	return new User(res);
    }
    
    // request wrapper end
    
    private SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss z", Locale.ENGLISH);
    
    private Response get(String url, boolean authenticated) throws TBlogException {
    	return http.get(url, authenticated); 
    }
   
    protected Response get(String url, Paging paging, boolean authenticate) throws TBlogException {
    	
    	String paramList = "";
    	
        if (null != paging) {
        	
        	List<String> params = new ArrayList<String>();
        	try{
        		
	            if (paging.getMaxId()!=null && !"".equals(paging.getMaxId())) {
	            	params.add("max_id=" + URLEncoder.encode(String.valueOf(paging.getMaxId()), "UTF-8"));
	            }
	            if (paging.getSinceId()!=null && !"".equals(paging.getSinceId())) {
	            	params.add("since_id=" + URLEncoder.encode(String.valueOf(paging.getSinceId()), "UTF-8"));
	            }
	            if (-1 != paging.getCount()) {
	            	params.add("count=" + URLEncoder.encode(String.valueOf(paging.getCount()), "UTF-8"));
	            }
        	}catch(UnsupportedEncodingException ex){
        		throw new TBlogException(ex);
        	}
            paramList = join(params.toArray(new String[0]), "&");
        } 
        
        if(paramList.isEmpty()){
        	return get(url, authenticate);
        }else{
        	if(url.indexOf('?') == -1){
        		return get(url + "?" + paramList, authenticate);
        	}else{
        		return get(url + "&" + paramList, authenticate);
        	}
        	
        }
    }
    
    private static String join(Object[] array, String separator) {
        if (array == null) {
            return null;
        }
        return join(array, separator, 0, array.length);
    }
    
    private static String join(Object[] array, String separator, int startIndex, int endIndex) {
        if (array == null) {
            return null;
        }
        if (separator == null) {
            separator = "";
        }

        // endIndex - startIndex > 0:   Len = NofStrings *(len(firstString) + len(separator))
        //           (Assuming that all Strings are roughly equally long)
        int bufSize = (endIndex - startIndex);
        if (bufSize <= 0) {
            return "";
        }

        bufSize *= ((array[startIndex] == null ? 16 : array[startIndex].toString().length())
                        + separator.length());

        StringBuffer buf = new StringBuffer(bufSize);

        for (int i = startIndex; i < endIndex; i++) {
            if (i > startIndex) {
                buf.append(separator);
            }
            if (array[i] != null) {
                buf.append(array[i]);
            }
        }
        return buf.toString();
    }
    
    public enum TopRetweetsType {
    	oneHour, sixHours, oneDay, oneWeek,
    }
}
