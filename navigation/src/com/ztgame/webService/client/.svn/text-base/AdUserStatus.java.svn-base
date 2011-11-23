/**
 * AdUserStatus.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class AdUserStatus  implements java.io.Serializable {
    private java.lang.Integer user_account_control;

    private java.lang.Boolean disabled;

    private java.lang.Boolean locked;

    public AdUserStatus() {
    }

    public AdUserStatus(
           java.lang.Integer user_account_control,
           java.lang.Boolean disabled,
           java.lang.Boolean locked) {
           this.user_account_control = user_account_control;
           this.disabled = disabled;
           this.locked = locked;
    }


    /**
     * Gets the user_account_control value for this AdUserStatus.
     * 
     * @return user_account_control
     */
    public java.lang.Integer getUser_account_control() {
        return user_account_control;
    }


    /**
     * Sets the user_account_control value for this AdUserStatus.
     * 
     * @param user_account_control
     */
    public void setUser_account_control(java.lang.Integer user_account_control) {
        this.user_account_control = user_account_control;
    }


    /**
     * Gets the disabled value for this AdUserStatus.
     * 
     * @return disabled
     */
    public java.lang.Boolean getDisabled() {
        return disabled;
    }


    /**
     * Sets the disabled value for this AdUserStatus.
     * 
     * @param disabled
     */
    public void setDisabled(java.lang.Boolean disabled) {
        this.disabled = disabled;
    }


    /**
     * Gets the locked value for this AdUserStatus.
     * 
     * @return locked
     */
    public java.lang.Boolean getLocked() {
        return locked;
    }


    /**
     * Sets the locked value for this AdUserStatus.
     * 
     * @param locked
     */
    public void setLocked(java.lang.Boolean locked) {
        this.locked = locked;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof AdUserStatus)) return false;
        AdUserStatus other = (AdUserStatus) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.user_account_control==null && other.getUser_account_control()==null) || 
             (this.user_account_control!=null &&
              this.user_account_control.equals(other.getUser_account_control()))) &&
            ((this.disabled==null && other.getDisabled()==null) || 
             (this.disabled!=null &&
              this.disabled.equals(other.getDisabled()))) &&
            ((this.locked==null && other.getLocked()==null) || 
             (this.locked!=null &&
              this.locked.equals(other.getLocked())));
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
        if (getUser_account_control() != null) {
            _hashCode += getUser_account_control().hashCode();
        }
        if (getDisabled() != null) {
            _hashCode += getDisabled().hashCode();
        }
        if (getLocked() != null) {
            _hashCode += getLocked().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(AdUserStatus.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdUserStatus"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_account_control");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_account_control"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("disabled");
        elemField.setXmlName(new javax.xml.namespace.QName("", "disabled"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("locked");
        elemField.setXmlName(new javax.xml.namespace.QName("", "locked"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setMinOccurs(0);
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
