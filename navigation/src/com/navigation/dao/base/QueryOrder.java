/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * QueryOrder Service层使用的排序类.
 * <pre>
 *  eg:
 *  	QueryOrder order = new QueryOrder();
 *		order.desc("Note","id");
 *	    order.asc("NoteType", "updateTime");
 *	    将此order对象传入dao层；
 *	    别名映射AliasMap；
 *      Map aliasMap = AliasMap.getAliasMap();
 *      在dao中
 *         使用HQL查询
 *      	dao.find(hql + order.toOrderBySQL(aliasMap));//根据别名映射表生成排序HQL；ORDER BY n.id DESC 
 *		    dao.find(hql + order.toOrderBySQL());//忽略别名生成排序HQL；ORDER BY id DESC
 *         使用DetachedCriteria查询
 *          //使用别名
 *          DetachedCriteria dc = DetachedCriteria.forClass(Note.class,"n");
 *          for(OrderBy ob:order.getOrderList()){
 *			 dc.addOrder(ob.isASC()?Order.asc(ob.toOrderAlias(aliasMap)):Order.desc(ob.toOrderAlias(aliasMap)));
 *		    }
 *		    //不使用别名
 *	        DetachedCriteria dc = DetachedCriteria.forClass(Note.class);
 *			for(OrderBy ob:order.getOrderList()){
 *			 dc.addOrder(ob.isASC()?Order.asc(ob.getPropName()):Order.desc(ob.getPropName()));
 *		    }
 * </pre>
 * 
 * @author derek
 * @version 1.0 , Oct 31, 2008
 */
public class QueryOrder {

	/** 排序集合 */
	private List<OrderBy> orderList = new ArrayList<OrderBy>(1);

	/** DESC 排序 */
	private final static String DESC = " DESC ";

	/** ASC 排序 */
	private final static String ASC = " ASC ";

	/**ORDER BY 语句*/
	private final static String ORDER_BY = " ORDER BY ";
	/**
	 * 添加DESC排序
	 * 
	 * @param tableName 要排序的实体对象名
	 * @param propName 要排序的属性
	 */
	public QueryOrder desc(String tableName, String propName) {
		orderList.add(new OrderBy(tableName, propName, DESC));
		return this;
	}

	/**
	 * 添加ASC排序
	 * 
	 * @param tableName 要排序的实体对象名
	 * @param propName 要排序的属性
	 */
	public QueryOrder asc(String tableName, String propName) {
		orderList.add(new OrderBy(tableName, propName, ASC));
		return this;
	}

    /**
     * 添加DESC排序
     * 
     * @param propName 要排序的属性
     */
    public QueryOrder desc(String propName) {
        orderList.add(new OrderBy(null, propName, DESC));
        return this;
    }	
	
    /**
     * 添加ASC排序
     * 
     * @param propName 要排序的属性
     */
    public QueryOrder asc(String propName) {
        orderList.add(new OrderBy(null, propName, ASC));
        return this;
    }    
    
	/**
	 * 根据别名影射MAP进行别名替换,返回ORDER BY 语句
	 * 
	 * @param aliasMap 别名影射MAP
	 * @return 返回ORDER BY 语句
	 */
	public String toOrderBySQL(Map<String, String> aliasMap) {
		StringBuilder SQL = new StringBuilder(ORDER_BY);
		int index = 0;
		int size = orderList.size();
		for (OrderBy orderBy : orderList) {
			SQL.append(convertAlias(aliasMap,orderBy.tableName));
			SQL.append(orderBy.propName);
			SQL.append(orderBy.condition);
			if (++index < size) SQL.append(",");
		}
		return SQL.toString();
	}

	/**
	 * 别名替换
	 * @param aliasMap
	 * @param tableName
	 * @return
	 */
	private String convertAlias(Map<String, String> aliasMap,String tableName){
	    if(tableName!=null){
    		String alias = aliasMap.get(tableName.trim());
    		if (alias != null && alias.trim().length() > 0) {
    			return alias+".";
    		}
	    }
	    return "";
	}
	
	/**
	 * 忽略别名返回ORDER BY 语句
	 * 
	 * @return
	 */
	public String toOrderBySQL() {
		StringBuilder SQL = new StringBuilder(ORDER_BY);
		int index = 0;
		int size = orderList.size();
		for (OrderBy orderBy : orderList) {
			SQL.append(orderBy.propName);
			SQL.append(orderBy.condition);
			if (++index < size) SQL.append(",");
		}
		return SQL.toString();
	}

	/**
	 * The Class OrderBy.
	 * 
	 * @author derek
	 * @version 1.0 , Oct 31, 2008
	 */
	public class OrderBy {
		/**要排序的实体对象名*/
		private String tableName;

		/**要排序的属性*/
		private String propName;
		
		/**DESC OR ASC*/
		private String condition;

		/**
		 * Instantiates a new order by.
		 * 
		 * @param tableName the table name
		 * @param propName the prop name
		 * @param condition the condition
		 */
		OrderBy(String tableName, String propName, String condition) {
			//this.tableName = tableName.trim();
			this.tableName = tableName!=null?tableName.trim():null;
			this.propName = propName.trim();
			this.condition = condition;
		}
		
		/**
		 * 别名替换
		 * @param aliasMap
		 * @return
		 */
		public String toOrderAlias(Map<String, String> aliasMap){
			return convertAlias(aliasMap,tableName)+propName;
		}
		
		/**
		 * @return the condition
		 */
		public String getCondition() {
			return condition;
		}

		/**
		 * @return the propName
		 */
		public String getPropName() {
			return propName;
		}

		/**
		 * @return the tableName
		 */
		public String getTableName() {
			return tableName;
		}

		/**
		 * @return the isASC
		 */
		public boolean isASC() {
			return condition.equals(ASC);
		}
	}

	/**
	 * 排序集合
	 * 
	 * @return the orderList
	 */
	public List<OrderBy> getOrderList() {
		return orderList;
	}
	
	/**
	 * 是否有自定义排序
	 * 
	 * @return <code>true</code>有自定义排序 <code>false</code>无自定义排序
	 */
	public boolean isOrder(){
		return this.getOrderList().size()>0?true:false;
	}
}
