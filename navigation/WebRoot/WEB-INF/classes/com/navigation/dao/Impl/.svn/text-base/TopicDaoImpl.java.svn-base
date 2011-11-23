/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;

import com.navigation.dao.TopicDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.Topic;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class TopicDaoImpl extends DaoSupport implements TopicDao {

	/**
	 * 创建对象
	 */
	public Topic save(Topic Topic){
		Topic.setSubscribeCount(0);
		Topic.setReplyCount(0);
		super.save(Topic);
		return Topic;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(Topic record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public Topic get(Serializable id) {
        return super.get(Topic.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(Topic record) {
		super.update(record);
	}

	/**
	 * 取得列表
	 */
	public List<Topic> getTopicList(int p, int pageSize,Integer targetUserId,Integer topicSortId,Integer areaId) {
		String hql = "from Topic t left join fetch t.userByAuthorId u where t.state != "+Constant.DELETE_STATE
					+" and t.area.id = ? ";
		Object[] params = new Object[]{areaId};
		
		if(targetUserId!=null){
			hql += " and t.userByAuthorId.id = ? and t.isFake != "+Constant.TOPIC_FAKE_FLAG;
			params = ArrayUtils.addAll(params, new Object[]{targetUserId});
		}
		
		if(topicSortId != null){	//版块情况下忽略隐藏
			hql += " and t.topicSort.id = ? ";
			params = ArrayUtils.addAll(params, new Object[]{topicSortId});
		}else{
			hql += " and t.state != "+Constant.NOMAL_HIDDEN;
		}
		
		hql += " order by t.lastReplyTime desc";
		return super.find(hql,params,(p-1)*pageSize, pageSize);
		
	}

	/**
	 * 取得总数
	 */
	public Integer getTopicListCount(Integer targetUserId,Integer topicSortId,Integer areaId) {
		String hql = "select count(*) from Topic t where t.state != "+Constant.DELETE_STATE
					+" and t.area.id = ? ";
		Object[] params = new Object[]{areaId};
		if(targetUserId!=null){
			hql += " and t.userByAuthorId.id = ? and t.isFake != "+Constant.TOPIC_FAKE_FLAG;
			params = ArrayUtils.addAll(params, new Object[]{targetUserId});
		}
		
		if(topicSortId != null){	//版块情况下忽略隐藏
			hql += " and t.topicSort.id = ? ";
			params = ArrayUtils.addAll(params, new Object[]{topicSortId});
		}else{
			hql += " and t.state != "+Constant.NOMAL_HIDDEN;
		}
		
		return super.count(hql,params);
	}

	/**
	 * 取得帖子和作者
	 */
	public Topic getTopicByIdFetchUser(Integer topicId) {
		String hql = "from Topic t left join fetch t.userByAuthorId u where t.id = ?";
		Object[] params = new Object[]{topicId};
		List<Topic> list = super.find(hql, params, 0,1);
		if(list.size()>0) return list.get(0);
		return null;
	}

	public List<Topic> getSyncTopicByIds(Long[] ids) {
		String hql = "from Topic t where t.syncId in (:ids)";
		Object[] params = new Object[]{ids};
		String[] names = new String[]{"ids"};
		return super.find(hql,names, params);
	}

	public long getLastSyncId(Integer areaId) {
		String hql = "from Topic t where t.syncId is not null and t.area.id = ? and t.state = "+Constant.NOMAL_STATE_FROM_SINA+" order by t.syncId desc";
		Object[] params = new Object[]{areaId};
		List<Topic> list = super.find(hql,params,0,1);
		if(list.size()>0){
			return list.get(0).getSyncId();
		}
		return 0L;
	}

	public Topic getRandomTopic() {
		String hql = "from Topic t left join fetch t.userByAuthorId u order by RAND()";
		List<Topic> list = super.find(hql, 0,1);
		if(list.size()>0) return list.get(0);
		return null;
	}

	public void updateTopicSubscribeCount(Integer topicId, int i) {
		String hql = "update Topic t set t.subscribeCount = t.subscribeCount + ? where t.id = ?";
		Object[] params = new Object[]{i,topicId};
		super.update(hql, params);
	}

	public List<Topic> searchTopoic(String keyWord, Integer pageSize, Integer p,Integer areaId) {
		String hql = "from Topic t where t.title like (:keyWord) and t.area.id = :areaId order by t.id desc";
		Object[] params = new Object[]{"%"+keyWord+"%",areaId};
		String[] names = new String[]{"keyWord","areaId"};
		int start = (p-1)*pageSize;
		return super.find(hql, names, params, start,pageSize);
	}

}
