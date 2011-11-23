/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.FileGpassDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.FileGpass;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class FileGpassDaoImpl extends DaoSupport implements FileGpassDao {

	/**
	 * 创建对象
	 */
	public FileGpass save(FileGpass user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(FileGpass record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public FileGpass get(Serializable id) {
        return super.get(FileGpass.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(FileGpass record) {
		super.update(record);
	}

	public void saveOrNot(FileGpass fileGpass) {
		String key = fileGpass.getFileKey();
		FileGpass fg = this.getFileGpassByKey(key);
		if(fg!=null) return ;
		this.save(fileGpass);
	}

	private FileGpass getFileGpassByKey(String key) {
		String hql = "from  FileGpass g where g.fileKey= ?";
		Object[] params = new Object[]{key};
		List<FileGpass> list = super.find(hql, params);
		if(list != null && list.size()>0) return list.get(0);
		return null;
	}

	public List<FileGpass> searchGpassHistory(String key, int p, int Pagesize) {
		int start = (p-1)*Pagesize;
		String hql = "from FileGpass f where f.fileName like :keyWord order by f.id desc";
		Object[] params = new Object[]{"%"+key+"%"};
		String[] names = new String[]{"keyWord"}; 
		return super.find(hql, names, params, start,Pagesize);
	}


}
