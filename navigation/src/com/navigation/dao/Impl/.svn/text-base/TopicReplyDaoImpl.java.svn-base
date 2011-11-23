/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;

import com.navigation.dao.TopicReplyDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.TopicReply;
import com.navigation.utils.TopicUtil;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class TopicReplyDaoImpl extends DaoSupport implements TopicReplyDao {

	/**
	 * 创建对象
	 */
	public TopicReply save(TopicReply TopicReply){
		super.save(TopicReply);
		return TopicReply;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(TopicReply record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public TopicReply get(Serializable id) {
        return super.get(TopicReply.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(TopicReply record) {
		super.update(record);
	}

	/**
	 * 取得回复
	 */
	public List<TopicReply> getReplyListByTopicIdAndLastReplyId(
			Integer topicId, Integer lastReplyId) {
		String hql = "from TopicReply r left join fetch r.user u where r.topic.id = ?";
		Object[] params = new Object[]{topicId};
		if(null != lastReplyId && !lastReplyId.equals("")){
			hql += " and r.id > ?";
			params = ArrayUtils.addAll(params, new Object[]{lastReplyId});
		}
		List<TopicReply> list = super.find(hql, params);
		for (TopicReply topicReply : list) {
			topicReply.setContent(TopicUtil.parseEmote(topicReply.getContent()));
		}
		return list;
	}


}
