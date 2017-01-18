<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body class="frame-bd">
<ul class="left-menu">
    <c:choose>
    <c:when test="${sessionScope.userRole==0}">
    <li><a href="billList" target="mainFrame"><img src="${pageContext.request.contextPath}/images/btn_bill.gif" /></a></li>
    <li><a href="toUserUpdate?userId=${sessionScope.userId }" target="mainFrame"><img src="${pageContext.request.contextPath}/images/btn_users.gif" /></a></li>
	<li><a href="logout" onClick="javaScript:alert('用户已退出')"><img src="${pageContext.request.contextPath}/images/btn_exit.gif" /></a></li>
    </c:when>
    <c:otherwise>
	<li><a href="billList" target="mainFrame"><img src="${pageContext.request.contextPath}/images/btn_bill.gif" /></a></li>
	<li><a href="providerList" target="mainFrame"><img src="${pageContext.request.contextPath}/images/btn_suppliers.gif" /></a></li>
	<li><a href="userList" target="mainFrame"><img src="${pageContext.request.contextPath}/images/btn_users.gif" /></a></li>
	<li><a href="logout" onClick="javaScript:alert('用户已退出')"><img src="${pageContext.request.contextPath}/images/btn_exit.gif" /></a></li>
	</c:otherwise>
	</c:choose>
</ul>
</body>
</html>