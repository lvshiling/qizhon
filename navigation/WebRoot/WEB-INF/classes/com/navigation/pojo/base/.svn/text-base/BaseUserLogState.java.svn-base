package com.navigation.pojo.base;

import java.io.Serializable;

/**
 * This is an object that contains data related to the user_log_state table. Do
 * not modify this class because it will be overwritten if the configuration
 * file related to this class is modified.
 * 
 * @hibernate.class table="user_log_state"
 */

public abstract class BaseUserLogState implements Serializable {

	public static String REF = "UserLogState";
	public static String PROP_LOG_STATE = "logState";
	public static String PROP_LAST_LOGIN_TIME = "lastLoginTime";
	public static String PROP_ONLINE_TIME = "onlineTime";
	public static String PROP_LOG_HASH_CODE = "logHashCode";
	public static String PROP_ID = "id";
	public static String PROP_LIVE_STATE = "liveState";
	public static String PROP_CAM_NUM = "camNum";

	// constructors
	public BaseUserLogState() {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserLogState(java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize() {
	}

	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer userId;
	private java.lang.Integer logState;
	private java.lang.String logHashCode;
	private java.util.Date lastLoginTime;
	private java.lang.Integer onlineTime;
	private java.lang.Integer liveState;
	private java.util.Date lastLiveTime;
	private java.lang.Integer camNum;

	/**
	 * Return the unique identifier of this class
	 * 
	 * @hibernate.id generator-class="increment" column="id"
	 */
	public java.lang.Integer getId() {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * 
	 * @param id
	 *            the new ID
	 */
	public void setId(java.lang.Integer id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}

	/**
	 * Return the value associated with the column: log_state
	 */
	public java.lang.Integer getLogState() {
		return logState;
	}

	/**
	 * Set the value related to the column: log_state
	 * 
	 * @param logState
	 *            the log_state value
	 */
	public void setLogState(java.lang.Integer logState) {
		this.logState = logState;
	}

	/**
	 * Return the value associated with the column: log_hash_code
	 */
	public java.lang.String getLogHashCode() {
		return logHashCode;
	}

	/**
	 * Set the value related to the column: log_hash_code
	 * 
	 * @param logHashCode
	 *            the log_hash_code value
	 */
	public void setLogHashCode(java.lang.String logHashCode) {
		this.logHashCode = logHashCode;
	}

	/**
	 * Return the value associated with the column: last_login_time
	 */
	public java.util.Date getLastLoginTime() {
		return lastLoginTime;
	}

	/**
	 * Set the value related to the column: last_login_time
	 * 
	 * @param lastLoginTime
	 *            the last_login_time value
	 */
	public void setLastLoginTime(java.util.Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	/**
	 * Return the value associated with the column: online_time
	 */
	public java.lang.Integer getOnlineTime() {
		return onlineTime;
	}

	/**
	 * Set the value related to the column: online_time
	 * 
	 * @param onlineTime
	 *            the online_time value
	 */
	public void setOnlineTime(java.lang.Integer onlineTime) {
		this.onlineTime = onlineTime;
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof com.navigation.pojo.UserLogState))
			return false;
		else {
			com.navigation.pojo.UserLogState userLogState = (com.navigation.pojo.UserLogState) obj;
			if (null == this.getId() || null == userLogState.getId())
				return false;
			else
				return (this.getId().equals(userLogState.getId()));
		}
	}

	public int hashCode() {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId())
				return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}

	public String toString() {
		return super.toString();
	}

	public java.lang.Integer getLiveState() {
		return liveState;
	}

	public void setLiveState(java.lang.Integer liveState) {
		this.liveState = liveState;
	}

	public java.util.Date getLastLiveTime() {
		return lastLiveTime;
	}

	public void setLastLiveTime(java.util.Date lastLiveTime) {
		this.lastLiveTime = lastLiveTime;
	}

	public java.lang.Integer getUserId() {
		return userId;
	}

	public void setUserId(java.lang.Integer userId) {
		this.userId = userId;
	}

	public java.lang.Integer getCamNum() {
		return camNum;
	}

	public void setCamNum(java.lang.Integer camNum) {
		this.camNum = camNum;
	}

}