package com.navigation.pojo;

import com.navigation.pojo.base.BaseUser;

public class User extends BaseUser {
	private static final long serialVersionUID = 1L;

	/* [CONSTRUCTOR MARKER BEGIN] */
	public User() {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public User(java.lang.Integer id) {
		super(id);
	}

	/* [CONSTRUCTOR MARKER END] */

	private UserCredit userCredit;
	private UserLogState userLogState;
	private Room room;

	private String icon1;
	private String icon3;
	private String icon5;

	public String getIcon1() {
		// Constant.getStaticPath()+"/upload/avatar/"+this.getId()+"_1.jpg";
		if (icon1 == null)
			icon1 = "/upload/avatar/" + this.getId() + "_1.jpg";
		return icon1;
	}

	public void setIcon1(String icon1) {
		this.icon1 = icon1;
	}

	public String getIcon3() {
		// Constant.getStaticPath()+"/upload/avatar/"+this.getId()+"_3.jpg";
		if (icon3 == null)
			icon3 = "/upload/avatar/" + this.getId() + "_3.jpg";
		return icon3;
	}

	public void setIcon3(String icon3) {
		this.icon3 = icon3;
	}

	public String getIcon5() {
		// Constant.getStaticPath()+"/upload/avatar/"+this.getId()+"_5.jpg";
		if (icon5 == null)
			icon5 = "/upload/avatar/" + this.getId() + "_5.jpg";
		return icon5;
	}

	public String getPicPath() {
		return "/upload/picture/" + this.getId() + "/" + this.getPic();
	}

	public void setIcon5(String icon5) {
		this.icon5 = icon5;
	}

	public UserCredit getUserCredit() {
		return userCredit;
	}

	public void setUserCredit(UserCredit userCredit) {
		this.userCredit = userCredit;
	}

	public UserLogState getUserLogState() {
		return userLogState;
	}

	public void setUserLogState(UserLogState userLogState) {
		this.userLogState = userLogState;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
}