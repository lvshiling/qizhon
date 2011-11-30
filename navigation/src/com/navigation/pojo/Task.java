package com.navigation.pojo;

import com.navigation.pojo.base.BaseTask;

/**
 * Task entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Task extends BaseTask implements java.io.Serializable {

	private static final long serialVersionUID = 2626362681683222313L;

	// Constructors

	/** default constructor */
	public Task() {
	}

	/** minimal constructor */
	public Task(Integer id) {
		super(id);
	}

}
