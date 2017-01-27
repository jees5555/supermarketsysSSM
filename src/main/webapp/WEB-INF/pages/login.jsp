<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录 - 超市账单管理系统</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
var xmlhttp;
function check() {
	var pass = true;
	if(document.getElementById("a").value==""){
		alert("请输入用户名");
		pass=false;
	}
	if(document.getElementById("b").value==""){
		alert("请输入密码");
		pass=false;
	}
	if(pass){
		var loginform=document.getElementById("loginform");
		loginform.submit();
	}
}


</script>
</head>
<body class="blue-style">
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form id="loginform" method="post" action="${pageContext.request.contextPath}/user/login">
			<dl>
				<dt>用户名：</dt>
				<dd><input id="a" type="text" name="userName" class="input-text" /></dd>
				<dt>密　码：</dt>
				<dd><input id="b" type="password" name="userPassword" class="input-text" /></dd>
			</dl>
			<div class="buttons">
				<input type="button" onclick="check();" name="login" value="登录系统" class="input-button" />
				<input type="reset" name="reset" value="重　　填" class="input-button" />
			</div>
			<p align="right"><font style="font-weight: bold;" size="3px;" color="red" >${msg }</font></p>
		</form>
	</div>
</div>
</body>
</html>
