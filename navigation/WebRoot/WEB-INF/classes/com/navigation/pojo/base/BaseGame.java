package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the game table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="game"
 */

public abstract class BaseGame  implements Serializable {

	public static String REF = "Game";
	public static String PROP_TYPE = "type";
	public static String PROP_NAME = "name";
	public static String PROP_ID = "id";


	// constructors
	public BaseGame () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseGame (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String name;
	private java.lang.Integer type;

	// collections
	private java.util.Set<com.navigation.pojo.GameArea> gameAreas;
	private java.util.Set<com.navigation.pojo.UserGameArea> userGameAreas;



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
	 * Return the value associated with the column: gameAreas
	 */
	public java.util.Set<com.navigation.pojo.GameArea> getGameAreas () {
		return gameAreas;
	}

	/**
	 * Set the value related to the column: gameAreas
	 * @param gameAreas the gameAreas value
	 */
	public void setGameAreas (java.util.Set<com.navigation.pojo.GameArea> gameAreas) {
		this.gameAreas = gameAreas;
	}

	public void addTogameAreas (com.navigation.pojo.GameArea gameArea) {
		if (null == getGameAreas()) setGameAreas(new java.util.TreeSet<com.navigation.pojo.GameArea>());
		getGameAreas().add(gameArea);
	}



	/**
	 * Return the value associated with the column: userGameAreas
	 */
	public java.util.Set<com.navigation.pojo.UserGameArea> getUserGameAreas () {
		return userGameAreas;
	}

	/**
	 * Set the value related to the column: userGameAreas
	 * @param userGameAreas the userGameAreas value
	 */
	public void setUserGameAreas (java.util.Set<com.navigation.pojo.UserGameArea> userGameAreas) {
		this.userGameAreas = userGameAreas;
	}

	public void addTouserGameAreas (com.navigation.pojo.UserGameArea userGameArea) {
		if (null == getUserGameAreas()) setUserGameAreas(new java.util.TreeSet<com.navigation.pojo.UserGameArea>());
		getUserGameAreas().add(userGameArea);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.Game)) return false;
		else {
			com.navigation.pojo.Game game = (com.navigation.pojo.Game) obj;
			if (null == this.getId() || null == game.getId()) return false;
			else return (this.getId().equals(game.getId()));
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