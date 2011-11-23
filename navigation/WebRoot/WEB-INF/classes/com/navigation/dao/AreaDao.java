/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;

import com.navigation.pojo.Area;

/**
 * @author Administrator
 *
 */
public interface AreaDao {

	/**
     * @param record
     * @return
     */
    public Area save(Area record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public Area get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(Area record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(Area record);


}
