package com.navigation.pojo;

import java.util.Date;

import com.navigation.pojo.base.BaseUserAuth;

/**
 * UserAuth entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserAuth extends BaseUserAuth implements java.io.Serializable {

	private static final long serialVersionUID = -7283660290483747771L;

	// Constructors

	/** default constructor */
	public UserAuth() {
	}

	/** full constructor */
	public UserAuth(Integer userId, Integer status, String photoName, Integer operator, Date createTime, Date updateTime) {
		super(userId, status, photoName, operator, createTime, updateTime);
	}

}
