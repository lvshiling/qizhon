package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the file_gpass table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="file_gpass"
 */

public abstract class BaseFileGpass  implements Serializable {

	public static String REF = "FileGpass";
	public static String PROP_FILE_KEY = "fileKey";
	public static String PROP_FILE_NAME = "fileName";
	public static String PROP_ADD_TIME = "addTime";
	public static String PROP_ID = "id";


	// constructors
	public BaseFileGpass () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseFileGpass (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String fileName;
	private java.util.Date addTime;
	private java.lang.String fileKey;



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
	 * Return the value associated with the column: file_name
	 */
	public java.lang.String getFileName () {
		return fileName;
	}

	/**
	 * Set the value related to the column: file_name
	 * @param fileName the file_name value
	 */
	public void setFileName (java.lang.String fileName) {
		this.fileName = fileName;
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
	 * Return the value associated with the column: file_key
	 */
	public java.lang.String getFileKey () {
		return fileKey;
	}

	/**
	 * Set the value related to the column: file_key
	 * @param fileKey the file_key value
	 */
	public void setFileKey (java.lang.String fileKey) {
		this.fileKey = fileKey;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.FileGpass)) return false;
		else {
			com.navigation.pojo.FileGpass fileGpass = (com.navigation.pojo.FileGpass) obj;
			if (null == this.getId() || null == fileGpass.getId()) return false;
			else return (this.getId().equals(fileGpass.getId()));
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