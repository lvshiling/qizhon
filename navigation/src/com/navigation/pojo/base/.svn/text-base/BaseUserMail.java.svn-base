package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_mail table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_mail"
 */

public abstract class BaseUserMail  implements Serializable {

	public static String REF = "UserMail";
	public static String PROP_SID = "sid";
	public static String PROP_MAIL_TITLE = "mailTitle";
	public static String PROP_USER_ID = "userId";
	public static String PROP_SEND_TIME = "sendTime";
	public static String PROP_ACCOUNT_ID = "accountId";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserMail () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserMail (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer accountId;
	private java.lang.Integer userId;
	private java.lang.String mailTitle;
	private java.util.Date sendTime;
	private java.lang.String sid;
	private java.util.Date addTime;



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
	 * Return the value associated with the column: account_id
	 */
	public java.lang.Integer getAccountId () {
		return accountId;
	}

	/**
	 * Set the value related to the column: account_id
	 * @param accountId the account_id value
	 */
	public void setAccountId (java.lang.Integer accountId) {
		this.accountId = accountId;
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
	 * Return the value associated with the column: mail_title
	 */
	public java.lang.String getMailTitle () {
		return mailTitle;
	}

	/**
	 * Set the value related to the column: mail_title
	 * @param mailTitle the mail_title value
	 */
	public void setMailTitle (java.lang.String mailTitle) {
		this.mailTitle = mailTitle;
	}



	/**
	 * Return the value associated with the column: send_time
	 */
	public java.util.Date getSendTime () {
		return sendTime;
	}

	/**
	 * Set the value related to the column: send_time
	 * @param sendTime the send_time value
	 */
	public void setSendTime (java.util.Date sendTime) {
		this.sendTime = sendTime;
	}



	/**
	 * Return the value associated with the column: sid
	 */
	public java.lang.String getSid () {
		return sid;
	}

	/**
	 * Set the value related to the column: sid
	 * @param sid the sid value
	 */
	public void setSid (java.lang.String sid) {
		this.sid = sid;
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
		if (!(obj instanceof com.navigation.pojo.UserMail)) return false;
		else {
			com.navigation.pojo.UserMail userMail = (com.navigation.pojo.UserMail) obj;
			if (null == this.getId() || null == userMail.getId()) return false;
			else return (this.getId().equals(userMail.getId()));
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


}