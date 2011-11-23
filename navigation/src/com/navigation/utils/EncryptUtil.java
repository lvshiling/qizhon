/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 *
 */
package com.navigation.utils;

import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

/**
 * 加密工具.
 * 
 * @author Derek
 * @version 1.0 2010-5-7
 */
public class EncryptUtil {
	
	/** The Constant CHARSET_NAME. */
	public static final String CHARSET_NAME = "utf-8";
	
	public static enum Algorithm {MD5,SHA,DES};
	
	/** The Constant baseKey. */
	private static final String baseKey = "snsgoo.com";
	
	/** The deskey. */
	private static SecretKeySpec deskey ;
	
	/*初始化DES加解密KEY*/
    static{
		try {
			MessageDigest md = MessageDigest.getInstance(Algorithm.MD5.name());
			byte[] key = md.digest(baseKey.getBytes(CHARSET_NAME));
			deskey = new SecretKeySpec(ArrayUtils.subarray(key, 0, 8), Algorithm.DES.name());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    /**
	 * Instantiates a new encrypt util.
	 */
    private EncryptUtil(){}
    
	/**
	 * MD5  签名
	 * 
	 * @param secret
	 * @return 16进制字符串 长度32
	 */
    public static String md5(String secret){
    	return signature(secret,Algorithm.MD5.name());
    }
	
    /**
     * SHA 签名
     * 
     * @param secret 被签名字符串
     * @return 16进制字符串 长度40
     */
    public static String sha(String secret){
    	return signature(secret,Algorithm.SHA.name());
    }
    
    /**
     * DES 加密
     * 
     * @param secret 待加密字符串
     * @return
     */
    public static String DESencrypt(String secret){
		try {
			Cipher cipher = Cipher.getInstance(Algorithm.DES.name());
			cipher.init(Cipher.ENCRYPT_MODE, deskey);
			byte[] cipherByte = cipher.doFinal(secret.getBytes(CHARSET_NAME));
			return byte2hex(cipherByte);
		} catch (Exception e) {
			e.printStackTrace();
			return StringUtils.EMPTY;
		} 
    }
    
    /**
     * DES 解密
     * 
     * @param secret 待解密字符串
     * @return
     */
    public static String DESdecrypt(String secret){
    	try {
			Cipher cipher = Cipher.getInstance(Algorithm.DES.name());
			cipher.init(Cipher.DECRYPT_MODE, deskey);
			byte[] deCipherByte = cipher.doFinal(hex2byte(secret));
			return new String(deCipherByte, CHARSET_NAME);
		} catch (Exception e) {
			e.printStackTrace();
			return StringUtils.EMPTY;
		} 
    }
    
    /**
	 * Signature.
	 * 
	 * @param secret the secret
	 * @param algorithm the algorithm
	 * @return the string
	 */
    private static String signature(String secret ,String algorithm){
    	 try{
             MessageDigest md = MessageDigest.getInstance(algorithm);
             return byte2hex(md.digest(secret.getBytes(CHARSET_NAME)));
         }catch(Exception e){
             throw new RuntimeException("sign error !");
         }
    }
    
    
    
    /**
     * byte to hex
     * 
     * @param b
     * @return
     */
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

	/**
	 * Hex2byte.
	 * 
	 * @param hex the hex
	 * @return the byte[]
	 * @throws IllegalArgumentException the illegal argument exception
	 */
	private static byte[] hex2byte(String hex) throws IllegalArgumentException { 
		if (hex.length() % 2 != 0) { 
			throw new IllegalArgumentException(); 
		} 
		char[] arr = hex.toCharArray(); 
		byte[] b = new byte[hex.length() / 2]; 
		for (int i = 0, j = 0, l = hex.length(); i < l; i++, j++) { 
			String swap = "" + arr[i++] + arr[i]; 
			int byteint = Integer.parseInt(swap, 16) & 0xFF; 
			b[j] = new Integer(byteint).byteValue(); 
		} 
		return b; 
	}

}
