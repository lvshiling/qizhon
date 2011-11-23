/*
 *  Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *  
 */
package com.navigation.cache.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.cache.CacheRegion;
import com.navigation.cache.CacheService;



/**
 * The Class MemcacheServiceImpl.
 * 
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public class CacheServiceImpl implements CacheService{
	
	/** The log. */
	private final Logger log = LoggerFactory.getLogger(CacheServiceImpl.class);
    
    /** The default cache region. */
    private CacheRegion defaultCacheRegion;
    
    private Map<String,CacheRegion> cacheRegionMap = new HashMap<String, CacheRegion>(3);

	/**
	 * @see com.navigation.cache.snsgoo.cache.CacheService#getCacheRegion(java.lang.String)
	 */
	public CacheRegion getCacheRegion(String regionName) {
		CacheRegion cr = cacheRegionMap.get(regionName);
		cr = (cr == null) ? defaultCacheRegion : cr;
		if(cr == null)
			throw new IllegalStateException("Not found the region by name "+regionName+" and default region not defined!");
		return cr;
	}

	/**
	 * @see com.navigation.cache.snsgoo.cache.CacheService#getCacheRegion()
	 */
	public CacheRegion getCacheRegion() {
		if(defaultCacheRegion == null)
			throw new IllegalStateException("Default region not defined!");
		log.info("Using default region.");
		return defaultCacheRegion;
	}

	public void setCacheRegions(List<CacheRegion> cacheRegions) {
		cacheRegionMap.clear();
		for(CacheRegion region : cacheRegions){
			cacheRegionMap.put(region.getRegionName(), region);
			log.info("Init cache region {}.",region.getRegionName());
		}
	}

	public CacheRegion getDefaultCacheRegion() {
		return defaultCacheRegion;
	}

	public void setDefaultCacheRegion(CacheRegion defaultCacheRegion) {
		this.defaultCacheRegion = defaultCacheRegion;
	}
}
