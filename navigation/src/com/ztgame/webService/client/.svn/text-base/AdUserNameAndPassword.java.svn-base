/**
 * AdUserNameAndPassword.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class AdUserNameAndPassword  implements java.io.Serializable {
    private java.lang.String user_name;

    private java.lang.String user_pwd;

    public AdUserNameAndPassword() {
    }

    public AdUserNameAndPassword(
           java.lang.String user_name,
           java.lang.String user_pwd) {
           this.user_name = user_name;
           this.user_pwd = user_pwd;
    }


    /**
     * Gets the user_name value for this AdUserNameAndPassword.
     * 
     * @return user_name
     */
    public java.lang.String getUser_name() {
        return user_name;
    }


    /**
     * Sets the user_name value for this AdUserNameAndPassword.
     * 
     * @param user_name
     */
    public void setUser_name(java.lang.String user_name) {
        this.user_name = user_name;
    }


    /**
     * Gets the user_pwd value for this AdUserNameAndPassword.
     * 
     * @return user_pwd
     */
    public java.lang.String getUser_pwd() {
        return user_pwd;
    }


    /**
     * Sets the user_pwd value for this AdUserNameAndPassword.
     * 
     * @param user_pwd
     */
    public void setUser_pwd(java.lang.String user_pwd) {
        this.user_pwd = user_pwd;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof AdUserNameAndPassword)) return false;
        AdUserNameAndPassword other = (AdUserNameAndPassword) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.user_name==null && other.getUser_name()==null) || 
             (this.user_name!=null &&
              this.user_name.equals(other.getUser_name()))) &&
            ((this.user_pwd==null && other.getUser_pwd()==null) || 
             (this.user_pwd!=null &&
              this.user_pwd.equals(other.getUser_pwd())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getUser_name() != null) {
            _hashCode += getUser_name().hashCode();
        }
        if (getUser_pwd() != null) {
            _hashCode += getUser_pwd().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(AdUserNameAndPassword.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdUserNameAndPassword"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_name");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_name"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_pwd");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_pwd"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
