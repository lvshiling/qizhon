package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the tag table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="tag"
 */

public abstract class BaseTag  implements Serializable {

	public static String REF = "Tag";
	public static String PROP_TAG_NAME = "tagName";
	public static String PROP_ID = "id";


	// constructors
	public BaseTag () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTag (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String tagName;

	// collections
	private java.util.Set<com.navigation.pojo.UserTag> userTags;



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
	 * Return the value associated with the column: tag_name
	 */
	public java.lang.String getTagName () {
		return tagName;
	}

	/**
	 * Set the value related to the column: tag_name
	 * @param tagName the tag_name value
	 */
	public void setTagName (java.lang.String tagName) {
		this.tagName = tagName;
	}



	/**
	 * Return the value associated with the column: userTags
	 */
	public java.util.Set<com.navigation.pojo.UserTag> getUserTags () {
		return userTags;
	}

	/**
	 * Set the value related to the column: userTags
	 * @param userTags the userTags value
	 */
	public void setUserTags (java.util.Set<com.navigation.pojo.UserTag> userTags) {
		this.userTags = userTags;
	}

	public void addTouserTags (com.navigation.pojo.UserTag userTag) {
		if (null == getUserTags()) setUserTags(new java.util.TreeSet<com.navigation.pojo.UserTag>());
		getUserTags().add(userTag);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.Tag)) return false;
		else {
			com.navigation.pojo.Tag tag = (com.navigation.pojo.Tag) obj;
			if (null == this.getId() || null == tag.getId()) return false;
			else return (this.getId().equals(tag.getId()));
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