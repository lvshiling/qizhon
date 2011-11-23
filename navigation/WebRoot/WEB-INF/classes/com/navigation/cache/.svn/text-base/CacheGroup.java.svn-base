/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.io.IOException;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 缓存服务器组（由节点组成）
 * 每个服务器组由一个或多个节点组成；作为缓存客户端操作的一个单位.
 * 
 * @author guohouqiang
 * @version 1.0, Oct 15, 200
 */
public class CacheGroup {
	/** 缓存服务器地址 ip:port 多服务器由空格或逗号隔开. */
	private String servers;
	
	/** The cache client factory. */
	private CacheClientFactory cacheClientFactory;

	/** The cache client. */
	private CacheClient cacheClient = null;
	
	/** The lock. */
	private ReentrantLock lock = new ReentrantLock();
	
	public void init(){
		if(cacheClient == null){
			try {
				cacheClient = cacheClientFactory.createClient(AddrUtil.getAddresses(servers));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * Gets the cache client.
	 * 
	 * @return the cache client
	 * 
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public CacheClient getCacheClient() throws IOException{
		if(cacheClient != null)return cacheClient;
		lock.lock();
		try{
			init();
		}finally{
			lock.unlock();
		}
		return cacheClient;
	}
	
	/**
	 * Gets the cache client factory.
	 * 
	 * @return the cache client factory
	 */
	public CacheClientFactory getCacheClientFactory() {
		return cacheClientFactory;
	}

	/**
	 * Sets the cache client factory.
	 * 
	 * @param cacheClientFactory the new cache client factory
	 */
	public void setCacheClientFactory(CacheClientFactory cacheClientFactory) {
		this.cacheClientFactory = cacheClientFactory;
	}

	/**
	 * Gets the servers.
	 * 
	 * @return the servers
	 */
	public String getServers() {
		return servers;
	}

	/**
	 * Sets the servers.
	 * 
	 * @param servers the new servers
	 */
	public void setServers(String servers) {
		this.servers = servers;
	}
}
