package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_picture table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_picture"
 */

public abstract class BaseUserPicture  implements Serializable {

	public static String REF = "UserPicture";
	public static String PROP_PICTURE_PATH = "picturePath";
	public static String PROP_USER = "user";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserPicture () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserPicture (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String picturePath;
	
	private java.util.Date updateTime;
	
	// many to one
	private com.navigation.pojo.User user;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="identity"
     *  column="id"
     */
	public java.lang.Integer getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.Integer id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: picture_path
	 */
	public java.lang.String getPicturePath () {
		return picturePath;
	}

	/**
	 * Set the value related to the column: picture_path
	 * @param picturePath the picture_path value
	 */
	public void setPicturePath (java.lang.String picturePath) {
		this.picturePath = picturePath;
	}



	/**
	 * Return the value associated with the column: user_id
	 */
	public com.navigation.pojo.User getUser () {
		return user;
	}

	/**
	 * Set the value related to the column: user_id
	 * @param user the user_id value
	 */
	public void setUser (com.navigation.pojo.User user) {
		this.user = user;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.UserPicture)) return false;
		else {
			com.navigation.pojo.UserPicture userPicture = (com.navigation.pojo.UserPicture) obj;
			if (null == this.getId() || null == userPicture.getId()) return false;
			else return (this.getId().equals(userPicture.getId()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}

	public java.util.Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}

}