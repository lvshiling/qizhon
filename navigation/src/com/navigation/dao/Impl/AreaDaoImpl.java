/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;

import com.navigation.dao.AreaDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.Area;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class AreaDaoImpl extends DaoSupport implements AreaDao {

	/**
	 * 创建对象
	 */
	public Area save(Area user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(Area record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public Area get(Serializable id) {
        return super.get(Area.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(Area record) {
		super.update(record);
	}


}
