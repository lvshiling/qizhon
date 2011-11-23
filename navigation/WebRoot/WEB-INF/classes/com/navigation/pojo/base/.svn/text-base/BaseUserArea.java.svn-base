package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_area table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_area"
 */

public abstract class BaseUserArea  implements Serializable {

	public static String REF = "UserArea";
	public static String PROP_USER = "user";
	public static String PROP_AREA = "area";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserArea () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserArea (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// many to one
	private com.navigation.pojo.Area area;
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
	 * Return the value associated with the column: area_id
	 */
	public com.navigation.pojo.Area getArea () {
		return area;
	}

	/**
	 * Set the value related to the column: area_id
	 * @param area the area_id value
	 */
	public void setArea (com.navigation.pojo.Area area) {
		this.area = area;
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
		if (!(obj instanceof com.navigation.pojo.UserArea)) return false;
		else {
			com.navigation.pojo.UserArea userArea = (com.navigation.pojo.UserArea) obj;
			if (null == this.getId() || null == userArea.getId()) return false;
			else return (this.getId().equals(userArea.getId()));
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