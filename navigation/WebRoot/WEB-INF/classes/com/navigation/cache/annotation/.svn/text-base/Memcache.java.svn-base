/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.cache.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.navigation.utils.CacheUtil.Region;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Memcache {
	static final int GET = 1;
	static final int DELETE = 2;
	static final int SET = 3;
	static final int GET_SET = 4;
	static final int UID = 1;
	static final int NONE = 0;
	
	/** 缓存分区 */
	Region region() default Region.defaultRegion;
	
	/** 缓存KEY前缀 */
	String key() default "";
	
	/** 缓存时间 */
	int time() default 600;
	
	/** 缓存操作 */
	CacheOp op() default CacheOp.GET_SET;
	
	/** 参数复合KEY后缀(参数位) */
	int[] keyPos() default {};
	
	/** 缓存KEY后缀 */
	int keyPostfix() default NONE;
	
	/** 是否使用本地缓存 */
	boolean localCache() default false;
}
