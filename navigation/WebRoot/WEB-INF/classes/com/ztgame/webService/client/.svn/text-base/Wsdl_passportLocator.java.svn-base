/**
 * Wsdl_passportLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class Wsdl_passportLocator extends org.apache.axis.client.Service implements com.ztgame.webService.client.Wsdl_passport {

    public Wsdl_passportLocator() {
    }


    public Wsdl_passportLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Wsdl_passportLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for wsdl_passportPort
    private java.lang.String wsdl_passportPort_address = "http://passport.ztgame.com/passport/soap/soapserver_passport.php";

    public java.lang.String getwsdl_passportPortAddress() {
        return wsdl_passportPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String wsdl_passportPortWSDDServiceName = "wsdl_passportPort";

    public java.lang.String getwsdl_passportPortWSDDServiceName() {
        return wsdl_passportPortWSDDServiceName;
    }

    public void setwsdl_passportPortWSDDServiceName(java.lang.String name) {
        wsdl_passportPortWSDDServiceName = name;
    }

    public com.ztgame.webService.client.Wsdl_passportPortType getwsdl_passportPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(wsdl_passportPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getwsdl_passportPort(endpoint);
    }

    public com.ztgame.webService.client.Wsdl_passportPortType getwsdl_passportPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.ztgame.webService.client.Wsdl_passportBindingStub _stub = new com.ztgame.webService.client.Wsdl_passportBindingStub(portAddress, this);
            _stub.setPortName(getwsdl_passportPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setwsdl_passportPortEndpointAddress(java.lang.String address) {
        wsdl_passportPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.ztgame.webService.client.Wsdl_passportPortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.ztgame.webService.client.Wsdl_passportBindingStub _stub = new com.ztgame.webService.client.Wsdl_passportBindingStub(new java.net.URL(wsdl_passportPort_address), this);
                _stub.setPortName(getwsdl_passportPortWSDDServiceName());
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
        if ("wsdl_passportPort".equals(inputPortName)) {
            return getwsdl_passportPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("urn:wsdl_passport", "wsdl_passport");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("urn:wsdl_passport", "wsdl_passportPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("wsdl_passportPort".equals(portName)) {
            setwsdl_passportPortEndpointAddress(address);
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
