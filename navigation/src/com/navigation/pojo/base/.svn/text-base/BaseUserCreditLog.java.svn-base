package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_credit_log table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_credit_log"
 */

public abstract class BaseUserCreditLog  implements Serializable {

	public static String REF = "UserCreditLog";
	public static String PROP_TYPE = "type";
	public static String PROP_USER_ID = "userId";
	public static String PROP_SCORE = "score";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_ID = "id";
	public static String PROP_CREDIT = "credit";
	public static String PROP_CASH = "cash";


	// constructors
	public BaseUserCreditLog () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserCreditLog (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.Integer userId;
	private java.lang.Integer type;
	private java.lang.Integer credit;
	private java.lang.Integer score;
	private java.lang.Integer state;
	private java.lang.String ref;
	private java.util.Date addTime;
	private java.lang.Integer cash;


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
	 * Return the value associated with the column: user_id
	 */
	public java.lang.Integer getUserId () {
		return userId;
	}

	/**
	 * Set the value related to the column: user_id
	 * @param userId the user_id value
	 */
	public void setUserId (java.lang.Integer userId) {
		this.userId = userId;
	}



	/**
	 * Return the value associated with the column: type
	 */
	public java.lang.Integer getType () {
		return type;
	}

	/**
	 * Set the value related to the column: type
	 * @param type the type value
	 */
	public void setType (java.lang.Integer type) {
		this.type = type;
	}



	/**
	 * Return the value associated with the column: credit
	 */
	public java.lang.Integer getCredit () {
		return credit;
	}

	/**
	 * Set the value related to the column: credit
	 * @param credit the credit value
	 */
	public void setCredit (java.lang.Integer credit) {
		this.credit = credit;
	}



	/**
	 * Return the value associated with the column: score
	 */
	public java.lang.Integer getScore () {
		return score;
	}

	/**
	 * Set the value related to the column: score
	 * @param score the score value
	 */
	public void setScore (java.lang.Integer score) {
		this.score = score;
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




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.UserCreditLog)) return false;
		else {
			com.navigation.pojo.UserCreditLog userCreditLog = (com.navigation.pojo.UserCreditLog) obj;
			if (null == this.getId() || null == userCreditLog.getId()) return false;
			else return (this.getId().equals(userCreditLog.getId()));
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

	public java.lang.Integer getState() {
		return state;
	}

	public void setState(java.lang.Integer state) {
		this.state = state;
	}

	public java.lang.String getRef() {
		return ref;
	}

	public void setRef(java.lang.String ref) {
		this.ref = ref;
	}

	public java.lang.Integer getCash() {
		return cash;
	}

	public void setCash(java.lang.Integer cash) {
		this.cash = cash;
	}


}