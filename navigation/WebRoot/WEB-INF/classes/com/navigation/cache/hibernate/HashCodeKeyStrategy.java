/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 * @(#) HashCodeKeyStrategy.java 1.0 Apr 16, 2010
 */
package com.navigation.cache.hibernate;

import java.util.regex.Pattern;

import org.hibernate.cache.CacheKey;

/**
 * Hibernate - Memcached 存储KEY计算类
 * 
 * @author Derek
 * @version 1.0 ,2008-12-11
 */
public class HashCodeKeyStrategy extends com.googlecode.hibernate.memcached.HashCodeKeyStrategy {
	 private int maxKeyLength = DEFAULT_MAX_KEY_LENGTH;
	 private static final Pattern CLEAN_PATTERN = Pattern.compile("\\s");
	 public String toKey(String regionName, long clearIndex, Object key) {
	        if (key == null) {
	            throw new IllegalArgumentException("key must not be null");
	        }
	        
	        String name;
	        if(key instanceof CacheKey){
	        	name = ((CacheKey)key).getEntityOrRoleName();
	        	if (!name.equals(regionName))
				regionName = new StringBuilder(regionName)
					        	.append(":")
					        	.append(name).toString();
	        }
	        
	        String keyString = concatenateKey(regionName, clearIndex, transformKeyObject(key));

	        if (keyString.length() > maxKeyLength) {
	            return truncateKey(keyString);
	        }

	        String finalKey = CLEAN_PATTERN.matcher(keyString).replaceAll("");
	        log.debug("Final cache key: [{}]", finalKey);
	        return finalKey;
	    }
}
