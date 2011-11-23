/**
 * Copyright (C) 2004-2008 The Giant Network, Inc. All rights reserved.
 *
 * @(#) LoadPathListener.java 1.0 2008-10-28
 */
package com.navigation.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;

import com.navigation.domain.Constant;


/**
 * 服务启动时 初始化网站根路径(domain).
 * 
 * @author Cailijuan
 * @version 1.0, 2008-11-29
 */
@SuppressWarnings("serial")
public class LoadPathListener extends HttpServlet implements ServletContextListener {

    /**
     * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub

    }

    /**
     * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
        Constant.setDomainPath(arg0.getServletContext().getInitParameter("domain"));
        Constant.setStaticPath(arg0.getServletContext().getInitParameter("static"));
        Constant.setImagesPath(arg0.getServletContext().getInitParameter("images"));
        Constant.setStylesPath(arg0.getServletContext().getInitParameter("styles"));
    }
    
}
