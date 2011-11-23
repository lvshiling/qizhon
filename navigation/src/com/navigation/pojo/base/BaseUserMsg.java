package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_msg table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_msg"
 */

public abstract class BaseUserMsg  implements Serializable {

	public static String REF = "UserMsg";
	public static String PROP_FROM_ID = "fromId";
	public static String PROP_USER_ID = "userId";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_CONTENT = "content";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserMsg () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserMsg (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer userId;
	private java.lang.Integer fromId;
	private java.lang.Integer state;
	private java.lang.String content;
	private java.util.Date addTime;



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
	 * Return the value associated with the column: user_id
	 */
	public java.lang.Integer getUserId () {
		return userId;
	}

	/**
	 * Set the value related to the column: user_id
	 * @param userId the user_id value
	 */
	public void setUserId (java.lang.Integer userId) {
		this.userId = userId;
	}



	/**
	 * Return the value associated with the column: from_id
	 */
	public java.lang.Integer getFromId () {
		return fromId;
	}

	/**
	 * Set the value related to the column: from_id
	 * @param fromId the from_id value
	 */
	public void setFromId (java.lang.Integer fromId) {
		this.fromId = fromId;
	}



	/**
	 * Return the value associated with the column: content
	 */
	public java.lang.String getContent () {
		return content;
	}

	/**
	 * Set the value related to the column: content
	 * @param content the content value
	 */
	public void setContent (java.lang.String content) {
		this.content = content;
	}



	/**
	 * Return the value associated with the column: add_time
	 */
	public java.util.Date getAddTime () {
		return addTime;
	}

	/**
	 * Set the value related to the column: add_time
	 * @param addTime the add_time value
	 */
	public void setAddTime (java.util.Date addTime) {
		this.addTime = addTime;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.UserMsg)) return false;
		else {
			com.navigation.pojo.UserMsg userMsg = (com.navigation.pojo.UserMsg) obj;
			if (null == this.getId() || null == userMsg.getId()) return false;
			else return (this.getId().equals(userMsg.getId()));
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

	public java.lang.Integer getState() {
		return state;
	}

	public void setState(java.lang.Integer state) {
		this.state = state;
	}


}