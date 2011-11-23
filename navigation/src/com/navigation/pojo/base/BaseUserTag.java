package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_tag table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_tag"
 */

public abstract class BaseUserTag  implements Serializable {

	public static String REF = "UserTag";
	public static String PROP_IP_ADDRESS = "ipAddress";
	public static String PROP_USER = "user";
	public static String PROP_TAG = "tag";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserTag () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserTag (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String ipAddress;
	private java.util.Date addTime;

	// many to one
	private com.navigation.pojo.Tag tag;
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
	 * Return the value associated with the column: ip_address
	 */
	public java.lang.String getIpAddress () {
		return ipAddress;
	}

	/**
	 * Set the value related to the column: ip_address
	 * @param ipAddress the ip_address value
	 */
	public void setIpAddress (java.lang.String ipAddress) {
		this.ipAddress = ipAddress;
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



	/**
	 * Return the value associated with the column: tag_id
	 */
	public com.navigation.pojo.Tag getTag () {
		return tag;
	}

	/**
	 * Set the value related to the column: tag_id
	 * @param tag the tag_id value
	 */
	public void setTag (com.navigation.pojo.Tag tag) {
		this.tag = tag;
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
		if (!(obj instanceof com.navigation.pojo.UserTag)) return false;
		else {
			com.navigation.pojo.UserTag userTag = (com.navigation.pojo.UserTag) obj;
			if (null == this.getId() || null == userTag.getId()) return false;
			else return (this.getId().equals(userTag.getId()));
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