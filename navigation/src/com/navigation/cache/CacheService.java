/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.cache;

/**
 * The Interface CacheService.
 * 
 * <pre>
 * 首先向要使用缓存的类中注入cacheService对象
 * bean id = cacheService
 *     	//使用已定义的缓存分区
    	Cache cache = cacheService.getCacheRegion("onlineRegion");
    	
    	//使用默认的缓存分区
    	Cache cache2 = cacheService.getCacheRegion();

    	Long userId_1 = 12L;
    	Long userId_2 = 13L;
    	Long userId_3 = 14L;
    	
    	//放入缓存(key,value);
    	cache.set(userId_1, userId_1);//使用onlineRegion默认过期时间
    	cache.set(userId_2, 300 ,userId_2);//300秒过期
    	cache.set(userId_3, 600 ,userId_3);//600秒过期
    	
    	//批量取值
    	Map<String,Object> mv1 = cache.getBulk(new Long[]{userId_1,userId_2,userId_3});
    	
    	//异步批量取值
    	Future<Map<String,Object>> f = cache.asyncGetBulk(new Long[]{userId_1,userId_2,userId_3});
    	try {
			Map<String,Object> mv2 = f.get();
			Iterator it = mv2.values().iterator();
			while(it.hasNext()){
				System.out.println(it.next());
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
    	
    	//单个取值
    	Object v = cache.get(userId_1);
    	
		//异步单个取值
    	Future<Object> ff = cache.asyncGet(userId_1);
    	try {
			Object v2 = ff.get();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
 * </pre>
 * @author Derek
 * @version 1.0, 2010-4-17
 */
public interface CacheService {
	
	/**
	 * Gets the cache region.
	 * 
	 * @param regionName the region name
	 * 
	 * @return the cache region
	 */
	public CacheRegion getCacheRegion(String regionName);
	
	/**
	 * Gets the cache region.
	 * 
	 * @return the cache region
	 */
	public CacheRegion getCacheRegion();
}
