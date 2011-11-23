/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.concurrent.locks;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.utils.CacheUtil;


/**
 * 基于缓存的锁.利用缓存来控制并发更新的锁机制，但是该锁并非严格的,且效率不高
 * 适用于多线程及多服务器针对特定缓存数据对象的同步更新操作；
 * 
 * @author Derek
 * @version 1.0 2010-5-28
 */
public class NonStrictCacheLock {
	
	/** The Constant LOCK_PREFIX. */
	private static final String LOCK_PREFIX = "CACHE-LOCK:";
	
	/** The Constant lockHoldTime. */
	private static final int lockHoldTime = 5;//seconds,最多只持有锁的时间
	
	/** The Constant maxTryTimes. */
	private static final int maxTryTimes = 5;//锁被占用时，最多重试次数
	
	/** The Constant sleepTime. */
	private static final int sleepTime = 10;//等待重试时间,毫秒
	
	private static final Logger log = LoggerFactory.getLogger(NonStrictCacheLock.class);
	
	/** The key. */
	private String key;
	
	private Lock localLock = new ReentrantLock();
	
	private volatile boolean hasUnlocked = true; //是否已调用解锁
	
	/**
	 * Instantiates a new non strict cache lock.
	 * 
	 * @param key the key
	 */
	public NonStrictCacheLock(String key){
		this.key = key;
	}
	
	/**
	 * Gets the lock key.
	 * 
	 * @return the lock key
	 */
	public String getLockKey(){
		return LOCK_PREFIX + key;
	}
	
	/**
	 * 尝试获取锁，如果获取失败，将返回失败；无等待重试
	 * 
	 * @return
	 */
	public boolean tryLock(){
		checkUnlock();
		try {
			boolean hasLock = CacheUtil.getCacheRegion().add(getLockKey(), true, lockHoldTime).get();
			if(!hasLock){
				hasUnlocked = true;
			}
			return hasLock;
		} catch (Exception e) {
			unlock();//产生异常时释放锁
			return false;
		}
	}
	
	/**
	 * 加锁，如果获取失败，将反复重试至最大锁占用时间，若仍未获取锁，则强制加锁.
	 */
	public void lock(){
		localLock.lock();
		checkUnlock();
		try {
			boolean hasLock = false;
			int totalSleepTime = 0;
			while(!(hasLock = CacheUtil.getCacheRegion().add(getLockKey(), true, lockHoldTime).get())){
				Thread.currentThread().sleep(sleepTime);//休眠sleepTime毫秒再试
				totalSleepTime += sleepTime;
				if(totalSleepTime > lockHoldTime)break;
			}
			if(!hasLock)CacheUtil.getCacheRegion().set(getLockKey(), true, lockHoldTime);//强制加锁
		} catch (Exception e) {
			unlock();//产生异常时释放锁
		}
	}
	
	/**
	 * 检查是否执行解锁.
	 */
	private void checkUnlock(){
		if(!hasUnlocked){
			throw new IllegalStateException("This CacheLock is not release some where! Please check it!");
		}else{
			hasUnlocked = false;
		}
	}
	
	/**
	 * 解锁.
	 */
	public void unlock(){
		localLock.unlock();
		CacheUtil.getCacheRegion().delete(getLockKey());
		hasUnlocked = true;
	}
}
