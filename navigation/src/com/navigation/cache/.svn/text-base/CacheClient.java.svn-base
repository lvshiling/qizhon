/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.net.SocketAddress;
import java.util.Collection;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;


/**
 * The Interface CacheClient.
 * 
 * @author guohouqiang
 * @version 1.0, Oct 15, 2008
 */
public interface CacheClient {

	/**
	 * Add an object to the cache (using the default transcoder) iff it does not exist already. 
	 The exp value is passed along to memcached exactly as given, 
	 and will be processed per the memcached protocol specification: 
	 
	 The actual value sent may either be Unix time (number of seconds since January 1, 1970, as a 32-bit value), 
	 or a number of seconds starting from current time. In the latter case, 
	 this number of seconds may not exceed 60*60*24*30 (number of seconds in 30 days);
	 if the number sent by a client is larger than that, 
	 the server will consider it to be real Unix time value rather than an offset from current time. 
	 
	 * @param key - the key under which this object should be added.
	 * @param cacheTimeSeconds - the expiration of this object
	 * @param o - the object to store 
	 * @return a future representing the processing of this operation
	 */
	Future<Boolean> add(String key, int cacheTimeSeconds, Object o);

	/**
	 * Get with a single key and decode using the default transcoder. 
	 * @param key - the key to get 
	 * @return the result from the cache (null if there is none)
	 */
	Object get(String key);

	/**
	 * Get the values for multiple keys from the cache.
	 * @param keys - the keys 
	 * @return a map of the values (for each value that exists) 
	 */
	Map<String, Object> getBulk(Collection<String> keys);

	/**
	 * Get the values for multiple keys from the cache.
	 * @param keys - the keys 
	 * @return a map of the values (for each value that exists) 
	 */
	Map<String, Object> getBulk(String[] keys);

	/**
	 * Get the given key asynchronously and decode with the default transcoder. 
	 * eg:
	 * Future<Object> f=c.asyncGet("someKey");
	 * try {
	 * myObj=f.get(5, TimeUnit.SECONDS);
	 * } catch(TimeoutException e) {
	 * // Since we don't need this, go ahead and cancel the operation.  This
	 * // is not strictly necessary, but it'll save some work on the server.
	 * f.cancel(false);
	 * // Do other timeout related stuff
	 * }
	 * 
	 * @param key - the key
	 * @return a future that will hold the return value of the fetch
	 */
	Future<Object> asyncGet(String key);

	/**
	 * Asynchronously get a bunch of objects from the cache and decode them with the given transcoder. 
	 * @param keys
	 * @return
	 */
	Future<Map<String, Object>> asyncGetBulk(
			Collection<String> keys);

	/**
	 * Asynchronously get a bunch of objects from the cache and decode them with the given transcoder. 
	 * @param keys
	 * @return
	 */
	Future<Map<String, Object>> asyncGetBulk(String[] keys);

	/**
	 *  Set an object in the cache (using the default transcoder) regardless of any existing value. 
	 The exp value is passed along to memcached exactly as given, 
	 and will be processed per the memcached protocol specification: 
	 
	 The actual value sent may either be Unix time (number of seconds since January 1, 1970, as a 32-bit value), 
	 or a number of seconds starting from current time. In the latter case, 
	 this number of seconds may not exceed 60*60*24*30 (number of seconds in 30 days);
	 if the number sent by a client is larger than that, 
	 the server will consider it to be real Unix time value rather than an offset from current time. 
	 
	 * @param key - the key under which this object should be added.
	 * @param cacheTimeSeconds - the expiration of this object
	 * @param o - the object to store 
	 * @return a future representing the processing of this operation
	 */
	Future<Boolean> set(String key, int cacheTimeSeconds,
			Object o);

	/**
	 * Replace an object with the given value (transcoded with the default transcoder) 
	 * iff there is already a value for the given key. 
	 The exp value is passed along to memcached exactly as given, 
	 and will be processed per the memcached protocol specification: 
	 
	 The actual value sent may either be Unix time (number of seconds since January 1, 1970, as a 32-bit value), 
	 or a number of seconds starting from current time. In the latter case, 
	 this number of seconds may not exceed 60*60*24*30 (number of seconds in 30 days);
	 if the number sent by a client is larger than that, 
	 the server will consider it to be real Unix time value rather than an offset from current time. 
	 
	 * @param key - the key under which this object should be added.
	 * @param cacheTimeSeconds - the expiration of this object
	 * @param o - the object to store 
	 * @return a future representing the processing of this operation
	 */
	Future<java.lang.Boolean> replace(String key,
			int cacheTimeSeconds, Object o);

	/**
	 * Increment the given key by the given amount.
	 * @param key  - the key
	 * @param by   -the amount to increment 
	 * @return -the new value (-1 if the key doesn't exist)
	 */
	long incr(java.lang.String key, int by);

	/**
	 * Increment the given counter, returning the new value.
	 * @param key  - the key
	 * @param by   -the amount to increment 
	 * @param startingValue -the default value (if the counter does not exist) 
	 * @return -the new value, or -1 if we were unable to increment or add 
	 */
	long incr(String key, int by, int startingValue);

	/**
	 * Decrement the given key by the given value. 
	 * @param key - the key
	 * @param by - the amount to decrement
	 * @return the new value (-1 if the key doesn't exist)
	 */
	long decr(String key, int by);

	/**
	 * Decrement the given counter, returning the new value.
	 * @param key - the key
	 * @param by - the amount to decrement
	 * @param def - the default value (if the counter does not exist) 
	 * @return the new value, or -1 if we were unable to decrement or add 
	 */
	long decr(String key, int by, long def);

	/**
	 * Shortcut to delete that doesn't put a hold on the key.
	 * @param key
	 * @return
	 */
	Future<Boolean> delete(String key);

	/**
	 * Flush all caches from all servers with a delay of application. 
	 * @param delay
	 * @return
	 */
	Future<Boolean> flush(int delay);

	/**
	 * Flush all caches from all servers immediately.
	 * @return
	 */
	Future<Boolean> flush();

	/**
	 * Shut down immediately. 
	 */
	void shutdown();

	/**
	 * Shut down this client gracefully. 
	 * @param timeout
	 * @param unit
	 * @return
	 */
	boolean shutdown(long timeout, TimeUnit unit);

	/**
	 * Get the addresses of available servers. 
	 * @return
	 */
	Collection<SocketAddress> getAvailableServers();

	/**
	 * Get the addresses of unavailable servers. 
	 * @return
	 */
	Collection<SocketAddress> getUnavailableServers();

	/**
	 * Get all of the stats from all of the connections. 
	 * @return
	 */
	Map<SocketAddress, Map<String, String>> getStats();

	/**
	 * Get the versions of all of the connected memcacheds. 
	 * @return
	 */
	Map<SocketAddress, String> getVersions();

}