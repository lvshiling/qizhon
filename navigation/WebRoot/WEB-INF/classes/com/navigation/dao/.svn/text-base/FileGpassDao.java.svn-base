/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.pojo.FileGpass;

/**
 * @author Administrator
 *
 */
public interface FileGpassDao {

	/**
     * @param record
     * @return
     */
    public FileGpass save(FileGpass record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public FileGpass get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(FileGpass record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(FileGpass record);

    /**
     * 保存GPASS 文件
     * @param fileGpass
     */
	public void saveOrNot(FileGpass fileGpass);

	/**
	 * 搜索
	 * @param key
	 * @param p
	 * @param Pagesize
	 * @return
	 */
	public List<FileGpass> searchGpassHistory(String key,int p,int Pagesize);
}
