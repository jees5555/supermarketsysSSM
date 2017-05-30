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
	document.getElementById("page").value= 1;
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
	<table width="860px"><tbody>
	<tr><td>${displaykey['bill.productname']}：<input type="text" name="productName"
				value="${productName==null?'':productName }" class="input-text" />&nbsp;&nbsp;&nbsp;&nbsp;
			${displaykey['bill.paystatus']}：<select name="payStatus" class="input-text">
				<option value=""
					${payStatus==null?'selected':''}>${displaykey['common.choose']}</option>
				<option value="1"
					${payStatus==1?'selected':''}>${displaykey['bill.paystatus.yes']}</option>
				<option value="0"
					${payStatus==0?'selected':''}>${displaykey['bill.paystatus.no']}</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="button" value="${displaykey['common.combinedsearch']}" class="button" onclick="search()"/>
		</td></tr>
		</tbody></table>
	</div>
	<div class="main">
	<div class="optitle clearfix">
		<em><input type="button" name="button" value="${displaykey['common.adddata']}" class="input-button" 
		onclick="location.href='toBillAdd'" /></em>
		<div class="title">${displaykey['bill.title']}&gt;&gt;</div>
	</div>
	<div class="content">
		<table class="list">
		<tbody>
			<tr>
				<td height="29"><div class="STYLE1" align="center">${displaykey['bill.billid']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.productname']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.productnum']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.billmoney']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.paystatus']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.suppliername']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.productinfo']}</div></td>
				<td><div class="STYLE1" align="center">${displaykey['bill.billtime']}</div></td>
			</tr>
			<c:forEach items="${billList }" var="bill" varStatus="vs">
			<c:set var="yes" value="${displaykey['bill.paystatus.yes']}"/>
			<c:set var="no" value="${displaykey['bill.paystatus.no']}"/>
			<tr>
				<td height="23"><span class="STYLE1">${bill.billId }</span></td>
				<td><span class="STYLE1"><a href="toBillUpdate?billId=${bill.billId }">${bill.productName }</a></span></td>
				<td><span class="STYLE1">${bill.productNum }</span></td>
				<td><span class="STYLE1">${bill.billMoney }</span></td>
				<td><span class="STYLE1">${bill.payStatus==0?no:yes }</span></td>
				<td><span class="STYLE1">${bill.supplierName }</span></td>
				<td><span class="STYLE1">${bill.productInfo }</span></td>
				<td><span class="STYLE1">${bill.formatBillTime }</span></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
  </div>
  <div class ="menu">
  <table  width="860px"><tbody><tr><td>
	<input type="button" name="first" value="${displaykey['common.toppage']}" class="button" onclick="gofirst()"/>
	<input type="button" name="forward" value="${displaykey['common.previouspage']}" class="button" onclick="goforward()"/>
	<input type="button" name="next" value="${displaykey['common.nextpage']}" class="button" onclick="gonext()"/>
	<input type="button" name="last" value="${displaykey['common.lastpage']}" class="button" onclick="golast()"/>
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
