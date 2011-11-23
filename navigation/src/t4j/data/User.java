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
 * 用户信息
 *
 */
public class User extends TBlogResponse {

	private String name;
	private String location;
	private long id;
	private String description;
	private String profile_image_url;
	private String screen_name;
	private int gender;
	private String url;
	private Date created_at;
	private int followers_count;
	private int friends_count;
	private int favourites_count;
	private int statuses_count;
	private boolean geoEnable;
	
	private String[] sysTag;
	private String[] userTag;
	
	private String darenRec;
	
	private SimpleStatus status;
	
	private String reason;
	
	public User(Response res) throws TBlogException{
		init(res.asJSONObject());
	}
	
	public User(JSONObject json) throws TBlogException{
		init(json);
	}
	
	private void init(JSONObject json) throws TBlogException{
		
		try{
			this.name = json.getString("name");
			this.location = json.getString("location");
			this.id = json.getLong("id");
			this.description = json.getString("description");
			this.profile_image_url = json.getString("profile_image_url");
			this.screen_name = json.getString("screen_name");
			this.gender = json.getInt("gender");
			this.url = json.getString("url");
			this.created_at = parseDate(json.getString("created_at"), "EEE MMM dd HH:mm:ss z yyyy");
			this.followers_count = json.getInt("followers_count");
			this.friends_count = json.getInt("friends_count");
			this.favourites_count = json.getInt("favourites_count");
			this.statuses_count = json.getInt("statuses_count");
			this.geoEnable = json.getBoolean("geo_enable");
			this.reason = json.getString("reason");
			this.darenRec = json.getString("darenRec");
			
			if(!json.isNull("status")){
				this.status = new SimpleStatus(json.getJSONObject("status"));
			}
			
			if(!json.isNull("sysTag")){
				JSONArray sys_tags = json.getJSONArray("sysTag");
				sysTag = new String[sys_tags.length()];
				for(int i=0; i<sys_tags.length(); i++){
					sysTag[i] = sys_tags.getString(i);
				}
			}
			
			if(!json.isNull("userTag")){
				JSONArray user_tags = json.getJSONArray("userTag");
				userTag = new String[user_tags.length()];
				for(int i=0; i<user_tags.length(); i++){
					userTag[i] = user_tags.getString(i);
				}
			}
		} catch (JSONException je){
			throw new TBlogException(je.getMessage() + ":" + json.toString(), je);
		}
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getProfileImageURL() {
		return profile_image_url;
	}
	
	public void setProfileImageURL(String profile_image_url) {
		this.profile_image_url = profile_image_url;
	}
	
	public String getScreenName() {
		return screen_name;
	}
	
	public void setScreenName(String screen_name) {
		this.screen_name = screen_name;
	}
	
	public int getGender() {
		return gender;
	}
	
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public Date getCreatedAt() {
		return created_at;
	}
	
	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}
	
	public int getFollowersCount() {
		return followers_count;
	}
	
	public void setFollowersCount(int followers_count) {
		this.followers_count = followers_count;
	}
	public int getFriendsCount() {
		return friends_count;
	}
	
	public void setFriendsCount(int friends_count) {
		this.friends_count = friends_count;
	}
	
	public int getFavouritesCount() {
		return favourites_count;
	}
	
	public void setFavouritesCount(int favourites_count) {
		this.favourites_count = favourites_count;
	}
	
	public boolean isGeoEnable() {
		return geoEnable;
	}

	public void setGeoEnable(boolean geoEnable) {
		this.geoEnable = geoEnable;
	}

	public int getStatusesCount() {
		return statuses_count;
	}
	
	public void setStatusesCount(int statuses_count) {
		this.statuses_count = statuses_count;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public SimpleStatus getStatus() {
		return status;
	}

	public void setStatus(SimpleStatus status) {
		this.status = status;
	}
	
	public String getDarenRec() {
		return darenRec;
	}

	public void setDarenRec(String darenRec) {
		this.darenRec = darenRec;
	}

	public String[] getSysTag() {
		return sysTag;
	}

	public void setSysTag(String[] sysTag) {
		this.sysTag = sysTag;
	}

	public String[] getUserTag() {
		return userTag;
	}

	public void setUserTag(String[] userTag) {
		this.userTag = userTag;
	}

	public static PagableResponseList<User> createPagableUserList(Response res) throws TBlogException {
        try {
            JSONObject json = res.asJSONObject();
            JSONArray list = json.getJSONArray("users");
            int size = list.length();
            PagableResponseList<User> users = new PagableResponseList<User>(size, json, res);
            for (int i = 0; i < size; i++) {
                users.add(new User(list.getJSONObject(i)));
            }
            return users;
        } catch (JSONException jsone) {
            throw new TBlogException(jsone);
        } catch (TBlogException te) {
            throw te;
        }
	}
	
	public static List<User> createUserList(JSONArray array) throws TBlogException {
		try{
			List<User> users = new ArrayList<User>();
			for(int i=0; i<array.length(); i++){
				users.add(new User(array.getJSONObject(i)));
			}
			return users;
		}catch(JSONException jsone){
			throw new TBlogException(jsone);
		}
	}
	
	public static List<User> createUserList(Response res) throws TBlogException{
		
		try{
			JSONArray list = res.asJSONArray();
			List<User> users = new ArrayList<User>();
			
			for(int i=0; i<list.length(); i++){
				users.add(new User(list.getJSONObject(i)));
			}
			return users;
		}catch(JSONException jsone){
			throw new TBlogException(jsone);
		}
	}
}
