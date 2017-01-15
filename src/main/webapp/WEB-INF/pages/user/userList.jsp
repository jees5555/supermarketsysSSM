<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="menu">
	<table><tbody>
		<tr><td><form method="post" action="userList">
			用户名称：<input name="userName" class="input-text" type="text" value="${requestScope.userName==null?'':userName }">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="submit" value="查询" class="button" />
		</form></td></tr>
		</tbody></table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" class="input-button"
				onclick="window.location='toUserAdd'" type="button"></em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<tbody>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
						<td width="80"><div class="STYLE1" align="center">用户名称</div></td>
						<td width="100"><div class="STYLE1" align="center">性别</div></td>
						<td width="100"><div class="STYLE1" align="center">年龄</div></td>
						<td width="150"><div class="STYLE1" align="center">电话</div></td>
						<td width="150"><div class="STYLE1" align="center">地址</div></td>
						<td width="150"><div class="STYLE1" align="center">权限</div></td>
					</tr>
                     <c:forEach items="${userList }" var="user" varStatus="vs">
					<tr>
						<td height="23"><span class="STYLE1">${user.userId }</span></td>
						<td><span class="STYLE1"><a href="toUserUpdate?userId=${user.userId }">${user.userName }</a></span></td>
						<td><span class="STYLE1">${user.userSex==0?"女":"男"}</span></td>
						<td><span class="STYLE1">${user.userAge==0?"":user.userAge}</span></td>
						<td><span class="STYLE1">${user.userTel==0?"":user.userTel}</span></td>
						<td><span class="STYLE1">${user.userAddress }</span></td>
						<td><span class="STYLE1">
						<c:choose>
						<c:when test="${user.userRole==0 }">
						普通用户
						</c:when>
						<c:when test="${user.userRole==1 }">
						经理
						</c:when>
						<c:otherwise>
						管理员
						</c:otherwise>
						</c:choose>
						 </span></td>

					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>