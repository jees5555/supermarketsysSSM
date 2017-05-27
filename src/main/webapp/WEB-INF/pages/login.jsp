<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${displaykey['login.title']}</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
var xmlhttp;
function keyLogin(){
	 if (event.keyCode==13)  //回车键的键值为13
	   check();//调用登录按钮的登录事件
	}
function check() {
	var pass = true;
	if(document.getElementById("a").value==""){
		alert("${displaykey['login.username.empty']}");
		pass=false;
	}
	if(document.getElementById("b").value==""){
		alert("${displaykey['login.password.empty']}");
		pass=false;
	}
	if(pass){
		var loginform=document.getElementById("loginform");
		loginform.submit();
	}
}
function changeLanguage(){
	location.href="${pageContext.request.contextPath}?language="+document.getElementById("language").value;
}

</script>
</head>
<body class="blue-style">

<div id="login">

	<div class="icon"></div>
	<div class="login-box">
		<form id="loginform" method="post" action="${pageContext.request.contextPath}/user/login">
			<dl>
				<dt><font size="2">${displaykey['login.username']}</font></dt>
				<dd><input id="a" type="text" name="userName" class="input-text" onkeydown="keyLogin()"/></dd>
				<dt><font size="2">${displaykey['login.password']}</font></dt>
				<dd><input id="b" type="password" name="userPassword" class="input-text" onkeydown="keyLogin()"/></dd>
				
				
			</dl>
			<div class="buttons">
			    <select id="language" name="language" onchange="changeLanguage()">
			    <option value="en-us" ${language=='en-us'?"selected='selected'":"" }>English</option>
			    <option value="ja-jp" ${language=='ja-jp'?"selected='selected'":"" }>日本語</option>
			    <option value="zh-cn" ${language=='zh-cn'?"selected='selected'":"" }>简体中文</option>
			    </select>
			    <input type="checkbox" name="autologin" /><font style="font-weight: bold;" size="1px;" color="#3379b7" >${displaykey['login.autologin']}</font>
			    <input type="button" onclick="check();" name="login" value="${displaykey['login.login']}" class="input-button" />
				<input type="reset" name="reset" value="${displaykey['login.reset']}" class="input-button" />
			  
			</div>
			<p align="right"><font style="font-weight: bold;" size="3px;" color="red" >${msg }</font></p>
		</form>
	</div>
</div>
</body>
</html>
