package com.navigation.pojo.base;

import java.io.Serializable;

/**
 * This is an object that contains data related to the user table. Do not modify
 * this class because it will be overwritten if the configuration file related
 * to this class is modified.
 * 
 * @hibernate.class table="user"
 */

public abstract class BaseUser implements Serializable {

	public static String REF = "User";
	public static String PROP_PASSWORD = "password";
	public static String PROP_MAIL = "mail";
	public static String PROP_ICON = "icon";
	public static String PROP_IS_VIP = "isVip";
	public static String PROP_NAME = "name";
	public static String PROP_ID = "id";
	public static String PROP_POSTER = "poster";
	public static String PROP_IS_AUTH = "isAuth";
	public static String PROP_PIC = "pic";

	// constructors
	public BaseUser() {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUser(java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize() {
	}

	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String mail;
	private java.lang.String password;
	private java.lang.String name;
	private java.lang.String icon;
	private java.lang.Integer isVip;
	private java.lang.String poster;
	private java.lang.Integer isAuth;
	private java.lang.String pic;

	// collections
	private java.util.Set<com.navigation.pojo.UserTopicSort> userTopicSorts;
	private java.util.Set<com.navigation.pojo.UserCredit> userCredits;
	private java.util.Set<com.navigation.pojo.UserNotice> userNotices;
	private java.util.Set<com.navigation.pojo.UserInfo> userInfos;
	private java.util.Set<com.navigation.pojo.UserGameArea> userGameAreas;
	private java.util.Set<com.navigation.pojo.UserPicture> userPictures;
	private java.util.Set<com.navigation.pojo.Topic> topicsForAuthorId;
	private java.util.Set<com.navigation.pojo.UserLink> userLinks;
	private java.util.Set<com.navigation.pojo.UserTag> userTags;
	private java.util.Set<com.navigation.pojo.TopicReply> topicReplies;
	private java.util.Set<com.navigation.pojo.UserStock> userStocks;
	private java.util.Set<com.navigation.pojo.Topic> topicsForLastReplyUserId;
	private java.util.Set<com.navigation.pojo.UserArea> userAreas;

	/**
	 * Return the unique identifier of this class
	 * 
	 * @hibernate.id generator-class="identity" column="id"
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
	 * Return the value associated with the column: mail
	 */
	public java.lang.String getMail() {
		return mail;
	}

	/**
	 * Set the value related to the column: mail
	 * 
	 * @param mail
	 *            the mail value
	 */
	public void setMail(java.lang.String mail) {
		this.mail = mail;
	}

	/**
	 * Return the value associated with the column: password
	 */
	public java.lang.String getPassword() {
		return password;
	}

	/**
	 * Set the value related to the column: password
	 * 
	 * @param password
	 *            the password value
	 */
	public void setPassword(java.lang.String password) {
		this.password = password;
	}

	/**
	 * Return the value associated with the column: name
	 */
	public java.lang.String getName() {
		return name;
	}

	/**
	 * Set the value related to the column: name
	 * 
	 * @param name
	 *            the name value
	 */
	public void setName(java.lang.String name) {
		this.name = name;
	}

	/**
	 * Return the value associated with the column: icon
	 */
	public java.lang.String getIcon() {
		return (icon == null) ? "/images/default.jpg" : icon;
	}

	/**
	 * Set the value related to the column: icon
	 * 
	 * @param icon
	 *            the icon value
	 */
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}

	/**
	 * Return the value associated with the column: is_vip
	 */
	public java.lang.Integer getIsVip() {
		return isVip;
	}

	/**
	 * Set the value related to the column: is_vip
	 * 
	 * @param isVip
	 *            the is_vip value
	 */
	public void setIsVip(java.lang.Integer isVip) {
		this.isVip = isVip;
	}

	/**
	 * Return the value associated with the column: userTopicSorts
	 */
	public java.util.Set<com.navigation.pojo.UserTopicSort> getUserTopicSorts() {
		return userTopicSorts;
	}

	/**
	 * Set the value related to the column: userTopicSorts
	 * 
	 * @param userTopicSorts
	 *            the userTopicSorts value
	 */
	public void setUserTopicSorts(java.util.Set<com.navigation.pojo.UserTopicSort> userTopicSorts) {
		this.userTopicSorts = userTopicSorts;
	}

	public void addTouserTopicSorts(com.navigation.pojo.UserTopicSort userTopicSort) {
		if (null == getUserTopicSorts())
			setUserTopicSorts(new java.util.TreeSet<com.navigation.pojo.UserTopicSort>());
		getUserTopicSorts().add(userTopicSort);
	}

	/**
	 * Return the value associated with the column: userCredits
	 */
	public java.util.Set<com.navigation.pojo.UserCredit> getUserCredits() {
		return userCredits;
	}

	/**
	 * Set the value related to the column: userCredits
	 * 
	 * @param userCredits
	 *            the userCredits value
	 */
	public void setUserCredits(java.util.Set<com.navigation.pojo.UserCredit> userCredits) {
		this.userCredits = userCredits;
	}

	public void addTouserCredits(com.navigation.pojo.UserCredit userCredit) {
		if (null == getUserCredits())
			setUserCredits(new java.util.TreeSet<com.navigation.pojo.UserCredit>());
		getUserCredits().add(userCredit);
	}

	/**
	 * Return the value associated with the column: userNotices
	 */
	public java.util.Set<com.navigation.pojo.UserNotice> getUserNotices() {
		return userNotices;
	}

	/**
	 * Set the value related to the column: userNotices
	 * 
	 * @param userNotices
	 *            the userNotices value
	 */
	public void setUserNotices(java.util.Set<com.navigation.pojo.UserNotice> userNotices) {
		this.userNotices = userNotices;
	}

	public void addTouserNotices(com.navigation.pojo.UserNotice userNotice) {
		if (null == getUserNotices())
			setUserNotices(new java.util.TreeSet<com.navigation.pojo.UserNotice>());
		getUserNotices().add(userNotice);
	}

	/**
	 * Return the value associated with the column: userInfos
	 */
	public java.util.Set<com.navigation.pojo.UserInfo> getUserInfos() {
		return userInfos;
	}

	/**
	 * Set the value related to the column: userInfos
	 * 
	 * @param userInfos
	 *            the userInfos value
	 */
	public void setUserInfos(java.util.Set<com.navigation.pojo.UserInfo> userInfos) {
		this.userInfos = userInfos;
	}

	public void addTouserInfos(com.navigation.pojo.UserInfo userInfo) {
		if (null == getUserInfos())
			setUserInfos(new java.util.TreeSet<com.navigation.pojo.UserInfo>());
		getUserInfos().add(userInfo);
	}

	/**
	 * Return the value associated with the column: userGameAreas
	 */
	public java.util.Set<com.navigation.pojo.UserGameArea> getUserGameAreas() {
		return userGameAreas;
	}

	/**
	 * Set the value related to the column: userGameAreas
	 * 
	 * @param userGameAreas
	 *            the userGameAreas value
	 */
	public void setUserGameAreas(java.util.Set<com.navigation.pojo.UserGameArea> userGameAreas) {
		this.userGameAreas = userGameAreas;
	}

	public void addTouserGameAreas(com.navigation.pojo.UserGameArea userGameArea) {
		if (null == getUserGameAreas())
			setUserGameAreas(new java.util.TreeSet<com.navigation.pojo.UserGameArea>());
		getUserGameAreas().add(userGameArea);
	}

	/**
	 * Return the value associated with the column: userPictures
	 */
	public java.util.Set<com.navigation.pojo.UserPicture> getUserPictures() {
		return userPictures;
	}

	/**
	 * Set the value related to the column: userPictures
	 * 
	 * @param userPictures
	 *            the userPictures value
	 */
	public void setUserPictures(java.util.Set<com.navigation.pojo.UserPicture> userPictures) {
		this.userPictures = userPictures;
	}

	public void addTouserPictures(com.navigation.pojo.UserPicture userPicture) {
		if (null == getUserPictures())
			setUserPictures(new java.util.TreeSet<com.navigation.pojo.UserPicture>());
		getUserPictures().add(userPicture);
	}

	/**
	 * Return the value associated with the column: topicsForAuthorId
	 */
	public java.util.Set<com.navigation.pojo.Topic> getTopicsForAuthorId() {
		return topicsForAuthorId;
	}

	/**
	 * Set the value related to the column: topicsForAuthorId
	 * 
	 * @param topicsForAuthorId
	 *            the topicsForAuthorId value
	 */
	public void setTopicsForAuthorId(java.util.Set<com.navigation.pojo.Topic> topicsForAuthorId) {
		this.topicsForAuthorId = topicsForAuthorId;
	}

	public void addTotopicsForAuthorId(com.navigation.pojo.Topic topic) {
		if (null == getTopicsForAuthorId())
			setTopicsForAuthorId(new java.util.TreeSet<com.navigation.pojo.Topic>());
		getTopicsForAuthorId().add(topic);
	}

	/**
	 * Return the value associated with the column: userLinks
	 */
	public java.util.Set<com.navigation.pojo.UserLink> getUserLinks() {
		return userLinks;
	}

	/**
	 * Set the value related to the column: userLinks
	 * 
	 * @param userLinks
	 *            the userLinks value
	 */
	public void setUserLinks(java.util.Set<com.navigation.pojo.UserLink> userLinks) {
		this.userLinks = userLinks;
	}

	public void addTouserLinks(com.navigation.pojo.UserLink userLink) {
		if (null == getUserLinks())
			setUserLinks(new java.util.TreeSet<com.navigation.pojo.UserLink>());
		getUserLinks().add(userLink);
	}

	/**
	 * Return the value associated with the column: userTags
	 */
	public java.util.Set<com.navigation.pojo.UserTag> getUserTags() {
		return userTags;
	}

	/**
	 * Set the value related to the column: userTags
	 * 
	 * @param userTags
	 *            the userTags value
	 */
	public void setUserTags(java.util.Set<com.navigation.pojo.UserTag> userTags) {
		this.userTags = userTags;
	}

	public void addTouserTags(com.navigation.pojo.UserTag userTag) {
		if (null == getUserTags())
			setUserTags(new java.util.TreeSet<com.navigation.pojo.UserTag>());
		getUserTags().add(userTag);
	}

	/**
	 * Return the value associated with the column: topicReplies
	 */
	public java.util.Set<com.navigation.pojo.TopicReply> getTopicReplies() {
		return topicReplies;
	}

	/**
	 * Set the value related to the column: topicReplies
	 * 
	 * @param topicReplies
	 *            the topicReplies value
	 */
	public void setTopicReplies(java.util.Set<com.navigation.pojo.TopicReply> topicReplies) {
		this.topicReplies = topicReplies;
	}

	public void addTotopicReplies(com.navigation.pojo.TopicReply topicReply) {
		if (null == getTopicReplies())
			setTopicReplies(new java.util.TreeSet<com.navigation.pojo.TopicReply>());
		getTopicReplies().add(topicReply);
	}

	/**
	 * Return the value associated with the column: userStocks
	 */
	public java.util.Set<com.navigation.pojo.UserStock> getUserStocks() {
		return userStocks;
	}

	/**
	 * Set the value related to the column: userStocks
	 * 
	 * @param userStocks
	 *            the userStocks value
	 */
	public void setUserStocks(java.util.Set<com.navigation.pojo.UserStock> userStocks) {
		this.userStocks = userStocks;
	}

	public void addTouserStocks(com.navigation.pojo.UserStock userStock) {
		if (null == getUserStocks())
			setUserStocks(new java.util.TreeSet<com.navigation.pojo.UserStock>());
		getUserStocks().add(userStock);
	}

	/**
	 * Return the value associated with the column: topicsForLastReplyUserId
	 */
	public java.util.Set<com.navigation.pojo.Topic> getTopicsForLastReplyUserId() {
		return topicsForLastReplyUserId;
	}

	/**
	 * Set the value related to the column: topicsForLastReplyUserId
	 * 
	 * @param topicsForLastReplyUserId
	 *            the topicsForLastReplyUserId value
	 */
	public void setTopicsForLastReplyUserId(java.util.Set<com.navigation.pojo.Topic> topicsForLastReplyUserId) {
		this.topicsForLastReplyUserId = topicsForLastReplyUserId;
	}

	public void addTotopicsForLastReplyUserId(com.navigation.pojo.Topic topic) {
		if (null == getTopicsForLastReplyUserId())
			setTopicsForLastReplyUserId(new java.util.TreeSet<com.navigation.pojo.Topic>());
		getTopicsForLastReplyUserId().add(topic);
	}

	/**
	 * Return the value associated with the column: userAreas
	 */
	public java.util.Set<com.navigation.pojo.UserArea> getUserAreas() {
		return userAreas;
	}

	/**
	 * Set the value related to the column: userAreas
	 * 
	 * @param userAreas
	 *            the userAreas value
	 */
	public void setUserAreas(java.util.Set<com.navigation.pojo.UserArea> userAreas) {
		this.userAreas = userAreas;
	}

	public void addTouserAreas(com.navigation.pojo.UserArea userArea) {
		if (null == getUserAreas())
			setUserAreas(new java.util.TreeSet<com.navigation.pojo.UserArea>());
		getUserAreas().add(userArea);
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof com.navigation.pojo.User))
			return false;
		else {
			com.navigation.pojo.User user = (com.navigation.pojo.User) obj;
			if (null == this.getId() || null == user.getId())
				return false;
			else
				return (this.getId().equals(user.getId()));
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

	public java.lang.String getPoster() {
		return poster;
	}

	public void setPoster(java.lang.String poster) {
		this.poster = poster;
	}

	public java.lang.Integer getIsAuth() {
		return isAuth;
	}

	public void setIsAuth(java.lang.Integer isAuth) {
		this.isAuth = isAuth;
	}

	public java.lang.String getPic() {
		return pic;
	}

	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}

}