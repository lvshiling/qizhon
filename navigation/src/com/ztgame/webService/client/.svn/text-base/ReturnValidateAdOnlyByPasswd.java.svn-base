/**
 * ReturnValidateAdOnlyByPasswd.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class ReturnValidateAdOnlyByPasswd  implements java.io.Serializable {
    private boolean return_flag;

    private java.lang.String return_remark;

    public ReturnValidateAdOnlyByPasswd() {
    }

    public ReturnValidateAdOnlyByPasswd(
           boolean return_flag,
           java.lang.String return_remark) {
           this.return_flag = return_flag;
           this.return_remark = return_remark;
    }


    /**
     * Gets the return_flag value for this ReturnValidateAdOnlyByPasswd.
     * 
     * @return return_flag
     */
    public boolean isReturn_flag() {
        return return_flag;
    }


    /**
     * Sets the return_flag value for this ReturnValidateAdOnlyByPasswd.
     * 
     * @param return_flag
     */
    public void setReturn_flag(boolean return_flag) {
        this.return_flag = return_flag;
    }


    /**
     * Gets the return_remark value for this ReturnValidateAdOnlyByPasswd.
     * 
     * @return return_remark
     */
    public java.lang.String getReturn_remark() {
        return return_remark;
    }


    /**
     * Sets the return_remark value for this ReturnValidateAdOnlyByPasswd.
     * 
     * @param return_remark
     */
    public void setReturn_remark(java.lang.String return_remark) {
        this.return_remark = return_remark;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof ReturnValidateAdOnlyByPasswd)) return false;
        ReturnValidateAdOnlyByPasswd other = (ReturnValidateAdOnlyByPasswd) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.return_flag == other.isReturn_flag() &&
            ((this.return_remark==null && other.getReturn_remark()==null) || 
             (this.return_remark!=null &&
              this.return_remark.equals(other.getReturn_remark())));
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
        _hashCode += (isReturn_flag() ? Boolean.TRUE : Boolean.FALSE).hashCode();
        if (getReturn_remark() != null) {
            _hashCode += getReturn_remark().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(ReturnValidateAdOnlyByPasswd.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "ReturnValidateAdOnlyByPasswd"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("return_flag");
        elemField.setXmlName(new javax.xml.namespace.QName("", "return_flag"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("return_remark");
        elemField.setXmlName(new javax.xml.namespace.QName("", "return_remark"));
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
