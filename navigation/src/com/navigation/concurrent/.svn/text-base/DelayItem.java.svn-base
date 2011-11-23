/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.concurrent;

import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

/**
 * 延迟对象,用于DelayQueue队列.
 * 
 * @param <T> the generic type
 * @author Derek
 * @version 1.0 2010-5-27
 */
public class DelayItem<T> implements Delayed {
	
	/** The item. */
	private final T item;
	
	/** The time. */
	private final long time;
	
	/** The time unit. */
	private final TimeUnit timeUnit = TimeUnit.MILLISECONDS;
	
	/**
	 * Instantiates a new delay item.
	 * 
	 * @param item the item
	 * @param timeout the timeout MILLISECONDS
	 */
	public DelayItem(T item,long timeout){
		this.item = item;
		this.time = System.currentTimeMillis()+timeout;
	}
	
	/**
	 * @see java.util.concurrent.Delayed#getDelay(java.util.concurrent.TimeUnit)
	 */
	public long getDelay(TimeUnit unit) {
		return unit.convert(time - System.currentTimeMillis(), timeUnit);
	}

	/**
	 * Gets the item.
	 * 
	 * @return the item
	 */
	public T getItem(){
		return item;
	}
	
	/**
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Delayed other) {
		if (other == this)
            return 0;
        if (other instanceof DelayItem) {
            DelayItem x = (DelayItem) other;
            long diff = time - x.time;
            if (diff < 0)
                return -1;
            else if (diff > 0)
                return 1;
        }
        return 0;
	}

	public boolean equals(Object obj) {
		if(obj instanceof DelayItem){
			return this.getItem().equals(((DelayItem)obj).getItem());
		}
		return super.equals(obj);
	}

}
