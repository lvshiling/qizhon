/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

import java.util.Locale;

import com.navigation.pojo.Area;
import com.navigation.pojo.User;



/**
 * 用户登陆状态信息.
 * 
 * @author Derek
 * @version 1.0 2010-5-7
 */
public final class UserState {

	/** 用户属性. */
	private User user;
	
	/** 用户当前所处的区域 **/
	private Area nowArea;
	
	/** 用户客户端IP. */
	private String clientIp;
	
	/** 用户上次访问时间. */
	private long lastAccessTime;
	
	/** 用户本地语言环境 */
	private Locale locale;

	/**
	 * Gets the user profile.
	 * 
	 * @return the DpUser
	 */
	public User getUser() {
		return user;
	}
	
	public boolean isLogin(){
		if(user == null)return false;
		else return true;
	}
	
	/**
	 * Sets the user profile.
	 * 
	 * @param userProfile the new user
	 */
	void setUser(User user) {
		this.user = user;
	}

	/**
	 * Gets the client ip.
	 * 
	 * @return the client ip
	 */
	public String getClientIp() {
		return clientIp;
	}

	/**
	 * Sets the client ip.
	 * 
	 * @param clientIp the new client ip
	 */
	void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	/**
	 * Gets the last access time.
	 * 
	 * @return the last access time
	 */
	public long getLastAccessTime() {
		return lastAccessTime;
	}

	/**
	 * Sets the last access time.
	 * 
	 * @param lastAccessTime the new last access time
	 */
	void setLastAccessTime(long lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}

	public Locale getLocale() {
		return locale;
	}

	void setLocale(Locale locale) {
		this.locale = locale;
	}
}
