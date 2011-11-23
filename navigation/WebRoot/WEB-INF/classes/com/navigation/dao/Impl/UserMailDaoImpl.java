/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;

import com.navigation.dao.UserMailDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.UserLink;
import com.navigation.pojo.UserMail;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class UserMailDaoImpl extends DaoSupport implements UserMailDao {

	/**
	 * 创建对象
	 */
	public UserMail save(UserMail UserMail){
		super.save(UserMail);
		return UserMail;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(UserMail record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public UserMail get(Serializable id) {
        return super.get(UserMail.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(UserMail record) {
		super.update(record);
	}

	public UserMail saveOrNot(UserMail userMail) {
		String hql = "from UserMail m where m.sid = ?";
		Object[] params = new Object[]{userMail.getSid()};
		List<UserMail> list = super.find(hql, params,0,1);
		if(null!=list && list.size()>0){
			return null;
		}else {
			this.save(userMail);
			return userMail;
		}
	}

	public List<UserMail> getUserMail(Integer userId, UserLink link) {
		String hql = "from UserMail m where m.userId = ?";
		Object[] params = new Object[]{userId};
		if(null!= link && link.getId()!=null){
			hql += " and m.accountId = ?";
			params = ArrayUtils.addAll(params, new Object[]{link.getId()});
		}
		hql += " order by id desc";
		return super.find(hql, params,0,10);
	}

	public List<UserMail> getUserMail(Integer userId, Integer p,
			Integer pageSize) {
		String hql = "from UserMail m where m.userId = ? order by m.id desc";
		Object[] params = new Object[]{userId};
		return super.find(hql, params,(p-1)*pageSize,pageSize);
	}

	public List<UserMail> searchMail(Integer userId, String keyWord, Integer p,
			Integer pageSize) {
		int start = (p-1)*pageSize;
		String hql = "from UserMail m where m.mailTitle like :keyWord and m.userId = :userId order by m.id desc";
		Object[] params = new Object[]{"%"+keyWord+"%",userId};
		String[] names = new String[]{"keyWord","userId"}; 
		return super.find(hql, names, params, start,pageSize);
	}



}
