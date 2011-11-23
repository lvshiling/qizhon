/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

/**
 * The Class CacheException.
 * 
 * @author guohouqiang
 * @version 1.0, 2008-10-15
 */
public class CacheException extends Exception {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Instantiates a new cache exception.
	 * 
	 * @param message the message
	 */
	public CacheException(String message){
		super(message);
	}

	/**
	 * Instantiates a new cache exception.
	 */
	public CacheException() {
		super();
	}

	/**
	 * Instantiates a new cache exception.
	 * 
	 * @param message the message
	 * @param cause the cause
	 */
	public CacheException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * Instantiates a new cache exception.
	 * 
	 * @param cause the cause
	 */
	public CacheException(Throwable cause) {
		super(cause);
	}
}
