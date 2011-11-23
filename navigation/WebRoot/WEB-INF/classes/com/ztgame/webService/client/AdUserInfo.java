/**
 * AdUserInfo.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ztgame.webService.client;

public class AdUserInfo  implements java.io.Serializable {
    private java.lang.String user_name;

    private java.lang.String display_name;

    private java.lang.String cn;

    private java.lang.String mail;

    private java.lang.String description;

    private int created_time;

    private java.lang.String staffnum;

    private java.lang.String telephonenumber;

    private java.lang.String title;

    private java.lang.String mobile;

    private java.lang.String[] othermobile;

    private java.lang.String[] facsimiletelephonenumber;

    private java.lang.String homephone;

    private java.lang.String[] otherhomephone;

    private com.ztgame.webService.client.AdUserStatus[] user_status;

    private com.ztgame.webService.client.AdDn dn;

    private java.lang.String department;

    private java.lang.String physicaldeliveryofficename;

    private java.lang.String thumbnailphoto;

    private com.ztgame.webService.client.AdDn[] memberof;

    private int primary_group_id;

    private com.ztgame.webService.client.AdDn manager;

    private com.ztgame.webService.client.AdDn[] direct_reports;

    public AdUserInfo() {
    }

    public AdUserInfo(
           java.lang.String user_name,
           java.lang.String display_name,
           java.lang.String cn,
           java.lang.String mail,
           java.lang.String description,
           int created_time,
           java.lang.String staffnum,
           java.lang.String telephonenumber,
           java.lang.String title,
           java.lang.String mobile,
           java.lang.String[] othermobile,
           java.lang.String[] facsimiletelephonenumber,
           java.lang.String homephone,
           java.lang.String[] otherhomephone,
           com.ztgame.webService.client.AdUserStatus[] user_status,
           com.ztgame.webService.client.AdDn dn,
           java.lang.String department,
           java.lang.String physicaldeliveryofficename,
           java.lang.String thumbnailphoto,
           com.ztgame.webService.client.AdDn[] memberof,
           int primary_group_id,
           com.ztgame.webService.client.AdDn manager,
           com.ztgame.webService.client.AdDn[] direct_reports) {
           this.user_name = user_name;
           this.display_name = display_name;
           this.cn = cn;
           this.mail = mail;
           this.description = description;
           this.created_time = created_time;
           this.staffnum = staffnum;
           this.telephonenumber = telephonenumber;
           this.title = title;
           this.mobile = mobile;
           this.othermobile = othermobile;
           this.facsimiletelephonenumber = facsimiletelephonenumber;
           this.homephone = homephone;
           this.otherhomephone = otherhomephone;
           this.user_status = user_status;
           this.dn = dn;
           this.department = department;
           this.physicaldeliveryofficename = physicaldeliveryofficename;
           this.thumbnailphoto = thumbnailphoto;
           this.memberof = memberof;
           this.primary_group_id = primary_group_id;
           this.manager = manager;
           this.direct_reports = direct_reports;
    }


    /**
     * Gets the user_name value for this AdUserInfo.
     * 
     * @return user_name
     */
    public java.lang.String getUser_name() {
        return user_name;
    }


    /**
     * Sets the user_name value for this AdUserInfo.
     * 
     * @param user_name
     */
    public void setUser_name(java.lang.String user_name) {
        this.user_name = user_name;
    }


    /**
     * Gets the display_name value for this AdUserInfo.
     * 
     * @return display_name
     */
    public java.lang.String getDisplay_name() {
        return display_name;
    }


    /**
     * Sets the display_name value for this AdUserInfo.
     * 
     * @param display_name
     */
    public void setDisplay_name(java.lang.String display_name) {
        this.display_name = display_name;
    }


    /**
     * Gets the cn value for this AdUserInfo.
     * 
     * @return cn
     */
    public java.lang.String getCn() {
        return cn;
    }


    /**
     * Sets the cn value for this AdUserInfo.
     * 
     * @param cn
     */
    public void setCn(java.lang.String cn) {
        this.cn = cn;
    }


    /**
     * Gets the mail value for this AdUserInfo.
     * 
     * @return mail
     */
    public java.lang.String getMail() {
        return mail;
    }


    /**
     * Sets the mail value for this AdUserInfo.
     * 
     * @param mail
     */
    public void setMail(java.lang.String mail) {
        this.mail = mail;
    }


    /**
     * Gets the description value for this AdUserInfo.
     * 
     * @return description
     */
    public java.lang.String getDescription() {
        return description;
    }


    /**
     * Sets the description value for this AdUserInfo.
     * 
     * @param description
     */
    public void setDescription(java.lang.String description) {
        this.description = description;
    }


    /**
     * Gets the created_time value for this AdUserInfo.
     * 
     * @return created_time
     */
    public int getCreated_time() {
        return created_time;
    }


    /**
     * Sets the created_time value for this AdUserInfo.
     * 
     * @param created_time
     */
    public void setCreated_time(int created_time) {
        this.created_time = created_time;
    }


    /**
     * Gets the staffnum value for this AdUserInfo.
     * 
     * @return staffnum
     */
    public java.lang.String getStaffnum() {
        return staffnum;
    }


    /**
     * Sets the staffnum value for this AdUserInfo.
     * 
     * @param staffnum
     */
    public void setStaffnum(java.lang.String staffnum) {
        this.staffnum = staffnum;
    }


    /**
     * Gets the telephonenumber value for this AdUserInfo.
     * 
     * @return telephonenumber
     */
    public java.lang.String getTelephonenumber() {
        return telephonenumber;
    }


    /**
     * Sets the telephonenumber value for this AdUserInfo.
     * 
     * @param telephonenumber
     */
    public void setTelephonenumber(java.lang.String telephonenumber) {
        this.telephonenumber = telephonenumber;
    }


    /**
     * Gets the title value for this AdUserInfo.
     * 
     * @return title
     */
    public java.lang.String getTitle() {
        return title;
    }


    /**
     * Sets the title value for this AdUserInfo.
     * 
     * @param title
     */
    public void setTitle(java.lang.String title) {
        this.title = title;
    }


    /**
     * Gets the mobile value for this AdUserInfo.
     * 
     * @return mobile
     */
    public java.lang.String getMobile() {
        return mobile;
    }


    /**
     * Sets the mobile value for this AdUserInfo.
     * 
     * @param mobile
     */
    public void setMobile(java.lang.String mobile) {
        this.mobile = mobile;
    }


    /**
     * Gets the othermobile value for this AdUserInfo.
     * 
     * @return othermobile
     */
    public java.lang.String[] getOthermobile() {
        return othermobile;
    }


    /**
     * Sets the othermobile value for this AdUserInfo.
     * 
     * @param othermobile
     */
    public void setOthermobile(java.lang.String[] othermobile) {
        this.othermobile = othermobile;
    }

    public java.lang.String getOthermobile(int i) {
        return this.othermobile[i];
    }

    public void setOthermobile(int i, java.lang.String _value) {
        this.othermobile[i] = _value;
    }


    /**
     * Gets the facsimiletelephonenumber value for this AdUserInfo.
     * 
     * @return facsimiletelephonenumber
     */
    public java.lang.String[] getFacsimiletelephonenumber() {
        return facsimiletelephonenumber;
    }


    /**
     * Sets the facsimiletelephonenumber value for this AdUserInfo.
     * 
     * @param facsimiletelephonenumber
     */
    public void setFacsimiletelephonenumber(java.lang.String[] facsimiletelephonenumber) {
        this.facsimiletelephonenumber = facsimiletelephonenumber;
    }

    public java.lang.String getFacsimiletelephonenumber(int i) {
        return this.facsimiletelephonenumber[i];
    }

    public void setFacsimiletelephonenumber(int i, java.lang.String _value) {
        this.facsimiletelephonenumber[i] = _value;
    }


    /**
     * Gets the homephone value for this AdUserInfo.
     * 
     * @return homephone
     */
    public java.lang.String getHomephone() {
        return homephone;
    }


    /**
     * Sets the homephone value for this AdUserInfo.
     * 
     * @param homephone
     */
    public void setHomephone(java.lang.String homephone) {
        this.homephone = homephone;
    }


    /**
     * Gets the otherhomephone value for this AdUserInfo.
     * 
     * @return otherhomephone
     */
    public java.lang.String[] getOtherhomephone() {
        return otherhomephone;
    }


    /**
     * Sets the otherhomephone value for this AdUserInfo.
     * 
     * @param otherhomephone
     */
    public void setOtherhomephone(java.lang.String[] otherhomephone) {
        this.otherhomephone = otherhomephone;
    }

    public java.lang.String getOtherhomephone(int i) {
        return this.otherhomephone[i];
    }

    public void setOtherhomephone(int i, java.lang.String _value) {
        this.otherhomephone[i] = _value;
    }


    /**
     * Gets the user_status value for this AdUserInfo.
     * 
     * @return user_status
     */
    public com.ztgame.webService.client.AdUserStatus[] getUser_status() {
        return user_status;
    }


    /**
     * Sets the user_status value for this AdUserInfo.
     * 
     * @param user_status
     */
    public void setUser_status(com.ztgame.webService.client.AdUserStatus[] user_status) {
        this.user_status = user_status;
    }

    public com.ztgame.webService.client.AdUserStatus getUser_status(int i) {
        return this.user_status[i];
    }

    public void setUser_status(int i, com.ztgame.webService.client.AdUserStatus _value) {
        this.user_status[i] = _value;
    }


    /**
     * Gets the dn value for this AdUserInfo.
     * 
     * @return dn
     */
    public com.ztgame.webService.client.AdDn getDn() {
        return dn;
    }


    /**
     * Sets the dn value for this AdUserInfo.
     * 
     * @param dn
     */
    public void setDn(com.ztgame.webService.client.AdDn dn) {
        this.dn = dn;
    }


    /**
     * Gets the department value for this AdUserInfo.
     * 
     * @return department
     */
    public java.lang.String getDepartment() {
        return department;
    }


    /**
     * Sets the department value for this AdUserInfo.
     * 
     * @param department
     */
    public void setDepartment(java.lang.String department) {
        this.department = department;
    }


    /**
     * Gets the physicaldeliveryofficename value for this AdUserInfo.
     * 
     * @return physicaldeliveryofficename
     */
    public java.lang.String getPhysicaldeliveryofficename() {
        return physicaldeliveryofficename;
    }


    /**
     * Sets the physicaldeliveryofficename value for this AdUserInfo.
     * 
     * @param physicaldeliveryofficename
     */
    public void setPhysicaldeliveryofficename(java.lang.String physicaldeliveryofficename) {
        this.physicaldeliveryofficename = physicaldeliveryofficename;
    }


    /**
     * Gets the thumbnailphoto value for this AdUserInfo.
     * 
     * @return thumbnailphoto
     */
    public java.lang.String getThumbnailphoto() {
        return thumbnailphoto;
    }


    /**
     * Sets the thumbnailphoto value for this AdUserInfo.
     * 
     * @param thumbnailphoto
     */
    public void setThumbnailphoto(java.lang.String thumbnailphoto) {
        this.thumbnailphoto = thumbnailphoto;
    }


    /**
     * Gets the memberof value for this AdUserInfo.
     * 
     * @return memberof
     */
    public com.ztgame.webService.client.AdDn[] getMemberof() {
        return memberof;
    }


    /**
     * Sets the memberof value for this AdUserInfo.
     * 
     * @param memberof
     */
    public void setMemberof(com.ztgame.webService.client.AdDn[] memberof) {
        this.memberof = memberof;
    }

    public com.ztgame.webService.client.AdDn getMemberof(int i) {
        return this.memberof[i];
    }

    public void setMemberof(int i, com.ztgame.webService.client.AdDn _value) {
        this.memberof[i] = _value;
    }


    /**
     * Gets the primary_group_id value for this AdUserInfo.
     * 
     * @return primary_group_id
     */
    public int getPrimary_group_id() {
        return primary_group_id;
    }


    /**
     * Sets the primary_group_id value for this AdUserInfo.
     * 
     * @param primary_group_id
     */
    public void setPrimary_group_id(int primary_group_id) {
        this.primary_group_id = primary_group_id;
    }


    /**
     * Gets the manager value for this AdUserInfo.
     * 
     * @return manager
     */
    public com.ztgame.webService.client.AdDn getManager() {
        return manager;
    }


    /**
     * Sets the manager value for this AdUserInfo.
     * 
     * @param manager
     */
    public void setManager(com.ztgame.webService.client.AdDn manager) {
        this.manager = manager;
    }


    /**
     * Gets the direct_reports value for this AdUserInfo.
     * 
     * @return direct_reports
     */
    public com.ztgame.webService.client.AdDn[] getDirect_reports() {
        return direct_reports;
    }


    /**
     * Sets the direct_reports value for this AdUserInfo.
     * 
     * @param direct_reports
     */
    public void setDirect_reports(com.ztgame.webService.client.AdDn[] direct_reports) {
        this.direct_reports = direct_reports;
    }

    public com.ztgame.webService.client.AdDn getDirect_reports(int i) {
        return this.direct_reports[i];
    }

    public void setDirect_reports(int i, com.ztgame.webService.client.AdDn _value) {
        this.direct_reports[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof AdUserInfo)) return false;
        AdUserInfo other = (AdUserInfo) obj;
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
            ((this.display_name==null && other.getDisplay_name()==null) || 
             (this.display_name!=null &&
              this.display_name.equals(other.getDisplay_name()))) &&
            ((this.cn==null && other.getCn()==null) || 
             (this.cn!=null &&
              this.cn.equals(other.getCn()))) &&
            ((this.mail==null && other.getMail()==null) || 
             (this.mail!=null &&
              this.mail.equals(other.getMail()))) &&
            ((this.description==null && other.getDescription()==null) || 
             (this.description!=null &&
              this.description.equals(other.getDescription()))) &&
            this.created_time == other.getCreated_time() &&
            ((this.staffnum==null && other.getStaffnum()==null) || 
             (this.staffnum!=null &&
              this.staffnum.equals(other.getStaffnum()))) &&
            ((this.telephonenumber==null && other.getTelephonenumber()==null) || 
             (this.telephonenumber!=null &&
              this.telephonenumber.equals(other.getTelephonenumber()))) &&
            ((this.title==null && other.getTitle()==null) || 
             (this.title!=null &&
              this.title.equals(other.getTitle()))) &&
            ((this.mobile==null && other.getMobile()==null) || 
             (this.mobile!=null &&
              this.mobile.equals(other.getMobile()))) &&
            ((this.othermobile==null && other.getOthermobile()==null) || 
             (this.othermobile!=null &&
              java.util.Arrays.equals(this.othermobile, other.getOthermobile()))) &&
            ((this.facsimiletelephonenumber==null && other.getFacsimiletelephonenumber()==null) || 
             (this.facsimiletelephonenumber!=null &&
              java.util.Arrays.equals(this.facsimiletelephonenumber, other.getFacsimiletelephonenumber()))) &&
            ((this.homephone==null && other.getHomephone()==null) || 
             (this.homephone!=null &&
              this.homephone.equals(other.getHomephone()))) &&
            ((this.otherhomephone==null && other.getOtherhomephone()==null) || 
             (this.otherhomephone!=null &&
              java.util.Arrays.equals(this.otherhomephone, other.getOtherhomephone()))) &&
            ((this.user_status==null && other.getUser_status()==null) || 
             (this.user_status!=null &&
              java.util.Arrays.equals(this.user_status, other.getUser_status()))) &&
            ((this.dn==null && other.getDn()==null) || 
             (this.dn!=null &&
              this.dn.equals(other.getDn()))) &&
            ((this.department==null && other.getDepartment()==null) || 
             (this.department!=null &&
              this.department.equals(other.getDepartment()))) &&
            ((this.physicaldeliveryofficename==null && other.getPhysicaldeliveryofficename()==null) || 
             (this.physicaldeliveryofficename!=null &&
              this.physicaldeliveryofficename.equals(other.getPhysicaldeliveryofficename()))) &&
            ((this.thumbnailphoto==null && other.getThumbnailphoto()==null) || 
             (this.thumbnailphoto!=null &&
              this.thumbnailphoto.equals(other.getThumbnailphoto()))) &&
            ((this.memberof==null && other.getMemberof()==null) || 
             (this.memberof!=null &&
              java.util.Arrays.equals(this.memberof, other.getMemberof()))) &&
            this.primary_group_id == other.getPrimary_group_id() &&
            ((this.manager==null && other.getManager()==null) || 
             (this.manager!=null &&
              this.manager.equals(other.getManager()))) &&
            ((this.direct_reports==null && other.getDirect_reports()==null) || 
             (this.direct_reports!=null &&
              java.util.Arrays.equals(this.direct_reports, other.getDirect_reports())));
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
        if (getDisplay_name() != null) {
            _hashCode += getDisplay_name().hashCode();
        }
        if (getCn() != null) {
            _hashCode += getCn().hashCode();
        }
        if (getMail() != null) {
            _hashCode += getMail().hashCode();
        }
        if (getDescription() != null) {
            _hashCode += getDescription().hashCode();
        }
        _hashCode += getCreated_time();
        if (getStaffnum() != null) {
            _hashCode += getStaffnum().hashCode();
        }
        if (getTelephonenumber() != null) {
            _hashCode += getTelephonenumber().hashCode();
        }
        if (getTitle() != null) {
            _hashCode += getTitle().hashCode();
        }
        if (getMobile() != null) {
            _hashCode += getMobile().hashCode();
        }
        if (getOthermobile() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getOthermobile());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getOthermobile(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getFacsimiletelephonenumber() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getFacsimiletelephonenumber());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getFacsimiletelephonenumber(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getHomephone() != null) {
            _hashCode += getHomephone().hashCode();
        }
        if (getOtherhomephone() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getOtherhomephone());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getOtherhomephone(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getUser_status() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getUser_status());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getUser_status(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getDn() != null) {
            _hashCode += getDn().hashCode();
        }
        if (getDepartment() != null) {
            _hashCode += getDepartment().hashCode();
        }
        if (getPhysicaldeliveryofficename() != null) {
            _hashCode += getPhysicaldeliveryofficename().hashCode();
        }
        if (getThumbnailphoto() != null) {
            _hashCode += getThumbnailphoto().hashCode();
        }
        if (getMemberof() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getMemberof());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getMemberof(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        _hashCode += getPrimary_group_id();
        if (getManager() != null) {
            _hashCode += getManager().hashCode();
        }
        if (getDirect_reports() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getDirect_reports());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getDirect_reports(), i);
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
        new org.apache.axis.description.TypeDesc(AdUserInfo.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdUserInfo"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_name");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_name"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("display_name");
        elemField.setXmlName(new javax.xml.namespace.QName("", "display_name"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cn");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cn"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("mail");
        elemField.setXmlName(new javax.xml.namespace.QName("", "mail"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("description");
        elemField.setXmlName(new javax.xml.namespace.QName("", "description"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("created_time");
        elemField.setXmlName(new javax.xml.namespace.QName("", "created_time"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("staffnum");
        elemField.setXmlName(new javax.xml.namespace.QName("", "staffnum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("telephonenumber");
        elemField.setXmlName(new javax.xml.namespace.QName("", "telephonenumber"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("title");
        elemField.setXmlName(new javax.xml.namespace.QName("", "title"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("mobile");
        elemField.setXmlName(new javax.xml.namespace.QName("", "mobile"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("othermobile");
        elemField.setXmlName(new javax.xml.namespace.QName("", "othermobile"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("facsimiletelephonenumber");
        elemField.setXmlName(new javax.xml.namespace.QName("", "facsimiletelephonenumber"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("homephone");
        elemField.setXmlName(new javax.xml.namespace.QName("", "homephone"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("otherhomephone");
        elemField.setXmlName(new javax.xml.namespace.QName("", "otherhomephone"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("user_status");
        elemField.setXmlName(new javax.xml.namespace.QName("", "user_status"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdUserStatus"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("dn");
        elemField.setXmlName(new javax.xml.namespace.QName("", "dn"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdDn"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("department");
        elemField.setXmlName(new javax.xml.namespace.QName("", "department"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("physicaldeliveryofficename");
        elemField.setXmlName(new javax.xml.namespace.QName("", "physicaldeliveryofficename"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("thumbnailphoto");
        elemField.setXmlName(new javax.xml.namespace.QName("", "thumbnailphoto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("memberof");
        elemField.setXmlName(new javax.xml.namespace.QName("", "memberof"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdDn"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("primary_group_id");
        elemField.setXmlName(new javax.xml.namespace.QName("", "primary_group_id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("manager");
        elemField.setXmlName(new javax.xml.namespace.QName("", "manager"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdDn"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("direct_reports");
        elemField.setXmlName(new javax.xml.namespace.QName("", "direct_reports"));
        elemField.setXmlType(new javax.xml.namespace.QName("urn:wsdl_passport", "AdDn"));
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
