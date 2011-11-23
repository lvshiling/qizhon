/**
 * 
 */
package com.navigation.dao;

import java.io.Serializable;

import com.navigation.pojo.Room;

/**
 * @author Administrator
 * 
 */
public interface RoomDao {

	/**
	 * @param record
	 * @return
	 */
	public Room save(Room record);

	/**
	 * 通过主键获取实体.
	 * 
	 * @param <T>
	 *            被查询实体
	 * @param c
	 *            实体类型
	 * @param id
	 *            主键值
	 * @return the T 被查询实体
	 */
	public Room get(Serializable id);

	/**
	 * 更新实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void update(Room record);

	/**
	 * 删除实体对象.
	 * 
	 * @param record
	 *            实体对象
	 */
	public void delete(Room record);

	/**
	 * 根据房号查找房间
	 * 
	 * @param roomNo
	 * @return
	 */
	public Room getRoom(Integer roomNo);

	/**
	 * 根据拥有者查找房间
	 * 
	 * @param userId
	 * @return
	 */
	public Room getByOwner(Integer userId);
}
