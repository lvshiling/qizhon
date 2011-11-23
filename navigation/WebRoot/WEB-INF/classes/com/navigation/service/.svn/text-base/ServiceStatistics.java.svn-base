/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.service;

import java.util.concurrent.locks.ReentrantLock;

/**
 * Service执行效率统计类
 * 
 * @author Derek
 * @version 1.0 ,Feb 4, 2009
 */
public class ServiceStatistics {
	
	private final String serviceName;

	private long executionCount;

	private long executionAvgTime;

	private long executionMaxTime;

	private long executionMinTime;

	private ReentrantLock updateLock = new ReentrantLock();

	public ServiceStatistics(String serviceName) {
		this.serviceName = serviceName;
	}

	public void setExecutionTime(long time) {
		updateLock.lock();
		try{
			if (time < executionMinTime || executionMinTime == 0L)
				executionMinTime = time;
			if (time > executionMaxTime)
				executionMaxTime = time;
			executionAvgTime = (executionAvgTime * executionCount + time)
					/ (executionCount + 1);
			executionCount++;
		}finally{
			updateLock.unlock();
		}
	}

	/**
	 * 获取 executionAvgTime
	 * 
	 * @return the executionAvgTime
	 */
	public long getExecutionAvgTime() {
		return executionAvgTime;
	}

	/**
	 * 获取 executionCount
	 * 
	 * @return the executionCount
	 */
	public long getExecutionCount() {
		return executionCount;
	}

	/**
	 * 获取 executionMaxTime
	 * 
	 * @return the executionMaxTime
	 */
	public long getExecutionMaxTime() {
		return executionMaxTime;
	}

	/**
	 * 获取 executionMinTime
	 * 
	 * @return the executionMinTime
	 */
	public long getExecutionMinTime() {
		return executionMinTime;
	}

	public String toString() {
		return new StringBuilder().append("ExectionCount=").append(
				this.executionCount).append(" ").append("ExectionAvgTime=")
				.append(this.executionAvgTime).append("ms ").append(
						"ExectionMaxTime=").append(this.executionMaxTime)
				.append("ms ").append("ExectionMinTime=").append(
						this.executionMinTime).append("ms ").toString();
	}

	/**
	 * 获取 serviceName
	 * 
	 * @return the serviceName
	 */
	public String getServiceName() {
		return serviceName;
	}
}
