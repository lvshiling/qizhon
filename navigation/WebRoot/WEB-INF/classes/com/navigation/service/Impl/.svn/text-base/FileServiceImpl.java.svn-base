/**
 * 
 */
package com.navigation.service.Impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;

import com.navigation.action.gpass.GpassAction;
import com.navigation.dao.FileGpassDao;
import com.navigation.dao.FileSearchConfigDao;
import com.navigation.dao.FileSearchDao;
import com.navigation.domain.Constant;
import com.navigation.domain.FileBean;
import com.navigation.exception.AjaxJsonException;
import com.navigation.exception.ServiceException;
import com.navigation.pojo.FileGpass;
import com.navigation.pojo.FileSearch;
import com.navigation.pojo.FileSearchConfig;
import com.navigation.service.FileService;
import com.navigation.utils.Constants;
import com.navigation.utils.FileUtil;
import com.navigation.utils.StringUtil;

/**
 * @author wanghui2
 *
 * Jun 13, 2011 12:09:43 PM
 */
public class FileServiceImpl implements FileService {

	@Resource
	public FileSearchDao fileSearchDao;
	@Resource
	public FileSearchConfigDao fileSearchConfigDao;
	@Resource
	public FileGpassDao fileGpassDao;
	
	public FileSearchConfig addNewConfig(String name, String path,String fileConfigRealPath) {
		FileSearchConfig config = new FileSearchConfig();
		config.setFolderName(name);
		config.setFolderPath(path);
		config.setFolderRealPath(fileConfigRealPath);
		this.fileSearchConfigDao.save(config);
		return config;
	}

	public void updateFileCache(Integer fileConfigId) {
		FileSearchConfig config = this.fileSearchConfigDao.get(fileConfigId);
		if(null == config) throw new ServiceException("配置不存在");
		//1删除CACHE
		this.fileSearchDao.deleteAllByFileConfigId(fileConfigId);
		//2更新CACHE
		this.updateCacheFile(config.getFolderRealPath(),config.getFolderPath(),config);
	}

	public List<FileSearchConfig> getConfigList() {
		return fileSearchConfigDao.getConfigList();
	}

	public List<FileSearch> searchFile(String keyWord, Integer[] folders,Integer p) {
		return this.fileSearchDao.search(keyWord,folders,p);
	}

	public void updateAddOnFileCache(Integer fileConfigId, String fileConfigPath) {
		FileSearchConfig config = this.fileSearchConfigDao.get(fileConfigId);
		if(null == config) throw new ServiceException("配置不存在");
		//1真实路径
		String realPath = config.getFolderRealPath().trim()+File.separator+fileConfigPath;
		System.out.println(realPath);
		File file = new File(realPath);
		//2更新CACHE
		if(file.exists()){
			fileConfigPath = fileConfigPath.replaceAll("/", "\\\\");
			String displayPath = config.getFolderPath()+File.separator+fileConfigPath;
			displayPath = displayPath.replaceAll("/", "\\\\");
			FileSearch fileSearch = new FileSearch();
			fileSearch.setFileExt(FileUtil.getExtension(file.getName()));
			String name = file.getName();
			if(name.length()>100) name = name.substring(0,100);
			fileSearch.setFileName(name);
			if(file.isDirectory()){
				this.updateCacheFile(realPath,displayPath,config);
				fileSearch.setIsFolder(1);
				fileSearch.setFilePath(config.getFolderPath()+"\\"+fileConfigPath);
			}else{
				fileSearch.setFilePath(config.getFolderPath());
				fileSearch.setIsFolder(0);
			}
			fileSearch.setFileSearchConfig(config);
			this.fileSearchDao.save(fileSearch);
		}else throw new ServiceException(realPath+"路径不存在");
	}

	private void updateCacheFile(String realPath, String displayPath,FileSearchConfig config) {
		List<FileBean> fileList = new ArrayList<FileBean>();
		FileUtil.getFileList(realPath,displayPath, fileList);
		for (FileBean fileBean : fileList) {
			FileSearch file = new FileSearch();
			file.setFileExt(fileBean.getFileType());
			String name = fileBean.getFileName();
			if(name.length()>100) name = name.substring(0,100);
			file.setFileName(name);
			file.setFilePath(fileBean.getFloder());
			file.setFileSearchConfig(config);
			file.setIsFolder(fileBean.getFileType() == null?1:0);
			this.fileSearchDao.save(file);
		}
		System.out.println("FILE COUNT "+fileList.size());  
	}

	public void updateGpassDaily() {
		List<FileBean> fileList=new ArrayList<FileBean>();
		try {
			GpassAction.__getFileListByPath(Constants.getInstance().path_gpass,"",fileList);
		} catch (AjaxJsonException e) {
			e.printStackTrace();
		}
		Date now = new Date();
		for (FileBean fileBean : fileList) {
			FileGpass fileGpass = new FileGpass();
			String name = fileBean.getFileName();
			if(name.length()>200) name = name.substring(0,200);
			fileGpass.setFileName(name);
			fileGpass.setAddTime(now);
			fileGpass.setFileKey(StringUtil.md5(name));
			this.fileGpassDao.saveOrNot(fileGpass);
		}
	}

	public List<FileGpass> searchGpassHistory(String keyWord, Integer p,
			Integer pageSize) {
		return this.fileGpassDao.searchGpassHistory(keyWord, p, pageSize);
	}

	@Override
	public String upload2Fdfs(String localFileName) throws FileNotFoundException, IOException, Exception {
		ClientGlobal.init(Constant.FDFS_CONF_PATH);
		System.out.println("network_timeout=" + ClientGlobal.g_network_timeout + "ms");
		System.out.println("charset=" + ClientGlobal.g_charset);
 
		TrackerClient tracker = new TrackerClient();
		TrackerServer trackerServer = tracker.getConnection();
		StorageServer storageServer = null;
		StorageClient1 client = new StorageClient1(trackerServer, storageServer);

		NameValuePair[] metaList = new NameValuePair[1];
		metaList[0] = new NameValuePair("fileName", localFileName);
		String fileId = client.upload_file1(localFileName, null, metaList);
		System.out.println("upload success. file id is: " + fileId);
		trackerServer.close();
        
        return fileId;
	}

}
