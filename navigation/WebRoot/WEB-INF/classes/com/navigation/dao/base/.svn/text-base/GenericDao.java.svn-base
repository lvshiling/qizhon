/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.io.Serializable;

/**
 * 通用DAO接口.
 * 
 * @author derek
 * @version 1.0 , 2008-10-21
 */
public interface GenericDao {
	/**
	 * FLUSH至数据库
	 */
	void flush();

	/**
	 * 使用回调方式在同一session中执行dao操作
	 * 
	 * @param <T>
	 * @param dc
	 * @param lazyProps
	 * @return
	 */
	<T> T callback(DaoCallback<T> dc,String... lazyProps);
    
     
     /**
      * 清理二级缓存
      * 
      * @param c
      * @param id
      */
     @SuppressWarnings("unchecked")
     void evict(Class c, Serializable id);
     
     /**
      * 清理一级缓存
      * 
      * @param o
      */
     void evict(Object o);
     
     /**
      * SaveOrUpdateCopy
      * 
      * @param record
      * @return
      */
     Object merge(Object o);
     
     void refresh(Object o);
}