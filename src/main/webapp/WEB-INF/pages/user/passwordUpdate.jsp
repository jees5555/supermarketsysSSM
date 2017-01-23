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
if (window.XMLHttpRequest){
  xmlhttp=new XMLHttpRequest();
}else{
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
var userId;
var userPasswordOld;
var userPassword;
var userPassword1;

function check() {
	var pass =true;
	var passwordcheck=true;
	userId =document.getElementById("userId").value;
	userPasswordOld =document.getElementById("userPasswordOld").value;
	userPassword =document.getElementById("userPassword").value;
	userPassword1=document.getElementById("userPassword1").value;
	if(userPasswordOld==""){
		document.getElementById("userPasswordOldMsg").innerHTML="请输入旧密码";
		pass=false;
	}else{
		document.getElementById("userPasswordOldMsg").innerHTML="";
	}
	if(userPassword==""){
		document.getElementById("userPasswordMsg").innerHTML="请输入新密码";
		pass=false;
	}else{
		document.getElementById("userPasswordMsg").innerHTML="";
	}
	if(userPassword1==""){
		document.getElementById("userPassword1Msg").innerHTML="请再次输入密码";
		passwordcheck=false;
		pass=false;
	}else{
		document.getElementById("userPassword1Msg").innerHTML="";
	}
	if(passwordcheck){
		if(userPassword!=userPassword1){
			document.getElementById("userPasswordMsg").innerHTML="两次输入的密码不一致";
			pass=false;
		}else{
			document.getElementById("userPasswordMsg").innerHTML="";
			xmlhttp.onreadystatechange = checkuserpassword;
			xmlhttp.open("post", "checkUserPassword", true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("userId="+userId+"&userPassword="+userPasswordOld);
		}
	}
}
function checkuserpassword() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		var data = xmlhttp.responseText.trim();
		if(data=="success"){
			document.getElementById("userPasswordOldMsg").innerHTML="";
			doSubmit();
		}else {
			document.getElementById("userPasswordOldMsg").innerHTML="旧密码错误";
		}
	}
}
function doSubmit(){
	xmlhttp.open("POST", "userPasswordUpdate", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("userId="+userId+"&userPassword="+userPassword);
	xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				  var text=xmlhttp.responseText;
				  if(text=="success"){
				     alert("修改成功");
				  }else{
				     alert("修改失败");
				  }
				    location.href("userAfterOperateShow");
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
		<input id="userId" name="userId" value="${requestScope.userId}" type="hidden" />
		<div class="content">
		<font color="red"></font>
			<table class="box" >
			<tbody><tr>
					<td class="field">旧的密码：</td>
					<td><input name="userPasswordOld" id="userPasswordOld" class="text" type="password" /> 
					<font color="red">*</font>
					<font id="userPasswordOldMsg" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">新的密码：</td>
					<td><input name="userPassword" id="userPassword" class="text" type="password" /> 
					<font color="red">*</font>
					<font id="userPasswordMsg" color="red"></font></td>

				</tr>
			     <tr>
					<td class="field">确认密码：</td>
					<td><input name="userPassword1" id="userPassword1" class="text" type="password" /> 
					<font color="red">*</font>
					<font id="userPassword1Msg" color="red"></font></td>
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
