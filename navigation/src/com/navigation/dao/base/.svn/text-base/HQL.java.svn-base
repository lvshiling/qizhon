
/*
 * HQL.java	2005-7-15
 *
 * 版权所有: 自由思考组织(FTO)软件团队 2000-2005, 保留所有权利.
 * 这个软件是自由思考组织(FTO)软件团队开发的，如果要使用这个软件，请首先阅读并接受许可协议。
 *
 * Copyright 2000-2005 FTO Software Team, Inc. All Rights Reserved.
 * This software is the proprietary information of FTO Software Team, Inc.
 * Use is subject to license terms.
 *
 * FTO站点：http://www.free-think.org
 */

package com.navigation.dao.base;

/**
 * 用于描述一个HQL语句。此HQL语句对象包含有HQL的相关信息，HQL语句类型，HQL语句串，HQL语句中的值，
 * 以及用于SELECT语句的分页信息。HQL类型有如下值：UNDEFINED,UPDATE,SELECT,UNDEFINED_SP,UPDATE_SP,SELECT_SP。
 * 
 * 
 * <p><pre><b>
 * 历史更新记录:</b>
 * 2005-07-15  创建此类型
 * </pre></p>
 * 
 * 
 * @author   wenjian
 * @version  1.0
 * @since    JThink 1.0
 * 
 */
public class HQL implements java.io.Serializable{
  private static final long serialVersionUID = 6626942489436364862L;
  private int type;
	private String hql;
	private Object[] values;
	
	private int rowStartIndex = -1;  //结果集的开始行索引,从0开始
	private int rowLength = -1;			//结果集的行数, 从索引位置(rowStartIndex)开始的行
	
	/**
	 * 创建一个HQL对象
	 * 
	 * @param type HQL语句类型
	 * @param hql HQL语句串, HQL串中的值可用"?"代替
	 * @param values 与HQL串中"?"对应的值对象数组
	 */
	public HQL(int type, String hql, Object[] values){
		if(type<1 ||type>6){
			throw new IllegalArgumentException(
					"类型必须是在此类中定义的常量.");
		}
		this.type = type;
		this.hql = hql;
		this.values = values==null?new Object[0]:values;
	}
	
	/**
	 * 创建一个HQL对象, 此构造方法主要用来创建带有分页信息的HQL语句
	 * 
	 * @param type HQL语句类型
	 * @param hql HQL语句串
	 * @param values HQL语句中的值数组
	 * @param rowStartIndex 结果集的开始索引位置
	 * @param rowLength 结果集的长度
	 */
	public HQL(int type, String hql, Object[] values, int rowStartIndex, int rowLength){
		if(type<1 ||type>6){
			throw new IllegalArgumentException(
					"类型必须是在此类中定义的常量.");
		}
		this.type = type;
		this.hql = hql;
		this.values = values==null?new Object[0]:values;
		this.rowStartIndex = rowStartIndex;
		this.rowLength = rowLength;
	}

	/**
	 * 返回HQL语句的类型
	 */
	public int getType(){
		return type;
	}
	
	/**
	 * 返回HQL语句串
	 */
	public String getHQLString(){
		return hql;
	}
	
	/**
	 * 返回在HQL语句串中的值数组
	 */
	public  Object[] getValues(){
		return values;
	}
	
	/**
	 * 返回结果集的开始索引值
	 */
	public int getRowStartIndex(){
		return rowStartIndex;
	}
	
	
	/**
	 * 返回结果集长度
	 */
	public  int getRowLength(){
		return rowLength;
	}
	
	
  /**
   * 常量，HQL类型，不明确的操作
   */
  public static final int UNDEFINED = 1;	
  /**
   * 常量，HQL类型，更新操作(Insert, Update)
   */
  public static final int UPDATE = 2;
  /**
   * 常量，HQL类型，查询操作(Select)
   */
  public static final int SELECT = 3;

  /**
   * 常量，HQL类型，不明确的存储过程调用
   */
  //public static final int UNDEFINED_SP = 4;
  /**
   * 常量，HQL类型，更新操作的存储过程调用
   */
  //public static final int UPDATE_SP = 5;
  /**
   * 常量，HQL类型，查询操作的存储过程调用
   */
  //public static final int SELECT_SP = 6;

}
