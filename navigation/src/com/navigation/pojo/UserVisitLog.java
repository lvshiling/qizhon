package com.navigation.pojo;

import java.util.Date;

import com.navigation.pojo.base.BaseUserVisitLog;

/**
 * UserVisitLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserVisitLog extends BaseUserVisitLog implements java.io.Serializable {

	private static final long serialVersionUID = -9003306518289848987L;

	// Constructors

	/** default constructor */
	public UserVisitLog() {
	}

	/** minimal constructor */
	public UserVisitLog(Integer id) {
		super(id);
	}

	/** full constructor */
	public UserVisitLog(Integer id, Integer owner, Integer visits, Integer page, Date date) {
		super(id, owner, visits, page, date);
	}

}
