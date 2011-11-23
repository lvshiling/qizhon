/**
 * 
 */
package com.navigation.jiasu.dao.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.PageBean;
import com.navigation.jiasu.dao.GameDownStatusDao;
import com.navigation.jiasu.pojo.GameDownStatus;
import com.navigation.utils.DateUtils;

/**
 * @author WANGHUI
 * Apr 8, 2011 11:21:36 AM
 */
public class GameDownStatusImpl extends DaoSupport implements GameDownStatusDao {

	/**
	 * 创建对象
	 */
	public GameDownStatus save(GameDownStatus user){
		super.save(user);
		return user;
	}
	
	/**
	 * 删除对象
	 */
    public void delete(GameDownStatus record) {
        super.delete(record);
    }
    
    /**
     * 返回对象
     */
	public GameDownStatus get(Serializable id) {
        return super.get(GameDownStatus.class, id);
    }

	/**
	 * 更新对象
	 */
	public void update(GameDownStatus record) {
		super.update(record);
	}

	@SuppressWarnings("unchecked")
	public void updateGame(String gameName, String gameVersion, String host) {
		GameDownStatus gameDownStatus = null;
		System.out.println(gameName);
		System.out.println(gameVersion);
		String hql = "from GameDownStatus g where g.game = ? and g.name = ?";
		Object[] params = new Object[]{gameName,gameVersion};
		List<GameDownStatus> list = super.find(hql, params,0,1);
		if(list!= null && list.size()>0) gameDownStatus = list.get(0);
		
		//不存在对象 则创建
		if(gameDownStatus == null){
			gameDownStatus = new GameDownStatus();
			gameDownStatus.setGame(gameName);
			gameDownStatus.setName(gameVersion);
			gameDownStatus.setNumber(1);
			this.save(gameDownStatus);
		}else{
			gameDownStatus.setNumber(gameDownStatus.getNumber()+1);
			this.update(gameDownStatus);
		}
		
	}



}
