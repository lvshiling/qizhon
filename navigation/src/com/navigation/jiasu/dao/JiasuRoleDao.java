package com.navigation.jiasu.dao;

import java.util.List;

import com.navigation.jiasu.pojo.GameZone;
import com.navigation.jiasu.pojo.JiasuRole;


public interface JiasuRoleDao {
   
	/**
	 * 获取用户名，ID，角色
	 * @param record
	 * @return
	 */
	public List  isJiasuAdmin(Integer id);
	
	
	// 更新
	
	public void update(JiasuRole jiasuRole);
	
}
