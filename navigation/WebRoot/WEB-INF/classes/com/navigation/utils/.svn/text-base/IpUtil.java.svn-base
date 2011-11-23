/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) IpUtil.java 1.0 2008-11-17
 */

package com.navigation.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * IP转换工具
 * 
 * @author guohouqiang
 * @version 1.0 ,2008-11-17
 */
public class IpUtil {
        
	private static final Logger log = LoggerFactory.getLogger(IpUtil.class);

	private static final long NET_MASK_24 = 4294967040L;

	// private static final long NET_MASK_16 = 4294901760l;
	
	/**
	 * 将127.0.0.1形式的字符串IP地址转换成10进制整数
	 * 
	 * @param strIp
	 * @return
	 */
	public static long ipToLong(String strIp) {
		try {
			long[] ip = new long[4];
			String[] ipStr = strIp.split("\\.");
			for (int i = 0; i < ipStr.length; i++) {
				ip[i] = Long.parseLong(ipStr[i]);
			}
			return (ip[0] << 24) + (ip[1] << 16) + (ip[2] << 8) + (ip[3]);
		} catch (Exception e) {
			log.info("IP:" + strIp + " convert to long error!");
			return 0L;
		}
	}

	/**
	 * 24位子网掩码对应的网段
	 * 
	 * @param longIp
	 * @return
	 */
	public static long longIpNM24(long longIp) {
		return longIp & NET_MASK_24;
	}
	
	public static long longBroadcastNM24(long longIp) {
		return (longIp & NET_MASK_24) + 255L;
	}

	/**
	 * 将十进制整数型IP转换成127.0.0.1形式的字符串IP地址
	 * 
	 * @param longIp
	 * @return
	 */
	public static String longToIp(long longIp) {
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append(String.valueOf(longIp >>> 24));
			sb.append(".");
			sb.append(String.valueOf((longIp & 0x00FFFFFF) >>> 16));
			sb.append(".");
			sb.append(String.valueOf((longIp & 0x0000FFFF) >>> 8));
			sb.append(".");
			sb.append(String.valueOf(longIp & 0x000000FF));
			return sb.toString();
		} catch (Exception e) {
			log.info("IP:" + longIp + " convert to String error!");
			return "";
		}
	}
	
	public static Long[] getSameRangeIpAddrStartLong(Long ipAddr){
	   Long[] retLong = new Long[]{longIpNM24(ipAddr),longBroadcastNM24(ipAddr)};
	   return retLong;
	}
}
