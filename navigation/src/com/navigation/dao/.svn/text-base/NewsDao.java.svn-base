/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.PageBean;
import com.navigation.pojo.News;

/**
 * @author Administrator
 *
 */
public interface NewsDao {

	/**
     * @param record
     * @return
     */
    public News save(News record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public News get(Serializable Id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(News record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(News record);

    /**
     * 新闻列表
     * @param areaId
     * @return
     */
	public List<News> getNewsList(Integer areaId,Integer p,Integer pageSize);

	/**
	 * 新闻BEAN
	 * @param areaId
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public PageBean getNewsPageBean(Integer areaId, Integer p, Integer pageSize);


}
