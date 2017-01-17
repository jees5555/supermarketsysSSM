<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
var xmlhttp;
if (window.XMLHttpRequest){
  xmlhttp=new XMLHttpRequest();
}else{
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
var billId;
var billMoney;
var productName;
var productNum;
var productInfo;
var providerId;
var payStatus;
function check() {
	var pass=true;
	billId =billMoney=document.getElementById("billId").value;
	billMoney=document.getElementById("billMoney").value;
	productName=document.getElementById("productName").value;
	productNum=document.getElementById("productNum").value;
	productInfo= document.getElementById("productInfo").value;
	providerId=document.getElementById("providerId").value;
	payStatus=document.getElementById("payStatus").value;
	if(billMoney==""){
		document.getElementById("billMoneyMsg").innerHTML="请输入交易金额";
		pass=false;
	}else{
		document.getElementById("billMoneyMsg").innerHTML="";
	}
	if(productName==""){
		document.getElementById("productNameMsg").innerHTML="请输入商品名称";
		pass=false;
	}else{
		document.getElementById("productNameMsg").innerHTML="";
	}
	if(productNum==""){
		document.getElementById("productNumMsg").innerHTML="请输入交易数量";
		pass=false;
	}else{
		document.getElementById("productNumMsg").innerHTML="";
	}
	if(providerId==""){
		document.getElementById("providerIdMsg").innerHTML="请选择供应商";
		pass=false;
	}else{
		document.getElementById("providerIdMsg").innerHTML="";
	}
	if(pass){
		xmlhttp.open("POST", "billAddOrUpdate", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		if(billId==""){
			xmlhttp.send("billMoney="+billMoney+"&productName="+productName+"&productNum="+productNum
					+"&productInfo="+productInfo+"&providerId="+providerId+"&payStatus="+payStatus);
			xmlhttp.onreadystatechange=function(){
				  if (xmlhttp.readyState==4 && xmlhttp.status==200){
					    var text=xmlhttp.responseText;
					    if(text=="success"){
					    	alert("添加成功");
					    }else{
					    	alert("添加失败");
					    }
					    location.href("billList");
					  }
			}
		}else{
			xmlhttp.send("billId="+billId+"&billMoney="+billMoney+"&productName="+productName+"&productNum="+productNum
					+"&productInfo="+productInfo+"&providerId="+providerId+"&payStatus="+payStatus);
			xmlhttp.onreadystatechange=function(){
			   if (xmlhttp.readyState==4 && xmlhttp.status==200){
				    var text=xmlhttp.responseText;
				    if(text=="success"){
				    	alert("修改成功");
				    }else{
				    	alert("修改失败");
				    }
				    location.href("billList");
				  }
			 }
		}
        
	}
}		
	
function del(id) {
	var con=confirm("确认删除id为"+id+"的账单吗？");
	if(con){
		xmlhttp.open("GET","billDelete?billId="+id,true);
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
		  if (xmlhttp.readyState==4 && xmlhttp.status==200){
		    var text=xmlhttp.responseText;
		    if(text=="success"){
		    	alert("删除成功");
		    }else{
		    	alert("删除失败");
		    }
		    location.href("billList");
		  }
		 }
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
			<input type="hidden" id="billId" name="billId"
				value="${bill.billId }" />
			<div class="content">
				<table class="box">
					<tr>
						<td class="field">交易金额：</td>
						<td><input id="billMoney" type="text" name="billMoney"
							class="text" value="${bill.billMoney }" /> 
							<font color="red">*</font>
							<font id="billMoneyMsg" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">商品名称：</td>
						<td><input id="productName" type="text" name="productName"
							class="text" value="${bill.productName }" />
							<font color="red">*</font>
							<font id="productNameMsg" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">交易数量：</td>
						<td><input id="productNum" type="text" name="productNum"
							class="text" value="${bill.productNum }" />
							<font color="red">*</font>
							<font id="productNumMsg" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">商品描述：</td>
						<td><textarea name="productInfo" id="productInfo">${bill.productInfo }</textarea></td>
					</tr>
					<tr>
						<td class="field">所属供应商：</td>
						<td><select name="providerId" id="providerId">
								<option value="">请选择</option>
								<c:forEach items="${providerList }" var="provider"
									varStatus="vs">
									<option value="${provider.providerId }"
										${provider.providerId==bill.providerId?"selected":"" }>${provider.providerName }</option>
								</c:forEach>
						</select>
						<font color="red">*</font>
						<font id="providerIdMsg" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">是否付款：</td>
						<td><select name="payStatus" id="payStatus">
								<option value="0" ${bill.payStatus==0?"selected":""}>否</option>
								<option value="1" ${bill.payStatus==1?"selected":""}>是</option>
						</select></td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<c:choose>
					<c:when test="${bill.billId==null }">
						<input type="button" onclick="check();" value="添加"
							class="input-button" />
					</c:when>
					<c:otherwise>
						<input type="button" onclick="check();" value="修改"
							class="input-button" />
						<input type="button" onclick="del(${bill.billId});" value="删除"
							class="input-button" />
					</c:otherwise>
				</c:choose>
				<input type="button" value="返回" class="input-button"
					onclick="history.back();" />
			</div>
		</form>
	</div>
</body>
</html>