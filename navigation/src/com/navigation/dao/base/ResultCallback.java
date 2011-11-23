/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.util.List;
/**
 * Dao查询结果回调接口
 * @author derek
 * @version 1.0 ,Nov 3, 2008
 */
@SuppressWarnings("unchecked")
public abstract class ResultCallback {
	
	/** The dao. */
	public DaoSupport dao;
	
	/** 查询缓存开关 */
	private boolean queryCacheEnabled = false;
	
	/** 查询缓存时间（本地缓存） */
	private int queryCacheTime = 10;
	
	/**
	 * Instantiates a new result callback.
	 * 
	 * @param dao the dao
	 */
	public ResultCallback(DaoSupport dao){
		this.dao = dao;
	}
	
	/**
	 * 查询数据
	 * 
	 * @return
	 */
	public abstract List find();
	
	/**
	 * 查询数据(带自定义排序条件)
	 * 
	 * @param order 自定义排序条件
	 * @return
	 */
	public abstract List find(QueryOrder order);
	
	/**
	 * 统计
	 * 
	 * @return
	 */
	public abstract Integer count();

	/**
	 * 获取 queryCacheEnabled
	 *
	 * @return the queryCacheEnabled
	 */
	public boolean isQueryCacheEnabled() {
		return queryCacheEnabled;
	}

	/**
	 * @param queryCacheEnabled the queryCacheEnabled to set
	 */
	public void setQueryCacheEnabled(boolean queryCacheEnabled) {
		this.queryCacheEnabled = queryCacheEnabled;
	}

	/**
	 * 获取 queryCacheTime
	 *
	 * @return the queryCacheTime
	 */
	public int getQueryCacheTime() {
		return queryCacheTime;
	}

	/**
	 * @param queryCacheTime the queryCacheTime to set
	 */
	public void setQueryCacheTime(int queryCacheTime) {
		this.queryCacheTime = queryCacheTime;
	}
}
