/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.exception;


/**
 * The Class AbstractException.
 * 
 * @author derek
 * @version 1.0 2010-5-9
 */
public abstract class AbstractException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public AbstractException() {
		super();
	}
	
	public AbstractException(Throwable throwable) {
		super(throwable);
	}
	
	public AbstractException(String errorCode,Object... values) {
		super(ExceptionMessage.getMessage(errorCode, values, errorCode));
	}
	
	public AbstractException(String errorCode,Throwable throwable,Object... values) {
		super(ExceptionMessage.getMessage(errorCode, values, errorCode),throwable);
	} 
}
