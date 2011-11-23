/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;

import com.navigation.dao.TagDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.Tag;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class TagDaoImpl extends DaoSupport implements TagDao {

	/**
	 * 创建对象
	 */
	public Tag save(Tag user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(Tag record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public Tag get(Serializable id) {
        return super.get(Tag.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(Tag record) {
		super.update(record);
	}


}
