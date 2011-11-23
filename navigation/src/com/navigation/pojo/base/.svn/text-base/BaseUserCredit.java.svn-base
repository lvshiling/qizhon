package com.navigation.pojo.base;

import java.io.Serializable;

/**
 * This is an object that contains data related to the user_credit table. Do not
 * modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 * 
 * @hibernate.class table="user_credit"
 */

public abstract class BaseUserCredit implements Serializable {

	public static String REF = "UserCredit";
	public static String PROP_USER = "user";
	public static String PROP_SCORE = "score";
	public static String PROP_ID = "id";
	public static String PROP_CREDIT = "credit";
	public static String PROP_EARN_CREDIT = "earnCredit";
	public static String PROP_SPEND_CREDIT = "spendCredit";
	public static String PROP_STAR_GRADE = "starGrade";
	public static String PROP_RICH_GRADE = "richGrade";
	public static String PROP_VISITS = "visits";

	// constructors
	public BaseUserCredit() {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserCredit(java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize() {
	}

	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer credit;
	private java.lang.Double score;
	private java.lang.Integer earnCredit;
	private java.lang.Integer spendCredit;
	private java.lang.Integer starGrade;
	private java.lang.Integer richGrade;
	private java.lang.Integer visits;
	private java.lang.String attList;
	private java.lang.String fansList;
	private java.lang.Integer fansNum;
	private java.lang.Integer scoreNum;

	// many to one
	private com.navigation.pojo.User user;

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
	 * Return the value associated with the column: credit
	 */
	public java.lang.Integer getCredit() {
		return credit;
	}

	/**
	 * Set the value related to the column: credit
	 * 
	 * @param credit
	 *            the credit value
	 */
	public void setCredit(java.lang.Integer credit) {
		this.credit = credit;
	}

	public java.lang.Double getScore() {
		return score;
	}

	public void setScore(java.lang.Double score) {
		this.score = score;
	}

	public java.lang.Integer getScoreNum() {
		return scoreNum;
	}

	public void setScoreNum(java.lang.Integer scoreNum) {
		this.scoreNum = scoreNum;
	}

	/**
	 * Return the value associated with the column: user_id
	 */
	public com.navigation.pojo.User getUser() {
		return user;
	}

	/**
	 * Set the value related to the column: user_id
	 * 
	 * @param user
	 *            the user_id value
	 */
	public void setUser(com.navigation.pojo.User user) {
		this.user = user;
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof com.navigation.pojo.UserCredit))
			return false;
		else {
			com.navigation.pojo.UserCredit userCredit = (com.navigation.pojo.UserCredit) obj;
			if (null == this.getId() || null == userCredit.getId())
				return false;
			else
				return (this.getId().equals(userCredit.getId()));
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

	public java.lang.Integer getEarnCredit() {
		return earnCredit;
	}

	public void setEarnCredit(java.lang.Integer earnCredit) {
		this.earnCredit = earnCredit;
	}

	public java.lang.Integer getSpendCredit() {
		return spendCredit;
	}

	public void setSpendCredit(java.lang.Integer spendCredit) {
		this.spendCredit = spendCredit;
	}

	public java.lang.Integer getStarGrade() {
		return starGrade;
	}

	public void setStarGrade(java.lang.Integer starGrade) {
		this.starGrade = starGrade;
	}

	public java.lang.Integer getRichGrade() {
		return richGrade;
	}

	public void setRichGrade(java.lang.Integer richGrade) {
		this.richGrade = richGrade;
	}

	public java.lang.Integer getVisits() {
		return visits;
	}

	public void setVisits(java.lang.Integer visits) {
		this.visits = visits;
	}

	public java.lang.String getAttList() {
		return attList;
	}

	public void setAttList(java.lang.String attList) {
		this.attList = attList;
	}

	public java.lang.String getFansList() {
		return fansList;
	}

	public void setFansList(java.lang.String fansList) {
		this.fansList = fansList;
	}

	public java.lang.Integer getFansNum() {
		return fansNum;
	}

	public void setFansNum(java.lang.Integer fansNum) {
		this.fansNum = fansNum;
	}
}