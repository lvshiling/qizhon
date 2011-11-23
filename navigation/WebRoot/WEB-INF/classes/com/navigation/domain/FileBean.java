/**
 * 
 */
package com.navigation.domain;

import java.util.Date;

import com.google.gson.annotations.Expose;

/**
 * @author Administrator
 *
 */
public class FileBean {

	@Expose
	private String fileName;
	@Expose
	private String fileType;
	@Expose
	private String link;
	@Expose
	private String floder;
	@Expose
	private String fileSize;
	@Expose
	private Date fileTime;
	private String absPath;
	
	
	public Date getFileTime() {
		return fileTime;
	}
	public void setFileTime(Date fileTime) {
		this.fileTime = fileTime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getFloder() {
		return floder;
	}
	public void setFloder(String floder) {
		this.floder = floder;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getAbsPath() {
		return absPath;
	}
	public void setAbsPath(String absPath) {
		this.absPath = absPath;
	}
	
}
