/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.utils;

import com.navigation.cache.Cache;
import com.navigation.cache.CacheCallback;
import com.navigation.cache.CacheService;


/**
 * The Class CacheUtil.
 * 
 * @author Derek
 * @version 1.0, Apr 19, 2010
 */
public class CacheUtil {
	
	public static enum Region{queryRegion,clusterRegion,localRegion,defaultRegion};
	
	/** The cache service. */
	private static CacheService cacheService;

	/**
	 * Gets the local region.
	 * 
	 * @return the local region
	 */
	public static Cache getLocalRegion(){
		return getCacheRegion(Region.localRegion);
	}
	
	/**
	 * Gets the query region.
	 * 
	 * @return the query region
	 */
	public static Cache getQueryRegion(){
		return getCacheRegion(Region.queryRegion);
	}
	
	/**
	 * Gets the cluster region.
	 * 
	 * @return the cluster region
	 */
	public static Cache getClusterRegion(){
		return getCacheRegion(Region.clusterRegion);
	}
	
	/**
	 * Gets the cache region.
	 * 
	 * @param regionName the region name
	 * @return the cache region
	 */
	public static Cache getCacheRegion(Region region) {
		if(region == null)return getCacheRegion();
		return cacheService.getCacheRegion(region.name());
	}

	/**
	 * Gets the cache region.
	 * 
	 * @return the cache region
	 */
	public static Cache getCacheRegion() {
		return cacheService.getCacheRegion();
	}
	
	/**
	 * Do in cache.
	 * 
	 * @param key the key
	 * @param time the time
	 * @param region the region
	 * @param c the c
	 * @param callback the callback
	 * @return the t
	 */
	@SuppressWarnings("unchecked")
	public static <T> T doInCache(String key, int time, Region region, Class<T> c, CacheCallback callback) {
		Cache cache = getCacheRegion(region);
		Object value = cache.get(key);
		if (!c.isInstance(value)) {
			value = callback.doIfCacheMiss();
			if (c.isInstance(value)) {
				cache.set(key, value, time);
			}
		} else {
			value = callback.doIfCacheHit(value);
		}
		if (c.isInstance(value)) {
			return (T) value;
		} else
			return null;
	}

	/**
	 * Gets the cache service.
	 * 
	 * @return the cache service
	 */
	public static CacheService getCacheService() {
		return CacheUtil.cacheService;
	}

	/**
	 * Sets the che service.
	 * 
	 * @param cacheService the new che service
	 */
	public void setCacheService(CacheService cacheService) {
		CacheUtil.cacheService = cacheService;
	}

}
