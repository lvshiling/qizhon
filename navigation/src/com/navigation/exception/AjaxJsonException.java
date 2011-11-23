/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.exception.AjaxJsonException.java 1.0, 2008-12-11
 */
package com.navigation.exception;

/**
 * 当一个用户请求属于Ajax请求，并且该请求将返回JSON格式数据，若发生错误，则抛出该异常。
 * 
 * @author  Fuchun
 * @version 1.0, 2008-12-11
 */
public class AjaxJsonException extends AbstractException {

    private static final long serialVersionUID = 1L;

    public AjaxJsonException() {
        super();
    }
    
    public AjaxJsonException(Throwable throwable) {
        super(throwable);
    }
    
    public AjaxJsonException(String errorCode,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode));
    }
    
    public AjaxJsonException(String errorCode,Throwable throwable,Object... values) {
        super(ExceptionMessage.getMessage(errorCode, values, errorCode),throwable);
    } 
}
