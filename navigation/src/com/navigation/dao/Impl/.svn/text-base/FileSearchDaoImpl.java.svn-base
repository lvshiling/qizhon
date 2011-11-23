/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.FileSearchDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.FileBean;
import com.navigation.pojo.FileSearch;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class FileSearchDaoImpl extends DaoSupport implements FileSearchDao {

	/**
	 * 创建对象
	 */
	public FileSearch save(FileSearch user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(FileSearch record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public FileSearch get(Serializable id) {
        return super.get(FileSearch.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(FileSearch record) {
		super.update(record);
	}

	/**
	 * 删除缓存
	 */
	public void deleteAllByFileConfigId(Integer fileConfigId) {
		String hql = "delete from FileSearch f where f.fileSearchConfig.id = ?";
		Object[] params = new Object[]{fileConfigId};
		super.update(hql, params);
	}

	public List<FileSearch> search(String keyWord, Integer[] folders,Integer p) {
		int pageSize = 20;
		int start = (p-1)*pageSize;
		String hql = "from FileSearch f where f.fileName like :keyWord and f.fileSearchConfig.id in (:folders) order by f.id desc";
		Object[] params = new Object[]{"%"+keyWord+"%",folders};
		String[] names = new String[]{"keyWord","folders"}; 
		return super.find(hql, names, params, start,pageSize);
	}


}
