/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;

import com.navigation.dao.UserNoticeDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.UserNotice;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserNoticeDaoImpl extends DaoSupport implements UserNoticeDao {

	/**
	 * 创建对象
	 */
	public UserNotice save(UserNotice UserNotice){
		super.save(UserNotice);
		return UserNotice;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserNotice record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserNotice get(Serializable id) {
        return super.get(UserNotice.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserNotice record) {
		super.update(record);
	}

	public UserNotice getTopicNotice(Integer userId, Integer topicId) {
		String hql = "from UserNotice n where n.user.id = ? and n.refId = ? and n.noticeType = "+Constant.NOTICE_TYPE_TOPIC;
		Object[] params = new Object[]{userId,topicId};
		List<UserNotice> list = super.find(hql, params);
		if(null != list && list.size()>0) return list.get(0);
		return null;
	}

	public void updateTopicNotice(int noticeType, Integer refId,Integer userId) {
		switch (noticeType) {
		case Constant.NOTICE_TYPE_EMAIL:
			String hql = "update UserNotice n set n.isRead = n.isRead +1 where n.noticeType = ? " +
			"and n.user.id = ?";
			Object[] params = new Object[]{noticeType,userId};
			super.bulkUpdate(hql, params);
			break;

		case Constant.NOTICE_TYPE_TOPIC:
			String hql1 = "update UserNotice n set n.isRead = n.isRead +1 where n.noticeType = ? " +
			"and n.user.id != ? and n.refId = ?";
			Object[] params1 = new Object[]{noticeType,userId,refId};
			super.bulkUpdate(hql1, params1);
			break;
		}
	}

	public List<UserNotice> getUserNotice(Integer userId, Integer noticeTpye,
			boolean isUnRead) {
		String hql = "from UserNotice n where n.user.id = ? ";
		Object[] params = new Object[]{userId};
		if(null != noticeTpye){
			hql += " and n.noticeType = ?";
			params = ArrayUtils.addAll(params, new Object[]{noticeTpye});
		}
		if(isUnRead){
			hql += " and n.isRead >0"; 
		}
		hql += " order by n.id desc";
		return super.find(hql, params);
	}

	public void setReadedAll(Integer userId) {
		String hql = "update UserNotice n set n.isRead = 0 where n.user.id = ?";
		Object[] params = new Object[]{userId};
		super.bulkUpdate(hql, params);
	}

	public UserNotice getUserMailNotice(Integer userId, Integer linktypeBindMail) {
		String hql = "from UserNotice n where n.user.id = ? and n.noticeType = "+linktypeBindMail;
		Object[] params = new Object[]{userId};
		List<UserNotice> list = super.find(hql, params);
		if(null != list && list.size()>0) return list.get(0);
		return null;
	}

}
