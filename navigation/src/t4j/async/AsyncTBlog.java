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
package t4j.async;

import java.io.File;

import t4j.Configuration;
import t4j.TBlog;
import t4j.TBlogException;
import t4j.async.Dispatcher;
import t4j.async.TBlogListener;
import t4j.data.Paging;

/**
 * @author gcwang
 *
 *  异步的微博访问
 */
public class AsyncTBlog extends TBlog {
	
	// method definitions
	public static final int GET_HOME_TIMELINE = 1;
	public static final int GET_PUBLIC_TIMELINE = 2;
	public static final int GET_MENTIONS = 3;
	public static final int GET_USER_TIMELINE = 4;
	public static final int GET_RETWEETS_OF_ME = 5;
	public static final int UPDATE_STATUS = 6;
	public static final int RETWEET = 7;
	public static final int SHOW_STATUS = 8;
	public static final int DESTROY_STATUS = 9;
	public static final int SHOW_USER = 10;
	public static final int GET_FRIENDS = 11;
	public static final int GET_FOLLOWERS = 12;
	public static final int CREATE_FRIENDSHIP = 13;
	public static final int DESTROY_FRIENDSHIP = 14;
	public static final int GET_DIRECT_MSG = 15;
	public static final int SEND_DIRECT_MSG = 16;
	public static final int DESTROY_DIRECT_MSG = 17;
	public static final int GET_SENT_MSG = 18;
	public static final int GET_FAVORITES = 19;
	public static final int CREATE_FAVORITES = 20;
	public static final int DESTROY_FAVORITES = 21;
	public static final int VERIFY_CREDENTIALS = 22;
	public static final int CREATE_BLOCK = 23;
	public static final int DESTORY_BLOCK = 24;
	public static final int EXISTS_BLOCK = 25;
	public static final int GET_BLOCK_USERS = 26;
	public static final int GET_BLOCK_USER_IDS = 27;
	public static final int UPDATE_IMAGES = 28;
	public static final int SEARCH_STATUS = 29;
	public static final int SEARCH_USERS = 30;
	public static final int GET_LOCATION_TIMELINE = 31;
	public static final int GET_VENUES = 32;
	public static final int GET_COMMENTS = 33;

	/**
	 *  获取当前登录用户的微博列表 
	 *  
	 * @param listener
	 */
	public void getHomeTimelineAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_HOME_TIMELINE, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotHomeTimeline(getHomeTimeline());				
			}
		});
	}
	
	/**
	 *  获取当前登录用户的微博列表 
	 *  
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getHomeTimelineAsync(Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_HOME_TIMELINE, listener, new Object[]{paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotHomeTimeline(getHomeTimeline((Paging)args[0]));		
			}
		});
	}
	
	/**
	 * 获取最新的公共微博列表(随便看看),返回最新的20条微博。 
	 * 
	 * @param listener
	 */
	public void getPublicTimelineAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_PUBLIC_TIMELINE, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotPublicTimeline(getPublicTimeline());				
			}
		});
	}
	
	/**
	 * 获取@评论当前登录用户的微博列表 
	 * 
	 * @param listener
	 */
	public void getMentionsAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_MENTIONS, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotMentions(getMentions());
			}
		});
	}
	
	/**
	 * 获取@评论当前登录用户的微博列表 
	 * 
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getMentionsAsync(Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_MENTIONS, listener, new Object[]{paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotMentions(getMentions((Paging)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的微博列表 
	 * 
	 * @param userId 用户id
	 * @param listener
	 */
	public void getUserTimelineAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_USER_TIMELINE, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotUserTimeline(getUserTimeline((Long)args[0]));				
			}
		});
	}
	
	/**
	 * 获取指定用户的微博列表 
	 * 
	 * @param screenName 可以传user_id或screen_name
	 * @param listener
	 */
	public void getUserTimelineAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_USER_TIMELINE, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotUserTimeline(getUserTimeline((String)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的微博列表 
	 * 
	 * @param userId 用户id
	 * @param paging 分页参数 
	 * @param listener
	 */
	public void getUserTimelineAsync(long userId, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_USER_TIMELINE, listener, new Object[]{userId, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotUserTimeline(getUserTimeline((Long)args[0], (Paging)args[1]));
			}
		});
	}
	
	/**
	 * 获取指定用户的微博列表 
	 * 
	 * @param screenName 可以传user_id或screen_name
	 * @param paging 分页参数 
	 * @param listener
	 */
	public void getUserTimelineAsync(String screenName, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_USER_TIMELINE, listener, new Object[]{screenName, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotUserTimeline(getUserTimeline((String)args[0], (Paging)args[1]));
			}
		});
	}
	
	/**
	 * 获取当前登录用户所发微博被转发的列表 
	 * 
	 * @param listener
	 */
	public void getRetweetsOfMeAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_RETWEETS_OF_ME, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotRetweetsOfMe(getRetweetsOfMe());
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param listener
	 */
	public void updateStatusAsync(String status, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0]));
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param listener
	 */
	public void updateStatusAsync(String status, double latitude, double longitude, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status, latitude, longitude}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0], (Double)args[1], (Double)args[2]));
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param vid poi id
	 * @param listener
	 */
	public void updateStatusAsync(String status, long vid, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status, vid}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0], (Long)args[1]));
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
	 * @param dispatchToFollowers 不发送给其他关注着者
	 * @param listener
	 */
	public void updateStatusAsync(String status, long inReplyStatusId, boolean dispatchToFollowers, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status, inReplyStatusId, dispatchToFollowers}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0], (Long)args[1], (Boolean)args[2]));
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
	 * @param dispatchToFollowers 不发送给其他关注着者
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param listener
	 */
	public void updateStatusAsync(String status, long inReplyStatusId, boolean dispatchToFollowers, double latitude, double longitude, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status, inReplyStatusId, dispatchToFollowers, latitude, longitude}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0], (Long)args[1], (Boolean)args[2], (Double)args[3], (Double)args[4]));
			}
		});
	}
	
	/**
	 * 发布一条微博
	 * 
	 * @param status 微博内容，不得超过163个字符
	 * @param inReplyStatusId 当评论指定微博时需带上此参数，值为被回复的微博ID
	 * @param dispatchToFollowers 不发送给其他关注着者
	 * @param vid poi id
	 * @param listener
	 */
	public void updateStatusAsync(String status, long inReplyStatusId, boolean dispatchToFollowers, long vid, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_STATUS, listener, new Object[]{status, inReplyStatusId, dispatchToFollowers, vid}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedStatus(updateStatus((String)args[0], (Long)args[1], (Boolean)args[2], (Long)args[3]));
			}
		});
	}
	
	/**
	 * 转发一条微博
	 * 
	 * @param statusId 微博ID
	 * @param listener
	 */
	public void retweetAsync(long statusId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(RETWEET, listener, new Object[]{statusId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.retweeted(retweet((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取单条微博信息
	 * 
	 * @param statusId 微博的ID
	 * @param listener
	 */
	public void showStatusAsync(long statusId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SHOW_STATUS, listener, new Object[]{statusId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.shownStatus(showStatus((Long)args[0]));
			}
		});
	}
	
	/**
	 * 删除指定的微博，也可以撤销已转发的微博
	 * 
	 * @param statusId 删除或撤销转发微博的ID
	 * @param listener
	 */
	public void destroyAsync(long statusId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTROY_STATUS, listener, new Object[]{statusId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destoryed(destroy((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户信息
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void showUserAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SHOW_USER, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.shownUser(showUser((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户信息
	 * 
	 * @param screenName 用户的个性网址
	 * @param listener
	 */
	public void showUserAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SHOW_USER, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.shownUser(showUser((String)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的关注用户列表
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void getFriendsAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FRIENDS, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFriends(friends((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的关注用户列表
	 *  
	 * @param userId 用户ID
	 * @param cursor 分页参数
	 * @param listener
	 */
	public void getFriendsAsync(long userId, long cursor, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FRIENDS, listener, new Object[]{userId, cursor}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFriends(friends((Long)args[0], (Long)args[1]));
			}
		});
	}
	
	/**
	 * 获取指定用户的关注用户列表
	 * 
	 * @param screenName 用户的个性网址
	 * @param listener
	 */
	public void getFriendsAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FRIENDS, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFriends(friends((String)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的关注用户列表
	 * 
	 * @param screenName 用户的个性网址
	 * @param cursor 分页参数
	 * @param listener
	 */
	public void getFriendsAsync(String screenName, long cursor, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FRIENDS, listener, new Object[]{screenName, cursor}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFriends(friends((String)args[0], (Long)args[1]));
			}
		});
	}
	
	/**
	 * 获取指定被关注用户列表
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void getFollowersAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FOLLOWERS, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFollowers(followers((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定被关注用户列表
	 * 
	 * @param userId 用户ID
	 * @param cursor 分页参数
	 * @param listener
	 */
	public void getFollowersAsync(long userId, long cursor, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FOLLOWERS, listener, new Object[]{userId, cursor}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFollowers(followers((Long)args[0], (Long)args[1]));
			}
		});
	}
	
	/**
	 * 获取指定被关注用户列表
	 * 
	 * @param screenName 用户的个性网址
	 * @param listener
	 */
	public void getFollowersAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FOLLOWERS, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFollowers(followers((String)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定被关注用户列表
	 * 
	 * @param screenName 用户的个性网址
	 * @param cursor 分页参数
	 * @param listener
	 */
	public void getFollowersAsync(String screenName, long cursor, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FOLLOWERS, listener, new Object[]{screenName, cursor}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFollowers(followers((String)args[0], (Long)args[1]));
			}
		});
	}
	
	/**
	 * 关注指定用户
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void createFriendshipAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(CREATE_FRIENDSHIP, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.createdFriendship(createFriendship((Long)args[0]));
			}
		});
	}
	
	/**
	 * 关注指定用户
	 * 
	 * @param screenName 用户的个性网址
	 * @param listener
	 */
	public void createFriendshipAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(CREATE_FRIENDSHIP, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.createdFriendship(createFriendship((String)args[0]));
			}
		});
	}
	
	/**
	 * 取消关注指定用户
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void destroyFriendshipAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTROY_FRIENDSHIP, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedFriendship(destroyFriendship((Long)args[0]));
			}
		});
	}
	
	/**
	 * 取消关注指定用户
	 * 
	 * @param screenName 用户的个性网址
	 * @param listener
	 */
	public void destroyFriendshipAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTROY_FRIENDSHIP, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedFriendship(destroyFriendship((String)args[0]));
			}
		});
	}
	
	/**
	 * 获取两个用户的相互关注关系，当前登录者为关注用户
	 * 
	 * @param listener
	 */
	public void getDirectMessageAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_DIRECT_MSG, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotDirectMessage(getDirectMessages());
			}
		});
	}
	
	/**
	 * 获取两个用户的相互关注关系，当前登录者为关注用户
	 * 
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getDirectMessageAsync(Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_DIRECT_MSG, listener, new Object[]{paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotDirectMessage(getDirectMessages((Paging)args[0]));
			}
		});
	}
	
	/**
	 * 获取当前用户私信列表
	 * 
	 * @param user 收信用户的昵称
	 * @param text 私信内容
	 * @param listener
	 */
	public void sendDirectMessageAsync(String user, String text, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SEND_DIRECT_MSG, listener, new Object[]{user, text}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.sentDirectMessage(sendDirectMessage((String)args[0], (String)args[1]));
			}
		});
	}
	
	/**
	 * 删除一条私信
	 * 
	 * @param id 删除的私信id
	 * @param listener
	 */
	public void destroyDirectMessageAsync(long id, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTROY_DIRECT_MSG, listener, new Object[]{id}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedDirectMessage(destroyDirectMessage((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取当前用户发送的私信列表
	 * 
	 * @param listener
	 */
	public void getSentDirectMessagesAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_SENT_MSG, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotSentDirectMessages(getSentDirectMessages());
			}
		});
	}
	
	/**
	 * 获取指定用户的收藏
	 * 
	 * @param userId 用户的id
	 * @param listener
	 */
	public void getFavoritesAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FAVORITES, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFavorites(getFavorites((Long)args[0]));
			}
		});
	}
	
	/**
	 * 获取指定用户的收藏
	 * 
	 * @param userId 用户的id
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getFavoritesAsync(long userId, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_FAVORITES, listener, new Object[]{userId, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotFavorites(getFavorites((Long)args[0], (Paging)args[1]));
			}
		});
	}
	
	/**
	 * 添加收藏
	 * 
	 * @param id 要收藏的微博ID
	 * @param listener
	 */
	public void createFavoriteAsync(long id, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(CREATE_FAVORITES, listener, new Object[]{id}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.createdFavorites(createFavorite((Long)args[0]));
			}
		});
	}
	
	/**
	 * 删除当前用户的收藏
	 * 
	 * @param id 要删除收藏的微博ID
	 * @param listener
	 */
	public void destroyFavoriteAsync(long id, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTROY_FAVORITES, listener, new Object[]{id}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedFavorite(destroyFavorite((Long)args[0]));
			}
		});
	}
	
	/**
	 * 判断当前用户是否验证成功并返回该用户信息
	 * 
	 * @param listener
	 */
	public void verifyCredentialsAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(VERIFY_CREDENTIALS, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.verifiedCredentials(verifyCredentials());
			}
		});
	}
	
	/**
	 * 阻止指定用户，即将该用户添加进黑名单。
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void createBlockAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(CREATE_BLOCK, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.createdBlock(createBlock((Long)args[0]));
			}
		});
	}
	
	/**
	 * 阻止指定用户，即将该用户添加进黑名单。
	 * 
	 * @param screenName 该用户的个性网址
	 * @param listener
	 */
	public void createBlockAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(CREATE_BLOCK, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.createdBlock(createBlock((String)args[0]));
			}
		});
	}
	
	/**
	 * 取消已阻止的用户，即将该用户添移除黑名单
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void destoryBlockAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTORY_BLOCK, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedBlock(destroyBlock((Long)args[0]));
			}
		});
	}
	
	/**
	 * 取消已阻止的用户，即将该用户添移除黑名单
	 * 
	 * @param screenName 该用户的个性网址
	 * @param listener
	 */
	public void destoryBlockAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(DESTORY_BLOCK, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.destroyedBlock(destroyBlock((String)args[0]));
			}
		});
	}
	
	/**
	 * 判断是否已经阻止用户,如已阻止此用户则返回用户信息
	 * 
	 * @param userId 用户ID
	 * @param listener
	 */
	public void existsBlockAsync(long userId, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(EXISTS_BLOCK, listener, new Object[]{userId}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.existsBlock(existsBlock((Long)args[0]));
			}
		});
	}
	
	/**
	 * 判断是否已经阻止用户,如已阻止此用户则返回用户信息
	 * 
	 * @param screenName 该用户的个性网址
	 * @param listener
	 */
	public void existsBlockAsync(String screenName, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(EXISTS_BLOCK, listener, new Object[]{screenName}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.existsBlock(existsBlock((String)args[0]));
			}
		});
	}
	
	/**
	 * 返回当前登录用户屏蔽的用户列表
	 * 
	 * @param listener
	 */
	public void getBlockUsersAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_BLOCK_USERS, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotBlockUsers(getBlockUsers());
			}
		});
	}
	
	/**
	 * 返回当前登录用户屏蔽的用户id列表
	 * 
	 * @param listener
	 */
	public void getBlockUserIdsAsync(TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_BLOCK_USER_IDS, listener, null) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotBlockUserIds(getBlockUserIds());
			}
		});
	}
	
	/**
	 * 上传图片文件并返回图片地址
	 * 
	 * @param file 支持jpg、png、bmp、gif这四种图片格式
	 * @param listener
	 */
	public void updateImageAsync(File file, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(UPDATE_IMAGES, listener, new Object[]{file}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.updatedImage(updateImage((File)args[0]));
			}
		});
	}
	
	/**
	 * 搜索微博
	 * 
     * @param query 关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @param page 可选参数，当前页数，默认为第一页 
     * @param pageSize 可选参数，返回数量,最大20 
	 * @param listener
	 */
	public void searchStatusAsync(String query, int page, int pageSize, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SEARCH_STATUS, listener, new Object[]{query, page, pageSize}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.searchedStatus(searchStatus((String)args[0], (Integer)args[1], (Integer)args[2]));
			}
		});
	}
	
	/**
	 * 搜索用户
	 * 
     * @param query 关键字,最大长度25,如果以#起始的关键字会作为tag搜索精确匹配 
     * @param page 可选参数，当前页数，默认为第一页 
     * @param pageSize 可选参数，返回数量,最大20 
	 * @param listener
	 */
	public void searchUserAsync(String query, int page, int pageSize, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(SEARCH_USERS, listener, new Object[]{query, page, pageSize}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.searchedUsers(searchUser((String)args[0], (Integer)args[1], (Integer)args[2]));
			}
		});
	}
	
	/**
	 * 获取地点列表
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param listener
	 */
	public void getVenuesAsync(double latitude, double longitude, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_VENUES, listener, new Object[]{latitude, longitude}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotVenues(getVenues((Double)args[0], (Double)args[1]));
			}
		});
	}
	
	/**
	 * 获取地点列表
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param count 返回数量
	 * @param listener
	 */
	public void getVenuesAsync(double latitude, double longitude, int count, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_VENUES, listener, new Object[]{latitude, longitude, count}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotVenues(getVenues((Double)args[0], (Double)args[1], (Integer)args[2]));
			}
		});
	}
	
	/**
	 * 获取地点列表
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param query 关键词
	 * @param listener
	 */
	public void getVenuesAsync(double latitude, double longitude, String query, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_VENUES, listener, new Object[]{latitude, latitude, query}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotVenues(getVenues((Double)args[0], (Double)args[1], (String)args[2]));
			}
		});
	}
	
	/**
	 * 获取地点列表
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param count 返回数量
	 * @param query 关键词
	 * @param listener
	 */
	public void getVenuesAsync(double latitude, double longitude, int count, String query, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_VENUES, listener, new Object[]{latitude, latitude, count, query}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotVenues(getVenues((Double)args[0], (Double)args[1], (Integer)args[2], (String)args[3]));
			}
		});
	}
	
	/**
	 * 通过地理信息获取微博列表
	 * @param vid poi id
	 * @param listener
	 */
	public void getLocationTimeline(long vid, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_LOCATION_TIMELINE, listener, new Object[]{vid}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotLocationTimeline(getLocationTimeline((Long)args[0]));
			}
		});
	}
	
	/**
	 * 通过地理信息获取微博列表
	 * @param vid poi id
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getLocationTimeline(long vid, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_LOCATION_TIMELINE, listener, new Object[]{vid, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotLocationTimeline(getLocationTimeline((Long)args[0], (Paging)args[1]));
			}
		});
	}
	
	/**
	 * 通过地理信息获取微博列表
	 * @param latitude
	 * @param longitude
	 * @param listener
	 */
	public void getLocationTimelineAsync(double latitude, double longitude, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_LOCATION_TIMELINE, listener, new Object[]{latitude, longitude}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotLocationTimeline(getLocationTimeline((Double)args[0], (Double)args[1]));
			}
		});
	}
	
	/**
	 * 通过地理信息获取微博列表
	 * @param latitude 纬度
	 * @param longitude 经度
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getLocationTimelineAsync(double latitude, double longitude, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_LOCATION_TIMELINE, listener, new Object[]{latitude, longitude, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotLocationTimeline(getLocationTimeline((Double)args[0], (Double)args[1], (Paging)args[2]));
			}
		});
	}
	
	/**
	 * 查看指定微博的所有评论
	 * @param id 微博id
	 * @param listener
	 */
	public void getCommentsAsync(long id, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_COMMENTS, listener, new Object[]{id}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotComments(getComments((Long)args[0]));
			}
		});
	}
	
	/**
	 * 查看指定微博的所有评论
	 * @param id 微博id
	 * @param paging 分页参数
	 * @param listener
	 */
	public void getCommentsAsync(long id, Paging paging, TBlogListener listener){
		getDispatcher().invokeLater(new AsyncTask(GET_COMMENTS, listener, new Object[]{id, paging}) {
			@Override
			void invoke(TBlogListener listener, Object[] args) throws TBlogException {
				listener.gotComments(getComments((Long)args[0], (Paging)args[1]));
			}
		});
	}

    private static transient Dispatcher dispatcher;
    
    private boolean shutdown = false;

    public void shutdown(){
    	
        synchronized (AsyncTBlog.class) {
            if (shutdown = true) {
                throw new IllegalStateException("Already shut down");
            }
            getDispatcher().shutdown();
            dispatcher = null;
            shutdown = true;
        }
    }
    
    private Dispatcher getDispatcher(){
        if(true == shutdown){
            throw new IllegalStateException("Already shut down");
        }
        if (null == dispatcher) {
            dispatcher = new Dispatcher(Configuration.getNumberOfAsyncThreads());
        }
        return dispatcher;
    }
    
    abstract class AsyncTask implements Runnable {
    	
        TBlogListener listener;
        Object[] args;
        int method;
        AsyncTask(int method, TBlogListener listener, Object[] args) {
            this.method = method;
            this.listener = listener;
            this.args = args;
        }

        abstract void invoke(TBlogListener listener,Object[] args) throws TBlogException;

        public void run() {
            try {
                   invoke(listener,args);
            } catch (TBlogException te) {
                if (null != listener) {
                    listener.onException(te,method);
                }
            }
        }
    }
}
