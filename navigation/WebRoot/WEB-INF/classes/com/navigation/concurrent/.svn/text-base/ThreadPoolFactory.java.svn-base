/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.concurrent;

import java.util.concurrent.DelayQueue;

import com.sun.jmx.remote.internal.ArrayQueue;

public class ThreadPoolFactory {
	
	private static ThreadPool feedThreadPool;
	
	
	public static ThreadPool getFeedThreadPool() {
		return feedThreadPool;
	}

	public void setFeedThreadPool(ThreadPool feedThreadPool) {
		ThreadPoolFactory.feedThreadPool = feedThreadPool;
	}


	public static void main(String[] args){
		ArrayQueue<String> aq = new ArrayQueue<String>(3);
		for(int i =0;i<5;i++){
			aq.add("=="+i);
		}
		System.out.println(aq.size());
		
		DelayQueue<DelayItem<String>> dq = new DelayQueue<DelayItem<String>>();
		DelayItem<String> di = new DelayItem<String>("derek", 3000);
		for(int i =0;i<5;i++){
			dq.add(di);
		}
		
		System.out.println(dq.contains(new DelayItem<String>("derek", 3000)));
//		try {
//			Thread.currentThread().sleep(1000);
//			System.out.println(dq.poll());
//			Thread.currentThread().sleep(1000);
//			System.out.println(dq.poll());
//			Thread.currentThread().sleep(1000);
//			System.out.println(dq.poll());
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
		
		try {
			System.out.println(dq.take().getItem());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(dq.size());
	}
}
