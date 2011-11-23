/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * The Class SqlBuilder.
 * 
 * @author guohouqiang
 * @version 1.0 , 2008-11-13
 */
public class SqlBuilder {
	
	private static String PH1 = " (?) ";
	private static String PH2 = " (?,?) ";
	private static String PH3 = " (?,?,?) ";
	private static String PH5 = " (?,?,?,?,?) ";
	private static String PH10 = " (?,?,?,?,?,?,?,?,?,?) ";
	private static String PH20 = " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	
    /**
     * 获取动态SQL - in 子句参数占位符placeHolder
     * 
     * @return String 返回组装后的动态SQL
     */
    public static String getDynamicPH(int length) {
        switch(length){
        	case 0: return "";
        	case 1: return PH1;
        	case 2: return PH2;
        	case 3: return PH3;
        	case 5: return PH5;
        	case 10: return PH10;
        	case 20: return PH20;
        }
        StringBuilder sb = new StringBuilder(" (");
        for (int i = 0; i < length; i++) {
            sb.append("?");
            if (i < (length - 1))
                sb.append(",");
        }
        return sb.append(") ").toString();
    }
    
    /**
     * 根据查询HQL生成统计总数的HQL
     * 
     * @param selectHql
     * @return
     */
    public static String selectHqlToCountHql(String selectHql){
    	 final String COUNT_HQL_PREFIX = "select count(*) from";
    	 String temp = selectHql.replaceFirst("from",COUNT_HQL_PREFIX);
    	 return temp.substring(temp.indexOf(COUNT_HQL_PREFIX), temp.length());
    }
    
    /**
     * 属性名转字段名
     * 
     * @param properties
     * @return
     */
    public static List<String> convertProperty2Column(String[] properties) {
		List<String> colunms = new ArrayList<String>();
		for (String property : properties) {
			colunms.add(convertProperty2Column(property));
		}
		return colunms;
	}

    /**
     * Convert property2 column.
     * 
     * @param property the property
     * 
     * @return the string
     */
    public static String convertProperty2Column(String property){
    	StringBuilder sb = new StringBuilder();
		for (int i = 0; i < property.length(); i++) {
			char cur = property.charAt(i);
			if (Character.isUpperCase(cur)) {
				sb.append("_");
				sb.append(cur);
			} else {
				sb.append(cur);
			}
		}
		return sb.toString().toLowerCase();
    }
    
    /**
     * 构建HQL查询条件子句项
     * 
     * @return Object[0] 为条件子句项，串类型
     *         Object[1] 为条件值，对象数组类型
     */
    public static Object[] buildWhere(Map where) {
        if(where==null || where.size()==0){
            return new Object[]{"", null};
        }
        
        StringBuffer whereStr = new StringBuffer();
        Object[] values = new Object[where.size()];
        Iterator<Map.Entry> entryIT = where.entrySet().iterator();
        int i=0;
        while(entryIT.hasNext()){
            Map.Entry e = entryIT.next();
            
            whereStr.append(" and ")
            .append(e.getKey())
            .append("=? ");
            
            values[i++] = e.getValue();
        }
        return new Object[]{whereStr.replace(0, 4, " where"), values};
    }
}
