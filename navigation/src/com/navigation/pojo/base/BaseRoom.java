package com.navigation.pojo.base;

import java.util.Date;

/**
 * AbstractRoom entity provides the base persistence definition of the Room
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseRoom implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roomNo;
	private Integer userId;
	private String roomName;
	private Date createTime;

	// Constructors

	/** default constructor */
	public BaseRoom() {
	}

	/** minimal constructor */
	public BaseRoom(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public BaseRoom(Integer id, Integer roomNo, Integer userId, String roomName, Date createTime) {
		this.id = id;
		this.roomNo = roomNo;
		this.userId = userId;
		this.roomName = roomName;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoomNo() {
		return this.roomNo;
	}

	public void setRoomNo(Integer roomNo) {
		this.roomNo = roomNo;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getRoomName() {
		return this.roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}