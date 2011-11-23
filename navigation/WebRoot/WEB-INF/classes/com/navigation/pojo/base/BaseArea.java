package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the area table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="area"
 */

public abstract class BaseArea  implements Serializable {

	public static String REF = "Area";
	public static String PROP_NAME = "name";
	public static String PROP_ID = "id";


	// constructors
	public BaseArea () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseArea (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String name;

	// collections
	private java.util.Set<com.navigation.pojo.UserArea> userAreas;
	private java.util.Set<com.navigation.pojo.TopicSort> topicSorts;
	private java.util.Set<com.navigation.pojo.News> newses;
	private java.util.Set<com.navigation.pojo.Topic> topics;



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
	 * Return the value associated with the column: name
	 */
	public java.lang.String getName () {
		return name;
	}

	/**
	 * Set the value related to the column: name
	 * @param name the name value
	 */
	public void setName (java.lang.String name) {
		this.name = name;
	}



	/**
	 * Return the value associated with the column: userAreas
	 */
	public java.util.Set<com.navigation.pojo.UserArea> getUserAreas () {
		return userAreas;
	}

	/**
	 * Set the value related to the column: userAreas
	 * @param userAreas the userAreas value
	 */
	public void setUserAreas (java.util.Set<com.navigation.pojo.UserArea> userAreas) {
		this.userAreas = userAreas;
	}

	public void addTouserAreas (com.navigation.pojo.UserArea userArea) {
		if (null == getUserAreas()) setUserAreas(new java.util.TreeSet<com.navigation.pojo.UserArea>());
		getUserAreas().add(userArea);
	}



	/**
	 * Return the value associated with the column: topicSorts
	 */
	public java.util.Set<com.navigation.pojo.TopicSort> getTopicSorts () {
		return topicSorts;
	}

	/**
	 * Set the value related to the column: topicSorts
	 * @param topicSorts the topicSorts value
	 */
	public void setTopicSorts (java.util.Set<com.navigation.pojo.TopicSort> topicSorts) {
		this.topicSorts = topicSorts;
	}

	public void addTotopicSorts (com.navigation.pojo.TopicSort topicSort) {
		if (null == getTopicSorts()) setTopicSorts(new java.util.TreeSet<com.navigation.pojo.TopicSort>());
		getTopicSorts().add(topicSort);
	}



	/**
	 * Return the value associated with the column: newses
	 */
	public java.util.Set<com.navigation.pojo.News> getNewses () {
		return newses;
	}

	/**
	 * Set the value related to the column: newses
	 * @param newses the newses value
	 */
	public void setNewses (java.util.Set<com.navigation.pojo.News> newses) {
		this.newses = newses;
	}

	public void addTonewses (com.navigation.pojo.News news) {
		if (null == getNewses()) setNewses(new java.util.TreeSet<com.navigation.pojo.News>());
		getNewses().add(news);
	}



	/**
	 * Return the value associated with the column: topics
	 */
	public java.util.Set<com.navigation.pojo.Topic> getTopics () {
		return topics;
	}

	/**
	 * Set the value related to the column: topics
	 * @param topics the topics value
	 */
	public void setTopics (java.util.Set<com.navigation.pojo.Topic> topics) {
		this.topics = topics;
	}

	public void addTotopics (com.navigation.pojo.Topic topic) {
		if (null == getTopics()) setTopics(new java.util.TreeSet<com.navigation.pojo.Topic>());
		getTopics().add(topic);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.Area)) return false;
		else {
			com.navigation.pojo.Area area = (com.navigation.pojo.Area) obj;
			if (null == this.getId() || null == area.getId()) return false;
			else return (this.getId().equals(area.getId()));
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