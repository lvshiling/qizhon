/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.interceptor;

import java.lang.reflect.Method;

/**
 * The Interface MethodAdvice.
 * 方法拦截通知，所有业务拦截通知均实现此接口，实现类将被作为链在拦截器中调用
 * 
 * @author guohouqiang
 * @version 1.0, May 11, 2009
 */
public interface MethodAdvice {
	
	/** The Constant EVAL_METHOD. */
	public static final Object EVAL_METHOD = null;
	
	/**
	 * 前置方法，调用被拦截方法前执行，如果此方法返回值不为NULL，则直接返回调用层，不执行被拦截的方法
	 * 
	 * @param serviceMethod the service method
	 * @param args the args
	 * 
	 * @return the object
	 * 
	 * @throws Throwable the throwable
	 */
	public Object before(Method serviceMethod,Object[] args) throws Throwable;
	
	/**
	 * 后置方法，被拦截方法调用后执行
	 * 
	 * @param serviceMethod the service method
	 * @param args the args
	 * @param returnObject the return object
	 * 
	 * @throws Throwable the throwable
	 */
	public void after(Method serviceMethod,Object[] args,Object returnObject) throws Throwable;
}
