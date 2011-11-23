/**
 * 
 */
package com.navigation.action.movie;

import java.util.ArrayList;
import java.util.List;

import com.navigation.action.BaseAction;
import com.navigation.action.gpass.GpassAction;
import com.navigation.domain.FileBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.security.SessionUtil;
import com.navigation.utils.Constants;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Apr 20, 2011 11:09:09 AM
 */
public class MovieAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String targetDirectory;
	
	/**
	 * 列表
	 * @return
	 * @throws SessionException 
	 */
	public String index() throws SessionException{
		SessionUtil.getLogonUID();
		List<FileBean> fileList=new ArrayList<FileBean>();
		if(null == targetDirectory) targetDirectory="";
		else targetDirectory = StringUtil.decode(targetDirectory);
		try {
			GpassAction.__getFileListByPath(Constants.getInstance().path_movie, targetDirectory, fileList);
		} catch (AjaxJsonException e) {
			e.printStackTrace();
		}
		this.getRequest().setAttribute("fileList", fileList);
		return "index";
	}

}
