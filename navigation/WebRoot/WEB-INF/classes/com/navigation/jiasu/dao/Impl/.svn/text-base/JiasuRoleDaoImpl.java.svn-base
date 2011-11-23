package com.navigation.jiasu.dao.Impl;

import java.util.List;

import com.navigation.dao.base.DaoSupport;
import com.navigation.jiasu.dao.JiasuRoleDao;
import com.navigation.jiasu.pojo.JiasuRole;

public class JiasuRoleDaoImpl  extends DaoSupport implements JiasuRoleDao {
 
	
	// answer 9-2
	@Override
	public  List isJiasuAdmin(Integer id) {
		
		boolean boo =false;
		String hql = "from JiasuRole where user_id = "+id;       
		Object[] params = new Object[] {id};		
		List<JiasuRole> list = super.find(hql,null);		
		return list;
	}

	@Override
	public void update(JiasuRole jiasuRole) {
		
		super.saveOrUpdate(jiasuRole);
		
	}
	
			

	
	
	
  
}
