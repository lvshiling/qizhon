package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the file_search_config table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="file_search_config"
 */

public abstract class BaseFileSearchConfig  implements Serializable {

	public static String REF = "FileSearchConfig";
	public static String PROP_FOLDER_REAL_PATH = "folderRealPath";
	public static String PROP_FOLDER_NAME = "folderName";
	public static String PROP_FOLDER_PATH = "folderPath";
	public static String PROP_ID = "id";


	// constructors
	public BaseFileSearchConfig () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseFileSearchConfig (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String folderName;
	private java.lang.String folderPath;
	private java.lang.String folderRealPath;

	// collections
	private java.util.Set<com.navigation.pojo.FileSearch> fileSearchs;



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
	 * Return the value associated with the column: folder_name
	 */
	public java.lang.String getFolderName () {
		return folderName;
	}

	/**
	 * Set the value related to the column: folder_name
	 * @param folderName the folder_name value
	 */
	public void setFolderName (java.lang.String folderName) {
		this.folderName = folderName;
	}



	/**
	 * Return the value associated with the column: folder_path
	 */
	public java.lang.String getFolderPath () {
		return folderPath;
	}

	/**
	 * Set the value related to the column: folder_path
	 * @param folderPath the folder_path value
	 */
	public void setFolderPath (java.lang.String folderPath) {
		this.folderPath = folderPath;
	}



	/**
	 * Return the value associated with the column: folder_real_path
	 */
	public java.lang.String getFolderRealPath () {
		return folderRealPath;
	}

	/**
	 * Set the value related to the column: folder_real_path
	 * @param folderRealPath the folder_real_path value
	 */
	public void setFolderRealPath (java.lang.String folderRealPath) {
		this.folderRealPath = folderRealPath;
	}



	/**
	 * Return the value associated with the column: fileSearchs
	 */
	public java.util.Set<com.navigation.pojo.FileSearch> getFileSearchs () {
		return fileSearchs;
	}

	/**
	 * Set the value related to the column: fileSearchs
	 * @param fileSearchs the fileSearchs value
	 */
	public void setFileSearchs (java.util.Set<com.navigation.pojo.FileSearch> fileSearchs) {
		this.fileSearchs = fileSearchs;
	}

	public void addTofileSearchs (com.navigation.pojo.FileSearch fileSearch) {
		if (null == getFileSearchs()) setFileSearchs(new java.util.TreeSet<com.navigation.pojo.FileSearch>());
		getFileSearchs().add(fileSearch);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.FileSearchConfig)) return false;
		else {
			com.navigation.pojo.FileSearchConfig fileSearchConfig = (com.navigation.pojo.FileSearchConfig) obj;
			if (null == this.getId() || null == fileSearchConfig.getId()) return false;
			else return (this.getId().equals(fileSearchConfig.getId()));
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