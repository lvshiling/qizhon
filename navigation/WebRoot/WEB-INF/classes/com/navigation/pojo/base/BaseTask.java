package com.navigation.pojo.base;

import java.util.Date;

/**
 * AbstractTask entity provides the base persistence definition of the Task
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseTask implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String userName;
	private Integer status;
	private String name;
	private String content;
	private Float offerPrice;
	private Date startDate;
	private Date endDate;
	private Integer winnerId;
	private String winnerName;
	private Integer taskAcptId;
	private Date createTime;
	private Date updateTime;

	// Constructors

	/** default constructor */
	public BaseTask() {
	}

	/** minimal constructor */
	public BaseTask(Integer id) {
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

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Float getOfferPrice() {
		return this.offerPrice;
	}

	public void setOfferPrice(Float offerPrice) {
		this.offerPrice = offerPrice;
	}

	public Integer getWinnerId() {
		return this.winnerId;
	}

	public void setWinnerId(Integer winnerId) {
		this.winnerId = winnerId;
	}

	public String getWinnerName() {
		return this.winnerName;
	}

	public void setWinnerName(String winnerName) {
		this.winnerName = winnerName;
	}

	public Integer getTaskAcptId() {
		return this.taskAcptId;
	}

	public void setTaskAcptId(Integer taskAcptId) {
		this.taskAcptId = taskAcptId;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

}