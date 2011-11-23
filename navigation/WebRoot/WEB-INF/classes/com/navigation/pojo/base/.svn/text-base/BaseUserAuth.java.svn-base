package com.navigation.pojo.base;

import java.util.Date;

/**
 * BaseUserAuth entity provides the base persistence definition of the
 * UserAuth entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseUserAuth implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer status;
	private String photoName;
	private Integer operator;
	private Date createTime;
	private Date updateTime;

	// Constructors

	/** default constructor */
	public BaseUserAuth() {
	}

	/** full constructor */
	public BaseUserAuth(Integer userId, Integer status, String photoName, Integer operator, Date createTime, Date updateTime) {
		this.userId = userId;
		this.status = status;
		this.photoName = photoName;
		this.operator = operator;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getOperator() {
		return this.operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
}