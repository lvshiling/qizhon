/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.TopicSortDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.TopicSort;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class TopicSortDaoImpl extends DaoSupport implements TopicSortDao {

	/**
	 * 创建对象
	 */
	public TopicSort save(TopicSort user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(TopicSort record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public TopicSort get(Serializable id) {
        return super.get(TopicSort.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(TopicSort record) {
		super.update(record);
	}

	public List<TopicSort> getPublicTopicSort(Integer areaId) {
		String hql = "from TopicSort s where s.state = "+Constant.TOPIC_SORT_STATE_DEFAULT+" and s.area.id = ?";
		Object[] params = new Object[]{areaId};
		return super.find(hql,params);
	}


}
