package com.navigation.utils;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.httpclient.util.DateUtil;

import com.navigation.domain.FileBean;


/**
 * 处理关于文件（<code>File</code>）的一个便捷工具类。
 * 
 */
public class FileUtil extends StringUtil {
    
    @SuppressWarnings("all")
    
    /**
     * 每KByte（千字节）的字节数。
     */
    public static final long BYTES_BY_KBYTE = 1024L;
    
    /**
     * 每MByte（兆字节）的字节数。
     */
    public static final long BYTES_BY_MBYTE = 1024L * 1024L;
    
    /**
     * 每GByte（千兆字节）的字节数。
     */
    public static final long BYTES_BY_GBYTE = 1024L * 1024L * 1024L;
    
    /** 文件目录分割线 */
    public static final String FILE_URL_DELEAVE = "/";

    /**
     * 返回指定文件名称（可能含有路径）的文件扩展名，若该名称长度不大于2，或者为空，则返回空字符串。
     * 
     * @param fileName 指定的文件名称（可能含有路径）。
     * @return 指定文件的名称的扩展名，如果该文件名为空或者长度不大于2，则返回空字符串。
     */
    public static String getExtension(String fileName) {
        if(fileName == null || fileName.length() <= 2)
            return EMPTY;
        int spos = fileName.lastIndexOf('.');
        if(spos > 0)
            return fileName.substring(spos + 1);
        else
            return EMPTY;
    }
    
    /**
     * 返回指定文件（文件夹）的大小（单位：B）。
     * 
     * @param file 指定的文件。
     * @return 指定文件的大小，若文件不存在，或者为文件夹，则返回文件夹下所有的文件的大小。
     */
    public static long getFileSize(File file) {
        long size = 0L;
        if(file == null || !file.exists())
            return 0L;
        if(file.isDirectory()) {
            File[] files = file.listFiles();
            for(File f : files) {
                if(f.isFile())
                    size += f.length();
                else
                    size += getFileSize(f);
            }
        } else {
            size += file.length();
        }
        return size;
    }
    
    /**
     * 返回格式化的给定Byte大小的文件大小。
     * 
     * @param fileSize 指定的文件大小（单位：Byte）。
     * @return 格式化的文件大小。
     */
    public static String format(long fileSize) {
        if(fileSize > 0 && fileSize < BYTES_BY_KBYTE) {
            return format(fileSize, "B");
        } else if(fileSize >= BYTES_BY_KBYTE && fileSize < BYTES_BY_MBYTE) {
            return format(fileSize, "K");
        } else if(fileSize >= BYTES_BY_MBYTE && fileSize < BYTES_BY_GBYTE) {
            return format(fileSize, "M");
        } else if(fileSize >= BYTES_BY_GBYTE) {
            return format(fileSize, "G");
        } else {
            return "";
        }
    }
    
    /**
     * 返回格式化的给定Byte大小的文件大小（该大小由指定的单位决定）。
     * <pre>
     * System.out.println(FileUtil.format(1234560, "K"));
     * // output:
     * 1,205.62 KB
     * System.out.println(FileUtil.format(1234560, "M"));
     * // output:
     * 1.18 MB
     * </pre>
     * 
     * @param fileSize 指定的文件大小（单位：Byte）。
     * @param unit 单位（B、K、M、G、T……）。
     * @return 格式化的文件大小。
     */
    public static String format(long fileSize, String unit) {
        NumberFormat f1 = new DecimalFormat("#,##0");
        NumberFormat f2 = new DecimalFormat("#,##0.00");
        if("B".equalsIgnoreCase(unit)) {
            return f1.format(fileSize) + " " + unit;
        } else if("K".equalsIgnoreCase(unit)) {
            return f2.format((double)fileSize / (double)BYTES_BY_KBYTE) + " KB";
        } else if("M".equalsIgnoreCase(unit)) {
            return f2.format((double)fileSize / (double)BYTES_BY_MBYTE) + " MB";
        } else if("G".equalsIgnoreCase(unit)) {
            return f2.format((double)fileSize / (double)BYTES_BY_GBYTE) + " GB";
        } else {
            return "";
        }
    }
    
    /**
     * 返回指定文件夹里的文件个数。若该<tt>file</tt>为<code>null</code>，则返回 0。
     * 
     * @param file 表示一个文件夹的<code>java.io.File</code>。
     * @return 指定文件夹里的文件总个数，若该<tt>file</tt>表示一个文件，则返回 1。
     */
    public static int getFileCount(File directory) {
        return getFileCount(directory, null);
    }
    
    /**
     * 返回指定文件夹的文件个数，返回的数量受参数<tt>extension</tt>影响。
     * <p>
     * 若指定的<tt>directory</tt>为<code>null</code>或者不存在，则返回 0，若表示一个文件，则永远返回 1。
     * 若参数<tt>extension</tt>为<code>null</code>或者空字符串，则表示计算所有文件，否则只计算指定扩展名的文件的个数。
     * </p>
     * <pre>
     * File file = new File("D:\\Workspace\\gavc\\WebContent\\images\\defaults");
     * // 只计算扩展名为jpg和gif的文件个数
     * int count = FileUtil.getFileCount(file, "jpg,gif");
     * </pre>
     * 
     * @param directory 指定的表示文件夹的<code>java.util.File</code>。
     * @param extension 指定的扩展名。
     * @return 指定文件夹里的文件个数。返回的数量受参数<tt>extension</tt>影响。
     */
    public static int getFileCount(File directory, String extension) {
        if(directory == null || !directory.exists())
            return 0;
        String[] exts = null;
        if(extension != null && extension.trim().length() != 0)
            exts = extension.split(",");
        if(directory.isFile()) {
            if(exts == null)
                return 1;
            else if(belong(exts, getExtension(directory.getName())))
                return 1;
            else
                return 0;
        }
        int count = 0;
        if(directory.isDirectory()) {
            File[] files = directory.listFiles();
            for(File f : files) {
                if(f.isFile()) {
                    if(exts == null || belong(exts, getExtension(f.getName())))
                        count += 1;
                } else {
                    count += getFileCount(f, extension);
                }
            }
        }
        return count;
    }
    
    // 指定的字符串是否和指定的字符串数组中的一项的值相等
    private static boolean belong(String[] strings, String string) {
        if(strings == null || strings.length == 0 || string == null || string.length() == 0)
            return Boolean.FALSE.booleanValue();
        for(String s : strings) {
            if(string.equalsIgnoreCase(s))
                return Boolean.TRUE.booleanValue();
        }
        return Boolean.FALSE.booleanValue();
    }
    
    /**
     * 在指定目录下，生成指定路径的文件夹
     * 
     * @param fileUrl 要生成的文件目录
     * @param parent 标示是否创建此抽象路径名指定目录的父目录(true-创建，false-不创建)
     * @return true-创建成功; false-不创建
     */
    public static boolean createDir(String fileUrl, boolean isFull) {
        File uploadDir = new File(fileUrl);
        boolean result = true;
        if(!uploadDir.exists()){
            if(isFull)
                result = uploadDir.mkdirs();
            else
                result = uploadDir.mkdir();
        }
        return result;
    }
    
    /**
     * 在指定目录下，生成一个当天日期的文件夹，供上传使用
     * 
     * @param fileDir 生成的日期文件夹所在的指定目录
     * @param isFull 标示返回的是完整的上传路径，还是只返回生成的日期目录名称
     * @return 目录生成成功后，新创建的目录，isFull：
     *         <code>true</code>表示返回的是上传的完整路径
     *         <code>false</code>表示只返回生成的日期目录名称
     */
    public static String createDateDir(String fileDir, boolean isFull) {
        String datePath = DateUtil.formatDate(new Date(), "yyyyMMdd");
        String uploadPath = fileDir + datePath;
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists()){
            boolean result = uploadDir.mkdir();
            if(result){
                if(isFull)
                    return uploadPath;
                else
                    return datePath;
            }
        }else{
            if(isFull)
                return uploadPath;
            else
                return datePath;
        }
        return null;
    }
    
    /**
     * 删除指定文件
     * 
     * @param file 要删除的文件
     * @return 删除成功，返回true，反之返回false
     */
    public static boolean deleteFile(File file) {
        if(file.isDirectory())
            return false;
        else{
            if(!file.exists())
                return true;
            if(file.delete())
                return true;
            else
                return false;
        }
    }
    
    /**
     * @return
     */
    public static String getDate() {
        return DateUtil.formatDate(new Date(), "yyyyMMdd");
    }
    
    
    public static void getFileList(String realPath,String disPath, List<FileBean> fileList) {
    	realPath = realPath.trim();
    	if(!StringUtil.isNullOrEmpty(disPath))disPath = disPath.trim();
		FileViewer f = new FileViewer();
		f.setPath(realPath);
		f.refreshList();
		while (f.nextFile()) {
			FileBean fileBean = new FileBean();
			try {
				String fileName = new String(f.getFileName().getBytes("UTF-8"),"UTF-8");
				if (!f.getFileType()) {
					fileBean.setFileName(fileName);
					fileBean.setFloder(StringUtil.isNullOrEmpty(disPath)?realPath:disPath);
					fileBean.setFileType(FileUtil.getExtension(fileName));
					fileList.add(fileBean);
				} else {
					fileBean.setFileName(fileName);
					fileBean.setFloder(StringUtil.isNullOrEmpty(disPath)?realPath:disPath);
					fileList.add(fileBean);
					String newPath = realPath + File.separator + f.getFileName();
					String newDisPath = StringUtil.isNullOrEmpty(disPath)?null:(disPath+ "\\" + f.getFileName());
					getFileList(newPath,newDisPath,fileList);
				}
				if(fileList.size()%100 == 0) System.out.println("=FILE GETING "+fileList.size());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
