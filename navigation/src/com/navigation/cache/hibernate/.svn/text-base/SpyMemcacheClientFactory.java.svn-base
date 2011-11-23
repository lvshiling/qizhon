/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 * @(#) SpyMemcacheClientFactory.java 1.0 Apr 16, 2010
 */
package com.navigation.cache.hibernate;

import java.util.concurrent.locks.ReentrantLock;

import net.spy.memcached.AddrUtil;
import net.spy.memcached.ConnectionFactory;
import net.spy.memcached.MemcachedClient;

import com.googlecode.hibernate.memcached.Memcache;
import com.googlecode.hibernate.memcached.PropertiesHelper;

/**
 * @author Derek
 * @version 1.0 ,2010-4-16
 */
public class SpyMemcacheClientFactory extends com.googlecode.hibernate.memcached.spymemcached.SpyMemcacheClientFactory{
	private static SpyMemcache memcache = null;
	private String THREADLOCAL_CACHE_ENABLED = "hibernate.memcached.threadLocalCacheEnabled";
	private ReentrantLock lock = new ReentrantLock();
	
	public SpyMemcacheClientFactory(PropertiesHelper properties) {
		super(properties);
	}
	
	@Override
	public Memcache createMemcacheClient() throws Exception {
		if(memcache != null) return memcache;
		lock.lock();
		try{
			if(memcache != null) return memcache;
		
	        ConnectionFactory connectionFactory = getConnectionFactory();
	        MemcachedClient client = new MemcachedClient(connectionFactory, AddrUtil.getAddresses(getServerList()));
	        memcache = new SpyMemcache(client);
	        memcache.setThreadLocalCacheEnabled(getThreadLocalCacheEnabled());
	        memcache.setExceptionHandler(new CacheExceptionHandler());
		}finally{
			lock.unlock();
		}
	    return memcache;
    }
	
	public boolean getThreadLocalCacheEnabled(){
		return this.getProperties().getBoolean(THREADLOCAL_CACHE_ENABLED, true);
	}
}
