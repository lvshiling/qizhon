package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the topic_sort table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="topic_sort"
 */

public abstract class BaseTopicSort  implements Serializable {

	public static String REF = "TopicSort";
	public static String PROP_SORT_NAME = "sortName";
	public static String PROP_STATE = "state";
	public static String PROP_SORT_DEGREE = "sortDegree";
	public static String PROP_TOPIC_SORT = "topicSort";
	public static String PROP_AREA = "area";
	public static String PROP_ID = "id";


	// constructors
	public BaseTopicSort () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTopicSort (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String sortName;
	private java.lang.Integer sortDegree;
	private java.lang.Integer state;

	// many to one
	private com.navigation.pojo.Area area;
	private com.navigation.pojo.TopicSort topicSort;

	// collections
	private java.util.Set<com.navigation.pojo.Topic> topics;
	private java.util.Set<com.navigation.pojo.UserTopicSort> userTopicSorts;
	private java.util.Set<com.navigation.pojo.TopicSort> topicSorts;



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
	 * Return the value associated with the column: sort_name
	 */
	public java.lang.String getSortName () {
		return sortName;
	}

	/**
	 * Set the value related to the column: sort_name
	 * @param sortName the sort_name value
	 */
	public void setSortName (java.lang.String sortName) {
		this.sortName = sortName;
	}



	/**
	 * Return the value associated with the column: sort_degree
	 */
	public java.lang.Integer getSortDegree () {
		return sortDegree;
	}

	/**
	 * Set the value related to the column: sort_degree
	 * @param sortDegree the sort_degree value
	 */
	public void setSortDegree (java.lang.Integer sortDegree) {
		this.sortDegree = sortDegree;
	}



	/**
	 * Return the value associated with the column: state
	 */
	public java.lang.Integer getState () {
		return state;
	}

	/**
	 * Set the value related to the column: state
	 * @param state the state value
	 */
	public void setState (java.lang.Integer state) {
		this.state = state;
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
	 * Return the value associated with the column: sort_parent
	 */
	public com.navigation.pojo.TopicSort getTopicSort () {
		return topicSort;
	}

	/**
	 * Set the value related to the column: sort_parent
	 * @param topicSort the sort_parent value
	 */
	public void setTopicSort (com.navigation.pojo.TopicSort topicSort) {
		this.topicSort = topicSort;
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



	/**
	 * Return the value associated with the column: userTopicSorts
	 */
	public java.util.Set<com.navigation.pojo.UserTopicSort> getUserTopicSorts () {
		return userTopicSorts;
	}

	/**
	 * Set the value related to the column: userTopicSorts
	 * @param userTopicSorts the userTopicSorts value
	 */
	public void setUserTopicSorts (java.util.Set<com.navigation.pojo.UserTopicSort> userTopicSorts) {
		this.userTopicSorts = userTopicSorts;
	}

	public void addTouserTopicSorts (com.navigation.pojo.UserTopicSort userTopicSort) {
		if (null == getUserTopicSorts()) setUserTopicSorts(new java.util.TreeSet<com.navigation.pojo.UserTopicSort>());
		getUserTopicSorts().add(userTopicSort);
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




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.TopicSort)) return false;
		else {
			com.navigation.pojo.TopicSort topicSort = (com.navigation.pojo.TopicSort) obj;
			if (null == this.getId() || null == topicSort.getId()) return false;
			else return (this.getId().equals(topicSort.getId()));
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