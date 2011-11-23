package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_info table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_info"
 */

public abstract class BaseUserInfo  implements Serializable {

	public static String REF = "UserInfo";
	public static String PROP_USER_AGE = "userAge";
	public static String PROP_USER_DEGREE = "userDegree";
	public static String PROP_USER_WEIGHT = "userWeight";
	public static String PROP_USER_HEIGHT = "userHeight";
	public static String PROP_USER = "user";
	public static String PROP_USER_PROVINCE = "userProvince";
	public static String PROP_USER_ANSWER = "userAnswer";
	public static String PROP_USER_SEX = "userSex";
	public static String PROP_ID = "id";
	public static String PROP_USER_CITY = "userCity";


	// constructors
	public BaseUserInfo () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserInfo (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer userAge;
	private java.lang.Integer userSex;
	private java.lang.Integer userProvince;
	private java.lang.Integer userCity;
	private java.lang.String userDegree;
	private java.lang.Integer userHeight;
	private java.lang.Integer userWeight;
	private java.lang.String userAnswer;

	// many to one
	private com.navigation.pojo.User user;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="identity"
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
	 * Return the value associated with the column: user_age
	 */
	public java.lang.Integer getUserAge () {
		return userAge;
	}

	/**
	 * Set the value related to the column: user_age
	 * @param userAge the user_age value
	 */
	public void setUserAge (java.lang.Integer userAge) {
		this.userAge = userAge;
	}



	/**
	 * Return the value associated with the column: user_sex
	 */
	public java.lang.Integer getUserSex () {
		return userSex;
	}

	/**
	 * Set the value related to the column: user_sex
	 * @param userSex the user_sex value
	 */
	public void setUserSex (java.lang.Integer userSex) {
		this.userSex = userSex;
	}



	/**
	 * Return the value associated with the column: user_province
	 */
	public java.lang.Integer getUserProvince () {
		return userProvince;
	}

	/**
	 * Set the value related to the column: user_province
	 * @param userProvince the user_province value
	 */
	public void setUserProvince (java.lang.Integer userProvince) {
		this.userProvince = userProvince;
	}



	/**
	 * Return the value associated with the column: user_city
	 */
	public java.lang.Integer getUserCity () {
		return userCity;
	}

	/**
	 * Set the value related to the column: user_city
	 * @param userCity the user_city value
	 */
	public void setUserCity (java.lang.Integer userCity) {
		this.userCity = userCity;
	}



	/**
	 * Return the value associated with the column: user_degree
	 */
	public java.lang.String getUserDegree () {
		return userDegree;
	}

	/**
	 * Set the value related to the column: user_degree
	 * @param userDegree the user_degree value
	 */
	public void setUserDegree (java.lang.String userDegree) {
		this.userDegree = userDegree;
	}



	/**
	 * Return the value associated with the column: user_height
	 */
	public java.lang.Integer getUserHeight () {
		return userHeight;
	}

	/**
	 * Set the value related to the column: user_height
	 * @param userHeight the user_height value
	 */
	public void setUserHeight (java.lang.Integer userHeight) {
		this.userHeight = userHeight;
	}



	/**
	 * Return the value associated with the column: user_weight
	 */
	public java.lang.Integer getUserWeight () {
		return userWeight;
	}

	/**
	 * Set the value related to the column: user_weight
	 * @param userWeight the user_weight value
	 */
	public void setUserWeight (java.lang.Integer userWeight) {
		this.userWeight = userWeight;
	}



	/**
	 * Return the value associated with the column: user_answer
	 */
	public java.lang.String getUserAnswer () {
		return userAnswer;
	}

	/**
	 * Set the value related to the column: user_answer
	 * @param userAnswer the user_answer value
	 */
	public void setUserAnswer (java.lang.String userAnswer) {
		this.userAnswer = userAnswer;
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
		if (!(obj instanceof com.navigation.pojo.UserInfo)) return false;
		else {
			com.navigation.pojo.UserInfo userInfo = (com.navigation.pojo.UserInfo) obj;
			if (null == this.getId() || null == userInfo.getId()) return false;
			else return (this.getId().equals(userInfo.getId()));
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