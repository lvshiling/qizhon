/**
 * 
 */
package com.navigation.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.navigation.pojo.FileGpass;
import com.navigation.pojo.FileSearch;
import com.navigation.pojo.FileSearchConfig;

/**
 * @author wanghui2
 *
 * Jun 13, 2011 12:09:10 PM
 */
public interface FileService {

	/**
	 * 更新指定文件夹
	 * @param fileConfigId
	 */
	@Transactional
	public void updateFileCache(Integer fileConfigId);
	
	/**
	 * 增加新的配置
	 * @param name
	 * @param path
	 * @param fileConfigRealPath 
	 * @return
	 */
	public FileSearchConfig addNewConfig(String name,String path, String fileConfigRealPath);

	/**
	 * 取得所有配置 文件夹
	 * @return
	 */
	public List<FileSearchConfig> getConfigList();

	/**
	 * 搜索 文件
	 * @param keyWord
	 * @param folders
	 * @param p 
	 * @return
	 */
	public List<FileSearch> searchFile(String keyWord, Integer[] folders, Integer p);

	/**
	 * 增量更新
	 * @param fileConfigId
	 * @param fileConfigPath
	 */
	public void updateAddOnFileCache(Integer fileConfigId, String fileConfigPath);

	/**
	 * 缓存Gpass
	 */
	public void updateGpassDaily();

	/**
	 * 搜索GPASS HISTORY
	 * @param keyWord
	 * @param p
	 * @param pageSize
	 * @return
	 */
	public List<FileGpass> searchGpassHistory(String keyWord, Integer p,
			Integer pageSize);
	
	/**
	 * 上传本地文件到fdfs文件系统
	 * @param localFileName
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws Exception
	 */
	public String upload2Fdfs(String localFileName) throws FileNotFoundException,
			IOException, Exception;
}
