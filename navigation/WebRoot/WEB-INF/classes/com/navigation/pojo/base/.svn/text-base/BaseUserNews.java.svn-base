package com.navigation.pojo.base;

import java.util.Date;

/**
 * AbstractUserNews entity provides the base persistence definition of the
 * UserNews entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseUserNews implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String content;
	private Integer type;
	private Date updateTime;
	private Integer refId;
	private String refImg;
	private Integer refUid;
	private Integer userGrade;

	// Constructors

	/** default constructor */
	public BaseUserNews() {
	}

	/** minimal constructor */
	public BaseUserNews(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public BaseUserNews(Integer id, Integer userId, String content, Integer type, Date updateTime, Integer refId, String refImg,
			Integer refUid, Integer userGrade) {
		this.id = id;
		this.userId = userId;
		this.content = content;
		this.type = type;
		this.updateTime = updateTime;
		this.refId = refId;
		this.refImg = refImg;
		this.refUid = refUid;
		this.userGrade = userGrade;
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

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getRefId() {
		return refId;
	}

	public void setRefId(Integer refId) {
		this.refId = refId;
	}

	public String getRefImg() {
		return refImg;
	}

	public void setRefImg(String refImg) {
		this.refImg = refImg;
	}

	public Integer getRefUid() {
		return refUid;
	}

	public void setRefUid(Integer refUid) {
		this.refUid = refUid;
	}

	public Integer getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(Integer userGrade) {
		this.userGrade = userGrade;
	}
}