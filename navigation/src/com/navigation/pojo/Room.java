package com.navigation.pojo;

import java.util.Date;

import com.navigation.pojo.base.BaseRoom;

/**
 * Room entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Room extends BaseRoom implements java.io.Serializable {

	// Constructors
	private static final long serialVersionUID = -291637697918747819L;

	/** default constructor */
	public Room() {
	}

	/** minimal constructor */
	public Room(Integer id) {
		super(id);
	}

	/** full constructor */
	public Room(Integer id, Integer roomNo, Integer userId, String roomName, Date createTime) {
		super(id, roomNo, userId, roomName, createTime);
	}

}
