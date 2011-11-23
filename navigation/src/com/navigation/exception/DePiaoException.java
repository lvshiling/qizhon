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
public class DePiaoException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public DePiaoException() {
        super();
    }
    
    public DePiaoException(Throwable throwable) {
        super(throwable);
    }
    
    public DePiaoException(String errorCode,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode));
    }
    
    public DePiaoException(String errorCode,Throwable throwable,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode),throwable);
    } 
}
