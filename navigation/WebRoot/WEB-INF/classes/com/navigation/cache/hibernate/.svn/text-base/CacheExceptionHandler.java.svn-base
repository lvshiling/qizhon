/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.cache.hibernate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.googlecode.hibernate.memcached.MemcacheExceptionHandler;

/**
 * 
 *
 * @author Derek
 * @version 1.0, 2010-04-16
 */
public class CacheExceptionHandler implements MemcacheExceptionHandler {
	private static final Logger log = LoggerFactory.getLogger(CacheExceptionHandler.class);
	
	public void handleErrorOnDelete(String key, Exception e) {
		log.warn("ErrorOnDelete {} [{}]",e.getMessage(),key);
	}

	public void handleErrorOnGet(String key, Exception e) {
		log.warn("ErrorOnGet {} [{}]",e.getMessage(),key);
	}

	public void handleErrorOnIncr(String key, int arg1, int arg2,
			Exception e) {
		log.warn("ErrorOnIncr {} [{}]",e.getMessage(),key);
	}

	public void handleErrorOnSet(String key, int arg1, Object arg2,
			Exception e) {
		log.warn("ErrorOnSet {} [{}]",e.getMessage(),key);
	}

}
