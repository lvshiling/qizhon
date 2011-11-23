/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.FileBean;
import com.navigation.pojo.FileSearch;

/**
 * @author Administrator
 *
 */
public interface FileSearchDao {

	/**
     * @param record
     * @return
     */
    public FileSearch save(FileSearch record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public FileSearch get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(FileSearch record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(FileSearch record);

    /**
     * 删除CACHE
     * @param fileConfigId
     */
	public void deleteAllByFileConfigId(Integer fileConfigId);

	/**
	 * 搜索
	 * @param keyWord
	 * @param folders
	 * @param p 
	 * @return
	 */
	public List<FileSearch> search(String keyWord, Integer[] folders, Integer p);


}
