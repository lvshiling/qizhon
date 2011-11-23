/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.exception;

import org.springframework.context.MessageSource;

import com.navigation.security.SessionUtil;

/**
 * The Class ExceptionMessage.
 * 
 * @author derek
 * @version 1.0 2010-5-9
 */
public class ExceptionMessage {
	
	/** The message source. */
	private static MessageSource messageSource;
	
	/**
	 * Gets the message.
	 * 
	 * @param errorCode the error code
	 * @param values the values
	 * @param defaultMessage the default message
	 * 
	 * @return the message
	 */
	public static String getMessage(String errorCode,Object[] values,String defaultMessage){
		return messageSource.getMessage(errorCode, values, defaultMessage ,SessionUtil.getCurrentUser().getLocale());
	}
	
	/**
	 * Sets the message source.
	 * 
	 * @param messageSource the new message source
	 */
	public void setMessageSource(MessageSource messageSource){
		ExceptionMessage.messageSource = messageSource;
	}
}
