/**
 * 
 */
package com.navigation.jiasu.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.PageBean;
import com.navigation.jiasu.pojo.Radacct;

/**
 * @author Administrator
 *
 */
public interface RadacctDao {

	/**
     * @param record
     * @return
     */
    public Radacct save(Radacct record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public Radacct get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(Radacct record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(Radacct record);

	public List<Radacct> getList(String name,Integer p,Integer pageSize,String startDate, String endDate);
	public Integer getListCount(String name,String startDate, String endDate);

	/**
	 * 返回分页
	 * @param name
	 * @param p
	 * @param pageSize
	 * @param endDate 
	 * @param startDate 
	 * @return
	 */
	public PageBean getListByName(String name,Integer p,Integer pageSize, String startDate, String endDate);

	
	/**
	 * 总的时间，分钟
	 * @param target
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Integer getTimeCount(String target, String startDate, String endDate);
}
