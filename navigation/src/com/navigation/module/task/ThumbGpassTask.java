/**
 * 
 */
package com.navigation.module.task;

import com.navigation.service.FileService;
import com.navigation.utils.DateUtils;

/**
 * @author wanghui2
 *
 * Jun 17, 2011 4:31:19 PM
 */
public class ThumbGpassTask {

	private FileService fileService;
	
	/**
	 * 缓存GPASS
	 */
	public void execute(){
		System.out.println("********** : "+DateUtils.format());
		fileService.updateGpassDaily();
	}

	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
}
