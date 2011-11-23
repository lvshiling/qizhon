package com.navigation.pojo.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the file_search table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="file_search"
 */

public abstract class BaseFileSearch  implements Serializable {

	public static String REF = "FileSearch";
	public static String PROP_IS_FOLDER = "isFolder";
	public static String PROP_FILE_PATH = "filePath";
	public static String PROP_FILE_EXT = "fileExt";
	public static String PROP_FILE_NAME = "fileName";
	public static String PROP_ID = "id";
	public static String PROP_FILE_SEARCH_CONFIG = "fileSearchConfig";
	public static String PROP_IS_COMMON = "isCommon";


	// constructors
	public BaseFileSearch () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseFileSearch (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String fileName;
	private java.lang.String filePath;
	private java.lang.String fileExt;
	private java.lang.Integer isFolder;
	private java.lang.Integer isCommon;

	// many to one
	private com.navigation.pojo.FileSearchConfig fileSearchConfig;



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
	 * Return the value associated with the column: file_path
	 */
	public java.lang.String getFilePath () {
		return filePath;
	}

	/**
	 * Set the value related to the column: file_path
	 * @param filePath the file_path value
	 */
	public void setFilePath (java.lang.String filePath) {
		this.filePath = filePath;
	}



	/**
	 * Return the value associated with the column: file_ext
	 */
	public java.lang.String getFileExt () {
		return fileExt;
	}

	/**
	 * Set the value related to the column: file_ext
	 * @param fileExt the file_ext value
	 */
	public void setFileExt (java.lang.String fileExt) {
		this.fileExt = fileExt;
	}



	/**
	 * Return the value associated with the column: is_folder
	 */
	public java.lang.Integer getIsFolder () {
		return isFolder;
	}

	/**
	 * Set the value related to the column: is_folder
	 * @param isFolder the is_folder value
	 */
	public void setIsFolder (java.lang.Integer isFolder) {
		this.isFolder = isFolder;
	}



	/**
	 * Return the value associated with the column: is_common
	 */
	public java.lang.Integer getIsCommon () {
		return isCommon;
	}

	/**
	 * Set the value related to the column: is_common
	 * @param isCommon the is_common value
	 */
	public void setIsCommon (java.lang.Integer isCommon) {
		this.isCommon = isCommon;
	}



	/**
	 * Return the value associated with the column: host_folder
	 */
	public com.navigation.pojo.FileSearchConfig getFileSearchConfig () {
		return fileSearchConfig;
	}

	/**
	 * Set the value related to the column: host_folder
	 * @param fileSearchConfig the host_folder value
	 */
	public void setFileSearchConfig (com.navigation.pojo.FileSearchConfig fileSearchConfig) {
		this.fileSearchConfig = fileSearchConfig;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.navigation.pojo.FileSearch)) return false;
		else {
			com.navigation.pojo.FileSearch fileSearch = (com.navigation.pojo.FileSearch) obj;
			if (null == this.getId() || null == fileSearch.getId()) return false;
			else return (this.getId().equals(fileSearch.getId()));
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