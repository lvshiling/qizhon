package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_link table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_link"
 */

public abstract class BaseUserLink  implements Serializable {

	public static String REF = "UserLink";
	public static String PROP_LINK_FIELD3 = "linkField3";
	public static String PROP_UPDATE_TIME = "updateTime";
	public static String PROP_LINK_FIELD1 = "linkField1";
	public static String PROP_LINK_FIELD2 = "linkField2";
	public static String PROP_USER = "user";
	public static String PROP_LINK_TYPE = "linkType";
	public static String PROP_LINK_FIELD4 = "linkField4";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserLink () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserLink (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer linkType;
	private java.lang.String linkField1;
	private java.lang.String linkField2;
	private java.lang.String linkField3;
	private java.lang.String linkField4;
	private java.util.Date updateTime;

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
	 * Return the value associated with the column: link_type
	 */
	public java.lang.Integer getLinkType () {
		return linkType;
	}

	/**
	 * Set the value related to the column: link_type
	 * @param linkType the link_type value
	 */
	public void setLinkType (java.lang.Integer linkType) {
		this.linkType = linkType;
	}



	/**
	 * Return the value associated with the column: link_field_1
	 */
	public java.lang.String getLinkField1 () {
		return linkField1;
	}

	/**
	 * Set the value related to the column: link_field_1
	 * @param linkField1 the link_field_1 value
	 */
	public void setLinkField1 (java.lang.String linkField1) {
		this.linkField1 = linkField1;
	}



	/**
	 * Return the value associated with the column: link_field_2
	 */
	public java.lang.String getLinkField2 () {
		return linkField2;
	}

	/**
	 * Set the value related to the column: link_field_2
	 * @param linkField2 the link_field_2 value
	 */
	public void setLinkField2 (java.lang.String linkField2) {
		this.linkField2 = linkField2;
	}



	/**
	 * Return the value associated with the column: link_field_3
	 */
	public java.lang.String getLinkField3 () {
		return linkField3;
	}

	/**
	 * Set the value related to the column: link_field_3
	 * @param linkField3 the link_field_3 value
	 */
	public void setLinkField3 (java.lang.String linkField3) {
		this.linkField3 = linkField3;
	}



	/**
	 * Return the value associated with the column: link_field_4
	 */
	public java.lang.String getLinkField4 () {
		return linkField4;
	}

	/**
	 * Set the value related to the column: link_field_4
	 * @param linkField4 the link_field_4 value
	 */
	public void setLinkField4 (java.lang.String linkField4) {
		this.linkField4 = linkField4;
	}



	/**
	 * Return the value associated with the column: update_time
	 */
	public java.util.Date getUpdateTime () {
		return updateTime;
	}

	/**
	 * Set the value related to the column: update_time
	 * @param updateTime the update_time value
	 */
	public void setUpdateTime (java.util.Date updateTime) {
		this.updateTime = updateTime;
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
		if (!(obj instanceof com.navigation.pojo.UserLink)) return false;
		else {
			com.navigation.pojo.UserLink userLink = (com.navigation.pojo.UserLink) obj;
			if (null == this.getId() || null == userLink.getId()) return false;
			else return (this.getId().equals(userLink.getId()));
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