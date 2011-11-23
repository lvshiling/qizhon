/**
 * 
 */
package com.navigation.domain;

import weibo4j.Status;
import weibo4j.User;

/**
 * @author wanghui2
 * 新浪BEAN
 */
public class StatusBean {

	private Status status;
	private User author;
	
	public static StatusBean initBean(Status st){
		StatusBean sb = new StatusBean();
		sb.setStatus(st);
		sb.setAuthor(st.getUser());
		return sb;
	}
	
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	
	
}
