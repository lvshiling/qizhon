/**
 * AdDn.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class AdDn  implements java.io.Serializable {
    private java.lang.String cn;

    private java.lang.String[] ou;

    private java.lang.String[] dc;

    public AdDn() {
    }

    public AdDn(
           java.lang.String cn,
           java.lang.String[] ou,
           java.lang.String[] dc) {
           this.cn = cn;
           this.ou = ou;
           this.dc = dc;
    }


    /**
     * Gets the cn value for this AdDn.
     * 
     * @return cn
     */
    public java.lang.String getCn() {
        return cn;
    }


    /**
     * Sets the cn value for this AdDn.
     * 
     * @param cn
     */
    public void setCn(java.lang.String cn) {
        this.cn = cn;
    }


    /**
     * Gets the ou value for this AdDn.
     * 
     * @return ou
     */
    public java.lang.String[] getOu() {
        return ou;
    }


    /**
     * Sets the ou value for this AdDn.
     * 
     * @param ou
     */
    public void setOu(java.lang.String[] ou) {
        this.ou = ou;
    }

    public java.lang.String getOu(int i) {
        return this.ou[i];
    }

    public void setOu(int i, java.lang.String _value) {
        this.ou[i] = _value;
    }


    /**
     * Gets the dc value for this AdDn.
     * 
     * @return dc
     */
    public java.lang.String[] getDc() {
        return dc;
    }


    /**
     * Sets the dc value for this AdDn.
     * 
     * @param dc
     */
    public void setDc(java.lang.String[] dc) {
        this.dc = dc;
    }

    public java.lang.String getDc(int i) {
        return this.dc[i];
    }

    public void setDc(int i, java.lang.String _value) {
        this.dc[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof AdDn)) return false;
        AdDn other = (AdDn) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.cn==null && other.getCn()==null) || 
             (this.cn!=null &&
              this.cn.equals(other.getCn()))) &&
            ((this.ou==null && other.getOu()==null) || 
             (this.ou!=null &&
              java.util.Arrays.equals(this.ou, other.getOu()))) &&
            ((this.dc==null && other.getDc()==null) || 
             (this.dc!=null &&
              java.util.Arrays.equals(this.dc, other.getDc())));
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
        if (getCn() != null) {
            _hashCode += getCn().hashCode();
        }
        if (getOu() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getOu());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getOu(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getDc() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getDc());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getDc(), i);
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
        new org.apache.axis.description.TypeDesc(AdDn.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdDn"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cn");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cn"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("ou");
        elemField.setXmlName(new javax.xml.namespace.QName("", "ou"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("dc");
        elemField.setXmlName(new javax.xml.namespace.QName("", "dc"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
