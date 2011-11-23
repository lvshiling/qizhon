package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the news table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="news"
 */

public abstract class BaseNews  implements Serializable {

	public static String REF = "News";
	public static String PROP_AREA = "area";
	public static String PROP_TITLE = "title";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_CONTENT = "content";
	public static String PROP_ID = "id";


	// constructors
	public BaseNews () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseNews (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String title;
	private java.lang.String content;
	private java.util.Date addTime;

	// many to one
	private com.navigation.pojo.Area area;



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
	 * Return the value associated with the column: title
	 */
	public java.lang.String getTitle () {
		return title;
	}

	/**
	 * Set the value related to the column: title
	 * @param title the title value
	 */
	public void setTitle (java.lang.String title) {
		this.title = title;
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




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.News)) return false;
		else {
			com.navigation.pojo.News news = (com.navigation.pojo.News) obj;
			if (null == this.getId() || null == news.getId()) return false;
			else return (this.getId().equals(news.getId()));
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