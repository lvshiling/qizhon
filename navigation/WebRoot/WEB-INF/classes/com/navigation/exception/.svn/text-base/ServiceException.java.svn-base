/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.exception.AjaxJsonException.java 1.0, 2008-12-11
 */
package com.navigation.exception;

/**
 * WANGHUI
 * 得票使用的 RuntimeException 异常
 */
public class ServiceException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ServiceException() {
        super();
    }
    
    public ServiceException(Throwable throwable) {
        super(throwable);
    }
    
    public ServiceException(String errorCode,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode));
    }
    
    public ServiceException(String errorCode,Throwable throwable,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode),throwable);
    } 
}
