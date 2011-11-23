/**
 * WorkflowServicePortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.workflow.web;

public interface WorkflowServicePortType extends java.rmi.Remote {
    public com.workflow.web.AnyType2AnyTypeMapEntry[] getPerBylogonname(java.lang.String in0) throws java.rmi.RemoteException;
    public com.workflow.web.AnyType2AnyTypeMapEntry[] getHrBylogonname(java.lang.String in0) throws java.rmi.RemoteException;
    public int getTodolistSizeByUsername(java.lang.String in0) throws java.rmi.RemoteException;
}
