/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

/**
 * 自动重置的ThreadLocal
 * 
 * 项目中要使用ThreadLocal处，可使用本类， 自动在请求线程工作结束时清理变量
 * @param <T>
 *
 * @author Derek
 * @version 1.0, 2010-04-16
 */
public class AutoResetThreadLocal<T> extends ThreadLocal<T> {

	/**
	 * @see java.lang.ThreadLocal#initialValue()
	 */
	@Override
	protected T initialValue() {
		ThreadLocalRegistry.registerThreadLocal(this);
		return super.initialValue();
	}

}
