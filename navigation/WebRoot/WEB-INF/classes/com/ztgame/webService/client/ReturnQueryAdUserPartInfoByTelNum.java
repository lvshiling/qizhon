/**
 * ReturnQueryAdUserPartInfoByTelNum.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class ReturnQueryAdUserPartInfoByTelNum  implements java.io.Serializable {
    private com.ztgame.webService.client.AdUserMainInfo[] user_main_info;

    public ReturnQueryAdUserPartInfoByTelNum() {
    }

    public ReturnQueryAdUserPartInfoByTelNum(
           com.ztgame.webService.client.AdUserMainInfo[] user_main_info) {
           this.user_main_info = user_main_info;
    }


    /**
     * Gets the user_main_info value for this ReturnQueryAdUserPartInfoByTelNum.
     * 
     * @return user_main_info
     */
    public com.ztgame.webService.client.AdUserMainInfo[] getUser_main_info() {
        return user_main_info;
    }


    /**
     * Sets the user_main_info value for this ReturnQueryAdUserPartInfoByTelNum.
     * 
     * @param user_main_info
     */
    public void setUser_main_info(com.ztgame.webService.client.AdUserMainInfo[] user_main_info) {
        this.user_main_info = user_main_info;
    }

    public com.ztgame.webService.client.AdUserMainInfo getUser_main_info(int i) {
        return this.user_main_info[i];
    }

    public void setUser_main_info(int i, com.ztgame.webService.client.AdUserMainInfo _value) {
        this.user_main_info[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ReturnQueryAdUserPartInfoByTelNum)) return false;
        ReturnQueryAdUserPartInfoByTelNum other = (ReturnQueryAdUserPartInfoByTelNum) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.user_main_info==null && other.getUser_main_info()==null) || 
             (this.user_main_info!=null &&
              java.util.Arrays.equals(this.user_main_info, other.getUser_main_info())));
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
        if (getUser_main_info() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getUser_main_info());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getUser_main_info(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(ReturnQueryAdUserPartInfoByTelNum.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "ReturnQueryAdUserPartInfoByTelNum"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_main_info");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_main_info"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdUserMainInfo"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
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
