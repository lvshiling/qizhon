package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the user_stock table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="user_stock"
 */

public abstract class BaseUserStock  implements Serializable {

	public static String REF = "UserStock";
	public static String PROP_USER = "user";
	public static String PROP_STOCK_LIST = "stockList";
	public static String PROP_ID = "id";


	// constructors
	public BaseUserStock () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUserStock (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String stockList;

	// many to one
	private com.navigation.pojo.User user;



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
	 * Return the value associated with the column: stock_list
	 */
	public java.lang.String getStockList () {
		return stockList;
	}

	/**
	 * Set the value related to the column: stock_list
	 * @param stockList the stock_list value
	 */
	public void setStockList (java.lang.String stockList) {
		this.stockList = stockList;
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
		if (!(obj instanceof com.navigation.pojo.UserStock)) return false;
		else {
			com.navigation.pojo.UserStock userStock = (com.navigation.pojo.UserStock) obj;
			if (null == this.getId() || null == userStock.getId()) return false;
			else return (this.getId().equals(userStock.getId()));
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