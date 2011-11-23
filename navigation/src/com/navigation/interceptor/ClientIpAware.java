/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) com.ztgame.interceptor.ClientIpAware.java 1.0, 2008-11-30
 */
package com.navigation.interceptor;

/**
 * 所有要获得当前请求用户的客户端IP地址，必须实现此接口。
 * 
 * @author  Fuchun
 * @version 1.0, 2008-11-30
 */
public interface ClientIpAware {

    /**
     * 为实现此接口的类设置当前请求的客户端真实IP。
     * 
     * @param ip 要设置的 客户端IP地址。
     */
    public void setClientIp(String ip);
}
