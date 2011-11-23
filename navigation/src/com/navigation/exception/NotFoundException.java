/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.exception;

/**
 * The Class NotFoundException.
 * 
 * @author derek
 * @version 1.0 2010-5-15
 */
public class NotFoundException extends AbstractException {
	private static final long serialVersionUID = 1L;

	public NotFoundException(String errorCode,Object... values) {
		super(errorCode,values);
	}
}
