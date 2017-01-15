<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" >
var xmlhttp;
function check() {
	var pass=true;
	var passwordcheck=true;
	if(document.getElementById("b").value==""){
		document.getElementById("bb").innerHTML="请输入用户名称";
		pass=false;
	}else{
		document.getElementById("bb").innerHTML="";
	}
	if(document.getElementById("a").value==""){
			if(document.getElementById("c").value==""){
				document.getElementById("cc").innerHTML="请输入用户密码";
				passwordcheck=false;
				pass=false;
			}else{
				document.getElementById("cc").innerHTML="";
			}
			if(document.getElementById("d").value==""){
				document.getElementById("dd").innerHTML="请再次输入用户密码";
				passwordcheck=false;
				pass=false;
			}else{
				document.getElementById("dd").innerHTML="";
			}
			if(passwordcheck){
				if(document.getElementById("c").value!=document.getElementById("d").value){
					document.getElementById("dd").innerHTML="两次输入的密码不一致";
					pass=false;
				}else{
					document.getElementById("dd").innerHTML="";
				}
			}
      }
	if(document.getElementById("e").value==""){
		document.getElementById("ee").innerHTML="请输入用户年龄";
		pass=false;
	}else{
		document.getElementById("ee").innerHTML="";
	}
	if(document.getElementById("f").value==""){
		document.getElementById("ff").innerHTML="请输入用户电话";
		pass=false;
	}else{
		document.getElementById("ff").innerHTML="";
	}
	if(pass){
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = checkuser;
		xmlhttp.open("post", "checkUser", true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("userId="+document.getElementById("a").value+"&userName="+document.getElementById("b").value);
	}
}

function checkuser(){
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		var data = xmlhttp.responseText.trim();
		if(data==1){
			document.getElementById("bb").innerHTML="用户名已存在";
		}else{
			if(document.getElementById("a").value==""){
				alert("添加成功");
			}else{
				alert("修改成功");
			}
			document.getElementById("form1").submit();
		}
	}	
}
function del(id) {
	var con=confirm("确认删除id为"+id+"的用户吗？");
	if(con){
		alert("删除成功");
		location.href ="userDelete?userId="+id;
	}
}

function updatePwd(id) {
		location.href ="toUserPasswordUpdate?userId="+id;
	
}
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">用户管理&gt;&gt;</div>

	</div>
	<form id="form1" name="form1" method="post" action="userAddOrUpdate" onsubmit="return checkit();">
		<input  id="a" type="hidden" name="userId" value="${user.userId }"/>
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">用户名称：</td>
					<td><input type="text" name="userName" class="text" id="b" value="${user.userName }"/> 
					<font color="red">*</font><font id="bb" color="red"></font></td>
				</tr>
				<c:if test="${user.userId==null }">
				<tr>
					<td class="field">用户密码：</td>

					<td><input type="password" name="userPassword" class="text" id="c" /> 
					<font color="red">*</font><font id="cc" color="red"></font></td>
				</tr>
			    <tr>
					<td class="field">确认密码：</td>
					<td><input type="password" name="userPassword1" class="text" id="d"/> 
					<font color="red">*</font><font id="dd" color="red"></font></td>
				</tr>
                </c:if>
				<tr>
					<td class="field">用户性别：</td>
			 <td>
				<select name="userSex" id="select">
                    <option value="0" ${user.userSex==0?"selected":""}>女</option>
                    <option value="1" ${user.userSex==1?"selected":""}>男</option>
               </select>
              </td>
				</tr>

				<tr>
					<td class="field">用户年龄：</td>
					<td><input type="text" name="userAge" class="text" id="e"
					 value="${user.userAge }"/> 
					<font color="red">*</font><font id="ee" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">用户电话：</td>
					<td><input type="text" name="userTel" class="text" id="f" 
					value="${user.userTel }"/> 
					<font color="red">*</font><font id="ff" color="red"></font></td>

				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><textarea name="userAddress" id="textarea" class="text" cols="45" rows="5">${user.userAddress }</textarea>
					</td>
				</tr>
				<c:choose>
				<c:when test="${sessionScope.userRole!=0 }">
				<tr>
					<td class="field">用户权限：</td>

					<td><input type="radio" name="userRole" id="auth" value="0" ${user.userRole==0||user.userRole==null?"checked":""}/>普通用户
					<input type="radio" name="userRole" id="auth" value="1" ${user.userRole==1?"checked":""}/>经理
					<input type="radio" name="userRole" id="auth" value="2" ${user.userRole==2?"checked":""}/>管理员
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<input type="hidden"  name="userRole" id="auth" value="0" />
				</c:otherwise>
				</c:choose>
			</table>
		</div>
		<div class="buttons">
		    <c:choose>
			<c:when test="${user.userId!=null }">
			<input type="button" onclick="check();" value="修改" class="input-button"/>
			 <input type="button" onclick="del(${user.userId});" value="删除" class="input-button"/>
			 <input type="button" onclick="updatePwd(${user.userId})" value="修改密码" class="input-button"/>
			 </c:when>
			 <c:otherwise>
			 <input type="button" onclick="check();" value="添加" class="input-button"/></c:otherwise>
			 </c:choose>
			 <input type="button" name="button" id="button" onclick="history.back();" value="返回" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
