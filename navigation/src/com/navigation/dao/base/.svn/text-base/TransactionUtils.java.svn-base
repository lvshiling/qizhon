/*
 * Copyright (C) 2010 The Depiao Network, Inc. All rights reserved.
 */
package com.navigation.dao.base;

import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionTemplate;

/**
 * The Class TransactionUtils.
 * 
 * @author guohouqiang
 * @version 1.0, May 11, 2009
 */
public class TransactionUtils {
	
	/** The transaction template. */
	private static TransactionTemplate transactionTemplate;
		
	/**
	 * 事务控制回调方法.
	 * 
	 * @param tc the tc
	 * 
	 * @return the object
	 */
	@SuppressWarnings("unchecked")
	public static Object execute(final TransactionCallback tc){
		return getTransactionTemplate().execute(new org.springframework.transaction.support.TransactionCallback(){
			public Object doInTransaction(final TransactionStatus status) {
				com.navigation.dao.base.TransactionStatus subStatus = new com.navigation.dao.base.TransactionStatus(){
						public boolean hasSavepoint() {return status.hasSavepoint();}
						public boolean isCompleted() {return status.isCompleted();}
						public boolean isNewTransaction() {return status.isNewTransaction();}
						public boolean isRollbackOnly() {return status.isRollbackOnly();}
						public void setRollbackOnly() {status.setRollbackOnly();}
						public Object createSavepoint() throws TransactionException {return status.createSavepoint();}
						public void releaseSavepoint(Object savepoint) throws TransactionException {status.releaseSavepoint(savepoint);}
						public void rollbackToSavepoint(Object savepoint) throws TransactionException {status.rollbackToSavepoint(savepoint);	}
						public void flush() {status.flush();}
					};
				return tc.doInTransaction(subStatus);
			}
		});
	}

	/**
	 * Gets the transaction template.
	 * 
	 * @return the transaction template
	 */
	public static TransactionTemplate getTransactionTemplate() {
		if(transactionTemplate == null)throw new NullPointerException("TransactionTemplate is null");
		return transactionTemplate;
	}

	/**
	 * Sets the transaction template.
	 * 
	 * @param transactionTemplate the new transaction template
	 */
	public void setTransactionTemplate(
			TransactionTemplate transactionTemplate) {
		TransactionUtils.transactionTemplate = transactionTemplate;
	}
}
