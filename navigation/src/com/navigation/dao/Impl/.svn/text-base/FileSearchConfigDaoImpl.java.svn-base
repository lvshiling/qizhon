/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.FileSearchConfigDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.FileSearchConfig;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class FileSearchConfigDaoImpl extends DaoSupport implements FileSearchConfigDao {

	/**
	 * 创建对象
	 */
	public FileSearchConfig save(FileSearchConfig user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(FileSearchConfig record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public FileSearchConfig get(Serializable id) {
        return super.get(FileSearchConfig.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(FileSearchConfig record) {
		super.update(record);
	}

	public List<FileSearchConfig> getConfigList() {
		String hql = "from FileSearchConfig";
		return super.find(hql);
	}


}
