
/*
 * Condition.java	2005-7-16
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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 条件, 用于描述HQL语句查询条件。
 * 
 * 
 * 
 * 
 * <p><pre><b>
 * 历史更新记录:</b>
 * 2005-07-16  创建此类型
 * </pre></p>
 * 
 * 
 * @author   wenjian
 * @version  1.0
 * @since    JThink 1.0
 */

public class Condition implements java.io.Serializable{
	
  private static final long serialVersionUID = 1L;

  /* 所有条件单项 */
	private List conditions = new ArrayList();
	
	/** 逻辑操作符，与(AND) */
	public final static String AND = "AND";
	/** 逻辑操作符, 或(OR) */
	public final static String OR = "OR";
	/** 逻辑操作符, 与非(AND NOT) */
	public final static String AND_NOT = "AND NOT";
	/** 逻辑操作符,或非(AND NOT) */
	public final static String OR_NOT = "OR NOT";

  /*
   * 在构建HQL条件时可用到的所有“逻辑运算符号”
   */
	private static String[] LOGIC_OPERATOR_SIGNS = {
			AND, OR, AND_NOT, OR_NOT};

  /*
   * 检查是否有效的逻辑运算符
   * @param oprtor
   * @return true,是
   */
  private boolean isValidLogicOperator(String oprtor){
    for(int i=0; i<LOGIC_OPERATOR_SIGNS.length;i++){
        if(LOGIC_OPERATOR_SIGNS[i].equalsIgnoreCase(oprtor)){
          return true;
        }
    }
    return false;
  }	
	
  /**
   * 清除所有条件项
   */
  public void clear(){
    conditions.clear();
  }
  
  /**
   * 返回条件项的数量
   * 
   * @return 条件项数量
   */
  public int size(){
  	return conditions.size();
  }
	  
  /**
   * 加入一条件单项
   * 
   * @param logicOperator 两条件项之间的逻辑运算符, AND, OR, AND NOT, OR NOT
   * @param item 条件单项
   */
  public void add(String logicOperator, ConditionItem item){
  	logicOperator = logicOperator.trim().toUpperCase();
  	if(!isValidLogicOperator(logicOperator)){
			throw new IllegalArgumentException(
				"不合法的逻辑运算符, 正确的逻辑运算符是:AND, OR, AND NOT, OR NOT");
  	}
  	conditions.add(new Object[]{logicOperator, item});
  }  
  
  /**
   * 加入一条件单项,默认逻辑运算符为 AND
   * 
   * @param item 条件单项
   */
  public void add(ConditionItem item){
  	add(AND, item);
  }

  /**
   * 加入一子条件
   * 
   * @param logicOperator 两条件项之间的逻辑运算符, AND, OR, AND NOT, OR NOT
   * @param condition 子条件
   */
  public void add(String logicOperator, Condition condition){
  	conditions.add(new Object[]{logicOperator, condition});
  }
  
  /**
   * 加入一子条件,默认逻辑运算符为 AND
   * 
   * @param condition 子条件
   */
  public void add(Condition condition){
  	conditions.add(new Object[]{AND, condition});
  }
  
  /**
   * 检查条件是否为空
   */  
  public boolean isEmpty(){
      return conditions.isEmpty();
  }
  
  /**
   * 返回HQL串形式条件
   * 
   * @return 条件串
   */
  public String getConditionString(){
  	Iterator conditionsIT = conditions.iterator();
  	StringBuffer where = new StringBuffer();
  	while(conditionsIT.hasNext()){
  		Object[] CondiItem = (Object[])conditionsIT.next();
  		String logicOperator = (String)CondiItem[0];
  		if (CondiItem[1] instanceof ConditionItem) {
  			ConditionItem item = (ConditionItem) CondiItem[1];
  			where.append(logicOperator).append(" ").append(item.getConditionItemString());
  		}else{
  			Condition condition = (Condition) CondiItem[1];
  			String subCondnStr = condition.getConditionString();
  			if(subCondnStr.length()>0){
  			  where.append(logicOperator).append(" (").append(subCondnStr.substring(5)).append(") ");
  			}
  		}
  		
  	}
  	String whereStr = where.toString();
  	if(whereStr.startsWith(AND)){
  		whereStr = whereStr.substring(3);
  	}else	if(whereStr.startsWith(OR)){
  		whereStr = whereStr.substring(2);
  	}
  	return whereStr.isEmpty()?"":"where "+whereStr;
  }
  
  /**
   * 返回所有条件表达式的值
   * 
   * @return 条件值
   */
  public Object[] getValues(){
  	Iterator conditionsIT = conditions.iterator();
  	List values = new ArrayList();
  	while(conditionsIT.hasNext()){
  		Object[] CondiItem = (Object[])conditionsIT.next();
  		if (CondiItem[1] instanceof ConditionItem) {
  			ConditionItem item = (ConditionItem) CondiItem[1];
  				Object[] objs = item.getValues();
  				int len = objs.length;
  				for(int i=0;i<len;i++){
  					values.add(objs[i]);
  				}
  		}else{
  			Condition condition = (Condition) CondiItem[1];
  			Object[] objs = condition.getValues();
  			int len = objs.length;
				for(int i=0;i<len;i++){
					values.add(objs[i]);
				}
  		}
  		
  	}
  	return values.toArray();
  }
  
  
  
}
