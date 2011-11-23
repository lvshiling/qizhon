/**
 * 
 */
package com.navigation.action.file;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.navigation.action.BaseAction;
import com.navigation.action.gpass.GpassAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.FileBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.SessionException;
import com.navigation.pojo.FileGpass;
import com.navigation.pojo.FileSearch;
import com.navigation.pojo.FileSearchConfig;
import com.navigation.pojo.Topic;
import com.navigation.pojo.UserMail;
import com.navigation.security.SessionUtil;
import com.navigation.security.UserState;
import com.navigation.service.FileService;
import com.navigation.service.TopicService;
import com.navigation.service.UserService;
import com.navigation.utils.Constants;
import com.navigation.utils.FileUtil;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Jun 13, 2011 11:49:53 AM
 */
public class FileAction extends BaseAction{

	/**
	 * 文件索引
	 */
	private static final long serialVersionUID = 1L;
	public Integer fileConfigId;
	public String fileConfigPath;
	public String fileConfigRealPath;
	public String fileConfigName;
	public String keyWord;
	public Integer[] folders;
	
	public Integer gpassFlag;
	public Integer topicFlag;
	public Integer gpassHistoryFlag;
	public Integer mailFlag;
	
	@Resource
	public FileService fileService;
	@Resource
	public TopicService topicService;
	@Resource
	public UserService userService;
	
	public File Filedata;
    public String FiledataContentType;
    public String FiledataFileName;

	/**
	 * 首页 搜索框及结果
	 * @return
	 */
	public String index(){
		boolean indexPermit = false;
		msg = "外网(公网)访问公司资源 限定只有用域用户登录后方可访问! 请先 [<a href='javascript:login();'>点击这里登录</a>]";
		
		if(SessionUtil.isLogon()){
			UserState state = SessionUtil.getCurrentUser();
			String email = state.getUser().getMail();
			if(email.toLowerCase().indexOf("@ztgame.com")!= -1 || email.toLowerCase().equals("319962@163.com")){
				indexPermit = true;
			}
		}
		this.getRequest().setAttribute("indexPermit", indexPermit);
		
		List<FileSearchConfig> list = fileService.getConfigList();
		this.getRequest().setAttribute("FileSearchConfigList", list);
		return "index";
	}
	
	/**
	 * 管理界面
	 * @return
	 */
	public String manager(){
		String author = userToken.getUser().getMail();
		//if(!author.equalsIgnoreCase("wanghui2@ztgame.com"))return ERROR;
		List<FileSearchConfig> list = fileService.getConfigList();
		this.getRequest().setAttribute("FileSearchConfigList", list);
		return "manager";
	}
	
	/**
	 * 创建搜索配置
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxAddConfig() throws AjaxJsonException{
		try {
			fileService.addNewConfig(fileConfigName, fileConfigPath,fileConfigRealPath);
		} catch (Exception e) {
			throw new AjaxJsonException(e.getMessage());
		}
		setJson(AjaxData.getSuccessJson("创建成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 搜索结果 
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxSearchFile() throws AjaxJsonException{
		if(!StringUtil.isNullOrEmpty(keyWord))keyWord = keyWord.trim();
		
		//搜索文件资源
		if(folders!= null && folders.length >0){
			List<FileSearch> fileList = this.fileService.searchFile(keyWord,folders,p);
			this.getRequest().setAttribute("fileList",fileList);
		}
		
		//搜索GPASS
		if(gpassFlag!= null  && gpassFlag == 1){
			List<FileBean> gpassResult = this.searchGpass(keyWord);
			this.getRequest().setAttribute("gpassResult",gpassResult);
		}

		//搜索TOPIC
		if(topicFlag!= null  && topicFlag == 1){
			List<Topic> topicResult = this.topicService.searchTopic(keyWord,pageSize,p,areaId);
			this.getRequest().setAttribute("topicResult",topicResult);
		}

		//搜索GPASS HISTORY
		if(gpassHistoryFlag!= null  && gpassHistoryFlag == 1){
			List<FileGpass> gpassHistoryResult = this.fileService.searchGpassHistory(keyWord,p,pageSize);
			this.getRequest().setAttribute("gpassHistoryResult",gpassHistoryResult);
		}
		
		//搜索用户邮件
		if(mailFlag != null && mailFlag == 1){
			try {
				Integer userId = SessionUtil.getLogonUID();
				List<UserMail> mailResult = this.userService.searchUserMail(userId,keyWord,p,pageSize);
				this.getRequest().setAttribute("mailResult",mailResult);
			} catch (SessionException e) {
			}
		}
		
		return "ajaxSearchFile";
	}
	
	/**
	 * 搜索 邮件
	 * @return
	 */
	public String ajaxSearchMail(){
		if(mailFlag != null && mailFlag == 1){
			try {
				Integer userId = SessionUtil.getLogonUID();
				List<UserMail> mailResult = this.userService.searchUserMail(userId,keyWord,p,pageSize);
				this.getRequest().setAttribute("mailResult",mailResult);
			} catch (SessionException e) {
			}
		}
		return "ajaxSearchMail";
	}
	
	/**
	 * 搜索帖子
	 * @return
	 */
	public String ajaxSearchTopic(){
		if(!StringUtil.isNullOrEmpty(keyWord)){
			keyWord = keyWord.trim();
			List<Topic> topicResult = this.topicService.searchTopic(keyWord,pageSize,p,areaId);
			this.getRequest().setAttribute("topicResult",topicResult);
		}
		return "ajaxSearchTopic";
	}
	
	/**
	 * 搜索文件资源
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxSearchFolder() throws AjaxJsonException{
		if(!StringUtil.isNullOrEmpty(keyWord))keyWord = keyWord.trim();
		//搜索文件资源
		List<FileSearch> fileList = this.fileService.searchFile(keyWord,folders,p);
		this.getRequest().setAttribute("fileList",fileList);
		return "ajaxSearchFolder";
	}
	
	/**
	 * 更新搜索 完整
	 * @return
	 * @throws AjaxJsonException 
	 */
	public String ajaxUpdatePath() throws AjaxJsonException{
		try {
			fileService.updateFileCache(fileConfigId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		setJson(AjaxData.getSuccessJson("更新成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 手动增量 更新 
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxAddOnUpdatePath() throws AjaxJsonException{
		if(StringUtil.isNullOrEmpty(fileConfigPath)) throw new AjaxJsonException("路径不得为空");
		try {
			fileService.updateAddOnFileCache(fileConfigId,fileConfigPath);
		} catch (Exception e) {
			e.printStackTrace();
			throw new AjaxJsonException(e.getMessage());
		}
		setJson(AjaxData.getSuccessJson("更新成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * GPASS搜索  实时
	 * @return
	 */
	public String ajaxSearchGpass(){
		if(!StringUtil.isNullOrEmpty(keyWord))keyWord = keyWord.trim();
		List<FileBean> gpassResult = this.searchGpass(keyWord);
		this.getRequest().setAttribute("gpassResult",gpassResult);
		return "ajaxSearchGpass";
	}

	private List<FileBean> searchGpass(String kw) {
		List<FileBean> fileList=new ArrayList<FileBean>();
		List<FileBean> fileListResult=new ArrayList<FileBean>();
		try {
			GpassAction.__getFileListByPath(Constants.getInstance().path_gpass,"",fileList);
		} catch (AjaxJsonException e) {
			e.printStackTrace();
		}
		for (FileBean fileBean : fileList) {
			String title = fileBean.getFileName();
			if(title.toLowerCase().indexOf(kw.toLowerCase())!= -1){
				fileListResult.add(fileBean);
			}
		}
		return fileListResult;
	}
	
	/**
	 * 搜索GPASS HISTORY
	 * @return
	 */
	public String ajaxSearchGpassHistory(){
		if(!StringUtil.isNullOrEmpty(keyWord))keyWord = keyWord.trim();
		List<FileGpass> gpassHistoryResult = this.fileService.searchGpassHistory(keyWord,p,pageSize);
		this.getRequest().setAttribute("gpassHistoryResult",gpassHistoryResult);
		return "ajaxSearchGpassHistory";
	}
	
	/**
	 * 上传 文件批量
	 * @return
	 */
	public String ajaxMultUpload2(){
		Map<String, String> map = new HashMap<String, String>();
		try{
			Integer userId = null;
			if(!StringUtil.isNullOrEmpty(target)) userId = Integer.parseInt(StringUtil.decode(target));
			if(userId != null){
				int buf = 0;
				String fileName = userId + "_" + System.currentTimeMillis() + ".jpg";
				String dictroy = Constants.getInstance().avatar_path + "/picture/"+userId;
				FileUtil.createDir(dictroy, true);
				String filePath = dictroy + "/" + fileName;
				FileOutputStream fos = new FileOutputStream(new File(filePath));
				byte[] buffer = new byte[4096];
				while ((buf = this.getRequest().getInputStream().read(buffer)) != -1)
					fos.write(buffer, 0, buf);
				fos.close();
				
				map.put("code", "A00001");
				map.put("message", "");
				map.put("data", "");
				//持久化
				this.userService.saveUserPicture(userId,fileName);
			}
		}catch (Exception e) {
			e.printStackTrace();
			map.put("code", "M00001");
			map.put("data", e.getMessage());
		}
		this.setJson(StringUtil.toJson(map));
		return AJAX_JSON_RESULT;
	}
	
	public String ajaxUploadAuth(){
		Map<String, String> map = new HashMap<String, String>();
		Integer userId = null;
		if(!StringUtil.isNullOrEmpty(target)) userId = Integer.parseInt(target);
		System.out.println(userId + " : "+Filedata);
		if(Filedata != null && userId != null){
			System.out.println(Filedata.getAbsolutePath());
			String fileName = userId+"_"+new Date().getTime()+"."+FileUtil.getExtension(FiledataFileName);
			String dir = Constants.getInstance().avatar_path+File.separator+"picture"+File.separator+userId;
			FileUtil.createDir(dir, true);
			String fileFullName = dir+File.separator+fileName;
			Filedata.renameTo(new File(fileFullName));
			map.put("code", "A00001");
			map.put("message", "");
			map.put("data", fileName);
			//更新用户默认照片
			this.userService.changeUserPic(userId, fileName, true);
			//持久化
			this.userService.saveUserPicture(userId,fileName);
			//加入用户动态
			this.userService.uploadImgUserNews(userId, fileName, 1);
		}
		this.setJson(StringUtil.toJson(map));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 上传 文件批量
	 * @return
	 */
	public String ajaxMultUpload(){
		Map<String, String> map = new HashMap<String, String>();
		Integer userId = null;
		System.out.println(target);
		if(!StringUtil.isNullOrEmpty(target)) userId = Integer.parseInt(StringUtil.decode(target));
		System.out.println(userId + " : "+Filedata);
		if(Filedata != null && userId != null){
			System.out.println(Filedata.getAbsolutePath());
			String fileName = userId+"_"+new Date().getTime()+"."+FileUtil.getExtension(FiledataFileName);
			String dir = Constants.getInstance().avatar_path+File.separator+"picture"+File.separator+userId;
			FileUtil.createDir(dir, true);
			String fileFullName = dir+File.separator+fileName;
			Filedata.renameTo(new File(fileFullName));
			map.put("code", "A00001");
			map.put("message", "");
			map.put("data", "");
			//更新用户默认照片
			this.userService.changeUserPic(userId, fileName, true);
			//持久化
			this.userService.saveUserPicture(userId,fileName);
			//加入用户动态
			this.userService.uploadImgUserNews(userId, fileName, 1);
		}
		this.setJson(StringUtil.toJson(map));
		return AJAX_JSON_RESULT;
	}

	public File getFiledata() {
		return Filedata;
	}

	public void setFiledata(File filedata) {
		Filedata = filedata;
	}

	public String getFiledataContentType() {
		return FiledataContentType;
	}

	public void setFiledataContentType(String filedataContentType) {
		FiledataContentType = filedataContentType;
	}

	public String getFiledataFileName() {
		return FiledataFileName;
	}

	public void setFiledataFileName(String filedataFileName) {
		FiledataFileName = filedataFileName;
	}

}
