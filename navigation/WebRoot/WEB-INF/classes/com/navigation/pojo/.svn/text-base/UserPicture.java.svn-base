package com.navigation.pojo;

import com.navigation.pojo.base.BaseUserPicture;

public class UserPicture extends BaseUserPicture {
	private static final long serialVersionUID = 1L;

	/* [CONSTRUCTOR MARKER BEGIN] */
	public UserPicture() {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public UserPicture(java.lang.Integer id) {
		super(id);
	}

	/* [CONSTRUCTOR MARKER END] */
	public String path;

	public String getPath() {
		// path =
		// Constant.getStaticPath()+"/upload/picture/"+this.getUser().getId()+"/"+this.getPicturePath();
		path = "/upload/picture/" + this.getUser().getId() + "/" + this.getPicturePath();
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getAvatar() {
		return "/upload/avatar/" + this.getUser().getId() + "_1.jpg";
	}

}