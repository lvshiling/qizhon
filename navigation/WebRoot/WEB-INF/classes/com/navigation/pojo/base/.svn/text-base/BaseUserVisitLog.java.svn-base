package com.navigation.pojo.base;

import java.util.Date;

/**
 * AbstractUserVisitLog entity provides the base persistence definition of the
 * UserVisitLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseUserVisitLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer owner;
	private Integer visits;
	private Integer page;
	private Date date;

	// Constructors

	/** default constructor */
	public BaseUserVisitLog() {
	}

	/** minimal constructor */
	public BaseUserVisitLog(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public BaseUserVisitLog(Integer id, Integer owner, Integer visits, Integer page, Date date) {
		this.id = id;
		this.owner = owner;
		this.visits = visits;
		this.page = page;
		this.date = date;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOwner() {
		return this.owner;
	}

	public void setOwner(Integer owner) {
		this.owner = owner;
	}

	public Integer getVisits() {
		return this.visits;
	}

	public void setVisits(Integer visits) {
		this.visits = visits;
	}

	public Integer getPage() {
		return this.page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}