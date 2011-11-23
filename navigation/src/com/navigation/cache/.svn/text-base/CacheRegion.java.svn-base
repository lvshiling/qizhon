/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.cache.impl.StringKeyStrategy;

/**
 * The Class CacheRegion.
 * 
 * @author guohouqiang
 * @version 1.0, Apr 19, 2010
 */
@SuppressWarnings("unchecked")
public class CacheRegion implements Cache{
	
	/** The log. */
	private Logger log = LoggerFactory.getLogger(CacheRegion.class);
	
	/** The groups. */
	private List<CacheGroup> groups = new ArrayList<CacheGroup>();
	
	/** The region name. */
	private String regionName = "default";
 	
	/** The default cache time seconds. */
	private int defaultCacheTimeSeconds = 300;
	
	/** The max async milliseconds. */
	private int maxAsyncMilliseconds = 100;
	
	/** The key strategy. */
	private String keyStrategy = "com.ztgame.cache.impl.StringKeyStrategy";
	
	/** The key strategy_. */
	private KeyStrategy keyStrategy_ = null;
	
	/** The clear supported. */
	private boolean clearSupported= false;
	
	/** The lock. */
	private ReentrantLock lock = new ReentrantLock();
	
	private ReentrantLock incrLock = new ReentrantLock();
	
	private ReentrantLock decrLock = new ReentrantLock();
	
	
	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#add(java.lang.Object, java.lang.Object, int[])
	 */
	public Future<Boolean> add(Object key, Object o, int... cacheTimeSeconds) {
		final int time = cacheTime(cacheTimeSeconds);
		final String objectKey = toKey(key);
		final Object value = o;
		return new CacheOperate<Boolean>(){
			protected Future<Boolean> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().add(objectKey, time, value);
			}
		}.execute();
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#asyncGet(java.lang.Object)
	 */
	public Future<Object> asyncGet(Object key) {
		final String objectKey = toKey(key);
		return new CacheOperate<Object>(){
			protected Future<Object> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().asyncGet(objectKey);
			}
		}.execute();
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#asyncGetBulk(java.lang.Object[])
	 */
	public Future<Map<String, Object>> asyncGetBulk(Object[] keys) {
		final String[] objectKey = toKeys(keys);
		return new CacheOperate<Map<String, Object>>(){
			protected Future<Map<String, Object>> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().asyncGetBulk(objectKey);
			}
		}.execute();
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#get(java.lang.Object)
	 */
	public Object get(Object key) {
		final String objectKey = toKey(key);
		Object value = null;
		for(CacheGroup group : groups){
			try {
				value = group.getCacheClient().get(objectKey);
				if(value != null) return value;
			} catch (IOException e) {
				//Ignore
			}
		}
		return null;
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#getBulk(java.lang.Object[])
	 */
	public Map<String, Object> getBulk(Object[] keys) {
		final String[] objectKey = toKeys(keys);
		Map<String, Object> value = null;
		for(CacheGroup group : groups){
			try {
				value = group.getCacheClient().getBulk(objectKey);
				if(value != null) return value;
			} catch (IOException e) {
				//Ignore
			}
		}
		return null;
	}
	
	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#delete(java.lang.Object)
	 */
	public Future<Boolean> delete(Object key) {
		final String objectKey = toKey(key);
		return new CacheOperate<Boolean>(){
			protected Future<Boolean> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().delete(objectKey);
			}
		}.execute();
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#replace(java.lang.Object, java.lang.Object, int)
	 */
	public Future<Boolean> replace(Object key, Object o, int cacheTimeSeconds) {
		final int time = cacheTimeSeconds;
		final String objectKey = toKey(key);
		final Object value = o;
		return new CacheOperate<Boolean>(){
			protected Future<Boolean> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().replace(objectKey, time, value);
			}
		}.execute();
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#set(java.lang.Object, java.lang.Object, int[])
	 */
	public Future<Boolean> set(Object key, Object o, int... cacheTimeSeconds) {
		final int time = cacheTime(cacheTimeSeconds);
		final String objectKey = toKey(key);
		final Object value = o;
		return new CacheOperate<Boolean>(){
			protected Future<Boolean> doCache(CacheGroup cacheGroup) throws IOException {
				return cacheGroup.getCacheClient().set(objectKey, time, value);
			}
		}.execute();
	}
	
	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#incr(java.lang.Object, int, int[])
	 */
	public long incr(Object key, int by, int... startingValue) {
		String objectKey = toKey(key);
		int start = startingValue.length > 0 ? startingValue[0]: 0;
		if(groups.size() > 0){
			log.warn("Counter by cache is not support multi-cacheGroup! It will be incr on one group!");
		}
		try {
			incrLock.lock();
			if(start == 0)
				return groups.get(0).getCacheClient().incr(objectKey, by);
			else 
				return groups.get(0).getCacheClient().incr(objectKey, by, start);
		} catch (IOException e) {
			log.error(e.getMessage());
			return -1;
		} finally{
			incrLock.unlock();
		}
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.Cache#decr(java.lang.Object, int, long[])
	 */
	public long decr(Object key, int by, long... def) {
		String objectKey = toKey(key);
		long start = def.length > 0 ? def[0]: 0;
		if(groups.size() > 0){
			log.warn("Counter by cache is not support multi-cacheGroup! It will be decr on one group!");
		}
		try {
			decrLock.lock();
			if(start == 0)
				return groups.get(0).getCacheClient().decr(objectKey, by);
			else 
				return groups.get(0).getCacheClient().decr(objectKey, by, start);
		} catch (IOException e) {
			log.error(e.getMessage());
			return -1;
		} finally{
			decrLock.unlock();
		}
	}


    /**
	 * Destroy.
	 * 
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
    @SuppressWarnings("unused")
	private void destroy() throws IOException{
    	for(CacheGroup cacheGroup : getGroups()){
    		cacheGroup.getCacheClient().shutdown();
    	}
    	log.warn(regionName + " is shutdown!");
    }
	
    /**
	 * To key.
	 * 
	 * @param key the key
	 * @return the string
	 */
    protected String toKey(Object key) {
        return getKeyStrategy().toKey(regionName,key);
    } 
    
    /**
	 * To keys.
	 * 
	 * @param keys the keys
	 * @return the string[]
	 */
    protected String[] toKeys(Object[] keys){
    	if(keys == null || keys.length == 0)
    		return ArrayUtils.EMPTY_STRING_ARRAY;
    	String[] skeys = new String[keys.length];
    	for(int i=0;i<keys.length;i++){
    		skeys[i] = toKey(keys[i]);
    	}
    	return skeys;
    }

    /**
	 * Gets the key strategy.
	 * 
	 * @return the key strategy
	 */
    private KeyStrategy getKeyStrategy() {
    	if(keyStrategy_ != null)return keyStrategy_;
    	
    	lock.lock();
    	try{
    		if(keyStrategy_ == null){
    	
    			try {
	    			Object object = Class.forName(keyStrategy).newInstance();
	    			if(object instanceof KeyStrategy){
	    				keyStrategy_ = (KeyStrategy)object;
	    			}
    			} catch (Exception e) {
    	        	log.info("Could not instantiate keyStrategy class,using default "+keyStrategy_.getClass().getName());
    	            keyStrategy_ = new StringKeyStrategy();
    	        }
    		}
    	}finally{
    		lock.unlock();
    	}
    	return keyStrategy_;
    }

    private int cacheTime(int[] cacheTimeSeconds){
    	return cacheTimeSeconds.length > 0 ? cacheTimeSeconds[0]:defaultCacheTimeSeconds;
    }
    
	/**
	 * Checks if is clear supported.
	 * 
	 * @return true, if is clear supported
	 */
	public boolean isClearSupported() {
		return clearSupported;
	}

	/**
	 * Sets the clear supported.
	 * 
	 * @param clearSupported the new clear supported
	 */
	public void setClearSupported(boolean clearSupported) {
		this.clearSupported = clearSupported;
	}

	/**
	 * Gets the default cache time seconds.
	 * 
	 * @return the default cache time seconds
	 */
	public int getDefaultCacheTimeSeconds() {
		return defaultCacheTimeSeconds;
	}

	/**
	 * Sets the default cache time seconds.
	 * 
	 * @param defaultCacheTimeSeconds the new default cache time seconds
	 */
	public void setDefaultCacheTimeSeconds(int defaultCacheTimeSeconds) {
		this.defaultCacheTimeSeconds = defaultCacheTimeSeconds;
	}

	/**
	 * Gets the groups.
	 * 
	 * @return the groups
	 */
	public List<CacheGroup> getGroups() {
		return groups;
	}

	/**
	 * Sets the groups.
	 * 
	 * @param groups the new groups
	 */
	public void setGroups(List<CacheGroup> groups) {
		this.groups = groups;
	}

	/**
	 * Sets the key strategy.
	 * 
	 * @param keyStrategy the new key strategy
	 */
	public void setKeyStrategy(String keyStrategy) {
		this.keyStrategy = keyStrategy;
	}

	/**
	 * Gets the max async milliseconds.
	 * 
	 * @return the max async milliseconds
	 */
	public int getMaxAsyncMilliseconds() {
		return maxAsyncMilliseconds;
	}

	/**
	 * Sets the max async milliseconds.
	 * 
	 * @param maxAsyncMilliseconds the new max async milliseconds
	 */
	public void setMaxAsyncMilliseconds(int maxAsyncMilliseconds) {
		this.maxAsyncMilliseconds = maxAsyncMilliseconds;
	}

	/**
	 * Gets the region name.
	 * 
	 * @return the region name
	 */
	public String getRegionName() {
		return regionName;
	}

	/**
	 * Sets the region name.
	 * 
	 * @param regionName the new region name
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	/**
	 * 缓存操作封装
	 * @param <T>
	 *
	 * @author Derek
	 * @version 1.0, 2010-04-19
	 */
	private abstract class CacheOperate<T>{
		Future<T>[] f;
		int size = groups.size();
		
		public Future<T> execute(){
			if(size == 1){
				try {
					return doCache(groups.get(0));
				} catch (IOException e) {
					e.printStackTrace();
					return new FutureAdapter<T>(null);
				}
			}else{
				f = new Future[size];
				for(int i = 0; i<size; i++){
					CacheGroup cacheGroup = groups.get(i);
					try {
						f[i] = doCache(cacheGroup);
					} catch (IOException e) {
						e.printStackTrace();
						return new FutureAdapter<T>(null);
					}
		    	}
				return new FutureAdapter<T>(f,maxAsyncMilliseconds);
			}
		}
		protected abstract Future<T> doCache(CacheGroup cacheGroup) throws IOException ;
	}

}
