/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.util.Map;
import java.util.concurrent.Future;

/**
 * cached缓存操作接口.
 * 
 * @author Derek
 * @version 1.0, Apr 19, 2010
 */
public interface Cache {

	/**
	 * 异步添加一个对象到缓存(如果该对象在缓存中不存在).
	 * 
	 * <pre>
	 * 过期时间cacheTimeSeconds的说明：
	 *    以秒为单位，如果该值小于60*60*24*30(即30天)，
	 *    表明该过期时间是从当前时间开始计算的时间长度；
	 *    如果大于30天，则服务器认为它是一个UNIX TIME(
	 *    number of seconds since January 1, 1970, as a 32-bit value
	 *    )，而不是时间长度；
	 * </pre>
	 * 
	 * @param key - 存储时使用的KEY
	 * @param o - 要存储的对象
	 * @param cacheTimeSeconds - 过期时间
	 * @return 异步返回存储是否成功 <code>future< boolean>[]</code>
	 */
	Future<Boolean> add(Object key, Object o, int... cacheTimeSeconds);

	/**
	 * 单KEY获得缓存对象.
	 * 
	 * @param key 存储时使用的KEY
	 * @return 存储的对象 (null if there is none)
	 */
	Object get(Object key);

	/**
	 * 多KEY获得多个缓存对象
	 * 
	 * @param keys - 存储时使用的KEYS
	 * @return 存储的对象 (for each value that exists)
	 */
	Map<String, Object> getBulk(Object[] keys);

	/**
	 * 单KEY异步获取缓存对象
	 * 
	 * <pre>
	 *  eg: Future<Object> f=c.asyncGet("someKey"); 
	 *  try{
	 *    myObj=f.get(5, TimeUnit.SECONDS); 
	 *  }catch(TimeoutException e) {
	 *    f.cancel(false); 
	 *  }
	 * </pre>
	 * 
	 * @param key 存储时使用的KEY
	 * @return a future that will hold the return value of the fetch
	 */
	Future<Object> asyncGet(Object key);

	/**
	 * 多KEY异步获取缓存对象
	 * 
	 * @param keys 存储时使用的KEYS
	 * @return the future< map< string, object>>
	 */
	Future<Map<String, Object>> asyncGetBulk(Object[] keys);

	/**
	 * 异步添加一个对象到缓存(无论该对象在缓存中存不存在).
	 * 
	 * <pre>
	 * 过期时间cacheTimeSeconds的说明：
	 *    以秒为单位，如果该值小于60*60*24*30(即30天)，
	 *    表明该过期时间是从当前时间开始计算的时间长度；
	 *    如果大于30天，则服务器认为它是一个UNIX TIME(
	 *    number of seconds since January 1, 1970, as a 32-bit value
	 *    )，而不是时间长度；
	 * </pre>
	 * 
	 * @param key - 存储时使用的KEY
	 * @param cacheTimeSeconds - 过期时间
	 * @param o - 要存储的对象
	 * @return 异步返回存储是否成功 <code>future< boolean>[]</code>
	 */
	Future<Boolean> set(Object key, Object o, int... cacheTimeSeconds);

	/**
	 * 异步替换一个对象到缓存(如果该对象在缓存中存在).
	 * 
	 * <pre>
	 * 过期时间cacheTimeSeconds的说明：
	 *    以秒为单位，如果该值小于60*60*24*30(即30天)，
	 *    表明该过期时间是从当前时间开始计算的时间长度；
	 *    如果大于30天，则服务器认为它是一个UNIX TIME(
	 *    number of seconds since January 1, 1970, as a 32-bit value
	 *    )，而不是时间长度；
	 * </pre>
	 * 
	 * @param key - 存储时使用的KEY
	 * @param cacheTimeSeconds - 过期时间
	 * @param o - 要存储的对象
	 * @return 异步返回存储是否成功 <code>future< boolean>[]</code>
	 */
	Future<Boolean> replace(Object key, Object o, int cacheTimeSeconds);

	/**
	 * 计数器 +加
	 * 
	 * @param key 计数器KEY
	 * @param by 要增加的值
	 * @return 返回增加后的值 (-1 if the key doesn't exist)
	 */
	long incr(Object key, int by, int... startingValue);

	/**
	 * 计数器 -减
	 * 
	 * @param key 计数器KEY
	 * @param by 要减少的值
	 * @return 返回增加后的值 (-1 if the key doesn't exist)
	 */
	long decr(Object key, int by, long... def);

	/**
	 * 删除缓存.
	 * 
	 * @param key 存储时使用的KEY
	 * @return the future< boolean>[]
	 */
	Future<Boolean> delete(Object key);

}
