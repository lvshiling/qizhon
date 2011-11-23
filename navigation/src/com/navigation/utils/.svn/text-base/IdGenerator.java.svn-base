/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.utils;

import java.io.Serializable;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Random;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;

/**
 * 
 * ID唯一主键生成器
 *
 * @author Derek
 * @version 1.0, 2010-5-11
 */
public class IdGenerator {
	private static String IP = "0000";
	private static final short concurrent = 7;
	private static final String JVM = Integer.toHexString((int)System.currentTimeMillis());
	private static ReentrantLock[] locks ;
	private static short[] counters ;
	private static final int maxTryRandomLockNum = 2;
	private static short[][] range;

	static {
		try {
			IP = byte2hex(ArrayUtils.subarray(InetAddress.getLocalHost().getAddress(), 2, 4));
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		locks = new ReentrantLock[concurrent];
		counters = new short[concurrent];
		range = new short[concurrent][2];
		for(short i = 0 ; i < concurrent ; i++){
			locks[i] = new ReentrantLock();
			counters[i] = 0;
			range[i] = new short[]{(short)(Short.MAX_VALUE/concurrent*i+1),(short)((Short.MAX_VALUE/concurrent)*(i+1))};
		}
	}
	
	private static String format(int intval) {
		return StringUtils.leftPad(Integer.toHexString(intval), 8, "0");
	}
	
	private static String format(short shortval) {
		return StringUtils.leftPad(Integer.toHexString(shortval), 4, "0");
	}

	public static Serializable generateID() {
		return new StringBuilder(32)
			.append(Long.toHexString(System.currentTimeMillis()))
			.append(JVM)
			.append(IP)
			.append(format(getCount()))
			.toString();
	}
	
	public static Serializable generateID(String sep) {
		return new StringBuilder(36)
			.append(Long.toHexString(System.currentTimeMillis())).append(sep)
			.append(JVM).append(sep)
			.append(IP).append(sep)
			.append(format(getCount()))
			.toString();
	}
	
	/**
	 * Unique in a millisecond for this JVM instance (unless there
	 * are > Short.MAX_VALUE instances created in a millisecond)
	 */
	private static short getCount() {
		int index = getLockIndex();
		short[] r = range[index];
		locks[index].lock();
		try{
			short v = ++counters[index];
			if (v < r[0] || v > r[1]) counters[index] = r[0];
		}finally{ 
			locks[index].unlock();
		}
		return counters[index];
	}
	
	/**
	 * 获取锁
	 * 先从并发锁中随机获取一个区间锁(尝试maxTryRandomLockNum次)；如果该锁被其他线程占用，
	 * 则计算所有锁中等待线程等待队列最少的锁返回
	 * 
	 * @return LockIndex
	 */
	private static int getLockIndex(){
		for(int num = 0 ; num < maxTryRandomLockNum; num++){
			int index = getRandomLockIndex();
			if(index >= 0) return index;
		}
		
		int queueLenth = 1;
		int index = 0;
		for(int i = 0;i < concurrent ;i++){
			int temp;
			if(i == 0){
				queueLenth = locks[i].getQueueLength();
				temp = queueLenth;
			}else{
				temp = locks[i].getQueueLength();
			}
			if(temp == 0)return i;
			
			if(temp < queueLenth){
				index = i;
				queueLenth = temp;
			}
		}
		return index;
	}
	
	private static int getRandomLockIndex(){
		int index = RandomUtils.nextInt(concurrent);
		ReentrantLock lock = locks[index];
		if(!lock.isLocked())return index;
		else return -1;
	}
		
    private static String byte2hex(byte b[]){
        StringBuilder hs = new StringBuilder();
        String stmp = "";
        for(int n = 0; n < b.length; n++){
            stmp = Integer.toHexString(b[n] & 0xff);
            if(stmp.length() == 1)
                hs.append("0").append(stmp);
            else
                hs.append(stmp);
        }
        return hs.toString();
    }
	
    private static String getMac(){
   	 String macString = null;
//   	 try {
//			Enumeration<NetworkInterface> netInterfaces=NetworkInterface.getNetworkInterfaces();
//			while(netInterfaces.hasMoreElements()){
//				NetworkInterface ni = netInterfaces.nextElement();
//				byte[] mac = ni.getHardwareAddress();
//				if(mac != null){
//					macString = byte2hex(mac);
//					break;
//				}
//			}
//		} catch (SocketException e) {
//			e.printStackTrace();
//		} 
		if(macString == null){
			Random random = new Random();
			byte[] randomByte = new byte[4];
			random.nextBytes(randomByte);
			macString = byte2hex(randomByte);
		}
		return macString;
   }
    
	public static void main(String[] args){
		for(int i =0;i<20;i++)
	    System.out.println(generateID("-"));
	}
}
