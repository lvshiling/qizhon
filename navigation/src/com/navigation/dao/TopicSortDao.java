/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.TopicSort;

/**
 * @author Administrator
 *
 */
public interface TopicSortDao {

	/**
     * @param record
     * @return
     */
    public TopicSort save(TopicSort record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public TopicSort get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(TopicSort record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(TopicSort record);

    /**
     * 取公开分类
     * @param areaId 
     * @return
     */
	public List<TopicSort> getPublicTopicSort(Integer areaId);


}
