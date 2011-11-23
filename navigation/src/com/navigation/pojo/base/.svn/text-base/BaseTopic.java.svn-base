package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the topic table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="topic"
 */

public abstract class BaseTopic  implements Serializable {

	public static String REF = "Topic";
	public static String PROP_REPLY_COUNT = "replyCount";
	public static String PROP_STATE = "state";
	public static String PROP_SYNC_ID = "syncId";
	public static String PROP_LAST_REPLY_TIME = "lastReplyTime";
	public static String PROP_IP_ADDRESS = "ipAddress";
	public static String PROP_AUTHOR_NAME = "authorName";
	public static String PROP_USER_BY_AUTHOR_ID = "userByAuthorId";
	public static String PROP_LAST_REPLY_AUTHOR_NAME = "lastReplyAuthorName";
	public static String PROP_IS_FAKE = "isFake";
	public static String PROP_TOPIC_SORT = "topicSort";
	public static String PROP_TITLE = "title";
	public static String PROP_AREA = "area";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_CONTENT = "content";
	public static String PROP_ID = "id";
	public static String PROP_SUBSCRIBE_COUNT = "subscribeCount";
	public static String PROP_USER_BY_LAST_REPLY_USER_ID = "userByLastReplyUserId";


	// constructors
	public BaseTopic () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseTopic (java.lang.Integer id) {
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
	private java.lang.String authorName;
	private java.lang.String lastReplyAuthorName;
	private java.util.Date addTime;
	private java.util.Date lastReplyTime;
	private java.lang.Integer state;
	private java.lang.Long syncId;
	private java.lang.Integer replyCount;
	private java.lang.Integer subscribeCount;
	private java.lang.Integer isFake;
	private java.lang.String ipAddress;

	// many to one
	private com.navigation.pojo.Area area;
	private com.navigation.pojo.User userByAuthorId;
	private com.navigation.pojo.User userByLastReplyUserId;
	private com.navigation.pojo.TopicSort topicSort;

	// collections
	private java.util.Set<com.navigation.pojo.TopicReply> topicReplies;



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
	 * Return the value associated with the column: author_name
	 */
	public java.lang.String getAuthorName () {
		return authorName;
	}

	/**
	 * Set the value related to the column: author_name
	 * @param authorName the author_name value
	 */
	public void setAuthorName (java.lang.String authorName) {
		this.authorName = authorName;
	}



	/**
	 * Return the value associated with the column: last_reply_author_name
	 */
	public java.lang.String getLastReplyAuthorName () {
		return lastReplyAuthorName;
	}

	/**
	 * Set the value related to the column: last_reply_author_name
	 * @param lastReplyAuthorName the last_reply_author_name value
	 */
	public void setLastReplyAuthorName (java.lang.String lastReplyAuthorName) {
		this.lastReplyAuthorName = lastReplyAuthorName;
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
	 * Return the value associated with the column: last_reply_time
	 */
	public java.util.Date getLastReplyTime () {
		return lastReplyTime;
	}

	/**
	 * Set the value related to the column: last_reply_time
	 * @param lastReplyTime the last_reply_time value
	 */
	public void setLastReplyTime (java.util.Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
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
	 * Return the value associated with the column: sync_id
	 */
	public java.lang.Long getSyncId () {
		return syncId;
	}

	/**
	 * Set the value related to the column: sync_id
	 * @param syncId the sync_id value
	 */
	public void setSyncId (java.lang.Long syncId) {
		this.syncId = syncId;
	}



	/**
	 * Return the value associated with the column: reply_count
	 */
	public java.lang.Integer getReplyCount () {
		return replyCount;
	}

	/**
	 * Set the value related to the column: reply_count
	 * @param replyCount the reply_count value
	 */
	public void setReplyCount (java.lang.Integer replyCount) {
		this.replyCount = replyCount;
	}



	/**
	 * Return the value associated with the column: subscribe_count
	 */
	public java.lang.Integer getSubscribeCount () {
		return subscribeCount;
	}

	/**
	 * Set the value related to the column: subscribe_count
	 * @param subscribeCount the subscribe_count value
	 */
	public void setSubscribeCount (java.lang.Integer subscribeCount) {
		this.subscribeCount = subscribeCount;
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
	 * Return the value associated with the column: author_id
	 */
	public com.navigation.pojo.User getUserByAuthorId () {
		return userByAuthorId;
	}

	/**
	 * Set the value related to the column: author_id
	 * @param userByAuthorId the author_id value
	 */
	public void setUserByAuthorId (com.navigation.pojo.User userByAuthorId) {
		this.userByAuthorId = userByAuthorId;
	}



	/**
	 * Return the value associated with the column: last_reply_user_id
	 */
	public com.navigation.pojo.User getUserByLastReplyUserId () {
		return userByLastReplyUserId;
	}

	/**
	 * Set the value related to the column: last_reply_user_id
	 * @param userByLastReplyUserId the last_reply_user_id value
	 */
	public void setUserByLastReplyUserId (com.navigation.pojo.User userByLastReplyUserId) {
		this.userByLastReplyUserId = userByLastReplyUserId;
	}



	/**
	 * Return the value associated with the column: sort_id
	 */
	public com.navigation.pojo.TopicSort getTopicSort () {
		return topicSort;
	}

	/**
	 * Set the value related to the column: sort_id
	 * @param topicSort the sort_id value
	 */
	public void setTopicSort (com.navigation.pojo.TopicSort topicSort) {
		this.topicSort = topicSort;
	}



	/**
	 * Return the value associated with the column: topicReplies
	 */
	public java.util.Set<com.navigation.pojo.TopicReply> getTopicReplies () {
		return topicReplies;
	}

	/**
	 * Set the value related to the column: topicReplies
	 * @param topicReplies the topicReplies value
	 */
	public void setTopicReplies (java.util.Set<com.navigation.pojo.TopicReply> topicReplies) {
		this.topicReplies = topicReplies;
	}

	public void addTotopicReplies (com.navigation.pojo.TopicReply topicReply) {
		if (null == getTopicReplies()) setTopicReplies(new java.util.TreeSet<com.navigation.pojo.TopicReply>());
		getTopicReplies().add(topicReply);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.Topic)) return false;
		else {
			com.navigation.pojo.Topic topic = (com.navigation.pojo.Topic) obj;
			if (null == this.getId() || null == topic.getId()) return false;
			else return (this.getId().equals(topic.getId()));
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