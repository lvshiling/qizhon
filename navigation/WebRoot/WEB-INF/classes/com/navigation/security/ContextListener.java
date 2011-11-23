/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.security;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.navigation.utils.Constants;



/**
 * The listener interface for receiving context events. The class that is
 * interested in processing a context event implements this interface, and the
 * object created with that class is registered with a component using the
 * component's <code>addContextListener<code> method. When
 * the context event occurs, that object's appropriate
 * method is invoked.
 * 
 * @see ContextEvent
 */
public class ContextListener implements ServletContextListener {
	
	/** The ctx. */
	private ServletContext ctx;
	
	/** The Constant LOG. */
	private static final Logger log = LoggerFactory.getLogger(ContextListener.class);

	
	/**
	 * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent servletContextEvent) {

	}

	/**
	 * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ctx = servletContextEvent.getServletContext();
		Constants.CONTEXT_PATH = ctx.getContextPath();
		Constants.APP_DIR = ctx.getRealPath("/");
	}
}
