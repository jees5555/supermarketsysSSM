<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" >
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">系统设置&gt;&gt;</div>

	</div>
	<form id="userform" method="post" action="userAddOrUpdate">
		<div class="content">
			<table class="box">
			<tr><td>&nbsp;&nbsp;<input type="checkbox" name="billSkip"/>&nbsp;&nbsp;添加帐单列表完成后直接添加下一个</td></tr>
            <c:if test="${sessionScope.userRole!=0}">
			<tr><td>&nbsp;&nbsp;<input type="checkbox" name="supplierSkip"/>&nbsp;&nbsp;添加供应商列表完成后直接添加下一个</td></tr>
			<tr><td>&nbsp;&nbsp;<input type="checkbox" name="userSkip"/>&nbsp;&nbsp;添加用户列表完成后直接添加下一个</td></tr>
			</c:if>	
			</table>
		</div>
		<div class="buttons">
		   
			<input type="button" onclick="check();" value="修改" class="input-button"/>
			<input type="reset" name="res"  value="重置" class="input-button"/> 
			<input type="button"   value="恢复默认" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
