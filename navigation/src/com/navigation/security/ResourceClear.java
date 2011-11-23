/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

/**
 * 清理资源类
 *
 * @author Derek
 * @version 1.0, 2010-04-16
 */
public class ResourceClear {
	
	/**
	 * Clear.
	 */
	public static void clear(){
		//清理线程变量
		ThreadLocalRegistry.resetThreadLocals();
	}
}
