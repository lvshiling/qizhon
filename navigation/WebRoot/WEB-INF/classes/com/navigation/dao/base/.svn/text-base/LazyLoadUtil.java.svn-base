/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.dao.base.Result;
import com.navigation.utils.PageBean;


/**
 * 延迟加载工具类
 * 支持单POJO加载；Collection集合加载；PageBean中RecordList集合加载
 * 接受 pojo,Collection,PageBean 类型参数
 * 
 * @author guohouqiang
 * @version 1.0 ,2008-11-29
 */
public class LazyLoadUtil {

	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(LazyLoadUtil.class);

	/** The Constant GET_PREFIX. */
	private static final String GET_PREFIX = "get";

	/** The Constant POJO_PACKAGE. */
	private static final String POJO_PACKAGE = "com.acttree.pojo";
	
	/** The Constant EMPTY_STRING. */
	private static final String EMPTY_STRING = "";
	
	/** The Constant POINT. */
	private static final String POINT = ".";

	/**
	 * 延迟加载属性强制加载
	 * 
	 * @param value DAO查询返回的数据(包括POJO，POJO的集合，PageBean中RecordListPOJO的集合)
	 * @param props
	 */
	@SuppressWarnings("unchecked")
	public static void initialize(Object value,String[] props) {
		if (value == null || props == null) return;
		String prefix = EMPTY_STRING;
		Set<String> s = getSubProperties(prefix,props);
		if (value instanceof PageBean) {
			PageBean pb = (PageBean) value;
			List pojoList = pb.getRecordList();
			if(pojoList.size()>0)load(pojoList,prefix,s,props);
		}if(value instanceof Result){
			Result result = (Result)value;
			List pojoList = result.getResultList();
			if(pojoList.size()>0)load(pojoList,prefix,s,props);
		}else{
			load(value,prefix,s,props);
		}
	}

	/**
	 * Initialize.
	 * 
	 * @param result the result
	 * @param ps the ps
	 */
	public static void initialize(Result<Object[]> result,String[][] ps){
		initialize(result.getResultList(),ps);
	}
	
	/**
	 * Initialize.
	 * 
	 * @param l the l
	 * @param ps the ps
	 */
	@SuppressWarnings("unchecked")
	public static void initialize(List<Object[]> l,String[][] ps){
		if(l.isEmpty())return;
		Object[] object = l.get(0);
		for(int i = 0 ; i < object.length ; i++){
			if(ps.length <= i)break;
			if(ps[i].length == 0)continue;
			List ls = new ArrayList();
			for(Object[] o : l){
				ls.add(o[i]);
			}
			initialize(ls,ps[i]);
		}
	}
	
	/**
	 * 生成GET方法名
	 * 
	 * @param propertyName
	 * @return
	 */
	private static String generateGetMethod(String propertyName) {
		if (propertyName == null || propertyName.isEmpty()) return null;
		String firstWord = propertyName.substring(0, 1);
		return propertyName.replaceFirst(firstWord, GET_PREFIX
				+ firstWord.toUpperCase());
	}

	/**
	 * 反射调用POJO的方法
	 * 
	 * @param pojo
	 * @param methodName
	 * @return
	 */
	private static Object invokeMethod(Object pojo, String methodName) {
		if (pojo == null || methodName == null || methodName.trim().equals(EMPTY_STRING))
			return null;
		try {
			Method method = pojo.getClass().getMethod(methodName);
			return method.invoke(pojo);
		} catch (Exception e) {
			logger.warn(e.getMessage());
		} 
		return null;
	}

	/**
	 * 判断是否是POJO对象
	 * 
	 * @param value
	 * @return
	 */
	private static boolean isPojo(Object value){
		if(value!=null&&value.getClass().getName().startsWith(POJO_PACKAGE)){
			return true;
		}else return false;
	}
	
	/**
	 * 从字符串中获取属性名称
	 * 
	 * @param s
	 * @return
	 */
	private static String getPropertyName(String s){
		int end = s.indexOf(POINT);
		end = end>-1?end:s.length();
		return s.substring(0,end);
	}
	
	/**
	 * 根据属性名称组装前缀字符串
	 * 
	 * @param propertyName
	 * @return
	 */
	private static String getPrefix(String propertyName){
		return EMPTY_STRING.equals(propertyName) ? EMPTY_STRING : (propertyName
				.endsWith(POINT) ? propertyName : propertyName + POINT);
	}
	
	/**
	 * 查找属性的子属性
	 * 
	 * @param propertyName
	 * @param props
	 * @return
	 */
	private static Set<String> getSubProperties(String propertyName,String[] props){
		Set<String> propSet = new HashSet<String>();
		for(String prop : props){
			String prefix = getPrefix(propertyName);
			if(prop.startsWith(prefix)){
				String t = getPropertyName(prop.replaceFirst(prefix, EMPTY_STRING));
				propSet.add(t);
			}
		}
		return propSet;
	}
	
	/**
	 * 递归初始化延迟属性
	 * 
	 * @param pojo
	 * @param prefix
	 * @param s
	 * @param b
	 */
	@SuppressWarnings("unchecked")
	private static void load(Object pojo,String prefix,Set<String> s,String[] props){
		if(pojo instanceof Collection){
			Iterator it = ((Collection)pojo).iterator();
			while(it.hasNext()){
				load(it.next(),prefix,s,props);
			}
		}else if(isPojo(pojo)){
			Iterator<String> it = s.iterator();
			while(it.hasNext()){
				String pn = it.next();
				Object returnObject = invokeMethod(pojo,generateGetMethod(pn));
				if (returnObject != null ) {
					try{
                        if(!Hibernate.isInitialized(returnObject)){
                            Hibernate.initialize(returnObject);
                        }
					}catch(Exception ex){
						//IGNORE
						logInitializeException(pojo,pn,ex);
					}	
					prefix = getPrefix(prefix);
					Set<String> subProp = getSubProperties(prefix+pn,props);                    
					if(subProp.size()>0){
						load(returnObject,prefix+pn,subProp,props);
					}
				}
			}
		}
	}
	
	/**
	 * 立即加载POJO类的指定延迟属性 immediately Load Propertie
	 * 
	 * @param pojo
	 * @param propertyNames
	 */
	public static void loadProperty(Object pojo, String[] propertyNames) {
		if (!pojo.getClass().getName().startsWith(POJO_PACKAGE)) return;
		for (String propertyName : propertyNames) {
			Object returnObject = invokeMethod(pojo,generateGetMethod(propertyName));
			if (returnObject != null) {
				try{
                    if(!Hibernate.isInitialized(returnObject)){
                        Hibernate.initialize(returnObject);
                    }
				}catch(Exception ex){
					//IGNORE
					logInitializeException(pojo,propertyName,ex);
				}	
			}
		}
	}
	
	/**
	 * Load object.
	 * 
	 * @param pojo the pojo
	 * 
	 * @return the object
	 */
	public static Object loadObject(Object pojo){
		if(pojo != null){
			try{
              if(!Hibernate.isInitialized(pojo)){
                  Hibernate.initialize(pojo);
              }
			}catch(Exception ex){
				logInitializeException(pojo,EMPTY_STRING,ex);
				return null;
			}	
		}
		return pojo;
	}
	
	/**
	 * Log initialize exception.
	 * 
	 * @param pojo the pojo
	 * @param propertyName the property name
	 * @param ex the ex
	 */
	private static void logInitializeException(Object pojo,String propertyName,Exception ex){
		logger.warn( new StringBuilder()
			.append(pojo.getClass())
			.append(":")
			.append(propertyName)
			.append("[")
			.append(ex.getMessage())
			.append("]").toString());
	}
}
