<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="commons" uri="/WEB-INF/tld/cus/common.tld" %>
<c:set var="static" value="${pageContext.request.contextPath}"/>
<c:set var="domain" value="${pageContext.request.contextPath}"/>
<c:set var="upload" value="${pageContext.request.contextPath}"/>
<c:set var="absDomain" value="${initParam.domain}"/>
<c:set var="siteTitle" value="趣乐（www.qule.com）"></c:set>
<c:set var="jiasuTitle" value="趣乐加速器 下载器（jiasu.qule.com）"></c:set>