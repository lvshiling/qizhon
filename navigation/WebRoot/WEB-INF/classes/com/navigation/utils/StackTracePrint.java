/*
 * Copyright (C) 2010 The Snsgoo. All rights reserved.
 * 
 */
package com.navigation.utils;

/**
 * The Class StackTracePrint.
 * 
 * @author derek
 * @version 2010-4-5 23:56:04
 * @since 1.0
 */
public class StackTracePrint {
	
	/**
	 * Print.
	 */
	public static void print(){
		StackTraceElement[] els = Thread.currentThread().getStackTrace();
		for(int i = 1 ; i <= els.length ; i++){
			StackTraceElement s = els[i-1];
			System.out.println("#debug_"+i+" "+s.getClassName() +"." +s.getMethodName()+"()" + s.getLineNumber());
		}
	}
}
