package com.navigation.jiasu.pojo;

import com.navigation.jiasu.pojo.base.BaseGameZone;

/**
 * GameZone entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class GameZone extends BaseGameZone implements java.io.Serializable {

	private static final long serialVersionUID = 2912793330477736487L;

	// Constructors

	/** default constructor */
	public GameZone() {
	}

	/** full constructor */
	public GameZone(String company, String game, String zone, String gateway, String port, String user, Integer status) {
		super(company, game, zone, gateway, port, user,status);
	}

}
