<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
var totalPage=${page.totalPage};
var currPage=${page.currPage};
function gofirst(){
	if(currPage==1){
		alert("已经在首页");
	}else{
		document.getElementById("page").value= 1;
		document.getElementById("billform").submit();
	}
}
function goforward(){
	if(currPage==1){
		alert("已经在首页");
	}else{
		document.getElementById("page").value= currPage-1;
		document.getElementById("billform").submit();
	}
}
function gonext(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= currPage+1;
		document.getElementById("billform").submit();
	}
}
function golast(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= totalPage;
		document.getElementById("billform").submit();
	}
}

function goany(){
	var toPage =document.getElementById("page").value;
	if(toPage<=0||toPage>totalPage){
		alert("没有这一页");
		document.getElementById("page").value=currPage;
	}else{
		document.getElementById("billform").submit();
	}
}

function changeItemsPerPage() {
	document.getElementById("billform").submit();
}
function search() {
	document.getElementById("page").value= 1;
	document.getElementById("billform").submit();
}
</script>
</head>
<body>
<form id="billform" method="get" action="billList">
	<div class="menu">
	<table><tbody>
	<tr><td>商品名称：<input type="text" name="productName"
				value="${productName==null?'':productName }" class="input-text" />&nbsp;&nbsp;&nbsp;&nbsp;
			是否付款：<select name="payStatus" class="input-text">
				<option value=""
					${payStatus==null?'selected':''}>请选择</option>
				<option value="1"
					${payStatus==1?'selected':''}>已付款</option>
				<option value="0"
					${payStatus==0?'selected':''}>未付款</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="button" value="组合查询" class="button" onclick="search()"/>
		</td></tr>
		</tbody></table>
	</div>
	<div class="main">
	<div class="optitle clearfix">
		<em><input type="button" name="button" value="添加数据" class="input-button" 
		onclick="location.href='toBillAdd'" /></em>
		<div class="title">账单管理&gt;&gt;</div>
	</div>
	<div class="content">
		<table class="list">
		<tbody>
			<tr>
				<td height="29"><div class="STYLE1" align="center">账单编号</div></td>
				<td><div class="STYLE1" align="center">商品名称</div></td>
				<td><div class="STYLE1" align="center">商品数量</div></td>
				<td><div class="STYLE1" align="center">交易金额</div></td>
				<td><div class="STYLE1" align="center">是否付款</div></td>
				<td><div class="STYLE1" align="center">供应商名称</div></td>
				<td><div class="STYLE1" align="center">商品描述</div></td>
				<td><div class="STYLE1" align="center">账单时间</div></td>
			</tr>
			<c:forEach items="${billList }" var="bill" varStatus="vs">
			<tr>
				<td height="23"><span class="STYLE1">${bill.billId }</span></td>
				<td><span class="STYLE1"><a href="toBillUpdate?billId=${bill.billId }">${bill.productName }</a></span></td>
				<td><span class="STYLE1">${bill.productNum }</span></td>
				<td><span class="STYLE1">${bill.billMoney }</span></td>
				<td><span class="STYLE1">${bill.payStatus==0?"未付款":"已付款" }</span></td>
				<td><span class="STYLE1">${bill.providerName }</span></td>
				<td><span class="STYLE1">${bill.productInfo }</span></td>
				<td><span class="STYLE1">${bill.formatBillTime }</span></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
  </div>
  <div class ="menu">
  <table><tbody><tr><td>
	<input type="button" name="first" value="首页" class="button" onclick="gofirst()"/>
	<input type="button" name="forward" value="上一页" class="button" onclick="goforward()"/>
	<input type="button" name="next" value="下一页" class="button" onclick="gonext()"/>
	<input type="button" name="last" value="末页" class="button" onclick="golast()"/>
	&nbsp;当前第${page.currPage}页，共${page.totalPage}页&nbsp;
	<input type ="text" id="page" name="currPage" value="${page.currPage}" class="input-text" style="width:30px"/>
	<input type="button" name="any" value="跳转" class="button" onclick="goany()"/>
	每页显示&nbsp;
	<select id="itemsPerPage" name="itemsPerPage" class="input-text" onchange="changeItemsPerPage()">
	<option value="5" ${page.itemsPerPage==5?'selected':''}>5</option>
	<option value="10" ${page.itemsPerPage==10?'selected':''}>10</option>
	<option value="20" ${page.itemsPerPage==20?'selected':''}>20</option>
	</select>&nbsp;条
	</td></tr></tbody></table>
	</div>
	</form>
</body>
</html>
