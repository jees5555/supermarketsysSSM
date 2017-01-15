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
		document.getElementById("bb").innerHTML="请输入交易金额";
		pass=false;
	}else{
		document.getElementById("bb").innerHTML="";
	}
	if(document.getElementById("c").value==""){
		document.getElementById("cc").innerHTML="请输入商品名称";
		pass=false;
	}else{
		document.getElementById("cc").innerHTML="";
	}
	if(document.getElementById("d").value==""){
		document.getElementById("dd").innerHTML="请输入交易数量";
		pass=false;
	}else{
		document.getElementById("dd").innerHTML="";
	}
	if(document.getElementById("e").value==""){
		document.getElementById("ee").innerHTML="请选择供应商";
		pass=false;
	}else{
		document.getElementById("ee").innerHTML="";
	}
	if(pass){
		if(document.getElementById("a").value==""){
			alert("添加成功");
		}else{
			alert("修改成功");
		}
		document.getElementById("billform").submit();
	}
}		
	
function del(id) {
	var con=confirm("确认删除id为"+id+"的账单吗？");
	if(con){
		alert("删除成功");
		location.href("billDelete?billId="+id);
	}
}
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">账单管理&gt;&gt;</div>
	</div>
	<form id="billform" method="post" action="billAddOrUpdate">
	<input  type="hidden" id="a" name="billId" value="${bill.billId }" />
		<div class="content">
			<table class="box">
				<tr>
					<td class="field">交易金额：</td>
					<td><input id="b" type="text" name="billMoney" class="text" value="${bill.billMoney }" /> 
					<font color="red">*</font><font id="bb" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">商品名称：</td>
					<td><input id="c" type="text" name="productName" class="text" value="${bill.productName }"/> 
					<font color="red">*</font><font id="cc" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">交易数量：</td>
					<td><input id="d" type="text" name="productNum" class="text" value="${bill.productNum }"/> 
					<font color="red">*</font><font id="dd" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">商品描述：</td>
					<td><textarea name="productInfo">${bill.productInfo }</textarea></td>
				</tr>
				<tr>
					<td class="field">所属供应商：</td>
					<td><select name="providerId" id="e">
					    <option value="">请选择</option>
					    <c:forEach items="${providerList }" var="provider" varStatus="vs">
						<option value="${provider.providerId }" ${provider.providerId==bill.providerId?"selected":"" }>${provider.providerName }</option>
						</c:forEach>
					</select>
					<font color="red">*</font><font id="ee" color="red"></font></td>
				</tr>
				<tr>
					<td class="field">是否付款：</td>
					<td><select name="payStatus">
					    <option value="0" ${bill.payStatus==0?"selected":""}>否</option>
						<option value="1" ${bill.payStatus==1?"selected":""}>是</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="buttons">
		    <c:choose>
		    <c:when test="${bill.billId==null }">
			<input type="button" onclick="check();" value="添加" class="input-button" />
			</c:when>
			<c:otherwise>
			<input type="button" onclick="check();" value="修改" class="input-button" />
			<input type="button" onclick="del(${bill.billId});" value="删除" class="input-button" />
			</c:otherwise>
			</c:choose>
			<input type="button" value="返回" class="input-button" onclick="history.back();" />
		</div>
	</form>
</div>
</body>
</html>