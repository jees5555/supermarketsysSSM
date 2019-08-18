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
		<table width="1200px"><tbody>
		<tr><td>${displaykey['supplier.suppliername']}：<input name="supplierName" 
		                value="${supplierName }" class="input-text" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;
				${displaykey['supplier.supplierinfo']}：<input name="supplierInfo" value="${supplierInfo }"
						class="input-text" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="${displaykey['common.combinedsearch']}" class="button" onclick="search()"/>
						</td></tr>
			</tbody></table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="${displaykey['common.adddata']}" class="input-button"
				onclick="window.location='toSupplierAdd'" type="button" /></em>
			<div class="title">${displaykey['supplier.title']}&gt;&gt;</div>
		</div>

		<div class="content">
			<table class="list">
				<tbody>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">${displaykey['supplier.supplierid']}</div></td>
						<td width="80"><div class="STYLE1" align="center">${displaykey['supplier.suppliername']}</div></td>
						<td width="100"><div class="STYLE1" align="center">${displaykey['supplier.supplierinfo']}</div></td>
						<td width="100"><div class="STYLE1" align="center">${displaykey['supplier.supplieratten']}</div></td>
						<td width="100"><div class="STYLE1" align="center">${displaykey['supplier.suppliertel']}</div></td>
						<td width="100"><div class="STYLE1" align="center">${displaykey['supplier.supplierfax']}</div></td>
						<td width="100"><div class="STYLE1" align="center">${displaykey['supplier.supplieraddress']}</div></td>
					</tr>
					<c:forEach items="${supplierList }" var="supplier" varStatus="vs">
					<tr>
						<td height="23"><span class="STYLE1">${supplier.supplierId }</span></td>
						<td><span class="STYLE1"><a
							href="toSupplierUpdate?supplierId=${supplier.supplierId }">${supplier.supplierName }</a></span></td>
						<td><span class="STYLE1">${supplier.supplierInfo }</span></td>
						<td><span class="STYLE1">${supplier.supplierAtten }</span></td>
						<td><span class="STYLE1">${supplier.supplierTel==0?"": supplier.supplierTel }</span></td>
						<td><span class="STYLE1">${supplier.supplierFax==0?"": supplier.supplierFax }</span></td>
						<td><span class="STYLE1">${supplier.supplierAddress }</span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
   <div class ="menu">
   <table  width="1200px"><tbody><tr><td>
	<input type="button" name="first" value="${displaykey['common.toppage']}" class="button" onclick="gofirst()"/>
	<input type="button" name="forward" value="${displaykey['common.previouspage']}" class="button" onclick="goforward()"/>
	<input type="button" name="next" value="${displaykey['common.nextpage']}" class="button" onclick="gonext()"/>
	<input type="button" name="last" value="${displaykey['common.lastpage']}" class="button" onclick="golast()"/>
	&nbsp;${displaykey['common.currpage']}:${page.currPage}，${displaykey['common.totalpage']}:${page.totalPage}&nbsp;
	<input type ="text" id="page" name="currPage" value="${page.currPage}" class="input-text" style="width:30px"/>
	<input type="button" name="any" value="${displaykey['common.go']}" class="button" onclick="goany()"/>
	${displaykey['common.itemsperpage']}:
	<select id="itemsPerPage" name="itemsPerPage" class="input-text" onchange="changeItemsPerPage()">
	<option value="5" ${page.itemsPerPage==5?'selected':''}>5</option>
	<option value="10" ${page.itemsPerPage==10?'selected':''}>10</option>
	<option value="20" ${page.itemsPerPage==20?'selected':''}>20</option>
	</select>&nbsp;
	</td></tr></tbody></table>
	</div>
	</form>
</body>
</html>