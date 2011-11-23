/*
 * Copyright (C) 2010 The Snsgoo Network, Inc. All rights reserved.
 */
package com.navigation.config;

import java.io.File;
import java.io.FileReader;
import java.io.Reader;

import org.logicalcobwebs.proxool.ProxoolFacade;
import org.logicalcobwebs.proxool.configuration.JAXPConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;

/**
 * The Class DBpoolConfigurator.
 * 
 * @author Derek
 * @version 1.0 2010-11-26
 */
public class DBpoolConfigurator {
	
	/** The xml file. */
	private Resource xmlFile;
	/** The Constant LOG. */
	private static final Logger log = LoggerFactory.getLogger(DBpoolConfigurator.class);
	
	/**
	 * Inits the.
	 */
	public void init(){
		try {
            File file = xmlFile.getFile();
            Reader reader = new FileReader(file);
            JAXPConfigurator.configure(reader, false);
            log.warn("Proxool is init");
        } catch (Exception e) {
        	log.error("Problem configuring " + xmlFile.getFilename(), e);
        }
	}
	
	/**
	 * Destroy.
	 */
	public void destroy(){
		ProxoolFacade.shutdown(0);
		log.warn("Proxool is shutdown");
	}

	/**
	 * Gets the xml file.
	 * 
	 * @return the xml file
	 */
	public Resource getXmlFile() {
		return xmlFile;
	}

	/**
	 * Sets the xml file.
	 * 
	 * @param xmlFile the new xml file
	 */
	public void setXmlFile(Resource xmlFile) {
		this.xmlFile = xmlFile;
	}
}
