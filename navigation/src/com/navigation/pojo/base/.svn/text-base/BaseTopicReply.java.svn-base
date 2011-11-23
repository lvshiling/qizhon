package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the topic_reply table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="topic_reply"
 */

public abstract class BaseTopicReply  implements Serializable {

	public static String REF = "TopicReply";
	public static String PROP_IP_ADDRESS = "ipAddress";
	public static String PROP_REPLY_USER_NAME = "replyUserName";
	public static String PROP_TOPIC = "topic";
	public static String PROP_IS_FAKE = "isFake";
	public static String PROP_USER = "user";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_CONTENT = "content";
	public static String PROP_ID = "id";


	// constructors
	public BaseTopicReply () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTopicReply (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String replyUserName;
	private java.lang.String content;
	private java.util.Date addTime;
	private java.lang.Integer isFake;
	private java.lang.String ipAddress;

	// many to one
	private com.navigation.pojo.User user;
	private com.navigation.pojo.Topic topic;



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
	 * Return the value associated with the column: reply_user_name
	 */
	public java.lang.String getReplyUserName () {
		return replyUserName;
	}

	/**
	 * Set the value related to the column: reply_user_name
	 * @param replyUserName the reply_user_name value
	 */
	public void setReplyUserName (java.lang.String replyUserName) {
		this.replyUserName = replyUserName;
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
	 * Return the value associated with the column: is_fake
	 */
	public java.lang.Integer getIsFake () {
		return isFake;
	}

	/**
	 * Set the value related to the column: is_fake
	 * @param isFake the is_fake value
	 */
	public void setIsFake (java.lang.Integer isFake) {
		this.isFake = isFake;
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
	 * Return the value associated with the column: reply_user_id
	 */
	public com.navigation.pojo.User getUser () {
		return user;
	}

	/**
	 * Set the value related to the column: reply_user_id
	 * @param user the reply_user_id value
	 */
	public void setUser (com.navigation.pojo.User user) {
		this.user = user;
	}



	/**
	 * Return the value associated with the column: topic_id
	 */
	public com.navigation.pojo.Topic getTopic () {
		return topic;
	}

	/**
	 * Set the value related to the column: topic_id
	 * @param topic the topic_id value
	 */
	public void setTopic (com.navigation.pojo.Topic topic) {
		this.topic = topic;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.TopicReply)) return false;
		else {
			com.navigation.pojo.TopicReply topicReply = (com.navigation.pojo.TopicReply) obj;
			if (null == this.getId() || null == topicReply.getId()) return false;
			else return (this.getId().equals(topicReply.getId()));
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