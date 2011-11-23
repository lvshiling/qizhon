/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;


/**
 * 
 * @param <T>
 *
 * @author Derek
 * @version 1.0, 2010-04-19
 */
public class FutureAdapter<T> implements Future<T>{
	
	/** The clazz. */
	T clazz;
	Future<T>[] futures;
	int maxAsyncMilliseconds;
	
	public FutureAdapter(T c){
		clazz = c;
	}

	public FutureAdapter(Future<T>[] futures, int maxAsyncMilliseconds){
		this.futures = futures;
		this.maxAsyncMilliseconds = maxAsyncMilliseconds;
	}
	
	/**
	 * @see java.util.concurrent.Future#cancel(boolean)
	 */
	public boolean cancel(boolean mayInterruptIfRunning) {
		if(futures == null) return true;
		for(int i = 0; i<futures.length ; i++ ){
			Future<T> f = futures[i];
			f.cancel(mayInterruptIfRunning);
		}
		return true;
	}

	/**
	 * @see java.util.concurrent.Future#get()
	 */
	public T get() throws InterruptedException, ExecutionException {
		if(futures == null)return clazz;
		for(int i = 0; i<futures.length ; i++ ){
			Future<T> f = futures[i];
			try {
				if(!isLastFuture(i)){
					return f.get(maxAsyncMilliseconds, TimeUnit.MILLISECONDS);
				}else{
					return f.get();
				}
			} catch (TimeoutException e) {
				if(isLastFuture(i)){
					return null;
				}
			}
		}
		return null;
	}
	
	/**
	 * @see java.util.concurrent.Future#get(long, java.util.concurrent.TimeUnit)
	 */
	public T get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
		if(futures == null)return clazz;
		for(int i = 0; i<futures.length ; i++ ){
			Future<T> f = futures[i];
			try {
				return f.get(timeout, unit);
			} catch (TimeoutException e) {
				if(isLastFuture(i)){
					return null;
				}
			}
		}
		return null;
	}


	private boolean isLastFuture(int index){
		if(futures == null){
			throw new IllegalArgumentException("Future<T>[] is null");
		}
		if(index == futures.length - 1) return true;
		else return false;
	}
	
	/**
	 * @see java.util.concurrent.Future#isCancelled()
	 */
	public boolean isCancelled() {
		if(futures == null) return true;
		for(Future<T> f : futures){
			return f.isCancelled();
		}
		return true;
	}

	/**
	 * @see java.util.concurrent.Future#isDone()
	 */
	public boolean isDone() {
		if(futures == null) return true;
		for(Future<T> f : futures){
			return f.isCancelled();
		}
		return true;
	}
}
