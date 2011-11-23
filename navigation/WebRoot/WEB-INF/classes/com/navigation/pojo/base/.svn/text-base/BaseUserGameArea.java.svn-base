package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_game_area table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_game_area"
 */

public abstract class BaseUserGameArea  implements Serializable {

	public static String REF = "UserGameArea";
	public static String PROP_USER_GAME_NAME = "userGameName";
	public static String PROP_GAME_AREA = "gameArea";
	public static String PROP_USER_GAME_LEVEL = "userGameLevel";
	public static String PROP_USER = "user";
	public static String PROP_ID = "id";
	public static String PROP_GAME = "game";
	public static String PROP_USER_GAME_MEMO = "userGameMemo";


	// constructors
	public BaseUserGameArea () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserGameArea (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String userGameName;
	private java.lang.Integer userGameLevel;
	private java.lang.String userGameMemo;

	// many to one
	private com.navigation.pojo.GameArea gameArea;
	private com.navigation.pojo.Game game;
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
	 * Return the value associated with the column: user_game_name
	 */
	public java.lang.String getUserGameName () {
		return userGameName;
	}

	/**
	 * Set the value related to the column: user_game_name
	 * @param userGameName the user_game_name value
	 */
	public void setUserGameName (java.lang.String userGameName) {
		this.userGameName = userGameName;
	}



	/**
	 * Return the value associated with the column: user_game_level
	 */
	public java.lang.Integer getUserGameLevel () {
		return userGameLevel;
	}

	/**
	 * Set the value related to the column: user_game_level
	 * @param userGameLevel the user_game_level value
	 */
	public void setUserGameLevel (java.lang.Integer userGameLevel) {
		this.userGameLevel = userGameLevel;
	}



	/**
	 * Return the value associated with the column: user_game_memo
	 */
	public java.lang.String getUserGameMemo () {
		return userGameMemo;
	}

	/**
	 * Set the value related to the column: user_game_memo
	 * @param userGameMemo the user_game_memo value
	 */
	public void setUserGameMemo (java.lang.String userGameMemo) {
		this.userGameMemo = userGameMemo;
	}



	/**
	 * Return the value associated with the column: area_id
	 */
	public com.navigation.pojo.GameArea getGameArea () {
		return gameArea;
	}

	/**
	 * Set the value related to the column: area_id
	 * @param gameArea the area_id value
	 */
	public void setGameArea (com.navigation.pojo.GameArea gameArea) {
		this.gameArea = gameArea;
	}



	/**
	 * Return the value associated with the column: game_id
	 */
	public com.navigation.pojo.Game getGame () {
		return game;
	}

	/**
	 * Set the value related to the column: game_id
	 * @param game the game_id value
	 */
	public void setGame (com.navigation.pojo.Game game) {
		this.game = game;
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
		if (!(obj instanceof com.navigation.pojo.UserGameArea)) return false;
		else {
			com.navigation.pojo.UserGameArea userGameArea = (com.navigation.pojo.UserGameArea) obj;
			if (null == this.getId() || null == userGameArea.getId()) return false;
			else return (this.getId().equals(userGameArea.getId()));
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