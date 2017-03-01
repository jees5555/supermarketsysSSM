<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		document.getElementById("supplierform").submit();
	}
}
function goforward(){
	if(currPage==1){
		alert("已经在首页");
	}else{
		document.getElementById("page").value= currPage-1;
		document.getElementById("supplierform").submit();
	}
}
function gonext(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= currPage+1;
		document.getElementById("supplierform").submit();
	}
}
function golast(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= totalPage;
		document.getElementById("supplierform").submit();
	}
}

function goany(){
	var toPage =document.getElementById("page").value;
	if(toPage<=0||toPage>totalPage){
		alert("没有这一页");
		document.getElementById("page").value=currPage;
	}else{
		document.getElementById("supplierform").submit();
	}
}

function changeItemsPerPage() {
	document.getElementById("page").value= 1;
	document.getElementById("supplierform").submit();
}
function search() {
	document.getElementById("page").value= 1;
	document.getElementById("supplierform").submit();
}
</script>
</head>
<body>
<form id="supplierform" method="post" action="supplierList">
	<div class="menu">
		<table width="860px"><tbody>
		<tr><td>供应商名称：<input name="supplierName" 
		                value="${supplierName }" class="input-text" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;
				供应商描述：<input name="supplierInfo" value="${supplierInfo }"
						class="input-text" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="组合查询" class="button" onclick="search()"/>
						</td></tr>
			</tbody></table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" class="input-button"
				onclick="window.location='toSupplierAdd'" type="button" /></em>
			<div class="title">供应商管理&gt;&gt;</div>
		</div>

		<div class="content">
			<table class="list">
				<tbody>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
						<td width="80"><div class="STYLE1" align="center">供应商名称</div></td>
						<td width="100"><div class="STYLE1" align="center">供应商描述</div></td>
						<td width="100"><div class="STYLE1" align="center">联系人</div></td>
						<td width="100"><div class="STYLE1" align="center">电话</div></td>
						<td width="100"><div class="STYLE1" align="center">地址</div></td>
					</tr>
					<c:forEach items="${supplierList }" var="supplier" varStatus="vs">
					<tr>
						<td height="23"><span class="STYLE1">${supplier.supplierId }</span></td>
						<td><span class="STYLE1"><a
							href="toSupplierUpdate?supplierId=${supplier.supplierId }">${supplier.supplierName }</a></span></td>
						<td><span class="STYLE1">${supplier.supplierInfo }</span></td>
						<td><span class="STYLE1">${supplier.supplierAtten }</span></td>
						<td><span class="STYLE1">${supplier.supplierTel==0?"": supplier.supplierTel }</span></td>
						<td><span class="STYLE1">${supplier.supplierAddress }</span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
   <div class ="menu">
  <table  width="860px"><tbody><tr><td>
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