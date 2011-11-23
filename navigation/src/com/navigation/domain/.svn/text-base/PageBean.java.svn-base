/**
 * Copyright (C) 2004-2008 Giant Interective Group, Inc. All rights reserved.
 *
 * @(#) PageBean.java 1.0 2008-10-20
 */
package com.navigation.domain;

import java.util.List;
import java.io.Serializable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * <code>PageBean</code>类为系统定义数据分页及其属性。
 * 
 * @author  Fuchun
 * @version 1.1, 2009-05-27
 */
public class PageBean extends BaseClause implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    //@SuppressWarnings("unused")
   // private final static Logger LOG = LoggerFactory.getLogger(PageBean.class);
    
    /** 默认的分页大小 - {@value #DEFAULT_PAGE_SIZE}。 */
    public static final Integer DEFAULT_PAGE_SIZE = 20;

    /** 返回的分页结果集，存放在request里的默认名称 */
    public static final String PAGE_RESULT_NAME = "pagelist";
    
    /** 使用分页时，需要存放在request里的分页参数：页大小名称 */
    public static final String PAGE_SIZE = "pSize";

	/** 当前页码。*/
	@Expose
	private Integer currPage;
	/** 分页大小。*/
	@Expose
	private Integer pageSize;
	/** 总页数。*/
	@Expose
	private Integer pageCount;
	/** 总记录数。*/
	@Expose
	private Integer recordCount;
	/** 当前页的记录集列表。*/
	@Expose
	@SerializedName("list")
	private List<? extends Object> recordList;
	
	/**
	 * 默认的构造方法，初始化一个新的<code>PageBean</code>实例。
	 */
	public PageBean() {
	}
	
    public PageBean(List data, int totalRowCount, int currentPage, int pageSize){
        this.recordList = data;
        this.recordCount = totalRowCount;
        this.currPage = currentPage;
        this.pageSize = pageSize;
        calculatePageCount();
    }	
	
	/**
	 * 测试分页查询时，当前页页码是否是第一页。
	 * 
	 * @return 如果当前页为1，返回<code>true</code>，否则<code>false</code>。
	 */
	public boolean isFirstPage() {
		return (getCurrPage() == 1);
	}
	
	/**
	 * 测试分页查询时，当前页是否等于结果集列表的最后一页。
	 * 
	 * @return 如果当前页等于结果集列表的最后一页，返回<code>true</code>，否则<code>false</code>。
	 */
	public boolean isLastPage() {
		if( getRecordCount() <= getPageSize() )
			return true;
		else
			return getCurrPage() == getPageCount();
	}
	
	/**
	 * 获得分页记录区间。
	 * 
	 * @return 分页记录区间。
	 */
	public Integer[] getRange() {
	    int start = currPage > 1 ? (currPage - 1) * pageSize : 0;
	    int end = pageSize;
	    return new Integer[]{start, end};
	}

	/**
	 * 获取当前页页码。
	 * 
	 * @return 当前页页码。
	 */
	public Integer getCurrPage() {
		return currPage;
	}

	/**
	 * 设置当前页页码。
	 * 
	 * @param currPage 要设置的 当前页页码。
	 */
	public void setCurrPage(Integer currPage) {
		this.currPage = currPage == null ? 1 : currPage;
	}

	/**
	 * 获取当前分页大小。
	 * 
	 * @return 当前分页大小。
	 */
	public Integer getPageSize() {
		return pageSize;
	}

	/**
	 * 设置当前分页大小。
	 * 
	 * @param pageSize 要设置的 当前分页大小。
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 获取当前分页的总页数。
	 * 
	 * @return 当前分页的总页数。
	 */
	public Integer getPageCount() {
		calculatePageCount();
		return pageCount;
	}
	
	/** 计算总页数。*/
	private void calculatePageCount() {
		if( recordCount == 0 || pageSize == 0 ) {
			pageCount = 0;
			return;
		}
		if( recordCount <= pageSize ) {
			pageCount = 1;
			return;
		}
		if( recordCount % pageSize <= 0 ) {
			pageCount = recordCount / pageSize;
		} else {
			pageCount = recordCount / pageSize + 1;
		}
	}

	/**
	 * 获取当前分页查询的总记录数。
	 * 
	 * @return 当前分页查询的总记录数。
	 */
	public Integer getRecordCount() {
		return recordCount;
	}

	/**
	 * 设置当前分页查询的总记录数。
	 * 
	 * @param recordCount 要设置的 当前分页查询的总记录数。
	 */
	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
		
	}

	/**
	 * 获取当前分页查询的集合列表。
	 * 
	 * @return 当前分页查询的集合列表。
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> getRecordList() {
		return (List<T>)recordList;
	}

	/**
	 * 设置当前分页查询的集合列表。
	 * 
	 * @param recordList 要设置的 当前分页查询的集合列表。
	 */
	public <T> void setRecordList(List<T> recordList) {
		this.recordList = recordList;
		
	}
}
