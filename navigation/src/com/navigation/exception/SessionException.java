/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.exception;

/**
 * The Class SessionException.
 * 用户会话异常
 * 
 * @author Derek
 * @version 1.0 2010-5-6
 */
public class SessionException extends AbstractException {
	
	private static final long serialVersionUID = 1L;
	
	public SessionException(String errorCode,Object... values) {
		super(errorCode,values);
	}
}
