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
function check() {
	var pass=true;
	if(document.getElementById("b").value==""){
		document.getElementById("bb").innerHTML="请输入供应商名称";
		pass=false;
	}else{
		document.getElementById("bb").innerHTML="";
	}
	if(pass){
		if(document.getElementById("a").value==""){
			alert("添加成功");
		}else{
			alert("修改成功");
		}
		document.getElementById("form1").submit();
 }
}

function del(id) {
	var con=confirm("确认删除id为"+id+"的供应商吗？");
	if(con){
		alert("删除成功");
		location.href("providerDelete?providerId="+id);
	}
}
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">供应商管理&gt;&gt;</div>
	</div>
	
	<form id="form1" name="form1" method="post" action="providerAddOrUpdate" onsubmit="return checkit();">
		<input id="a" name="providerId" value="${provider.providerId }" type="hidden" />
		<div class="content">
		<font color="red"></font>
			<table class="box" >
			<tbody>
				<tr>
					<td class="field">供应商名称：</td>
					<td><input name="providerName" id="b" class="text" type="text" value="${provider.providerName }"/> 
					<font color="red">*</font><font id="bb" color="red"></font></td>
				</tr>
			 <tr>
					<td class="field">供应商描述：</td>
					<td><textarea name="providerInfo" id="textarea" cols="45" rows="5">${provider.providerInfo }</textarea></td>
				</tr>
				<tr>
					<td class="field">供应商联系人：</td>
					<td><input name="providerAtten" id="textfield2" class="text" type="text" 
					value="${provider.providerAtten }"/></td>
				</tr>
				<tr>
					<td class="field">供应商电话：</td>
					<td><input name="providerTel" id="textfield2" class="text" type="text" 
					value="${provider.providerTel }"/></td>
				</tr>
				<tr>
					<td class="field">供应商传真：</td>

					<td><input name="providerFax" id="textfield2" class="text" type="text" 
					value="${provider.providerFax }"/></td>
				</tr>
				<tr>
					<td class="field">供应商地址：</td>
					<td><input name="providerAddress" id="textfield2" class="text" type="text" value="${provider.providerAddress }"/></td>
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
