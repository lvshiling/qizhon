package com.navigation.jiasu.dao;

import java.io.Serializable;
import java.util.List;

import com.navigation.domain.PageBean;
import com.navigation.jiasu.pojo.GameZone;

public interface GameZoneDao {

	/**
	 * 获取所有游戏区 - 游戏名- 区号 - 端口号
	 * 
	 * @param record
	 * @return
	 */
	public List<GameZone> getGameZonesList();

	/**
	 * @param record
	 * @return
	 */
	public Serializable save(GameZone record);

	/**
	 * 通过主键获取实体
	 * 
	 * @param id
	 * @return
	 */
	public GameZone get(Serializable id);

	/**
	 * 更新实体对象
	 * 
	 * @param record
	 */
	public void update(GameZone record);

	/**
	 * 更新或新增实体
	 * 
	 * @param record
	 */
	public void saveOrUpdate(GameZone record);

	/**
	 * 根据游戏名和区名查找实体
	 * 
	 * @param game
	 * @param zone
	 * @return
	 */
	public GameZone getByGameZone(String game, String zone);

	/**
	 * 分页查询列表
	 * 
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public PageBean getGameZonesList(Integer p, Integer pageSize);
}
