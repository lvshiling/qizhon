package com.navigation.jiasu.pojo.base;

/**
 * AbstractGameZone entity provides the base persistence definition of the
 * GameZone entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class BaseGameZone implements java.io.Serializable {

	// Fields

	private Long id;
	private String company;
	private String game;
	private String zone;
	private String gateway;
	private String port;
	private String user;
	
	// answer 9-2
	private Integer status;

	// Constructors

	/** default constructor */
	public BaseGameZone() {
	}

	/** full constructor */
	// answer  9-2
	
	public BaseGameZone(String company, String game, String zone, String gateway, String port, String user,Integer status) {
		this.company = company;
		this.game = game;
		this.zone = zone;
		this.gateway = gateway;
		this.port = port;
		this.user = user;
		
		this.status = status;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getGame() {
		return this.game;
	}

	public void setGame(String game) {
		this.game = game;
	}

	public String getZone() {
		return this.zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getGateway() {
		return this.gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getPort() {
		return this.port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}