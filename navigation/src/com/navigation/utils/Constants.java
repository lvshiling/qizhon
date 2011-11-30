/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * The Class Constants.
 * 
 * @author derek
 * @version 2010-4-5 23:56:04
 * @since 1.0
 */
@Component
public class Constants {

	private static Constants instance;

	public boolean isDebugMode = false;

	/** 工程实际所在物理路径 */
	public static String APP_DIR;

	/** 应用上下文路径 比如 /snsgoo */
	public static String CONTEXT_PATH;

	/** 路径 * */
	@Value("#{constant.gpass}")
	public String path_gpass;

	@Value("#{constant.movie}")
	public String path_movie;

	@Value("#{constant.certPath}")
	public String cert_path;

	@Value("#{constant.avatarPath}")
	public String avatar_path;

	@Value("#{constant.xamppServer}")
	public String xampp_server;

	@Value("#{constant.xamppServerPort}")
	public int xampp_port;

	@Value("#{constant.xamppServerAdmin}")
	public String xampp_admin;

	@Value("#{constant.xamppServerPassword}")
	public String xampp_password;
		
	@Value("#{constant.xamppResource}")
	public String xampp_resource;
	
	@Value("#{constant.red5Server}")
	public String red5_server;
	
	@Value("#{constant.redOrginServer}")
	public String red_orgin_server;

	@Value("#{constant.recordTempPath}")
	public String record_temp_path;
	
	@Value("#{constant.rmbLebiExchangeRate}")
	public int rmb_lebi_exchange_rate;
	
	@Value("#{constant.authCallbackBW}")
	public String auth_callback_BW;

	public static Constants getInstance() {
		if (instance != null) {
			return instance;
		} else {
			throw new IllegalArgumentException("Please create instance of Constants.class by Spring!");
		}
	}

	private Constants() {
		instance = this;
	}
}
