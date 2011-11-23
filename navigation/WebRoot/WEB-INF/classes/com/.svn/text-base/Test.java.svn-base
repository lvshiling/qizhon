/**
 * 
 */
package com;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.navigation.domain.FileBean;
import com.navigation.utils.FileUtil;
import com.navigation.utils.FileViewer;

/**
 * @author wanghui2
 * 
 * Apr 25, 2011 12:31:42 PM
 */
public class Test {

	/**
	 * @param args
	 *            http://192.168.32.251/service/workflowService?wsdl
	 *            http://192.168.32.253/service/dealWebService
	 */
	private static Map<String, String> hashMap = new HashMap<String, String>();

	public static void main(String[] args) throws Exception {
		/*
		 * try { URL url = new
		 * URL("http://workflow.ztgame.com/service/dealWebService");
		 * DealWebServiceHttpBindingStub web = new
		 * DealWebServiceHttpBindingStub(url,null); DetailModel[] detail =
		 * web.getDeallistByUsername("wangyanyan"); System.out.println(detail);
		 * if(null != detail){ for (DetailModel detailModel : detail) {
		 * System.out.println(detailModel.getHumresname());
		 * System.out.println(detailModel.getSystemname());
		 * System.out.println(detailModel.getUrl());
		 * System.out.println(detailModel.getWorkflowname());
		 * System.out.println(detailModel.getLastmodify()); } } } catch
		 * (AxisFault e) { e.printStackTrace(); } catch (MalformedURLException
		 * e) { e.printStackTrace(); } catch (RemoteException e) {
		 * e.printStackTrace(); } Pattern pattern =
		 * Pattern.compile("\\[OCS:(.+?)\\]"); String str =
		 * "中语言[OCS:wanghui2]222"; Matcher matcher = pattern.matcher(str);
		 * System.out.println(matcher.matches());
		 * System.out.println(matcher.replaceAll("<a
		 * href=\"sip:$1.ztgame.com\">$1</a>"));
		 */

		// System.out.println(StringUtil.md5("123456"));
		//List<FileBean> fileList = new ArrayList<FileBean>();
		// getFileList("v:", fileList);
//		getFileList("e:\\tmp", fileList);
//
//		for (FileBean fileBean : fileList) {
//			System.out.println(fileBean.getFileName());
//			System.out.println(fileBean.getFileType());
//			System.out.println(fileBean.getFileSize());
//			System.out.println(DateUtils.format(fileBean.getFileTime(),"yyyy-MM-dd HH.mm.ss"));
//			System.out.println(fileBean.getFloder());
//			System.out.println("#################");
//		}
//		File file = new File("D:\\111.txt");
//		try {
//			FileInputStream fis = new FileInputStream(file);
//			FileReader fr = new FileReader(file);
//			BufferedReader br = new BufferedReader(fr);
//			while (br.readLine()!=null) {
//				System.out.println(br.readLine());
//			}
//			
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//String s = "\\\\192.168.35.50\\fas270\\电影/这里拒绝低画质、拒绝SD、拒绝RMVB、拒绝枪版/[大盗石川五右卫门].Goemon.2009.Bluray.1080p.DTS.x264-CHD";
		//System.out.println(s.replaceAll("/", "\\\\"));
		
		/*
		URL url = null; 
        HttpURLConnection httpurlconnection = null; 
        // Cookie handler,设置cookie代理，不设置的话，会提示说无法开启session错误
        CookieManager manager = new CookieManager();
        manager.setCookiePolicy(java.net.CookiePolicy.ACCEPT_ALL);
        CookieHandler.setDefault(manager);
        
        url = new URL("http://"); 
        String strPost = "ftpname=&password="; //请求的参数
        httpurlconnection = (HttpURLConnection) url.openConnection();
        httpurlconnection.setDoOutput(true); // 需要向服务器写数据 
        httpurlconnection.setDoInput(true);
        httpurlconnection.setUseCaches(false); // 获得服务器最新的信息 
        httpurlconnection.setAllowUserInteraction(false); 
        httpurlconnection.setRequestMethod("POST"); 
        httpurlconnection.setRequestProperty("Accept-Language", "zh-cn"); 
        httpurlconnection.setRequestProperty("User-Agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows 2000)");
        httpurlconnection.getOutputStream().write(strPost.getBytes()); //将参数写入链接中
        httpurlconnection.getOutputStream().flush(); 
        httpurlconnection.getOutputStream().close(); 
        httpurlconnection.connect();  //链接
        System.out.println("code" + httpurlconnection.getResponseCode()); //请求响应结果
        InputStream urlStream = httpurlconnection.getInputStream();  //返回结果输出流
        
        
        Map<String,List<String>> map = httpurlconnection.getHeaderFields();
        Set<String> keySet = map.keySet();
        for (String string : keySet) {
        	System.out.println("###################"+string);
        	List<String> value = map.get(string);
        	for (String string2 : value) {
				System.out.println(string2);
			}
        	System.out.println("###################");
		}
        
        outPutStream(urlStream);//输出urlStream里面的内容
        
        
        
        httpurlconnection.disconnect();
        
        
		String date = DateUtils.format(new Date(), "yyyyMMddHHmmss");
        */
		
		
	}
	
	private static void getFileList(String path, List<FileBean> fileList) {
		FileViewer f = new FileViewer();
		f.setPath(path);
		f.refreshList();
		while (f.nextFile()) {
			FileBean fileBean = new FileBean();
			try {
				String fileName = new String(f.getFileName().getBytes("UTF-8"),
						"UTF-8");
				String newPath = path + File.separator + f.getFileName();
				if (!f.getFileType()) {
					File file = f.getCurrentFile();
					fileBean.setFileSize(f.getFileSize());
					fileBean.setFileName(fileName);
					fileBean.setFloder(path);
					fileBean.setFileType(FileUtil.getExtension(fileName));
					fileBean.setAbsPath(file.getAbsolutePath());
					fileBean.setFileTime(new Date(file.lastModified()));
					fileList.add(fileBean);

					// FileInputStream fis = new
					// FileInputStream(f.getCurrentFile());
					// if(f.getCurrentFile().length()>1024){
					// //fis.skip(f.getCurrentFile().length()-1024);
					// byte[] buffer = new byte[1024];
					// fis.read(buffer);
					// StringBuffer str = new StringBuffer().append(new
					// String(buffer));
					// // buffer = new byte[1024];
					// // System.out.println(f.getCurrentFile().length());
					// // System.out.println(f.getCurrentFile().length()-1024);
					// // fis.read(buffer,
					// (int)f.getCurrentFile().length()-2048, 1024);
					// // str.append(new String(buffer));
					// String key = StringUtil.md5(str.toString());
					// System.out.println(key+" "+fileName);
					// if(hashMap.containsKey(key)){
					// System.out.println(f.getCurrentFile().getAbsolutePath());
					// System.out.println("###############################");
					// }
					// hashMap.put(key, buffer.toString());
					// }
				} else {
					fileBean.setFileName(fileName);
					fileBean.setFloder(path);
					fileList.add(fileBean);
					getFileList(newPath, fileList);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
