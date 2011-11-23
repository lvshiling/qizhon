/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

/**
 * 缓存命中回调适配
 * 
 * @author guohouqiang
 * @version 1.0 ,Feb 10, 2009
 */
public abstract class CacheHitCallback implements CacheCallback{
	public Object doIfCacheMiss(){
		return null;
	}
}
