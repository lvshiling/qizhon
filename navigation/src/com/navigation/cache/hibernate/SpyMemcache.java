/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 * @(#) SpyMemcache.java 1.0 Apr 16, 2010
 */
package com.navigation.cache.hibernate;

import net.spy.memcached.MemcachedClient;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.cache.ThreadLocalCache;



/**
 * @author Derek
 * @version 1.0 ,2010-4-16
 */
public class SpyMemcache extends com.googlecode.hibernate.memcached.spymemcached.SpyMemcache {
	private static final Logger log = LoggerFactory.getLogger(SpyMemcache.class);
	private boolean threadLocalCacheEnabled = true;
	
	public SpyMemcache(MemcachedClient client) {
		super(client);
	}
	
	/**
	 * 删除缓存
	 * 
	 * 删除二级缓存及线程缓存
	 * 
	 * @see com.googlecode.hibernate.memcached.spymemcached.SpyMemcache#delete(java.lang.String)
	 */
	@Override
	public void delete(String key) {
		super.delete(key);
		if(threadLocalCacheEnabled)ThreadLocalCache.delete(key);
	}

	/**
	 * 缓存获取
	 * 
	 * 先查找线程缓存，如果命中直接返回值，否则继续查找二级缓存，如果命中则设置线程缓存，再返回。
	 * 
	 * @see com.googlecode.hibernate.memcached.spymemcached.SpyMemcache#get(java.lang.String)
	 */
	@Override
	public Object get(String key) {
		//log.debug("Pojo Cache get. {}",key);
		//查找线程缓存
		Object value = null;
		if(threadLocalCacheEnabled) value = ThreadLocalCache.get(key);
		if(value != null)return value;
		
		//查找二级缓存
		value = super.get(key);

		//设置线程缓存
		if(value != null && threadLocalCacheEnabled){
			ThreadLocalCache.put(key, value);
		}
		return value;
	}

	/**
	 * 设置缓存
	 * 
	 * 设置二级缓存及清除线程缓存
	 * 
	 * @see com.googlecode.hibernate.memcached.spymemcached.SpyMemcache#set(java.lang.String, int, java.lang.Object)
	 */
	@Override
	public void set(String key, int time, Object value) {
		//log.debug("Pojo Cache set. {}",key);
		super.set(key, time, value);
		if(threadLocalCacheEnabled) ThreadLocalCache.delete(key);
	}

	public void setThreadLocalCacheEnabled(boolean threadLocalCacheEnabled) {
		this.threadLocalCacheEnabled = threadLocalCacheEnabled;
	}
	
}
