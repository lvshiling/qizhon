/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.utils;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import com.google.gson.reflect.TypeToken;

/**
 * The Class Convertor.
 * 
 * @author Derek
 * @version 1.0 2010-5-14
 */
public class Convertor {
	
	/** The Constant mapType. */
	public static final TypeToken<Map<String,String>> mapType = new TypeToken<Map<String,String>>(){};
	
	/** The Constant listType. */
	public static final TypeToken<List<String>> listType = new TypeToken<List<String>>(){};
	
	/** The Constant listMapType. */
	public static final TypeToken<List<Map<String,String>>> listMapType = new TypeToken<List<Map<String,String>>>(){};
	
	/**
	 * Bean to map to json.
	 * 
	 * @param bean the bean
	 * @param props the props
	 * @return the string
	 */
	public static String bean2Map2Json(Object bean,String[] props){
		if(bean == null)return StringUtils.EMPTY;
		return JsonUtil.toJson(beanConvert(bean,props));
	}
	
	/**
	 * Json to list map.
	 * 
	 * @param json the json
	 * @return the list
	 */
	public static List<Map<String,String>> json2ListMap(String json){
		return JsonUtil.fromJson(json, listMapType);
	}
	
	/**
	 * Json to list.
	 * 
	 * @param json the json
	 * @return the list
	 */
	public static List<String> json2List(String json){
		return JsonUtil.fromJson(json, listType);
	}
	
	/**
	 * Json to map.
	 * 
	 * @param json the json
	 * @return the map
	 */
	public static Map<String,String> json2Map(String json){
		return JsonUtil.fromJson(json, mapType);
	}
	
	/**
	 * Bean2 map for list.
	 * 
	 * @param ul the ul
	 * @param props the props
	 * @return the list
	 */
	public static List<Map<String,Object>> bean2MapForList(List ul,String[] props){
		if(ul == null || ul.isEmpty())return null;
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		for(Object object : ul){
			listMap.add(bean2Map(object,props));
		}
		return listMap;
	}
	
	/**
	 * Bean2 map.
	 * 
	 * @param bean the bean
	 * @param props the props
	 * @return the map
	 */
	public static Map<String,Object> bean2Map(Object bean,String[] props){
		if(bean == null)return null;
		Map<String,Object> map = new HashMap<String, Object>();
		String[] ps = props;
		if(ps == null || ps.length == 0){
			ps = getGetMethodName(bean.getClass()).toArray(new String[]{});
		}
		for(String prop : ps){
			try {
				if(StringUtils.isNotEmpty(prop))map.put(prop, PropertyUtils.getProperty(bean, prop));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	/**
	 * Bean convert.
	 * 
	 * @param bean the bean
	 * @param props the props
	 * @return the object
	 */
	public static Object beanConvert(Object bean,String[] props){
		if(bean == null)return null;
		if(bean instanceof List){
			return bean2MapForList((List)bean,props);
		}if(bean instanceof Map){
			return bean;
		}if(bean instanceof Object[]){
			return bean;
		}else{
			return bean2Map(bean,props);
		}
	}
	
	/**
	 * Gets the gets the method name.
	 * 
	 * @param clazz the clazz
	 * @return the gets the method name
	 */
	private static List<String> getGetMethodName(Class clazz){
		Method[] methods = clazz.getMethods();
		List<String> l = new ArrayList<String>(5);
		for(Method method : methods){
			String name = method.getName();
			if(name.startsWith("get") && name.length() > 3){
				l.add(name.substring(3).toLowerCase());
			}
		}
		return l;
	}

}
