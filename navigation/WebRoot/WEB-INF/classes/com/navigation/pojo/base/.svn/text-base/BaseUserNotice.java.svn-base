package com.navigation.pojo.base;

import java.io.Serializable;

import com.google.gson.annotations.Expose;


/**
 * This is an object that contains data related to the user_notice table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_notice"
 */

public abstract class BaseUserNotice  implements Serializable {

	public static String REF = "UserNotice";
	public static String PROP_NOTICE_TYPE = "noticeType";
	public static String PROP_IS_READ = "isRead";
	public static String PROP_USER = "user";
	public static String PROP_ID = "id";
	public static String PROP_REF_ID = "refId";


	// constructors
	public BaseUserNotice () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserNotice (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	@Expose
	private java.lang.Integer id;

	// fields
	@Expose
	private java.lang.Integer noticeType;
	@Expose
	private java.lang.Integer refId;
	@Expose
	private java.lang.Integer isRead;
	@Expose
	private String refTitle;

	// many to one
	private com.navigation.pojo.User user;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="increment"
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
	 * Return the value associated with the column: notice_type
	 */
	public java.lang.Integer getNoticeType () {
		return noticeType;
	}

	/**
	 * Set the value related to the column: notice_type
	 * @param noticeType the notice_type value
	 */
	public void setNoticeType (java.lang.Integer noticeType) {
		this.noticeType = noticeType;
	}



	/**
	 * Return the value associated with the column: ref_id
	 */
	public java.lang.Integer getRefId () {
		return refId;
	}

	/**
	 * Set the value related to the column: ref_id
	 * @param refId the ref_id value
	 */
	public void setRefId (java.lang.Integer refId) {
		this.refId = refId;
	}



	/**
	 * Return the value associated with the column: is_read
	 */
	public java.lang.Integer getIsRead () {
		return isRead;
	}

	/**
	 * Set the value related to the column: is_read
	 * @param isRead the is_read value
	 */
	public void setIsRead (java.lang.Integer isRead) {
		this.isRead = isRead;
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
		if (!(obj instanceof com.navigation.pojo.UserNotice)) return false;
		else {
			com.navigation.pojo.UserNotice userNotice = (com.navigation.pojo.UserNotice) obj;
			if (null == this.getId() || null == userNotice.getId()) return false;
			else return (this.getId().equals(userNotice.getId()));
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

	public String getRefTitle() {
		return refTitle;
	}

	public void setRefTitle(String refTitle) {
		this.refTitle = refTitle;
	}


}