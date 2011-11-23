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
 * 用来表示发的私信
 *
 */
public class DirectMessage extends TBlogResponse {

    private long id;
    private String text;
    private long sender_id;
    private long recipient_id;
    private Date created_at;
    private String sender_screen_name;
    private String recipient_screen_name;
	
    private User sender;
    private User recipient;
    
    public DirectMessage(JSONObject json) throws TBlogException{
    	init(json);
    }
    
    public DirectMessage(Response res) throws TBlogException{
    	init(res.asJSONObject());
    }
    
    private void init(JSONObject json) throws TBlogException {
    	try {
			this.id = json.getInt("id");
			this.text = json.getString("text");
	    	this.sender_id = json.getLong("sender_id");
	    	this.recipient_id = json.getLong("recipient_id");
	    	this.created_at = parseDate(json.getString("created_at"), "EEE MMM dd HH:mm:ss z yyyy");
	    	this.sender_screen_name = json.getString("sender_screen_name");
	    	this.recipient_screen_name = json.getString("recipient_screen_name");
	    	
	    	this.sender = new User(json.getJSONObject("sender"));
	    	this.recipient = new User(json.getJSONObject("recipient"));
	    	
		} catch (JSONException e) {
			throw new TBlogException(e);
		}
    }
    
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public long getSenderId() {
		return sender_id;
	}
	
	public void setSenderId(long sender_id) {
		this.sender_id = sender_id;
	}
	
	public long getRecipientId() {
		return recipient_id;
	}
	
	public void setRecipientId(long recipient_id) {
		this.recipient_id = recipient_id;
	}
	
	public Date getCreatedAt() {
		return created_at;
	}
	
	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}
	
	public String getSenderScreenName() {
		return sender_screen_name;
	}
	
	public void setSenderScreenName(String sender_screen_name) {
		this.sender_screen_name = sender_screen_name;
	}
	
	public String getRecipientScreenName() {
		return recipient_screen_name;
	}
	
	public void setRecipientScreenName(String recipient_screen_name) {
		this.recipient_screen_name = recipient_screen_name;
	}
	
	public User getSender() {
		return sender;
	}
	
	public void setSender(User sender) {
		this.sender = sender;
	}
	
	public User getRecipient() {
		return recipient;
	}
	
	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}
	
    public static List<DirectMessage> createDirectMessageList(Response res) throws TBlogException {
        try {
            JSONArray list = res.asJSONArray();
            int size = list.length();
            List<DirectMessage> directMessages = new ArrayList<DirectMessage>(size);
            for (int i = 0; i < size; i++) {
                directMessages.add(new DirectMessage(list.getJSONObject(i)));
            }
            return directMessages;
        } catch (JSONException jsone) {
            throw new TBlogException(jsone);
        } catch (TBlogException te) {
            throw te;
        }
    }
}
