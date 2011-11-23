package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the game_area table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="game_area"
 */

public abstract class BaseGameArea  implements Serializable {

	public static String REF = "GameArea";
	public static String PROP_AREA_NAME = "areaName";
	public static String PROP_ID = "id";
	public static String PROP_GAME = "game";


	// constructors
	public BaseGameArea () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseGameArea (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String areaName;

	// many to one
	private com.navigation.pojo.Game game;

	// collections
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
	 * Return the value associated with the column: area_name
	 */
	public java.lang.String getAreaName () {
		return areaName;
	}

	/**
	 * Set the value related to the column: area_name
	 * @param areaName the area_name value
	 */
	public void setAreaName (java.lang.String areaName) {
		this.areaName = areaName;
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
		if (!(obj instanceof com.navigation.pojo.GameArea)) return false;
		else {
			com.navigation.pojo.GameArea gameArea = (com.navigation.pojo.GameArea) obj;
			if (null == this.getId() || null == gameArea.getId()) return false;
			else return (this.getId().equals(gameArea.getId()));
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