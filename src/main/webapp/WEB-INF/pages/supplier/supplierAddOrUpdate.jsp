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
var supplierId;
var supplierName;
var supplierInfo;
var supplierAtten;
var supplierTel;
var supplierFax;
var supplierAddress;

var supplierSkip=${supplierSkip};

function check() {
	var pass=true;
	supplierId=document.getElementById("supplierId").value;
	supplierName=document.getElementById("supplierName").value;
	supplierInfo=document.getElementById("supplierInfo").value;
	supplierAtten=document.getElementById("supplierAtten").value;
	supplierTel=document.getElementById("supplierTel").value;
	supplierFax=document.getElementById("supplierFax").value;
	supplierAddress=document.getElementById("supplierAddress").value;
	if(supplierName==""){
		document.getElementById("supplierNameMsg").innerHTML="请输入供应商名称";
		pass=false;
	}else{
		document.getElementById("supplierNameMsg").innerHTML="";
	}
	if(pass){
		xmlhttp.open("POST", "supplierAddOrUpdate", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		if(supplierId==""){
			xmlhttp.send("supplierName="+supplierName+"&supplierInfo="+supplierInfo+"&supplierAtten="+supplierAtten
					+"&supplierTel="+supplierTel+"&supplierFax="+supplierFax+"&supplierAddress="+supplierAddress);
			xmlhttp.onreadystatechange=function(){
				  if (xmlhttp.readyState==4 && xmlhttp.status==200){
					    var text=xmlhttp.responseText;
					    if(text=="success"){
					    	alert("添加成功");
					    }else{
					    	alert("添加失败");
					    }
					    if(supplierSkip){
					    	 location.href="toSupplierAdd";
					    }else{
					    	location.href="supplierList";
					    }
					  }
			}
		}else{
			xmlhttp.send("supplierId="+supplierId+"&supplierName="+supplierName+"&supplierInfo="+supplierInfo+"&supplierAtten="+supplierAtten
					+"&supplierTel="+supplierTel+"&supplierFax="+supplierFax+"&supplierAddress="+supplierAddress);
			xmlhttp.onreadystatechange=function(){
			   if (xmlhttp.readyState==4 && xmlhttp.status==200){
				    var text=xmlhttp.responseText;
				    if(text=="success"){
				    	alert("修改成功");
				    }else{
				    	alert("修改失败");
				    }
				    location.href="supplierList";
				  }
			 }
		}
        
 }
}

function del(id) {
	var con=confirm("确认删除id为"+id+"的供应商吗？");
	if(con){
		xmlhttp.open("GET","supplierDelete?supplierId="+id,true);
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
		  if (xmlhttp.readyState==4 && xmlhttp.status==200){
		    var text=xmlhttp.responseText;
		    if(text=="success"){
		    	alert("删除成功");
		    }else{
		    	alert("删除失败");
		    }
		    location.href="supplierList";
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
	
	<form id="supplierform" method="post" action="supplierAddOrUpdate">
		<input id="supplierId" name="supplierId" value="${supplier.supplierId }" type="hidden" />
		<div class="content">
		<font color="red"></font>
			<table class="box" >
			<tbody>
				<tr>
					<td class="field">供应商名称：</td>
					<td><input name="supplierName" id="supplierName" class="text" type="text" value="${supplier.supplierName }"/> 
					<font color="red">*</font>
					<font id="supplierNameMsg" color="red"></font></td>
				</tr>
			 <tr>
					<td class="field">供应商描述：</td>
					<td><textarea name="supplierInfo" id="supplierInfo" cols="45" rows="5">${supplier.supplierInfo }</textarea></td>
				</tr>
				<tr>
					<td class="field">供应商联系人：</td>
					<td><input name="supplierAtten" id="supplierAtten" class="text" type="text" 
					value="${supplier.supplierAtten }"/></td>
				</tr>
				<tr>
					<td class="field">供应商电话：</td>
					<td><input name="supplierTel" id="supplierTel" class="text" type="text" 
					value="${supplier.supplierTel }"/></td>
				</tr>
				<tr>
					<td class="field">供应商传真：</td>

					<td><input name="supplierFax" id="supplierFax" class="text" type="text" 
					value="${supplier.supplierFax }"/></td>
				</tr>
				<tr>
					<td class="field">供应商地址：</td>
					<td><input name="supplierAddress" id="supplierAddress" class="text" type="text" value="${supplier.supplierAddress }"/></td>
				</tr>
			</tbody></table>
		</div>

		<div class="buttons">
		     <c:choose>
		     <c:when test="${supplier.supplierId==null }">
		     <input name="button"  value="提交" class="input-button" type="button" onclick="check();"/> 
		     </c:when>
			<c:otherwise>
			 <input name="button"  value="修改" class="input-button" type="button" onclick="check();"/> 
			<input type="button" onclick="del(${supplier.supplierId});" value="删除" class="input-button" />
			</c:otherwise>
			</c:choose>
			<input name="button"  onclick="history.back();" value="返回" class="input-button" type="button" /> 
		</div>
     </form>
</div>
</body>
</html>
