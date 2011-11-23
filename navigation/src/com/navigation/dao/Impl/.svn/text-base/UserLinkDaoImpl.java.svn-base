/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.UserLinkDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.Constant;
import com.navigation.pojo.UserLink;
import com.navigation.utils.StringUtil;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserLinkDaoImpl extends DaoSupport implements UserLinkDao {

	/**
	 * 创建对象
	 */
	public UserLink save(UserLink user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserLink record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserLink get(Serializable id) {
        return super.get(UserLink.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserLink record) {
		super.update(record);
	}

	public UserLink getUserLink(Integer userId, Integer bindType) {
		String hql = " from UserLink l where l.user.id = ? and l.linkType = ?";
		Object[] params = new Object[]{userId,bindType};
		List<UserLink> list = super.find(hql,params);
		if(null != list && list.size()>0) return list.get(0);
		return null;
	}

	public UserLink getSinaDefaultUser() {
		String hql = " from UserLink l where l.linkField4 = ? and l.linkType = ?";
		Object[] params = new Object[]{Constant.sinaAdminUserId,Constant.LINKTYPE_BIND_SINA};
		List<UserLink> list = super.find(hql,params);
		if(null != list && list.size()>0) return list.get(0);
		return null;
	}

	public void changeAdMailPassword(String email, String password) {
		String hql = "update UserLink l set l.linkField2 = ? where l.linkField3 = ? and l.linkField1 = ?";
		String name = email;
    	if(email.indexOf("@")!= -1) name = email.substring(0, email.indexOf("@"));
		Object[] params = new Object[]{StringUtil.encode(password),Constant.GIANT_EMAIL_HOST,name};
		super.bulkUpdate(hql, params);
	}

	public List<UserLink> getUserLinks(Integer userId, Integer[] types) {
		String hql = " from UserLink l where l.user.id = :userId ";
		Object[] params = new Object[]{userId};
		String[] names = new String[]{"userId"};
		if(types!=null){
			hql += " and l.linkType in (:types)";
			params = new Object[]{userId,types};
			names = new String[]{"userId","types"};
		}
		return super.find(hql, names, params);
	}


}
