/**
 * 
 */
package com.navigation.jiasu.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.PageBean;
import com.navigation.jiasu.pojo.GameDownStatus;

/**
 * @author Administrator
 *
 */
public interface GameDownStatusDao {

	/**
     * @param record
     * @return
     */
    public GameDownStatus save(GameDownStatus record);
    
    /**
     * 通过主键获取实体.
     * 
     * @param <T> 被查询实体
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    public GameDownStatus get(Serializable id);
    
    /**
     * 更新实体对象.
     * 
     * @param record 实体对象
     */
    public void update(GameDownStatus record);
    
    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(GameDownStatus record);
    
    /**
     * 更新游戏 内容
     * @param gameName
     * @param gameVersion
     * @param host
     */
    public void updateGame(String gameName,String gameVersion,String host);

}
