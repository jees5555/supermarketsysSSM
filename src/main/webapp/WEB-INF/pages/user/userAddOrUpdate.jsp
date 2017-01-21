<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" >
var xmlhttp;
if (window.XMLHttpRequest){
  xmlhttp=new XMLHttpRequest();
}else{
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
var userId;
var userName;
var userPassword;
var userPasswordValidate;
var userSex;
var userAge;
var userTel;
var userAddress;
var userRole;

function check() {
	var pass=true;
	var passwordcheck=true;
	userId =document.getElementById("userId").value;
	userName = document.getElementById("userName").value;
	if(userId==""){
	userPassword = document.getElementById("userPassword").value;
	userPasswordValidate = document.getElementById("userPasswordValidate").value;
	}
	userSex =document.getElementById("userSex").value;
	userAge =document.getElementById("userAge").value;
	userTel = document.getElementById("userTel").value;
	userAddress = document.getElementById("userAddress").value;
	userRole = getRadioBoxValue("userRole");
	function getRadioBoxValue(radioName) { 
		var obj = document.getElementsByName(radioName);  //这个是以标签的name来取控件
		    for(i=0; i<obj.length;i++)    {
		         if(obj[i].checked)    { 
		              return   obj[i].value; 
		         } 
		    }         
		 return "0";       
    } 
	
	if(userName==""){
		document.getElementById("userNameMsg").innerHTML="请输入用户名称";
		pass=false;
	}else{
		document.getElementById("userNameMsg").innerHTML="";
	}
	if(userId==""){
			if(userPassword==""){
				document.getElementById("userPasswordMsg").innerHTML="请输入用户密码";
				passwordcheck=false;
				pass=false;
			}else{
				document.getElementById("userPasswordMsg").innerHTML="";
			}
			if(userPasswordValidate==""){
				document.getElementById("userPasswordValidateMsg").innerHTML="请再次输入用户密码";
				passwordcheck=false;
				pass=false;
			}else{
				document.getElementById("userPasswordValidateMsg").innerHTML="";
			}
			if(passwordcheck){
				if(userPassword!=userPasswordValidate){
					document.getElementById("userPasswordValidateMsg").innerHTML="两次输入的密码不一致";
					pass=false;
				}else{
					document.getElementById("userPasswordValidateMsg").innerHTML="";
				}
			}
      }
	if(userAge==""){
		document.getElementById("userAgeMsg").innerHTML="请输入用户年龄";
		pass=false;
	}else{
		document.getElementById("userAgeMsg").innerHTML="";
	}
	if(userTel==""){
		document.getElementById("userTelMsg").innerHTML="请输入用户电话";
		pass=false;
	}else{
		document.getElementById("userTelMsg").innerHTML="";
	}
	if(pass){
		checkuser(true);
		
	}
}
function doSubmit(){
	xmlhttp.open("POST", "userAddOrUpdate", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	if(userId==""){
		xmlhttp.send("userName="+userName+"&userPassword="+userPassword+"&userSex="+userSex
				+"&userAge="+userAge+"&userTel="+userTel+"&userAddress="+userAddress+"&userRole="+userRole);
		xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
				    var text=xmlhttp.responseText;
				    if(text=="success"){
				    	alert("添加成功");
				    }else{
				    	alert("添加失败，你可能没有合适的权限");
				    }
				    location.href("userList");
				  }
		}
	}else{
		xmlhttp.send("userId="+userId+"&userName="+userName+"&userSex="+userSex+"&userAge="+userAge
				+"&userTel="+userTel+"&userAddress="+userAddress+"&userRole="+userRole);
		xmlhttp.onreadystatechange=function(){
		   if (xmlhttp.readyState==4 && xmlhttp.status==200){
			    var text=xmlhttp.responseText;
			    if(text=="success"){
			    	alert("修改成功");
			    }else{
			    	alert("修改失败，你可能没有合适的权限");
			    }
			    if("0"=="${sessionScope.userRole}"){
			    	location.href("showWelcome");
			    }else{
			    	location.href("userList");
			    }
			  }
		 }
	}
}
function checkuser(submit){
	userId = document.getElementById("userId").value;
	userName = document.getElementById("userName").value;
	xmlhttp.open("post", "checkUser", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	if(userId==""){
		xmlhttp.send("userName="+userName);
	}else{
		xmlhttp.send("userId="+userId+"&userName="+userName);
	}
	xmlhttp.onreadystatechange = function(submit) {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var data = xmlhttp.responseText.trim();
			if(data=="failure"){
				document.getElementById("userNameMsg").innerHTML="用户名已存在";
			}else{
				document.getElementById("userNameMsg").innerHTML="";
				if(submit){
					doSubmit();
				}
			}
		}	
	}
	
}
function del(id) {
	var con=confirm("确认删除id为"+id+"的用户吗？");
	if(con){
		xmlhttp.open("GET","userDelete?userId="+id,true);
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
		  if (xmlhttp.readyState==4 && xmlhttp.status==200){
		    var text=xmlhttp.responseText;
		    if(text=="success"){
		    	alert("删除成功");
		    }else{
		    	alert("删除失败");
		    }
		    location.href("userList");
		  }
		 }
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
	<form id="userform" method="post" action="userAddOrUpdate">
		<input  id="userId" type="hidden" name="userId" value="${user.userId }"/>
		<div class="content">
			<table class="box">
			<tr>
					<td class="field">用户名称：</td>
					<td><input type="text" name="userName" class="text" id="userName" value="${user.userName }" onblur="javascript:checkuser('false')"/> 
					<font color="red">*</font>
					<font id="userNameMsg" color="red"></font></td>
				</tr>
				<c:if test="${user.userId==null }">
				<tr>
					<td class="field">用户密码：</td>

					<td><input type="password" name="userPassword" class="text" id="userPassword" /> 
					<font color="red">*</font>
					<font id="userPasswordMsg" color="red"></font></td>
				</tr>
			    <tr>
					<td class="field">确认密码：</td>
					<td><input type="password" name="userPasswordValidate" class="text" id="userPasswordValidate"/> 
					<font color="red">*</font>
					<font id="userPasswordValidateMsg" color="red"></font></td>
				</tr>
                </c:if>
				<tr>
					<td class="field">用户性别：</td>
			 <td>
				<select name="userSex" id="userSex">
                    <option value="0" ${user.userSex==0?"selected":""}>女</option>
                    <option value="1" ${user.userSex==1?"selected":""}>男</option>
               </select>
              </td>
				</tr>

				<tr>
					<td class="field">用户年龄：</td>
					<td><input type="text" name="userAge" class="text" id="userAge"
					 value="${user.userAge }"/> 
					<font color="red">*</font>
					<font id="userAgeMsg" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">用户电话：</td>
					<td><input type="text" name="userTel" class="text" id="userTel" 
					value="${user.userTel }"/> 
					<font color="red">*</font>
					<font id="userTelMsg" color="red"></font></td>

				</tr>
				<tr>
					<td class="field">用户地址：</td>
					<td><textarea name="userAddress" id="userAddress" class="text" cols="45" rows="5">${user.userAddress }</textarea>
					</td>
				</tr>
				<c:choose>
				<c:when test="${sessionScope.userRole!=0 }">
				<tr>
					<td class="field">用户权限：</td>

					<td><input type="radio" name="userRole" id="userRole" value="0" ${user.userRole==0||user.userRole==null?"checked":""}/>普通用户
					<input type="radio" name="userRole" id="userRole" value="1" ${user.userRole==1?"checked":""}/>经理
					<input type="radio" name="userRole" id="userRole" value="2" ${user.userRole==2?"checked":""}/>管理员
					</td>
				</tr>
				</c:when>
				<c:otherwise>
				<input type="hidden"  name="userRole" id="userRole" value="0" />
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
