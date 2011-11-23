/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.NewsDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.PageBean;
import com.navigation.pojo.News;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class NewsDaoImpl extends DaoSupport implements NewsDao {

	/**
	 * 创建对象
	 */
	public News save(News user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(News record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public News get(Serializable id) {
        return super.get(News.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(News record) {
		super.update(record);
	}

	public List<News> getNewsList(Integer areaId,Integer p,Integer pageSize) {
		String hql = "from News n where n.area.id = ?";
		Object[] params = new Object[]{areaId};
		return super.find(hql, params, (p-1)*pageSize, pageSize);
	}

	public PageBean getNewsPageBean(Integer areaId, Integer p, Integer pageSize) {
		List<News> newsList = this.getNewsList(areaId, p, pageSize);
		Integer count = this.getNewsCount(areaId);
		
		PageBean pb = new PageBean();
		pb.setRecordList(newsList);
		pb.setRecordCount(count);
		pb.setCurrPage(p);
		pb.setPageSize(pageSize);
		return pb;
	}

	private Integer getNewsCount(Integer areaId) {
		String hql = "select count(*) from News n where n.area.id = ?";
		Object[] params = new Object[]{areaId};
		return super.count(hql, params);
	}


}
