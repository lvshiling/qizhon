/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.EntityMode;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate3.SessionHolder;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.support.TransactionSynchronizationManager;


/**
 * The Class DaoSupport.
 * 
 * @author derek
 * @version 1.0, 2008-10-10
 */
public class DaoSupport extends HibernateDaoSupport implements GenericDao {
	public Map<Class,ClassMetadata> classMetadataMap = new HashMap<Class,ClassMetadata>();
    
    /** The Constant MAX_ROW_FOR_CACHE_MODE_GET. */
    private static final int MAX_ROW_FOR_CACHE_MODE_GET = 20;
    //private static final int DEFAULT_MAX_ROW = 500;

    /**
     * 通过主键获取实体.
     * 
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    @SuppressWarnings("unchecked")
    public <T> T get(Class<T> c, Serializable id) {
        return (T) this.getDaoTemplate().get(c, id);
    }

    /**
     * 通过主键获取实体,忽略二级缓存数据.
     * 
     * @param c 实体类型
     * @param id 主键值
     * @param noCache <code>true</code> 忽略二级缓存，直接从数据库获取
     * @return the T 被查询实体
     */
    @SuppressWarnings("unchecked")
    public <T> T get(final Class<T> c, final Serializable id, final boolean noCache) {
        if (!noCache)
            return get(c, id);
        return (T) this.getDaoTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                session.getSessionFactory().evict(c, id);
                session.setCacheMode(CacheMode.PUT);
                Object o = session.get(c, id);
                session.setCacheMode(CacheMode.NORMAL);
                return o;
            }
        });
    }

    /**
     * 通过主键获取只读实体.
     * 
     * @param c 实体类型
     * @param id 主键值
     * @return the T 被查询实体
     */
    @SuppressWarnings("unchecked")
    public <T> T getForReadOnly(final Class<T> c, final Serializable id) {
        return (T) this.getDaoTemplate().executeWithNewSession(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                session.setCacheMode(CacheMode.IGNORE);
                Object o = session.get(c, id);
                session.setReadOnly(o, true);
                return o;
            }
        });
    }

    /**
     * 通过主键获取实体,并使数据库该行加锁.
     * 
     * @param c 实体类型
     * @param id 主键值
     * @return 被查询实体
     */
    @SuppressWarnings("unchecked")
    public <T> T getForUpdate(Class<T> c, Serializable id) {
        return (T) getHibernateTemplate().get(c, id, LockMode.UPGRADE);
    }

    /**
     * 通过主键删除实体.
     * 
     * @param c 实体类型
     * @param id 主键值
     */
    public <T> void delete(Class<T> c, Serializable id) {
        T record = this.get(c, id);
        if (record != null)
            this.delete(record);
    }

    /**
     * 删除实体对象.
     * 
     * @param record 实体对象
     */
    public void delete(Object record) {
        getHibernateTemplate().delete(record);
    }

    /**
     * 删除实体对象集合(大量数据操作不使用此方法).
     * 
     * @param records 实体对象集合
     */
    public void delete(Collection<?> records) {
        getHibernateTemplate().deleteAll(records);
    }

    /**
     * 插入或更新实体对象.
     * 
     * @param record 要插入或更新的实体对象
     */
    public void saveOrUpdate(Object record) {
        getHibernateTemplate().saveOrUpdate(record);
    }

    /**
     * 插入或更新实体对象集合(大量数据操作不使用此方法).
     * 
     * @param records 要插入或更新的实体对象集合
     */
    public void saveOrUpdate(Collection<?> records) {
        getHibernateTemplate().saveOrUpdateAll(records);
    }

    /**
     * @see com.navigation.dao.base.derek.server.dao.base.snsgoo.dao.GenericDao#merge(java.lang.Object)
     */
    public Object merge(Object record) {
        return getHibernateTemplate().merge(record);
    }

    /**
     * 插入实体
     * 
     * @param record 实体
     */
    public Serializable save(Object record) {
        return getHibernateTemplate().save(record);
    }

    /**
     * 更新实体
     * 
     * @param record 实体
     */
    public void update(Object record) {
        getHibernateTemplate().update(record);
    }

    /**
     * 拼装动态HQL更新语句
     * （暂不支持复合主键）
     * 
     * @param record
     */
    public void dynamicUpdate(Object record){
    	StringBuilder hqlB = new StringBuilder("update ");
    	List<Object> params = new ArrayList<Object>();
    	ClassMetadata cm = getClassMetadata(record);
    	
    	String entityName = cm.getEntityName();
    	hqlB.append(entityName).append(" set ");
    	//组装SET语句
    	String[] pnames = cm.getPropertyNames();
    	int index = 0;
    	for(String pname : pnames){
    		Object value = cm.getPropertyValue(record, pname, EntityMode.POJO);
    		if(value != null){
    			if(index > 0)hqlB.append(",");
    			if(value.getClass().getPackage().equals(record.getClass().getPackage())){
    				ClassMetadata jc = getClassMetadata(value);
    				String jcIdName = jc.getIdentifierPropertyName();
    				Serializable jcId = jc.getIdentifier(value, EntityMode.POJO);
    				hqlB.append(pname).append(".").append(jcIdName).append(" = ? ");
	    			params.add(jcId);
    			}else{
    				hqlB.append(pname).append(" = ? ");
	    			params.add(value);
    			}
    			index++;
    		}
    	}
    	//组装WHERE语句
    	String idName = cm.getIdentifierPropertyName();
    	Serializable id = cm.getIdentifier(record, EntityMode.POJO);
    	if(id.getClass().getPackage().equals(record.getClass().getPackage())){
    		//复合主键 TODO
    		
    	}else{
    		hqlB.append(" where ").append(idName).append(" = ?");
    		params.add(id);
    	}
//    	System.out.println(hqlB.toString());
//    	System.out.println(params);
    	getHibernateTemplate().bulkUpdate(hqlB.toString(), params.toArray());
    }
    
    private ClassMetadata getClassMetadata(Object pojo){
    	Class clazz = pojo.getClass();
    	if(clazz.getName().contains("$$")){
    		clazz = clazz.getSuperclass();
    	}
    	ClassMetadata cm = classMetadataMap.get(clazz);
    	if(cm == null){
    		cm = getHibernateTemplate().getSessionFactory().getClassMetadata(clazz);
    		classMetadataMap.put(pojo.getClass(), cm);
    	}
    	return cm;
    }
    
    /**
     * 加锁更新实体
     * 
     * @param record 实体
     * @param lockMode 锁
     */
    public void update(Object record, LockMode lockMode) {
        getHibernateTemplate().update(record, lockMode);
    }

    /**
     * 通过HQL更新表对象记录
     * 
     * @param hql 用于更新操作的HQL
     * @param params 参数绑定值数组
     * 
     * @return 被更新的记录数
     */
    public int update(final String hql, final Object params[]){
      return (Integer)getHibernateTemplate().execute(new HibernateCallback() {
          public Object doInHibernate(Session session)
              throws HibernateException, SQLException {
              Query q = session.createQuery(hql);
              if(params!=null){
                  int len = params.length;
                  for (int i = 0; i < len; i++) {
                      q.setParameter(i, params[i]);
                  }
              }
              return q.executeUpdate();
          }
      });
    }
    
    /**
     * 通过HQL更新表对象记录
     * 
     * @param hql 用于更新操作的HQL
     * @param params 参数绑定值数组
     * 
     * @return 被更新的记录数
     */
    public int update(final String hql, final String names[], final Object values[]){
      return (Integer)getHibernateTemplate().execute(new HibernateCallback() {
          public Object doInHibernate(Session session)
              throws HibernateException, SQLException {
              Query q = session.createQuery(hql);
              if (names != null) {
                  for (int i = 0; i < names.length; i++) {
                      applyNamedParameterToQuery(q, names[i], values[i]);                      
                  }
              }
              return q.executeUpdate();
          }
      });
    }        
    
    /**
     * 清除实体对象的二级缓存.
     * 
     * @param c 实体类型
     * @param id 实体ID
     */
    @SuppressWarnings("unchecked")
    public void evict(Class c, Serializable id) {
        getHibernateTemplate().getSessionFactory().evict(c, id);
    }

    /**
     * 清除实体对象的一级缓存.
     * 
     * @param o
     */
    public void evict(Object o) {
        getHibernateTemplate().evict(o);
    }

    /**
     * 从数据库刷新实体对象.
     * 
     * @param o 受管理的实体对象
     */
    public void refresh(Object o) {
        this.getDaoTemplate().refresh(o);
    }

    /**
     * 记录数统计.
     * 
     * @param hql HQL语句
     * @return 统计结果
     */
    public int count(String hql) {
        Long c = (Long) this.find(hql).get(0);
        return c == null ? 0 : c.intValue();
    }

    /**
     * 记录数统计(带条件参数).
     * 
     * @param hql HQL语句
     * @param params 对应的?参数值数组
     * @return 统计结果
     */
    public int count(String hql, Object params[]) {
        Long c = (Long) this.find(hql, params).get(0);
        return c == null ? 0 : c.intValue();
    }

    /**
     * 记录数统计(带条件参数).
     * 
     * @param hql HQL语句
     * @param params 对应的?参数值数组
     * @return 统计结果
     */
    public int count(String hql,String[] names, Object params[]) {
    	List<Object> list = this.find(hql, names, params);
    	if(null != list && list.size()>0){
    		Long c = (Long) list.get(0);
    		return c == null ? 0 : c.intValue();
    	}return 0;
    }
    
    /**
     * 记录数统计(带条件参数).
     * 
     * @param hql HQL语句
     * @param params 对应的?参数值数组
     * @return 统计结果
     */
    @SuppressWarnings("unchecked")
	public Integer countByNativeSql(final String sql,final String[] names,final Object params[]) {
    	BigInteger c = (BigInteger)getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                SQLQuery q = session.createSQLQuery(sql);
                setParameter(q,names,params);
                return q.list().get(0);
            }
        });
    	return c == null ? 0 : c.intValue();
    }
    
    
    /**
     * 参数绑定HQL分页记录列表查询.
     * 
     * @param hql HQL语句
     * @param params 对应的?参数值数组
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    @SuppressWarnings("unchecked")
    public List find(final String hql, final Object params[], 
    		final int firstRow, final int maxRow, final boolean... readOnly) {
        return this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws SQLException, HibernateException {
                Query q = session.createQuery(hql);
                setCacheModeByMaxRow(session, maxRow);
                setParameter(q,null,params);
                setReadOnly(q, readOnly);
                setRowsLimit(q, firstRow, maxRow);
                return q.list();
            }
        });
    }

    public List findForUpdate(final String hql,final String name[], final Object params[]) {
        return this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws SQLException, HibernateException {
                Query q = session.createQuery(hql);
                q.setCacheMode(CacheMode.PUT);
                q.setLockMode("qfu", LockMode.UPGRADE);
                setParameter(q,name,params);
                return q.list();
            }
        });
    }
    
    /**
     * 带参无分页查询.
     * 
     * @param hql HQL语句
     * @param params
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    @SuppressWarnings("unchecked")
    public List find(final String hql, final Object params[], final boolean... readOnly) {
        return (List) this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException {
                Query q = session.createQuery(hql);
                setParameter(q,null,params);
                setReadOnly(q, readOnly);
                return q.list();
            }
        });
    }
    
    /**
     * answer  8-31
     * 
     * *
     * **/
    
//    public List  find(final  String hql){
//    	
//    	return this.getDaoTemplate().executeFind(new HibernateCallback() {
//    		
//            public Object doInHibernate(Session session) throws SQLException, HibernateException {
//               
//            	Query q = session.createQuery(hql);
//              
//                return q.list();
//            }
//        });
//    	
//    	
//    }
    
    
    /**
     * 参数绑定HQL分页记录列表查询.
     * 
     * @param hql HQL语句
     * @param names 参数名
     * @param params 对应的参数值数组
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    @SuppressWarnings("unchecked")
    public List find(final String hql, final String names[], final Object params[],
            final int firstRow, final int maxRow, final boolean... readOnly) {
        return this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws SQLException, HibernateException {
                Query q = session.createQuery(hql);
                setCacheModeByMaxRow(session, maxRow);
                setParameter(q,names,params);
                setReadOnly(q, readOnly);
                setRowsLimit(q, firstRow, maxRow);
                return q.list();
            }
        });
    }
    
    /**
     * 非参数绑定分页记录列表查询.
     * 
     * @param hql HQL语句
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    public List find(final String hql, 
    		final int firstRow, final int maxRow, final boolean... readOnly) {
        return this.find(hql, null, firstRow, maxRow, readOnly);
    }

    /**
     * 参数绑定HQL分页记录列表查询.
     * 
     * @param <T> 结果集 {@code java.util.List} 的泛型类型。
     * @param hql HQL语句
     * @param names 参数名
     * @param params 对应的参数值数组
     * @param clazz 结果集 {@code java.util.List} 的泛型类型。
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    public List find(final String hql, final String names[], final Object params[], 
    		final boolean... readOnly) {
        return this.find(hql, names, params, 0, 0, readOnly);
    }
    
    /**
     * 非参数绑定查询.
     * TODO: 未指定结果集合的泛型
     * @param hql HQL语句
     * @param readOnly 是否只读(可选项)
     * @return 查询结果集合
     */
    public List find(final String hql, final boolean... readOnly) {
        return find(hql,null,readOnly);
    }

    public List findByCriteria(final DetachedCriteria detachedCriteria,final int firstRow, final int maxRow ){
        return  this.getDaoTemplate().executeFind(new HibernateCallback() {
            public List doInHibernate(Session session) throws SQLException, HibernateException {
            	Criteria criteria = detachedCriteria.getExecutableCriteria(session);
            	if(!(firstRow == 0 && maxRow == 0)){
            		criteria.setFirstResult(firstRow);
            		criteria.setMaxResults(maxRow);
            	}
                return criteria.list();
            }
        });
    }

    public Integer countByCriteria(final DetachedCriteria detachedCriteria){
        return this.getDaoTemplate().execute(new HibernateCallback<Integer>() {
            public Integer doInHibernate(Session session) throws SQLException, HibernateException {
            	Criteria criteria = detachedCriteria.getExecutableCriteria(session);
            	Long totalCount = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
            	criteria.setProjection(null);
                return totalCount.intValue();
            }
        });
    }
    
    /**
     * 本地SQL查询
     * 
     * @param <T>
     * @param nativeSql
     * @param names
     * @param params
     * @param firstRow
     * @param maxRow
     * @param mappingPojo
     * @return
     */
    @SuppressWarnings("unchecked")
	public <T> List<T> findByNativeSql(final String nativeSql, final String[] names, final Object[] params,
    		final int firstRow, final int maxRow,final Class<T> mappingPojo) {
        return getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                SQLQuery q = session.createSQLQuery(nativeSql);
                setParameter(q,names,params);
                q.addEntity(mappingPojo);
                setRowsLimit(q, firstRow, maxRow);
                return q.list();
            }
        });
    }
    
    /**
     * 参数绑定分页命名查询.
     * TODO: 未指定结果集合的泛型
     * @param queryName 查询名称
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param names 参数名称数组
     * @param params 参数绑定值数组
     * @return 查询结果集合
     */
    @SuppressWarnings("unchecked")
    public List findByQueryName(final String queryName, final String names[], final Object params[], 
    		final int firstRow, final int maxRow, final boolean... readOnly) {
        return this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query q = session.getNamedQuery(queryName);
                setCacheModeByMaxRow(session, maxRow);
                setParameter(q,names,params);
                setReadOnly(q, readOnly);
                setRowsLimit(q, firstRow, maxRow);
                return q.list();
            }
        });
    }

    /**
     * 参数绑定分页命名查询.
     * TODO: 未指定结果集合的泛型
     * @param queryName 查询名称
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param params 参数绑定值数组
     * @return 查询结果集合
     */
    @SuppressWarnings("unchecked")
    public List findByQueryName(final String queryName, final Object params[], 
    		final int firstRow, final int maxRow, final boolean... readOnly) {
        return findByQueryName(queryName, null, params, firstRow, maxRow, readOnly);
    }
    
    /**
     * 根据命名查询执行select count(*)语句.
     * 
     * @param queryName the query name
     * @param names the names
     * @param params the params
     * 
     * @return the integer
     */
    @SuppressWarnings("unchecked")
	public Integer countByQueryName(final String queryName, final String names[], final Object params[]) {
    	return (Integer)this.getDaoTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query q = session.getNamedQuery(queryName);
                setParameter(q, names, params);
                return q.list().get(0);
            }
        });
    }
    
    public Integer countByQueryName(final String queryName, final Object params[]) {
        return countByQueryName(queryName, null, params);
    }

    /**
     * 调用命名存储过程
     * 
     * @param procName 命名存储过程
     * @param params 参数列表
     * @return
     */
    @SuppressWarnings("unchecked")
    public List callProc(final String procName, final Object params[]){
    	 return this.getDaoTemplate().executeFind(new HibernateCallback() {
             public Object doInHibernate(Session session) throws HibernateException, SQLException {
                 Query q = session.getNamedQuery(procName);
                 setParameter(q,null,params);
                 return q.list();
             }
         });
    }
    
    /**
     * 过滤one-to-many获得的关联对象SET集合.
     * TODO: 未指定结果集合的泛型
     * @param collection 要过滤的集合对象
     * @param sql 原生where条件语句及排序语句
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @return 查询结果集合
     */
    public List filterCollection(final Collection collection, final String sql, 
    		final int firstRow, final int maxRow) {
        List rs = this.getDaoTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException {
                Query fq = session.createFilter(collection, sql);
                setRowsLimit(fq, firstRow, maxRow);
                return fq.list();
            }
        });
        return rs;
    }

    // **********************批量操作************************.
    /**
     * 无参数绑定批量更新.
     * 
     * @param hql HQL语句
     * @return 影响行数
     */
    public Integer bulkUpdate(final String hql) {
        return getHibernateTemplate().bulkUpdate(hql);
    }
    
    /**
     * 多参数绑定批量更新.
     * 
     * @param hql HQL语句
     * @param params 绑定参数值数组
     * @return 影响行数
     */
    public Integer bulkUpdate(final String hql, final Object[] params) {
        return getHibernateTemplate().bulkUpdate(hql, params);
    }
    
    /**
     * 单参数绑定批量更新.
     * 
     * @param hql HQL语句
     * @param param 绑定参数值
     * @return 影响行数
     */
    public Integer bulkUpdate(final String hql, Object param) {
        return getHibernateTemplate().bulkUpdate(hql, param);
    }
    
    /**
     * 命名参数绑定批量更新.
     * 
     * @param hql HQL语句
     * @param params 绑定参数值数组
     * @return 影响行数
     */
    @SuppressWarnings("unchecked")
	public Integer bulkUpdate(final String hql, final String[] names,final Object[] params) {
        return (Integer) getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				setParameter(query,names,params);
				return query.executeUpdate();
			}
        });
    }
    
    /**
     * 执行本地SQL更新.
     * 
     * @param nativeSql 本地SQL语句
     * @return 影响行数
     */
    public Integer bulkUpdateByNativeSql(final String nativeSql) {
        return bulkUpdateByNativeSql(nativeSql, null);
    }

    /**
     * 参数绑定执行本地SQL更新.
     * 
     * @param nativeSql
     * @param params
     * @return
     */
    public Integer bulkUpdateByNativeSql(final String sqlOrSqlName, final Object[] params,final boolean... isNameSql) {
        return bulkUpdateByNativeSql(sqlOrSqlName,null,params,isNameSql);
    }

    /**
     * 命名参数绑定执行本地SQL更新.
     * 
     * @param nativeSql
     * @param names
     * @param params
     * @return
     */
    @SuppressWarnings("unchecked")
	public Integer bulkUpdateByNativeSql(final String sqlOrSqlName, final String[] names,
            final Object[] params,final boolean... isNameSql) {
        return (Integer) getHibernateTemplate().execute(new HibernateCallback() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
            	Query query;
            	if(isNameSql.length >0 && isNameSql[0]){
            		query = session.getNamedQuery(sqlOrSqlName);
                }else{
                	query = session.createSQLQuery(sqlOrSqlName);
                }
                setParameter(query,names,params);
                return query.executeUpdate();
            }
        });
    }
    
    /**
     * 获取Hibernate操作模板
     * 
     * @return HibernateTemplate
     */
    public HibernateTemplate getDaoTemplate() {
        return this.getHibernateTemplate();
    }

    /**
     * @see com.navigation.dao.base.derek.server.dao.base.ztgame.dao.GenericDao#flush()
     */
    public void flush() {
        getHibernateTemplate().flush();
    }

    /**
     * @see com.navigation.dao.base.derek.server.dao.base.ztgame.dao.GenericDao#callback(com.ztgame.dao.DaoCallback,
     *      java.lang.String[])
     */
    public <T> T callback(DaoCallback<T> dc, String... lazyProps) {
        SessionFactory sf = this.getDaoTemplate().getSessionFactory();

        this.initDeferredClose(sf);
        try {
            T t = dc.doInCurrentSession();
            if (lazyProps != null && lazyProps.length > 0) {
                LazyLoadUtil.initialize(t, lazyProps);
            }
            return t;
        } finally {
        	this.processDeferredClose(sf);
        }
    }

    
    //绑定session资源
    /**
     * Inits the deferred close.
     * 
     * @param sf the sf
     */
    private void initDeferredClose(SessionFactory sf){
    	if(!TransactionSynchronizationManager.hasResource(sf)){
        	Session session = SessionFactoryUtils.getSession(sf, true);
        	TransactionSynchronizationManager.bindResource(sf, new SessionHolder(session));
        }
    }
    //销毁session资源
    /**
     * Process deferred close.
     * 
     * @param sf the sf
     */
    private void processDeferredClose(SessionFactory sf){
    	SessionHolder sessionHolder = (SessionHolder)TransactionSynchronizationManager.unbindResource(sf);
   	 	SessionFactoryUtils.closeSession(sessionHolder.getSession());
    }
    
    /**
     * 分页行数
     * 
     * @param q
     * @param firstRow
     * @param maxRow
     */
    protected void setRowsLimit(Query q, int firstRow, int maxRow) {
        if (!allRows(firstRow, maxRow)) {
            q.setFirstResult(firstRow).setMaxResults(maxRow);
        } else {
            //q.setMaxResults(DEFAULT_MAX_ROW);
        }
    }

    /**
     * 结果集设置成只读
     * 
     * @param q
     * @param readOnly
     */
    protected void setReadOnly(Query q, boolean... readOnly) {
        if (readOnly != null && readOnly.length > 0)
            q.setReadOnly(readOnly[0]);
    }

    /**
     * Sets the cache mode by max row.
     * 
     * @param session the session
     * @param maxRow the max row
     */
    protected void setCacheModeByMaxRow(Session session, int maxRow) {
        if (maxRow == 0 || maxRow > MAX_ROW_FOR_CACHE_MODE_GET) {
            session.setCacheMode(CacheMode.GET);
        }
    }

    /**
     * All rows.
     * 
     * @param firstRow the first row
     * @param maxRow the max row
     * 
     * @return true, if successful
     */
    public boolean allRows(int firstRow, int maxRow) {
        if (firstRow < 0)
            firstRow = 0;
        if (maxRow < 0)
            maxRow = 0;
        if (!(firstRow == 0 && maxRow == 0))
            return false;
        else
            return true;
    }

    /**
     * Apply the given name parameter to the given Query object.
     * 
     * @param queryObject the Query object
     * @param paramName the name of the parameter
     * @param value the value of the parameter
     * @throws HibernateException if thrown by the Query object
     */
    @SuppressWarnings("unchecked")
    protected void applyNamedParameterToQuery(Query queryObject, String paramName, Object value)
            throws HibernateException {
        if (value instanceof Collection) {
            queryObject.setParameterList(paramName, (Collection<?>) value);
        } else if (value instanceof Object[]) {
            queryObject.setParameterList(paramName, (Object[]) value);
        } else {
            queryObject.setParameter(paramName, value);
        }
    }

    /**
     * 设置查询参数
     * 
     * @param q
     * @param names
     * @param params
     */
    protected void setParameter(Query q, String[] names, Object[] params){
    	if (names != null) {
            for (int i = 0; i < names.length; i++) {
                applyNamedParameterToQuery(q, names[i], params[i]);
            }
        } else {
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    q.setParameter(i, params[i]);
                }
            }
        }
    }
    
    /**
     * 分页排序条件列表查询，主要针对单对象查询
     * 
     * @param c 被查询的对象类型
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @return 查询结果集合
     */
    public Result find(final Class c, final String hql, final int firstRow, final int maxRow, final Object params[]){
        final String chql = SqlBuilder.selectHqlToCountHql(hql);
        return ResultAdapter.createResult(hql, chql, "",
                params, params, new int[]{firstRow, maxRow}, this, c);
    }

    /**
     * 分页排序条件列表查询，主要针对单对象查询
     * 
     * @param c 被查询的对象类型
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @return 查询结果集合
     */
    public Result find(final Class c, final String hql, final int firstRow, final int maxRow, final Object params[], final QueryOrder order){
        final String chql = SqlBuilder.selectHqlToCountHql(hql);
        final String orderby = order==null?"":order.toOrderBySQL();
        return ResultAdapter.createResult(hql, chql, orderby,
                params, params, new int[]{firstRow, maxRow}, this, c);
    }
 
    
    /**
     * 分页排序条件列表查询，主要针对单对象查询
     * 
     * @param c 被查询的对象类型
     * @param where 复杂查询条件, 可以为null
     * @param firstRow 起始行数
     * @param maxRow 最大返回行数
     * @param order 排序方式, 可以为null
     * 
     * @return 查询结果集合
     * 
     * @author wenjian
     */
    public Result find(final Class c, final Condition where, final int firstRow, final int maxRow, final QueryOrder order){
        //Object[] preWhere = SqlBuilder.buildWhere(where);
        String shql = new StringBuffer()
        .append("from ")
        .append(c.getName())
        .append(where!=null?" "+where.getConditionString():"").toString();
        Object[] params = where!=null?where.getValues():null;
        final String chql = SqlBuilder.selectHqlToCountHql(shql);
        final String orderby = order==null?"":order.toOrderBySQL();
        return ResultAdapter.createResult(shql, chql, orderby,
                params, params, new int[]{firstRow, maxRow}, this, c);
    }    
    
}