/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Class ResultAdapter. 创建Result的适配器
 * 
 * @author Derek
 * @version 1.0 , 2008-11-17
 */
@SuppressWarnings("unchecked")
public abstract class ResultAdapter{
	
	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(ResultAdapter.class);

	/** 不分页查询全部记录 */
	private static final int[] NO_PAGE_RANGE = { 0, 0 };

	/** 查询前10条记录 */
	private static final int[] TOP_10_RANGE = { 0, 10 };
	
	/** The Constant EMPTY_RESULT. */
	public static final Result EMPTY_RESULT ;
		
	/** 最大KEY的长度 */
	private static final int DEFAULT_MAX_KEY_LENGTH = 250;

	static{
		EMPTY_RESULT = new Result(new ResultCallback(null){
			public Integer count() { return 0; }
			public List find() { return new ArrayList(0); }
			public List find(QueryOrder order) { return find(); }
		});
	}
	
	
	/**
	 * Gets the range.
	 * 
	 * @param range the range
	 * 
	 * @return the range
	 */
	private static int[] getRange(int[] range) {
		final int[] RANGE;
		if (range == null) {
			RANGE = NO_PAGE_RANGE;
			logger.info("Page range is null! It will be using NO_PAGE_RANGE");
		} else if (range.length != 2) {
			RANGE = TOP_10_RANGE;
			logger.info("Page range length is wrong! It will be using TOP_10_RANGE");
		} else
			RANGE = range;
		return RANGE;
	}

	/**
	 * 创建Result
	 * 
	 * @param sHql 查询HQL
	 * @param cHql 统计HQL
	 * @param defaultOrderBy 默认排序HQL
	 * @param sParams 查询参数列表
	 * @param cParams 统计参数列表
	 * @param range 分页查询范围
	 * @param daoSupport 执行查询的DAO
	 * @param t 返回值泛型类型
	 * @return
	 */
	public static <T> Result<T> createResult(final String sHql,
											 final String cHql, 
											 final String defaultOrderBy,
											 final Object sParams[], 
											 final Object cParams[],
											 final int[] range, 
											 final DaoSupport daoSupport, 
											 Class<T> t) {
		return ResultAdapter.createResult(sHql, cHql, defaultOrderBy, 
				sParams, cParams, range, null, daoSupport, t);
	}

	/**
	 * 创建Result无查询参数绑定
	 * 
	 * @param <T>
	 * @param sHql
	 * @param cHql
	 * @param defaultOrderBy
	 * @param range
	 * @param daoSupport
	 * @param t
	 * @return
	 */
	public static <T> Result<T> createResult(final String sHql,
											final String cHql, 
											final String defaultOrderBy,
											final int[] range, 
											final DaoSupport daoSupport, 
											Class<T> t) {
		return ResultAdapter.createResult(sHql, cHql, defaultOrderBy, 
				null, null, range, null, daoSupport, t);
	}

	/**
	 * 创建Result(带别名映射表)无查询参数绑定
	 * 
	 * @param <T>
	 * @param sHql
	 * @param cHql
	 * @param defaultOrderBy
	 * @param range
	 * @param aliasMap
	 * @param daoSupport
	 * @param t
	 * @return
	 */
	public static <T> Result<T> createResult(final String sHql,
											final String cHql, 
											final String defaultOrderBy,
											final int[] range, 
											final Map<String, String> aliasMap,
											final DaoSupport daoSupport, 
											Class<T> t) {
		return ResultAdapter.createResult(sHql, cHql, defaultOrderBy, 
				null, null, range, aliasMap, daoSupport, t);
	}
	
	/**
	 * 创建Result(带别名映射表)
	 * 
	 * @param <T>
	 * @param sHql
	 * @param cHql
	 * @param defaultOrderBy
	 * @param sParams
	 * @param cParams
	 * @param range
	 * @param aliasMap
	 * @param daoSupport
	 * @param t
	 * @return
	 */
	public static <T> Result<T> createResult(final String sHql,
											final String cHql, 
											final String defaultOrderBy,
											final Object sParams[], 
											final Object cParams[],
											final int[] range, 
											final Map<String, String> aliasMap,
											final DaoSupport daoSupport, 
											Class<T> t) {
		Result<T> result = new Result<T>(new ResultCallback(daoSupport) {
			Integer num = null;

			public Integer count() {
				int[] ra = getRange(range);
				int first = ra[0];
				int max = ra[1];
				if (num != null) {
					if (num < max || num > max) {
						return num;
					} else {
						if (first == 0 && max == 0) {
							return num;
						} else {
							int i = dao.count(cHql, cParams);
							return i;
						}
					}
				} else {
					num = dao.count(cHql, cParams);
					return num;
				}
			}

			public List find() {
				int[] ra = getRange(range);
				int first = ra[0];
				int max = ra[1];
				if (num != null) {
					if (num > 0) {
						if(first>=num){
							int totalPage = (num%max == 0)?num/max:num/max + 1;
							first = (totalPage - 1) * max;
						}
						List lt = dao.find(sHql + defaultOrderBy, sParams, first, max);
						return lt; 
					} else {
						return new ArrayList(0);
					}
				} else {
					List list = dao.find(sHql + defaultOrderBy, sParams, first, max);
 
					int size = list.size();
					if(first == 0 && max == 0){
						num = size;
					}else if(size < max){
						num = first + size;
					}
					return list;
				}
			}
			
			public List find(QueryOrder order) {
				int[] ra = getRange(range);
				if (order == null || !order.isOrder()) {
					return find();
				} else {
					List list;
					int first = ra[0];
					int max = ra[1];
					if (num != null) {
						if (num > 0) {
							if(first>=num){
								int totalPage = (num%max == 0)?num/max:num/max + 1;
								first = (totalPage - 1) * max;
							}
							if (aliasMap != null) {
								list = dao.find(sHql+order.toOrderBySQL(aliasMap),sParams, first, max);
							} else {
								list = dao.find(sHql + order.toOrderBySQL(),sParams, first, max);
							}
							return list;
						} else {
							return new ArrayList(0);
						}
					} else {
						if (aliasMap != null) {
							list = dao.find(sHql + order.toOrderBySQL(aliasMap),sParams, first, max);
						} else {
							list = dao.find(sHql + order.toOrderBySQL(),sParams, first, max);
						}
						int size = list.size();
						if(first == 0 && max == 0){
							num = size;
						}else if(size < max){
							num = first + size;
						}
						return list;
					}
				}
			}
		});
		return result;
	}
	
	/**
	 * 创建Result(命名本地SQL查询)
	 * 
	 * @param <T>
	 * @param selectQueryName
	 * @param countQueryName
	 * @param sParams
	 * @param cParams
	 * @param range
	 * @param daoSupport
	 * @param t
	 * @return
	 */
	public static <T> Result<T> createNameQueryResult(final String selectQueryName,
											 final String countQueryName,
											 final Object sParams[],
											 final Object cParams[],
											 final int[] range,
											 final DaoSupport daoSupport,
											 Class<T> t){
		Result<T> result = new Result<T>(new ResultCallback(daoSupport) {
			Integer num = null;
            public Integer count() {
            	int[] ra = getRange(range);
				int first = ra[0];
				int max = ra[1];
				if (num != null) {
					if (num < max || num > max) {
						return num;
					} else {
						if (first == 0 && max == 0) {
							return num;
						} else {
							Integer i = (Integer)dao.countByQueryName(countQueryName, cParams);
							return i;
						}
					}
				} else {
					num = (Integer)dao.countByQueryName(countQueryName, cParams);
					return num;
				}
            }

            public List find() {
            	int[] ra = getRange(range);
				int first = ra[0];
				int max = ra[1];
				if (num != null) {
					if (num > 0) {
						if(first>=num){
							int totalPage = (num%max == 0)?num/max:num/max + 1;
							first = (totalPage - 1) * max;
						}
						List lt = dao.findByQueryName(selectQueryName, sParams, first, max);
						return lt; 
					} else {
						return new ArrayList(0);
					}
				} else {
					List list = dao.findByQueryName(selectQueryName, sParams, first, max);
 
					int size = list.size();
					if(first == 0 && max == 0){
						num = size;
					}else if(size < max){
						num = first + size;
					}
					return list;
                }
            }

            public List find(QueryOrder order) {
                return find();
            }
        });
        return result;
	}
	
	/**
	 * Builds the query key.
	 * 
	 * @param hql the hql
	 * @param params the params
	 * @param range the range
	 * 
	 * @return the string
	 */
	public static String buildQueryKey(String hql, Object params[], Integer[] range){
		StringBuilder keyBuilder = new StringBuilder();
		if(null != hql){
			keyBuilder.append(hql).append(":");
		}
		if(null != params){
			keyBuilder.append("[");
			for(int i = 0;i < params.length ;i++){
				if(null != params[i]){
					keyBuilder.append(params[i].toString());
				}
				if(i < params.length-1){
					keyBuilder.append(",");
				}else{
					keyBuilder.append("]");
				}
			}
		}
		if(null != range){
			keyBuilder.append("[");
			for(int i = 0;i < range.length ;i++){
				if(null != range[i]){
					keyBuilder.append(range[i].toString());
				}
				if(i < range.length-1){
					keyBuilder.append(",");
				}else{
					keyBuilder.append("]");
				}
			}
		}
		
		String key = keyBuilder.toString();
		if(key.length() > DEFAULT_MAX_KEY_LENGTH){
			key = truncateKey(key);
		}
		logger.debug("QueryCache key:"+key);
		return key;
	}
	
    /**
	 * Truncate key.
	 * 
	 * @param key the key
	 * @return the string
	 */
    protected static String truncateKey(String key) {
    	return DigestUtils.md5Hex(key.getBytes());
    }
    
}
