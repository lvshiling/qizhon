/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;

import com.navigation.dao.UserStockDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserStock;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserStockDaoImpl extends DaoSupport implements UserStockDao {

	/**
	 * 创建对象
	 */
	public UserStock save(UserStock user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserStock record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserStock get(Serializable id) {
        return super.get(UserStock.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserStock record) {
		super.update(record);
	}


}
