/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) SpyMemcacheClient.java 1.0 2008-10-15
 */
package com.navigation.cache.impl;

import java.net.SocketAddress;
import java.util.Collection;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import net.spy.memcached.MemcachedClient;
import net.spy.memcached.OperationTimeoutException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.cache.CacheClient;
import com.navigation.cache.FutureAdapter;


/**
 * The Class SpyMemcacheClientImpl.
 * 
 * @author derek
 * @version 1.0 , 2008-10-15
 */
public class SpyMemcacheClientImpl implements CacheClient {
    
    /** The Constant log. */
    private static final Logger log = LoggerFactory.getLogger(SpyMemcacheClientImpl.class);
    
    /** The memcached client. */
    private final MemcachedClient memcachedClient;

    /**
	 * Instantiates a new spy memcache client impl.
	 * 
	 * @param memcachedClient the memcached client
	 */
    public SpyMemcacheClientImpl(MemcachedClient memcachedClient) {
        this.memcachedClient = memcachedClient;
    }
    
	/**
	 * @see com.navigation.cache.ztgame.cache.CacheClient#add(java.lang.String, int, java.lang.Object)
	 */
	public Future<Boolean> add(String key, int cacheTimeSeconds, Object o) {
		try{
			return memcachedClient.add(key, cacheTimeSeconds, o);
		}catch (OperationTimeoutException e){
			log.error("Cache 'add' timed out for key [" + key + "]");
		}

		return new FutureAdapter<Boolean>(false);
	}
    
    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#get(java.lang.String)
     */
    public Object get(String key) {
        try {
            return memcachedClient.get(key);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'get' timed out for key [" + key + "]");
        }
        return null;
    }
    
    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getBulk(java.util.Collection)
     */
    public Map<String, Object> getBulk(Collection<String> keys){
    	try {
            return memcachedClient.getBulk(keys);
    	} catch (OperationTimeoutException e) {
            log.error("Cache 'getBulk' timed out for key [" + keys + "]");
        }
        return null;   
    }
    
    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getBulk(java.lang.String[])
     */
    public Map<String, Object> getBulk(String[] keys){
    	try {
            return memcachedClient.getBulk(keys);
    	} catch (OperationTimeoutException e) {
            log.error("Cache 'getBulk' timed out for key [" + keys + "]");
        }
        return null;   
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#asyncGet(java.lang.String)
     */
    public Future<Object> asyncGet(String key) {
        try {
            return memcachedClient.asyncGet(key);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'asyncGet' timed out for key [" + key + "]");
        }
        return new FutureAdapter<Object>(null);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#asyncGetBulk(java.util.Collection)
     */
    public Future<Map<String,Object>> asyncGetBulk(Collection<String> keys) {
        try {
            return memcachedClient.asyncGetBulk(keys);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'asyncGetBulk' timed out for key [" + keys + "]");
        }
        return new FutureAdapter<Map<String,Object>>(null);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#asyncGetBulk(java.lang.String[])
     */
    public Future<Map<String,Object>> asyncGetBulk(String[] keys) {
        try {
            return memcachedClient.asyncGetBulk(keys);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'asyncGetBulk' timed out for key [" + keys + "]");
        }
        return new FutureAdapter<Map<String,Object>>(null);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#set(java.lang.String, int, java.lang.Object)
     */
    public Future<Boolean> set(String key, int cacheTimeSeconds, Object o) {
        try {
        	return memcachedClient.set(key, cacheTimeSeconds, o);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'set' timed out for key [" + key + "]");
        }
        return new FutureAdapter<Boolean>(false);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#replace(java.lang.String, int, java.lang.Object)
     */
    public Future<Boolean> replace(String key,int cacheTimeSeconds,Object o){
        try {
        	return memcachedClient.set(key, cacheTimeSeconds, o);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'replace' timed out for key [" + key + "]");
        }
        return new FutureAdapter<Boolean>(false);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#incr(java.lang.String, int)
     */
    public long incr(java.lang.String key, int by) {
        try {
            return memcachedClient.incr(key, by);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'incr' timed out for key [" + key + "]");
        }
        return -1;
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#incr(java.lang.String, int, int)
     */
    public long incr(String key, int factor, int startingValue) {
        try {
            return memcachedClient.incr(key, factor, startingValue);
        } catch (OperationTimeoutException e) {
            log.error("Cache 'incr' timed out for key [" + key + "]");
        }
        return -1;
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#decr(java.lang.String, int)
     */
    public long decr(String key, int by){
    	try {
    		return memcachedClient.decr(key, by);
    	} catch (OperationTimeoutException e) {
            log.error("Cache count 'decr' timed out for key [" + key + "]");
        }
    	return -1;
    }
 
    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#decr(java.lang.String, int, long)
     */
    public long decr(String key, int by, long def){
    	try {
    		return memcachedClient.decr(key, by, def);
    	} catch (OperationTimeoutException e) {
            log.error("Cache count 'decr' timed out for key [" + key + "]");
        }
    	return -1;
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#delete(java.lang.String)
     */
    public Future<Boolean> delete(String key){
        return memcachedClient.delete(key);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#flush(int)
     */
    public Future<Boolean> flush(int delay){
        log.debug("MemcachedClient.flush({})",delay);
        return memcachedClient.flush(delay);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#flush()
     */
    public Future<Boolean> flush(){
        log.debug("MemcachedClient.flush({})");
        return memcachedClient.flush();
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#shutdown()
     */
    public void shutdown() {
        log.debug("Shutting down spy MemcachedClient");
        memcachedClient.shutdown();
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#shutdown(long, java.util.concurrent.TimeUnit)
     */
    public boolean shutdown(long timeout,TimeUnit unit){
    	log.debug("Shutting down spy MemcachedClient");
        return memcachedClient.shutdown(timeout,unit);
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getAvailableServers()
     */
    public Collection<SocketAddress> getAvailableServers(){
    	return memcachedClient.getAvailableServers();
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getUnavailableServers()
     */
    public Collection<SocketAddress> getUnavailableServers(){
    	return memcachedClient.getUnavailableServers();
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getStats()
     */
    public Map<SocketAddress,Map<String,String>> getStats(){
    	return memcachedClient.getStats();
    }

    /**
     * @see com.navigation.cache.ztgame.cache.CacheClient#getVersions()
     */
    public Map<SocketAddress,String> getVersions(){
    	return memcachedClient.getVersions();
    }
}