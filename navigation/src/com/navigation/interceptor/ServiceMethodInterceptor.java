/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.interceptor;

import java.lang.reflect.Method;
import java.util.List;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.service.ServicePerformance;



/**
 * The Class ServiceMethodInterceptor.
 * 
 * @author Derek
 * @version 1.0, May 11, 2009
 */
public class ServiceMethodInterceptor implements MethodInterceptor {
	
	/** The Constant log. */
	private static final Logger log = LoggerFactory.getLogger("SMI");
	
	/** The print cost time. */
	public boolean printCostTime = false;
	
	/** The print cost time with out method. */
	private List<String> printCostTimeWithOutMethod;
	
	/** The beford method advices. */
	public List<MethodAdvice> befordMethodAdvices;
	
	/** The after method advices. */
	public List<MethodAdvice> afterMethodAdvices;
	
	
	/**
	 * Before method.
	 * 
	 * @param serviceMethod the service method
	 * @param args the args
	 * 
	 * @return the object
	 * 
	 * @throws Throwable the throwable
	 */
	private Object beforeMethod(Method serviceMethod,Object[] args) throws Throwable{
		if(befordMethodAdvices != null){
			for(MethodAdvice ma : befordMethodAdvices){
				Object ro = ma.before(serviceMethod, args);
				if(ro != MethodAdvice.EVAL_METHOD){
					return ro;
				}
			}
		}
		return MethodAdvice.EVAL_METHOD;
	}
	
	/**
	 * After method.
	 * 
	 * @param serviceMethod the service method
	 * @param args the args
	 * @param returnObject the return object
	 * 
	 * @throws Throwable the throwable
	 */
	private void afterMethod(Method serviceMethod,Object[] args,Object returnObject) throws Throwable{
		if(afterMethodAdvices != null){
			for(MethodAdvice ma : afterMethodAdvices){
				ma.after(serviceMethod, args, returnObject);
			}
		}
	}
	
	/**
	 * @see org.aopalliance.intercept.MethodInterceptor#invoke(org.aopalliance.intercept.MethodInvocation)
	 */
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		long startTime = 0;
		//if(printCostTime)startTime = System.currentTimeMillis();
		//最终返回值
		Object returnObject = null;
		//被调方法
		Method serviceMethod = methodInvocation.getMethod();
		//被调方法参数
		Object[] args = methodInvocation.getArguments();
		
		//方法调用前置处理
		returnObject = beforeMethod(serviceMethod,args);
		if(returnObject != MethodAdvice.EVAL_METHOD){
			//printCostTime(serviceMethod,startTime);
			return returnObject;
		}
		
		if(printCostTime)startTime = System.currentTimeMillis();
		//执行service方法
		
		returnObject = methodInvocation.proceed();
		
		//打印方法执行时间
		printCostTime(serviceMethod,startTime);
		
		//方法调用后置处理
		afterMethod(serviceMethod,args,returnObject);
		
		return returnObject;
	}

	/**
	 * Prints the cost time.
	 * 
	 * @param serviceMethod the service method
	 * @param startTime the start time
	 */
	private void printCostTime(Method serviceMethod,long startTime){
		if(!printCostTime)return;
		String serviceName = serviceMethod.getDeclaringClass().getName()+"."+serviceMethod.getName();
		if(printCostTimeWithOutMethod == null || !printCostTimeWithOutMethod.contains(serviceName)){
			long cost = System.currentTimeMillis()-startTime;
				log.info(new StringBuilder()
				.append("$ COST_TIME:")
				.append(cost).append("ms")
				.append(" [").append(serviceName).append("]")
				.toString());
			if(ServicePerformance.isStatisticsEnabled()){
					ServicePerformance.setServiceStatistics(serviceName, cost);
			}
		}
	}

	/**
	 * Gets the beford method advices.
	 * 
	 * @return the beford method advices
	 */
	public List<MethodAdvice> getBefordMethodAdvices() {
		return befordMethodAdvices;
	}

	/**
	 * Sets the beford method advices.
	 * 
	 * @param befordMethodAdvices the new beford method advices
	 */
	public void setBefordMethodAdvices(List<MethodAdvice> befordMethodAdvices) {
		this.befordMethodAdvices = befordMethodAdvices;
	}

	/**
	 * Gets the after method advices.
	 * 
	 * @return the after method advices
	 */
	public List<MethodAdvice> getAfterMethodAdvices() {
		return afterMethodAdvices;
	}

	/**
	 * Sets the after method advices.
	 * 
	 * @param afterMethodAdvices the new after method advices
	 */
	public void setAfterMethodAdvices(List<MethodAdvice> afterMethodAdvices) {
		this.afterMethodAdvices = afterMethodAdvices;
	}

	/**
	 * Checks if is prints the cost time.
	 * 
	 * @return true, if is prints the cost time
	 */
	public boolean isPrintCostTime() {
		return printCostTime;
	}

	/**
	 * Sets the prints the cost time.
	 * 
	 * @param printCostTime the new prints the cost time
	 */
	public void setPrintCostTime(boolean printCostTime) {
		this.printCostTime = printCostTime;
	}

	public List<String> getPrintCostTimeWithOutMethod() {
		return printCostTimeWithOutMethod;
	}

	public void setPrintCostTimeWithOutMethod(
			List<String> printCostTimeWithOutMethod) {
		this.printCostTimeWithOutMethod = printCostTimeWithOutMethod;
	}
	
	public void setStatistics(boolean statistics) {
		ServicePerformance.setStatisticsEnabled(statistics);
	}
}
