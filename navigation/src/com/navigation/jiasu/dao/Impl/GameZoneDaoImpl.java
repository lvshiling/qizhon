package com.navigation.jiasu.dao.Impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.navigation.dao.base.DaoSupport;
import com.navigation.domain.PageBean;
import com.navigation.jiasu.dao.GameZoneDao;
import com.navigation.jiasu.pojo.GameZone;
import com.navigation.jiasu.pojo.Radacct;
import com.navigation.utils.DateUtils;

public class GameZoneDaoImpl extends DaoSupport implements GameZoneDao {

	public GameZone get(Serializable id) {
		return super.get(GameZone.class, id);
	}

	public Serializable save(GameZone record) {
		return super.save(record);
	}

	public void update(GameZone record) {
		super.update(record);
	}

	public void saveOrUpdate(GameZone record) {
		super.saveOrUpdate(record);
	}

	@SuppressWarnings("unchecked")
	public GameZone getByGameZone(String game, String zone) {
		String hql = "from GameZone g where g.game = ? and g.zone = ?";
		Object[] params = new Object[] { game, zone };
		List<GameZone> list = super.find(hql, params, 0, 1);
		if (list != null && list.size() > 0)
			return list.get(0);
		return null;
	}

	
	//  answer 9-2
	@Override
	public List<GameZone> getGameZonesList() {
		
		String hql  = "from GameZone g ";
		
		List<GameZone> list  = super.find(hql, null);
		
		return list;
		
	}
	
	public PageBean getGameZonesList(Integer p, Integer pageSize) {
		Integer count = this.getListCount();
		if(count > 0 ){
			PageBean pb = new PageBean();
			String hql = "from GameZone";
			List<GameZone> list = super.find(hql,(p-1)*pageSize,pageSize);
			pb.setRecordList(list);
			pb.setRecordCount(count);
			return pb;
		}
		return null;
	}
	
	public Integer getListCount() {
		String hql = "select count(*) from GameZone";
		return super.count(hql);
	}
}
