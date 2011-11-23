/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.util.List;


/**
 * Dao查询结果调用对象
 * <pre>
 * 在DAO实现类集合查询方法中使用Result对象，且作为返回值
 *  dao eg:
    public Result find(final Long userId,final Integer[] range){
    	String hql = "from UserProfile";
    	String count = "select count(*) from UserProfile";
    	
    	final String defaultOrderBy = " order by id desc ";
    	final String condition = " where id=? ";
    	final String selectHql = hql + condition;
    	final String countHql = count + condition;
    	final Object[] params = new Object[]{userId};
    	
    	Result result = new Result(new ResultCallback(this){
			public Integer count() {
				return dao.count(countHql,params);
			}

			public List find() {
				return dao.find(selectHql+defaultOrderBy,params,range[0],range[1]);
			}

			public List find(QueryOrder order) {
				if(order==null||!order.isOrder())return find();
				return dao.find(selectHql+order.toOrderBySQL(),params,range[0],range[1]);
			}
    	});
    	return result;
    }
    
    service eg:
    
        Result result = xxDao.find(1L,0, 0);
    	
    	//自定义排序
    	QueryOrder order = new QueryOrder();
    	order.asc(UserProfile.REF, UserProfile.PROP_CREATE_TIME);
    	List resultList = result.getResultList(order);
    	
    	//默认排序
    	List resultList = result.getResultList();
    	
    	//统计数
    	Integer count = result.getResultCount();
 * </pre>
 * 
 * @author derek
 * @version 1.0 ,Nov 3, 2008
 * @param <T>
 */
public class Result<T> {
	
	/**查询回调*/
	 ResultCallback callback;
	 
	/**
	 * 构造函数
	 * 
	 * @param callback
	 */
	public Result(ResultCallback callback){
		this.callback = callback;
	}
	
	/**
	 * 获取查询结果集
	 * 
	 * @return 查询结果集
	 */
	@SuppressWarnings("unchecked")
	public List<T> getResultList(){
		return callback.find();
	}
	
	/**
	 * 获取查询结果集(带自定义排序条件)
	 * 
	 * @param order 自定义排序条件
	 * @return 查询结果集
	 */
	@SuppressWarnings("unchecked")
	public List<T> getResultList(QueryOrder order){
		return callback.find(order);
	}
	
	/**
	 * 获取统计数
	 * 
	 * @return 统计数
	 */
	public Integer getResultCount(){
		return callback.count();
	}

	/**
	 * 获取 queryCacheEnabled
	 *
	 * @return the queryCacheEnabled
	 */
	public boolean isQueryCacheEnabled() {
		return callback.isQueryCacheEnabled();
	}

	/**
	 * @param queryCacheEnabled the queryCacheEnabled to set
	 */
	public void setQueryCacheEnabled(boolean queryCacheEnabled) {
		callback.setQueryCacheEnabled(queryCacheEnabled);
	}
	
	/**
	 * Sets the query cache time.
	 * 
	 * @param queryCacheTime the new query cache time
	 */
	public void setQueryCacheTime(int queryCacheTime){
		callback.setQueryCacheTime(queryCacheTime);
	}
	
}
