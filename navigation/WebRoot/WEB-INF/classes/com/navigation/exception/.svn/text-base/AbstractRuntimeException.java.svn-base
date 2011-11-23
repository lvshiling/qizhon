/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.exception;

/**
 * The Class AbstractRuntimeException.
 * 
 * @author derek
 * @version 1.0 2010-5-9
 */
public abstract class AbstractRuntimeException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public AbstractRuntimeException() {
		super();
	}
	
	public AbstractRuntimeException(Throwable throwable) {
		super(throwable);
	}
	
	public AbstractRuntimeException(String errorCode,Object... values) {
		super(ExceptionMessage.getMessage(errorCode, values, errorCode));
	}
	
	public AbstractRuntimeException(String errorCode,Throwable throwable,Object... values) {
		super(ExceptionMessage.getMessage(errorCode, values, errorCode),throwable);
	} 
}
