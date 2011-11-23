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
package t4j.data;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import t4j.TBlogException;
import t4j.TBlogResponse;
import t4j.http.Response;
import t4j.org.json.JSONArray;
import t4j.org.json.JSONException;
import t4j.org.json.JSONObject;

/**
 * 
 * @author gcwang
 * 
 * 微博信息
 *
 */
public class Status extends TBlogResponse {

	private long id;
	private String source;
	private Date created_at;
	private String text;
	private long in_reply_to_status_id;
	private long in_reply_to_user_id;
	private String in_reply_to_screen_name;
	private int retweet_count;
	private int comments_count;
	private Date favorited_at;
	private String in_reply_to_status_text;
	private String in_reply_to_user_name;
	private boolean favorited;
	private String cursor_id;
	private long root_in_reply_to_status_id;
	private boolean is_retweet_by_user;
	private long retweet_user_id;
	private String retweet_user_name;
	private String retweet_user_screen_name;
	private Date retweet_created_at;
	private long root_in_reply_to_user_id;
	private String root_in_reply_to_screen_name;
	private String root_in_reply_to_user_name;
	private String root_in_reply_to_status_text;
	private String ref_img;
	private String ref_img_middle;
	private String root_in_reply_to_img;
	private String root_in_reply_to_img_middle;

	private User user;
	private GeoInfor geoInfor;
	private Venue venue;
	
	public Status(Response res) throws TBlogException{
		JSONObject json=res.asJSONObject();
		init(json);
			
	}
	
	public Status(JSONObject json) throws TBlogException {
		init(json);
	}
	
	private void init(JSONObject json) throws TBlogException{
		
    	try {

    		this.id = json.getLong("id");
    		this.source = json.getString("source");
    		this.created_at = parseDate(json.getString("created_at"), "EEE MMM dd HH:mm:ss z yyyy");
    		
    		String text = json.getString("text");
    		/*	图片引用	*/
    		if(text.indexOf("http://126.fm") != -1){
				try {
					String str = text.substring(text.indexOf("http://126.fm"));
					if(str.indexOf(" ")!=-1)str = str.substring(0,str.indexOf(" "));
					this.ref_img = "http://oimagec8.ydstatic.com/image?w=120&h=&url="+URLEncoder.encode(str, "UTF-8");
					this.ref_img_middle = "http://oimagec8.ydstatic.com/image?w=460&h=&url="+URLEncoder.encode(str, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
    		}
    		this.text = text;
    		this.in_reply_to_status_id = json.getLong("in_reply_to_status_id");
    		this.in_reply_to_user_id = json.getLong("in_reply_to_user_id");
    		this.in_reply_to_screen_name = json.getString("in_reply_to_screen_name");
    		this.retweet_count = json.getInt("retweet_count");
    		this.comments_count = json.getInt("comments_count");
    		this.favorited_at = parseDate(json.getString("favorited_at"), "EEE MMM dd HH:mm:ss z yyyy");
    		this.in_reply_to_status_text = json.getString("in_reply_to_status_text");
    		this.in_reply_to_user_name = json.getString("in_reply_to_user_name");
    		this.favorited = json.getBoolean("favorited");
    		this.cursor_id = json.getString("cursor_id");
    		this.root_in_reply_to_status_id = json.getLong("root_in_reply_to_status_id");
    		this.is_retweet_by_user = json.getBoolean("is_retweet_by_user");
    		this.retweet_user_id = json.getLong("retweet_user_id");
    		this.retweet_user_name = json.getString("retweet_user_name");
    		this.retweet_user_screen_name = json.getString("retweet_user_screen_name");
    		this.retweet_created_at = parseDate(json.getString("retweet_created_at"), "EEE MMM dd HH:mm:ss z yyyy");
    		this.root_in_reply_to_user_id = json.getLong("root_in_reply_to_user_id");
    		this.root_in_reply_to_screen_name = json.getString("root_in_reply_to_screen_name");
    		this.root_in_reply_to_user_name = json.getString("root_in_reply_to_user_name");
    		this.root_in_reply_to_status_text = json.getString("root_in_reply_to_status_text");
    		
    		if(!json.isNull("user")){
    			this.user = new User(json.getJSONObject("user"));
    		}
    		
    		if(!json.isNull("geo")){
    			this.geoInfor = new GeoInfor(json.getJSONObject("geo"));
    		}
    		
    		if(!json.isNull("venue")){
    			this.venue = new Venue(json.getJSONObject("venue"));
    		}
    		
		} catch (JSONException je) {
			throw new TBlogException(je.getMessage() + ":" + json.toString(), je);
		}
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getCreatedAt() {
		return created_at;
	}

	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public long getInReplyToStatusId() {
		return in_reply_to_status_id;
	}

	public void setInReplyToStatusId(long in_reply_to_status_id) {
		this.in_reply_to_status_id = in_reply_to_status_id;
	}

	public long getInReplyToUserId() {
		return in_reply_to_user_id;
	}

	public void setInReplyToUserId(long in_reply_to_user_id) {
		this.in_reply_to_user_id = in_reply_to_user_id;
	}

	public String getInReplyToScreenName() {
		return in_reply_to_screen_name;
	}

	public void setInReplyToScreeName(String in_reply_to_screen_name) {
		this.in_reply_to_screen_name = in_reply_to_screen_name;
	}

	public int getRetweetCount() {
		return retweet_count;
	}

	public void setRetweetCount(int retweet_count) {
		this.retweet_count = retweet_count;
	}

	public int getCommentsCount() {
		return comments_count;
	}

	public void setCommentsCount(int comments_count) {
		this.comments_count = comments_count;
	}

	public Date getFavoritedAt() {
		return favorited_at;
	}

	public void setFavoritedAt(Date favorited_at) {
		this.favorited_at = favorited_at;
	}

	public String getInReplyToStatusText() {
		return in_reply_to_status_text;
	}

	public void setInReplyToStatusText(String in_reply_to_status_text) {
		this.in_reply_to_status_text = in_reply_to_status_text;
	}

	public String getInReplyToUserName() {
		return in_reply_to_user_name;
	}

	public void setInReplyToUserName(String in_reply_to_user_name) {
		this.in_reply_to_user_name = in_reply_to_user_name;
	}

	public boolean isFavorited() {
		return favorited;
	}

	public void setFavorited(boolean favorited) {
		this.favorited = favorited;
	}

	public String getCursorId() {
		return cursor_id;
	}

	public void setCursorId(String cursor_id) {
		this.cursor_id = cursor_id;
	}

	public long getRootInReplyToStatusId() {
		return root_in_reply_to_status_id;
	}

	public void setRootInReplyToStatusId(long root_in_reply_to_status_id) {
		this.root_in_reply_to_status_id = root_in_reply_to_status_id;
	}

	public boolean isIsRetweetByUser() {
		return is_retweet_by_user;
	}

	public void setIsRetweetByUser(boolean is_retweet_by_user) {
		this.is_retweet_by_user = is_retweet_by_user;
	}

	public long getRetweetUserId() {
		return retweet_user_id;
	}

	public void setRetweetUserId(long retweet_user_id) {
		this.retweet_user_id = retweet_user_id;
	}

	public String getRetweetUserName() {
		return retweet_user_name;
	}

	public void setRetweetUserName(String retweet_user_name) {
		this.retweet_user_name = retweet_user_name;
	}

	public String getRetweetUserScreenName() {
		return retweet_user_screen_name;
	}

	public void setRetweetUserScreenName(String retweet_user_screen_name) {
		this.retweet_user_screen_name = retweet_user_screen_name;
	}

	public Date getRetweetCreatedAt() {
		return retweet_created_at;
	}

	public void setRetweetCreatedAt(Date retweet_created_at) {
		this.retweet_created_at = retweet_created_at;
	}

	public long getRootInReplyToUserId() {
		return root_in_reply_to_user_id;
	}

	public void setRootInReplyToUserId(long root_in_reply_to_user_id) {
		this.root_in_reply_to_user_id = root_in_reply_to_user_id;
	}

	public String getRootInReplyToScreenName() {
		return root_in_reply_to_screen_name;
	}

	public void setRootInReplyToScreenName(String root_in_reply_to_screen_name) {
		this.root_in_reply_to_screen_name = root_in_reply_to_screen_name;
	}

	public String getRootInReplyToUserName() {
		return root_in_reply_to_user_name;
	}

	public void setRootInReplyToUserName(String root_in_reply_to_user_name) {
		this.root_in_reply_to_user_name = root_in_reply_to_user_name;
	}

	public String getRootInReplyToStatusText() {
		return root_in_reply_to_status_text;
	}

	public void setRootInReplyToStatusText(String root_in_reply_to_status_text) {
		this.root_in_reply_to_status_text = root_in_reply_to_status_text;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public GeoInfor getGeoInfor() {
		return geoInfor;
	}

	public void setGeoInfor(GeoInfor geoInfor) {
		this.geoInfor = geoInfor;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}
	
	public static List<Status> constructStatuses(JSONArray jsonArray) throws TBlogException {
		
		try {
			int size = jsonArray.length();
			List<Status> statuses = new ArrayList<Status>(size);
			for (int i = 0; i < size; i++) {
				statuses.add(new Status(jsonArray.getJSONObject(i)));
			}
			return statuses;
		} catch (JSONException jsone) {
			throw new TBlogException(jsone);
		} catch (TBlogException te) {
			throw te;
		}
	}
	
	public static List<Status> constructStatuses(Response res) throws TBlogException {
		
		return constructStatuses(res.asJSONArray());
	}

	public String getRef_img() {
		return ref_img;
	}

	public void setRef_img(String ref_img) {
		this.ref_img = ref_img;
	}

	public String getRoot_in_reply_to_img() {
		return root_in_reply_to_img;
	}

	public void setRoot_in_reply_to_img(String root_in_reply_to_img) {
		this.root_in_reply_to_img = root_in_reply_to_img;
	}

	public String getRef_img_middle() {
		return ref_img_middle;
	}

	public void setRef_img_middle(String ref_img_middle) {
		this.ref_img_middle = ref_img_middle;
	}

	public String getRoot_in_reply_to_img_middle() {
		return root_in_reply_to_img_middle;
	}

	public void setRoot_in_reply_to_img_middle(String root_in_reply_to_img_middle) {
		this.root_in_reply_to_img_middle = root_in_reply_to_img_middle;
	}
}
