<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
var providerId;
var providerName;
var providerInfo;
var providerAtten;
var providerTel;
var providerFax;
var providerAddress;

function check() {
	var pass=true;
	providerId=document.getElementById("providerId").value;
	providerName=document.getElementById("providerName").value;
	providerInfo=document.getElementById("providerInfo").value;
	providerAtten=document.getElementById("providerAtten").value;
	providerTel=document.getElementById("providerTel").value;
	providerFax=document.getElementById("providerFax").value;
	providerAddress=document.getElementById("providerAddress").value;
	if(providerName==""){
		document.getElementById("providerNameMsg").innerHTML="请输入供应商名称";
		pass=false;
	}else{
		document.getElementById("providerNameMsg").innerHTML="";
	}
	if(pass){
		xmlhttp.open("POST", "providerAddOrUpdate", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		if(providerId==""){
			xmlhttp.send("providerName="+providerName+"&providerInfo="+providerInfo+"&providerAtten="+providerAtten
					+"&providerTel="+providerTel+"&providerFax="+providerFax+"&providerAddress="+providerAddress);
			xmlhttp.onreadystatechange=function(){
				  if (xmlhttp.readyState==4 && xmlhttp.status==200){
					    var text=xmlhttp.responseText;
					    if(text=="success"){
					    	alert("添加成功");
					    }else{
					    	alert("添加失败");
					    }
					    location.href="providerList";
					  }
			}
		}else{
			xmlhttp.send("providerId="+providerId+"&providerName="+providerName+"&providerInfo="+providerInfo+"&providerAtten="+providerAtten
					+"&providerTel="+providerTel+"&providerFax="+providerFax+"&providerAddress="+providerAddress);
			xmlhttp.onreadystatechange=function(){
			   if (xmlhttp.readyState==4 && xmlhttp.status==200){
				    var text=xmlhttp.responseText;
				    if(text=="success"){
				    	alert("修改成功");
				    }else{
				    	alert("修改失败");
				    }
				    location.href="providerList";
				  }
			 }
		}
        
 }
}

function del(id) {
	var con=confirm("确认删除id为"+id+"的供应商吗？");
	if(con){
		xmlhttp.open("GET","providerDelete?providerId="+id,true);
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
		  if (xmlhttp.readyState==4 && xmlhttp.status==200){
		    var text=xmlhttp.responseText;
		    if(text=="success"){
		    	alert("删除成功");
		    }else{
		    	alert("删除失败");
		    }
		    location.href="providerList";
		  }
		 }
	}
}
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">供应商管理&gt;&gt;</div>
	</div>
	
	<form id="providerform" method="post" action="providerAddOrUpdate">
		<input id="providerId" name="providerId" value="${provider.providerId }" type="hidden" />
		<div class="content">
		<font color="red"></font>
			<table class="box" >
			<tbody>
				<tr>
					<td class="field">供应商名称：</td>
					<td><input name="providerName" id="providerName" class="text" type="text" value="${provider.providerName }"/> 
					<font color="red">*</font>
					<font id="providerNameMsg" color="red"></font></td>
				</tr>
			 <tr>
					<td class="field">供应商描述：</td>
					<td><textarea name="providerInfo" id="providerInfo" cols="45" rows="5">${provider.providerInfo }</textarea></td>
				</tr>
				<tr>
					<td class="field">供应商联系人：</td>
					<td><input name="providerAtten" id="providerAtten" class="text" type="text" 
					value="${provider.providerAtten }"/></td>
				</tr>
				<tr>
					<td class="field">供应商电话：</td>
					<td><input name="providerTel" id="providerTel" class="text" type="text" 
					value="${provider.providerTel }"/></td>
				</tr>
				<tr>
					<td class="field">供应商传真：</td>

					<td><input name="providerFax" id="providerFax" class="text" type="text" 
					value="${provider.providerFax }"/></td>
				</tr>
				<tr>
					<td class="field">供应商地址：</td>
					<td><input name="providerAddress" id="providerAddress" class="text" type="text" value="${provider.providerAddress }"/></td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
		     <c:choose>
		     <c:when test="${provider.providerId==null }">
		     <input name="button"  value="提交" class="input-button" type="button" onclick="check();"/> 
		     </c:when>
			<c:otherwise>
			 <input name="button"  value="修改" class="input-button" type="button" onclick="check();"/> 
			<input type="button" onclick="del(${provider.providerId});" value="删除" class="input-button" />
			</c:otherwise>
			</c:choose>
			<input name="button"  onclick="history.back();" value="返回" class="input-button" type="button" /> 
		</div>
     </form>
</div>
</body>
</html>
