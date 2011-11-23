/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.util.HashMap;
import java.util.Map;

import com.navigation.security.AutoResetThreadLocal;

/**
 * 线程缓存 
 *
 * @author Derek
 * @version 1.0, 2010-04-16
 */
public class ThreadLocalCache {
	
	/** The Constant cache. */
	private static final ThreadLocal<Map<String, Object>> cache = new AutoResetThreadLocal<Map<String, Object>>();
	
	/**
	 * 设置缓存.
	 * 
	 * @param key the key
	 * @param value the value
	 */
	public static void put(String key,Object value){
		Map<String, Object> cacheMap = cache.get();
		if(cacheMap == null){
			cacheMap = new HashMap<String, Object>();
			cache.set(cacheMap);
		}
		cacheMap.put(key, value);
	}
	
	/**
	 * 获取缓存.
	 * 
	 * @param key the key
	 * @return the object
	 */
	public static Object get(String key){
		Map<String, Object> cacheMap = cache.get();
		if(cacheMap != null){
			return cacheMap.get(key);
		}else{
			return null;
		}
	}
	
	/**
	 * 删除缓存.
	 * 
	 * @param key the key
	 */
	public static void delete(String key){
		Map<String, Object> cacheMap = cache.get();
		if(cacheMap != null){
			cacheMap.remove(key);
		}
	}
}
