package com.navigation.pojo.base;

import java.util.Date;

/**
 * AbstractUserScoreLog entity provides the base persistence definition of the
 * UserScoreLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseUserScoreLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Double score;
	private String userPhoto;
	private Integer scorer;
	private Date createTime;

	// Constructors

	/** default constructor */
	public BaseUserScoreLog() {
	}

	/** minimal constructor */
	public BaseUserScoreLog(Integer id) {
		this.id = id;
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

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getUserPhoto() {
		return this.userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public Integer getScorer() {
		return this.scorer;
	}

	public void setScorer(Integer scorer) {
		this.scorer = scorer;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}