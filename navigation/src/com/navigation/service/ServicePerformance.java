/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.service;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author Derek
 * @version 1.0 ,Feb 4, 2009
 */
public class ServicePerformance {
	
	private static final HashMap<String, ServiceStatistics> serviceStatistics = new HashMap<String, ServiceStatistics>();

	private static Date startTime = new Date();

	private static boolean statisticsEnabled = false;

	private static ReentrantLock flushLock = new ReentrantLock();

	public static void clear() {
		if (flushLock.tryLock()) {
			try{
				serviceStatistics.clear();
			}finally{
				flushLock.unlock();
			}
		}
	}

	public static void setServiceStatistics(String serviceName, long time) {
		if (flushLock.isLocked())
			return;
		ServiceStatistics ss = getServiceStatistics(serviceName);
		ss.setExecutionTime(time);
	}

	private static ServiceStatistics getServiceStatistics(String serviceName) {
		ServiceStatistics ss = serviceStatistics.get(serviceName);
		if (ss == null) {
			ss = new ServiceStatistics(serviceName);
			serviceStatistics.put(serviceName, ss);
		}
		return ss;
	}

	public static Map<String, ServiceStatistics> getStatisticsMap() {
		return Collections.unmodifiableMap(serviceStatistics);
	}

	/**
	 * 获取 statisticsEnabled
	 * 
	 * @return the statisticsEnabled
	 */
	public static boolean isStatisticsEnabled() {
		return statisticsEnabled;
	}

	/**
	 * @param statisticsEnabled
	 *            the statisticsEnabled to set
	 */
	public static void setStatisticsEnabled(boolean enabled) {
		statisticsEnabled = enabled;
		if (enabled) {
			startTime = new Date();
		} else {
			startTime = null;
		}
	}

	public static String getInfo() {
		return new StringBuilder().append("Service Statistics [").append(
				startTime == null ? "disabled" : "StartTime:" + startTime)
				.append("]\n").append("[The number of service:").append(
						serviceStatistics.size()).append("]").toString();
	}
}
