/**
 * 
 */
package com.navigation.dao.Impl;

import java.io.Serializable;
import java.util.List;

import com.navigation.dao.RoomDao;
import com.navigation.dao.base.DaoSupport;
import com.navigation.pojo.Room;

/**
 * @author zhuchuanyong
 */
@SuppressWarnings("unchecked")
public class RoomDaoImpl extends DaoSupport implements RoomDao {

	/**
	 * 创建对象
	 */
	public Room save(Room user) {
		super.save(user);
		return user;
	}

	/**
	 * 删除对象
	 */
	public void delete(Room record) {
		super.delete(record);
	}

	/**
	 * 返回对象
	 */
	public Room get(Serializable id) {
		return super.get(Room.class, id);
	}

	/**
	 * 更新对象
	 */
	public void update(Room record) {
		super.update(record);
	}

	@Override
	public Room getByOwner(Integer userId) {
		String hql = "from Room r where r.userId = ?";
		Object[] params = new Object[] { userId };
		List<Room> list = super.find(hql, params, 0, 1);
		if (list != null && !list.isEmpty())
			return list.get(0);
		return null;
	}

	@Override
	public Room getRoom(Integer roomNo) {
		String hql = "from Room r where r.roomNo = ?";
		Object[] params = new Object[] { roomNo };
		List<Room> list = super.find(hql, params, 0, 1);
		if (list != null && !list.isEmpty())
			return list.get(0);
		return null;
	}
}
