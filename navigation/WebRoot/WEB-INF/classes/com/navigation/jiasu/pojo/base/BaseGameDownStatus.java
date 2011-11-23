package com.navigation.jiasu.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the game_down_status table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="game_down_status"
 */

public abstract class BaseGameDownStatus  implements Serializable {

	public static String REF = "GameDownStatus";
	public static String PROP_HOST = "host";
	public static String PROP_NUMBER = "number";
	public static String PROP_NAME = "name";
	public static String PROP_ID = "id";
	public static String PROP_GAME = "game";


	// constructors
	public BaseGameDownStatus () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseGameDownStatus (java.lang.Long id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Long id;

	// fields
	private java.lang.String game;
	private java.lang.String host;
	private java.lang.String name;
	private java.lang.Integer number;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="increment"
     *  column="id"
     */
	public java.lang.Long getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.Long id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: game
	 */
	public java.lang.String getGame () {
		return game;
	}

	/**
	 * Set the value related to the column: game
	 * @param game the game value
	 */
	public void setGame (java.lang.String game) {
		this.game = game;
	}



	/**
	 * Return the value associated with the column: host
	 */
	public java.lang.String getHost () {
		return host;
	}

	/**
	 * Set the value related to the column: host
	 * @param host the host value
	 */
	public void setHost (java.lang.String host) {
		this.host = host;
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
	 * Return the value associated with the column: number
	 */
	public java.lang.Integer getNumber () {
		return number;
	}

	/**
	 * Set the value related to the column: number
	 * @param number the number value
	 */
	public void setNumber (java.lang.Integer number) {
		this.number = number;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.jiasu.pojo.GameDownStatus)) return false;
		else {
			com.navigation.jiasu.pojo.GameDownStatus gameDownStatus = (com.navigation.jiasu.pojo.GameDownStatus) obj;
			if (null == this.getId() || null == gameDownStatus.getId()) return false;
			else return (this.getId().equals(gameDownStatus.getId()));
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