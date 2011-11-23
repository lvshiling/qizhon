/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) DESCrypto.java 2.0 2008-09-02
 */
package com.navigation.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * <code>DES</code> 加密算法给定字符串加解密的便捷类。
 * 
 * @author Liuyiwen
 * @author Fuchun
 * @versin 2.0
 */
public class DESCrypto {
	
	// 日志实例
	//private static final Logger LOG = LoggerFactory.getLogger(DESCrypto.class);

	/**
	 * 普通字符串加密标识。
	 */
	public static final Integer NORMAL_STRING = 1;
	
	/**
	 * 重要字符串加密标识。
	 */
	public static final Integer IMPORTANT_STRING = 2;
	
	// 加密类型。
	private static final String ENCRYPTO_TYPE = "DES";
	
	// 普通字符串加密密钥
	private static final byte[] normalString = {
		(byte)0xda, (byte)0x0b, (byte)0xb0, (byte)0xad,
		(byte)0xa2, (byte)0x54, (byte)0x15, (byte)0xae
	};
	
	// 重要字符串加密密钥
	private static final byte[] importantString = {
		(byte)0xda, (byte)0x0a, (byte)0xb0, (byte)0xad,
		(byte)0xa2, (byte)0x34, (byte)0x15, (byte)0xae
	};
	
	private final static int  ENCODE_XORMASK = 0x62;
    private final static char ENCODE_CHAR_OFFSET1 = 'F';
    private final static char ENCODE_CHAR_OFFSET2 = 'A';
    
    /**
     * 默认的构造方法。
     */
    DESCrypto() {
    }
	
	/**
	 * 加密给定的字符串。用{@link #decrypt(String, int)}方法进行解密。
	 * 
	 * @param input 要加密的字符串。
	 * @return 返回给定字符串的密文。
	 */
	public static String encrypt(String input, int type) {
		byte[] cipherByte = null;
		try {
			SecretKeySpec deskey = null;
			if(type == NORMAL_STRING)
				deskey = new SecretKeySpec(normalString, ENCRYPTO_TYPE);
			else if(type == IMPORTANT_STRING) {
				deskey = new SecretKeySpec(importantString, ENCRYPTO_TYPE);
			}
			Cipher c1 = Cipher.getInstance(ENCRYPTO_TYPE);
			c1.init(Cipher.ENCRYPT_MODE, deskey);
			cipherByte = c1.doFinal(input.getBytes("UTF-8"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return byte2hex(cipherByte);
	}
	
	/**
	 * 解密给定的字符串。给定的字符串为{@link #encrypt(String, int)}加密的字符串。
	 * 
	 * @param input 要解密的密文字符串。
	 * @return 返回解密后的原文字符串。
	 */
	public static String decrypt(String input, int type) {
		byte[] cipherByte = null;
		try {
			SecretKeySpec deskey = null;
			if(type == NORMAL_STRING)
				deskey = new SecretKeySpec(normalString, ENCRYPTO_TYPE);
			else if(type == IMPORTANT_STRING) {
				deskey = new SecretKeySpec(importantString, ENCRYPTO_TYPE);
			}
			Cipher c1 = Cipher.getInstance(ENCRYPTO_TYPE);
			c1.init(Cipher.DECRYPT_MODE, deskey);
			cipherByte = c1.doFinal(hex2byte(input));
		} catch(Exception e) {
//			if( LOG.isInfoEnabled() ) {
//				LOG.info("要解密的密文字符串格式错误，密钥无法解密！\n" + e.getMessage());
//			}
			return "";
		}
		return new String(cipherByte);
	}
	
	/**
	 * 一个快速简洁的加密算法，加密一段字符串，用{@link #decode(String)}方法解密。
	 * 
	 * @param info 要加密的字符串。
	 * @return 返回加密后的密文。
	 */
	public static String encode(String info) {
		StringBuffer buf = new StringBuffer();
		if( info != null && !"".equals(info) ) {
			byte[] bytes = info.getBytes();
			int b;
			
			for (int n = 0; n < bytes.length; n++) {
                b = bytes[n] ^ (ENCODE_XORMASK + n);
                buf.append((char)(ENCODE_CHAR_OFFSET1 + (b & 0x0F)));
                buf.append((char)(ENCODE_CHAR_OFFSET2 + ((b >> 4) & 0x0F)));
            }
		}
		return buf.toString();
	}
	
	/**
	 * 一个快速简洁的加密解密算法，解密一段字符串，用{@link #encode(String)}方法加密。
	 * 
	 * @param info 要加密的字符串。
	 * @return 返回解密后的原文。
	 */
	public static String decode(String info) {
		if( info == null || info.length() <= 0 ) {
			return "";
		}
		
		char[] chars = info.toCharArray();
        byte[] bytes = new byte[chars.length / 2];
        
        int b;
        for (int n = 0, m = 0; n < bytes.length; n++) {
            b = chars[m++] - ENCODE_CHAR_OFFSET1;
            b |= (chars[m++] - ENCODE_CHAR_OFFSET2) << 4;
            bytes[n] = (byte)(b ^ (ENCODE_XORMASK + n));
        }

        return new String(bytes);
	}
	
	private static String byte2hex(byte[] b) { 
		String hs = ""; 
		String stmp = ""; 
		for (int i = 0; i < b.length; i++) { 
		stmp = Integer.toHexString(b[i] & 0xFF); 
			if (stmp.length() == 1) { 
				hs += "0" + stmp; 
			} 
			else { 
				hs += stmp; 
			} 
		} 
		return hs.toUpperCase(); 
	} 

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
