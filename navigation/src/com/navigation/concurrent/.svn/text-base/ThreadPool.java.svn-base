/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.concurrent;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ThreadPoolExecutor.AbortPolicy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ThreadPool  {
	/** The pool name. */
	private String poolName = "default";

	/** The core pool size. */
	private int corePoolSize = 1;

	/** The maximum pool size. */
	private int maximumPoolSize = 10;

	/** The keep alive time. */
	private long keepAliveTime = 200;

	/** The unit. */
	private TimeUnit unit = TimeUnit.SECONDS;

	/** The work queue. */
	private BlockingQueue<Runnable> workQueue = new LinkedBlockingQueue<Runnable>();

	/** The thread factory. */
	private ThreadFactory threadFactory = Executors.defaultThreadFactory();

	/** The handler. */
	private RejectedExecutionHandler handler = new AbortPolicy();

	/** The executor service. */
	private ExecutorService executorService = null;
	
	private static final Logger log = LoggerFactory.getLogger(ThreadPool.class);

	public void init(){
		executorService = new ThreadPoolExecutor(
				corePoolSize,
				maximumPoolSize, 
				keepAliveTime, 
				unit, 
				workQueue,
				threadFactory, 
				handler);
		log.warn("Thread pool {} is init!",poolName);
	}

	public ExecutorService getExecutorService(){
		if(executorService == null){
			init();
		}
		return executorService;
	}
	
	public void shutdown(){
		if(executorService != null){
			executorService.shutdown();
			log.warn("Thread pool {} is shutdown!",poolName);
		}
	}

	public String getPoolName() {
		return poolName;
	}

	public void setPoolName(String poolName) {
		this.poolName = poolName;
	}

	public int getCorePoolSize() {
		return corePoolSize;
	}

	public void setCorePoolSize(int corePoolSize) {
		this.corePoolSize = corePoolSize;
	}

	public int getMaximumPoolSize() {
		return maximumPoolSize;
	}

	public void setMaximumPoolSize(int maximumPoolSize) {
		this.maximumPoolSize = maximumPoolSize;
	}

	public long getKeepAliveTime() {
		return keepAliveTime;
	}

	public void setKeepAliveTime(long keepAliveTime) {
		this.keepAliveTime = keepAliveTime;
	}

	public BlockingQueue<Runnable> getWorkQueue() {
		return workQueue;
	}

	public void setWorkQueue(BlockingQueue<Runnable> workQueue) {
		this.workQueue = workQueue;
	}

	public RejectedExecutionHandler getHandler() {
		return handler;
	}

	public void setHandler(RejectedExecutionHandler handler) {
		this.handler = handler;
	}

	public void setExecutorService(ExecutorService executorService) {
		this.executorService = executorService;
	}
	
}
