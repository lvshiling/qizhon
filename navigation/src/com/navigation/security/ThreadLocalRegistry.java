/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * ThreadLocal注册表
 *
 * @author Derek
 * @version 1.0, 2010-04-16
 */
public class ThreadLocalRegistry {
	
	/** The Constant log. */
	private static final Logger log = LoggerFactory.getLogger(ThreadLocalRegistry.class);
	
	/** The thread local set. */
	private static ThreadLocal<Set<ThreadLocal<?>>> threadLocalSet = new ThreadLocal<Set<ThreadLocal<?>>>();
	
	/**
	 * 注册ThreadLocal.
	 * 
	 * @param threadLocal the thread local
	 */
	public static void registerThreadLocal(ThreadLocal<?> threadLocal){
		log.debug("Register ThreadLocal {}",threadLocal.toString());
		Set<ThreadLocal<?>> tset = threadLocalSet.get();
		if(tset == null){
			tset = new HashSet<ThreadLocal<?>>();
			threadLocalSet.set(tset);
		}
		tset.add(threadLocal);
	}
	
	/**
	 * 重置注册表里的所有ThreadLocal.
	 */
	public static void resetThreadLocals(){
		log.debug("Reset ThreadLocal .");
		Set<ThreadLocal<?>> tset = threadLocalSet.get();
		if(tset == null)return;
		for(ThreadLocal<?> t : tset){
			t.remove();
		}
	}
	
	/**
	 * 获取注册表里的ThreadLocal快照.
	 * 
	 * @return the thread local<?>[]
	 */
	public static ThreadLocal<?>[] snapshot() {
	    Set<ThreadLocal<?>> tset = threadLocalSet.get();
		return tset.toArray(new ThreadLocal<?>[tset.size()]);
    }
}
