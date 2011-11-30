package com.navigation.pojo;

import com.navigation.pojo.base.BaseUserNews;

/**
 * UserNews entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserNews extends BaseUserNews implements java.io.Serializable {

	// Constructors
	private static final long serialVersionUID = -8700440987873370444L;
	
	private String userName;
	private String refUserName;

	/** default constructor */
	public UserNews() {
	}

	/** minimal constructor */
	public UserNews(Integer id) {
		super(id);
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRefUserName() {
		return refUserName;
	}

	public void setRefUserName(String refUserName) {
		this.refUserName = refUserName;
	}
}
