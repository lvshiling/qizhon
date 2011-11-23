<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:if test="exception.message == null || exception.message == ''">{"status":"-1","message":"\u7cfb\u7edf\u7e41\u5fd9"}</s:if><s:else>{"status":"-1","message":"${exception.message}"}</s:else>