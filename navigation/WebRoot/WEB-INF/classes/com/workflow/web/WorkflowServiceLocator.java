/**
 * WorkflowServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.workflow.web;

public class WorkflowServiceLocator extends org.apache.axis.client.Service implements com.workflow.web.WorkflowService {

    public WorkflowServiceLocator() {
    }


    public WorkflowServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public WorkflowServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for workflowServiceHttpPort
    private java.lang.String workflowServiceHttpPort_address = "http://workflow.ztgame.com//service/workflowService";

    public java.lang.String getworkflowServiceHttpPortAddress() {
        return workflowServiceHttpPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String workflowServiceHttpPortWSDDServiceName = "workflowServiceHttpPort";

    public java.lang.String getworkflowServiceHttpPortWSDDServiceName() {
        return workflowServiceHttpPortWSDDServiceName;
    }

    public void setworkflowServiceHttpPortWSDDServiceName(java.lang.String name) {
        workflowServiceHttpPortWSDDServiceName = name;
    }

    public com.workflow.web.WorkflowServicePortType getworkflowServiceHttpPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(workflowServiceHttpPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getworkflowServiceHttpPort(endpoint);
    }

    public com.workflow.web.WorkflowServicePortType getworkflowServiceHttpPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.workflow.web.WorkflowServiceHttpBindingStub _stub = new com.workflow.web.WorkflowServiceHttpBindingStub(portAddress, this);
            _stub.setPortName(getworkflowServiceHttpPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setworkflowServiceHttpPortEndpointAddress(java.lang.String address) {
        workflowServiceHttpPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.workflow.web.WorkflowServicePortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.workflow.web.WorkflowServiceHttpBindingStub _stub = new com.workflow.web.WorkflowServiceHttpBindingStub(new java.net.URL(workflowServiceHttpPort_address), this);
                _stub.setPortName(getworkflowServiceHttpPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("workflowServiceHttpPort".equals(inputPortName)) {
            return getworkflowServiceHttpPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://service.workflow.workflow.velcro.com", "workflowService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://service.workflow.workflow.velcro.com", "workflowServiceHttpPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("workflowServiceHttpPort".equals(portName)) {
            setworkflowServiceHttpPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
