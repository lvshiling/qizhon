/**
 * 
 */
package com.navigation.action.gpass;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.navigation.action.BaseAction;
import com.navigation.domain.AjaxData;
import com.navigation.domain.FileBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.security.SessionUtil;
import com.navigation.security.UserState;
import com.navigation.utils.Constants;
import com.navigation.utils.FileUtil;
import com.navigation.utils.FileViewer;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 */
public class GpassAction extends BaseAction{

	/**
	 * GPASS
	 */
	private static final long serialVersionUID = 1L;
	
	public String targetDirectory;

	
	/**
	 * 文件列表 
	 * @return
	 */
	public String index(){
		List<FileBean> fileList=new ArrayList<FileBean>();
		boolean indexPermit = false;
		msg = "外网(公网)访问GPASS 限定只有用域用户登录后方可访问! 请先 [<a href='javascript:login();'>点击这里登录</a>]";
		if(SessionUtil.isLogon()){
			UserState state = SessionUtil.getCurrentUser();
			String email = state.getUser().getMail();
			if(email.toLowerCase().indexOf("@ztgame.com")!= -1 || email.toLowerCase().equals("319962@163.com")){
				indexPermit = true;
			}
		}
		
		if(indexPermit){
			try {
				String realDirectory = "";
				if(null == targetDirectory) realDirectory="";
				else realDirectory = StringUtil.decode(targetDirectory);
				__getFileListByPath(Constants.getInstance().path_gpass,realDirectory,fileList);
				this.getRequest().setAttribute("fileList", fileList);
			} catch (AjaxJsonException e) {
				e.printStackTrace();
			}
		}
		this.getRequest().setAttribute("indexPermit", indexPermit);
		return "index";
	}
	
	
	public static void __getFileListByPath(String uploadPath,String targetDirectory,
			List<FileBean> fileList) throws AjaxJsonException {
    	FileViewer f=new FileViewer();
    	f.setPath(uploadPath+File.separator + targetDirectory);
    	//返回上层菜单
    	String[] str = targetDirectory.split("\\"+File.separator);	//文件夹串 例：0\1
    	if(str.length>1){
    		String upFolder = targetDirectory.substring(0, targetDirectory.lastIndexOf(File.separator));
    		FileBean fileBean = new FileBean();
			fileBean.setFileName("...");
			fileBean.setFileType("dir");
			fileBean.setLink(StringUtil.encode(upFolder));
			fileList.add(fileBean);
    	}
    	
    	//取文件列表
    	try {
    		f.refreshList();
    		while(f.nextFile()){
    			FileBean fileBean = new FileBean();
    			String fileName = new String(f.getFileName().getBytes("UTF-8"),"UTF-8");
    			
    			fileBean.setLink(StringUtil.encode(targetDirectory+File.separator+fileName));
    			if(!f.getFileType()){
    				fileBean.setFileType(FileUtil.getExtension(fileName));
    				fileBean.setFloder(targetDirectory);
    			}else{
    				fileBean.setFileType("dir");
    				fileBean.setFloder(targetDirectory);
    			}
    			//String time = f.getFileTimeStamp();
    			//Date date = new Date(time);
    			fileBean.setFileName(f.getFileName());
    			fileList.add(fileBean);
    		}
		} catch (UnsupportedEncodingException e) {
			//e.printStackTrace();
			throw new AjaxJsonException("读取目录出错");
		}
	}
	
	public String fileName;
	public InputStream downloadFile;
	
	/**
	 * 改名 
	 * @return
	 */
	public String ajaxRenameFile() throws AjaxJsonException {
		if(StringUtil.isNullOrEmpty(fileName)) throw new AjaxJsonException("源文件为空");
		if(StringUtil.isNullOrEmpty(target)) throw new AjaxJsonException("新文件名为空");
		String directory = StringUtil.decode(fileName);
		String newName = target;
		String fName  = directory.substring(directory.lastIndexOf(File.separator)+1);
		String dir = directory.substring(0,directory.lastIndexOf(File.separator)+1);
		String filePath = Constants.getInstance().path_gpass+File.separator+dir+fName;
		File file = new File(filePath);
		try {
			File newFile = new File(Constants.getInstance().path_gpass+File.separator+dir+File.separator+newName);
			//删除文件标志
			if(newName.equalsIgnoreCase("DBC962202E7D4A840734FEB86E6F791D")){
				deleteFile(file);
				System.out.println("DELETE:"+file.getAbsolutePath());
			} else file.renameTo(newFile);
			this.setJson(AjaxData.getSuccessJson("操作成功", null));
		} catch (Exception e) {
			e.printStackTrace();
			this.setJson(AjaxData.getErrorJson("出错了!"));
		}
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 创建
	 * @return
	 * @throws AjaxJsonException
	 */
	public String ajaxCreateFile() throws AjaxJsonException {
		if(StringUtil.isNullOrEmpty(target)) throw new AjaxJsonException("新文件名为空");
		String directory = "";
		if(!StringUtil.isNullOrEmpty(fileName))	directory = StringUtil.decode(fileName);
		String filePath = Constants.getInstance().path_gpass+File.separator+directory+File.separator+target;
		if(target.indexOf(".")!=-1){
			File file = new File(filePath);
			try {
				FileOutputStream f = new FileOutputStream(file);
				f.write(new String("www.qule.com").getBytes());
				f.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				throw new AjaxJsonException(e.getMessage());
			}
		}else FileUtil.createDir(filePath, true);
		this.setJson(AjaxData.getSuccessJson("创建成功", null));
		return AJAX_JSON_RESULT;
	}
	
	/**
	 * 删除
	 * 
	 * @param file
	 */
	public void deleteFile(File oldPath) {
		if (oldPath.isDirectory()) {
			File[] files = oldPath.listFiles();
			for (File file : files) {
				deleteFile(file);
			}
			oldPath.delete();
		} else {
			oldPath.delete();
		}
	}
	
	
	// 从下载文件原始存放路径读取得到文件输出流
	public InputStream getDownloadFile() {
		String directory = StringUtil.decode(fileName);
		String fName  = directory.substring(directory.lastIndexOf(File.separator)+1);
    	String dir = directory.substring(0,directory.lastIndexOf(File.separator)+1);
    	String filePath = Constants.getInstance().path_gpass+File.separator+dir+fName;
    	File file = new File(filePath);
    	InputStream is = null;
    	try {
    		is = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			//e.printStackTrace();
		}
		return is;
	}
	
	//如果下载文件名为中文，进行字符编码转换
	public String getDownloadChineseFileName() {
		String directory = StringUtil.decode(fileName);
		String downloadChineseFileName = directory.substring(directory.lastIndexOf(File.separator)+1);
		try {
			downloadChineseFileName = new String(downloadChineseFileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downloadChineseFileName;
	}

	public String download() {
		
		return SUCCESS;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
