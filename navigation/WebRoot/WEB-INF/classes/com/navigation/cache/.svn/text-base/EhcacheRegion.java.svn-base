/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.locks.ReentrantLock;

import net.sf.ehcache.Element;

/**
 * The Class EhcacheRegion.
 * 
 * @author Derek
 * @version 1.0 2010-5-19
 */
public class EhcacheRegion extends CacheRegion {
	
	/** The cache. */
	private net.sf.ehcache.Cache cache;

	/** The region name. */
	private String regionName = "default";
	
	/** The incr lock. */
	private ReentrantLock incrLock = new ReentrantLock();
	
	/** The decr lock. */
	private ReentrantLock decrLock = new ReentrantLock();
	
	/**
	 * @see com.navigation.cache.CacheRegion#add(java.lang.Object, java.lang.Object, int[])
	 */
	@Override
	public Future<Boolean> add(Object key, Object o, int... cacheTimeSeconds) {
		if(cache.get(key) == null){
			return set(key,o,cacheTimeSeconds);
		}else 
			return new FutureAdapter<Boolean>(false);
	}

	/**
	 * @see com.navigation.cache.CacheRegion#asyncGet(java.lang.Object)
	 */
	@Override
	public Future<Object> asyncGet(Object key) {
		Object value = get(key);
		return new FutureAdapter<Object>(value);
	}

	/**
	 * @see com.navigation.cache.CacheRegion#asyncGetBulk(java.lang.Object[])
	 */
	@Override
	public Future<Map<String, Object>> asyncGetBulk(Object[] keys) {
		return new FutureAdapter<Map<String, Object>>(getBulk(keys));
	}

	/**
	 * @see com.navigation.cache.CacheRegion#decr(java.lang.Object, int, long[])
	 */
	@Override
	public long decr(Object key, int by, long... def) {
		decrLock.lock();
		long v ;
		try{
			Object i = get(key);
			if(i != null && i instanceof Number){
				v = (Long)i - by;
				v = v <= 0 ? 0 : v;
			}else{
				v = def.length == 0 ? -1 : def[0];
			}
			if(v >= 0)set(key,v);
		}finally{
			decrLock.unlock();
		}
		return v;
	}

	/**
	 * @see com.navigation.cache.CacheRegion#delete(java.lang.Object)
	 */
	@Override
	public Future<Boolean> delete(Object key) {
		cache.removeQuiet(key);
		return new FutureAdapter<Boolean>(true);
	}

	/**
	 * @see com.navigation.cache.CacheRegion#get(java.lang.Object)
	 */
	@Override
	public Object get(Object key) {
		Element element = cache.get(key);
		if(element != null){
			return element.getValue();
		}else return null;	
	}

	/**
	 * @see com.navigation.cache.CacheRegion#getBulk(java.lang.Object[])
	 */
	@Override
	public Map<String, Object> getBulk(Object[] keys) {
		HashMap<String, Object> values = new HashMap<String, Object>();
		for(Object key : keys){
			Object value = get(key);
			if(value != null)values.put(key.toString(), value);
		}
		return values;
	}

	/**
	 * @see com.navigation.cache.CacheRegion#incr(java.lang.Object, int, int[])
	 */
	@Override
	public long incr(Object key, int by, int... startingValue) {
		incrLock.lock();
		long v ;
		try{
			Object i = get(key);
			if(i != null && i instanceof Number){
				v = (Long)i + by;
			}else{
				v = startingValue.length == 0 ? -1 : startingValue[0];
			}
			if(v >= 0)set(key,v);
		}finally{
			incrLock.unlock();
		}
		return v;
	}

	/**
	 * @see com.navigation.cache.CacheRegion#replace(java.lang.Object, java.lang.Object, int)
	 */
	@Override
	public Future<Boolean> replace(Object key, Object o, int cacheTimeSeconds) {
		return add(key,o,cacheTimeSeconds);
	}

	/**
	 * @see com.navigation.cache.CacheRegion#set(java.lang.Object, java.lang.Object, int[])
	 */
	@Override
	public Future<Boolean> set(Object key, Object o, int... cacheTimeSeconds) {
		Element element =
		cacheTimeSeconds.length == 0 ? new Element(key,o)
			:new Element(key, o, false, cacheTimeSeconds[0]/2, cacheTimeSeconds[0]);
		cache.putQuiet(element);
		return new FutureAdapter<Boolean>(true);
	}
	
	/**
	 * @see com.navigation.cache.CacheRegion#getRegionName()
	 */
	public String getRegionName() {
		return regionName;
	}

	/**
	 * @see com.navigation.cache.CacheRegion#setRegionName(java.lang.String)
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	/**
	 * Gets the cache.
	 * 
	 * @return the cache
	 */
	public net.sf.ehcache.Cache getCache() {
		return cache;
	}

	/**
	 * Sets the cache.
	 * 
	 * @param cache the new cache
	 */
	public void setCache(net.sf.ehcache.Cache cache) {
		this.cache = cache;
	}
}
