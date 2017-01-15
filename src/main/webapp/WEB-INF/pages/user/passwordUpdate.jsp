<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
var xmlhttp;
function check() {
	var pass =true;
	var passwordcheck=true;
	if(document.getElementById("a").value==""){
		document.getElementById("aa").innerHTML="请输入旧密码";
		pass=false;
	}else{
		document.getElementById("aa").innerHTML="";
	}
	if(document.getElementById("b").value==""){
		document.getElementById("bb").innerHTML="请输入新密码";
		pass=false;
	}else{
		document.getElementById("bb").innerHTML="";
	}
	if(document.getElementById("c").value==""){
		document.getElementById("cc").innerHTML="请再次输入密码";
		passwordcheck=false;
		pass=false;
	}else{
		document.getElementById("cc").innerHTML="";
	}
	if(passwordcheck){
		if(document.getElementById("b").value!=document.getElementById("c").value){
			document.getElementById("bb").innerHTML="两次输入的密码不一致";
			pass=false;
		}else{
			document.getElementById("bb").innerHTML="";
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = checkuserpassword;
			xmlhttp.open("post", "checkUserPassword", true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("userId="+document.getElementById("x").value+"&userPassword="+document.getElementById("a").value);
		}
	}
}
function checkuserpassword() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		var data = xmlhttp.responseText.trim();
		if(data=="0"){
			document.getElementById("aa").innerHTML="密码错误";
		}else {
			document.getElementById("aa").innerHTML="";
			alert("修改成功");
			document.getElementById("form1").submit();
			
		}
	}
}
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>
	</div>
	<form id="form1" name="form1" method="post" action="userPasswordUpdate" onsubmit="return checkit();">
		<input id="x" name="userId" value="${requestScope.userId}" type="hidden" />
		<div class="content">
		<font color="red"></font>
			<table class="box" >
			<tbody><tr>
					<td class="field">旧的密码：</td>
					<td><input name="userPasswordOld" id="a" class="text" type="password" /> 
					<font id="aa" color="red"></font><font id="aa" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">新的密码：</td>
					<td><input name="userPassword" id="b" class="text" type="password" /> 
					<font id="bb" color="red"></font><font id="bb" color="red"></font></td>

				</tr>
			     <tr>
					<td class="field">确认密码：</td>
					<td><input name="userPassword1" id="c" class="text" type="password" /> 
					<font id="cc" color="red"></font><font id="cc" color="red"></font></td>
				</tr>
				
			</tbody></table>
		</div>

		<div class="buttons">
			<input name="button"  value="提交" class="input-button" type="button" onclick="check();"/> 
			<input name="button"  onclick="history.back();" value="返回" class="input-button" type="button" /> 
		</div>
	</form>
</div>
</body>
</html>
