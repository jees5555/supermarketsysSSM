<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript">
var totalPage=${page.totalPage};
var currPage=${page.currPage};
function gofirst(){
	if(currPage==1){
		alert("已经在首页");
	}else{
		document.getElementById("page").value= 1;
		document.getElementById("userform").submit();
	}
}
function goforward(){
	if(currPage==1){
		alert("已经在首页");
	}else{
		document.getElementById("page").value= currPage-1;
		document.getElementById("userform").submit();
	}
}
function gonext(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= currPage+1;
		document.getElementById("userform").submit();
	}
}
function golast(){
	if(currPage>=totalPage){
		alert("已达到末页");
	}else{
		document.getElementById("page").value= totalPage;
		document.getElementById("userform").submit();
	}
}

function goany(){
	var toPage =document.getElementById("page").value;
	if(toPage<=0||toPage>totalPage){
		alert("没有这一页");
		document.getElementById("page").value=currPage;
	}else{
		document.getElementById("userform").submit();
	}
}

function changeItemsPerPage() {
	document.getElementById("page").value= 1;
	document.getElementById("userform").submit();
}
function search() {
	document.getElementById("page").value= 1;
	document.getElementById("userform").submit();
}
</script>
</head>
<body>
    <form id="userform" method="post" action="userList">
	<div class="menu">
	<table  width="860px"><tbody>
		<tr><td>
			用户名称：<input name="userName" class="input-text" type="text" value="${requestScope.userName==null?'':userName }">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="查询" class="button" />
		</td></tr>
		</tbody></table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" class="input-button"
				onclick="window.location='toUserAdd'" type="button"></em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<tbody>
					<tr>
						<td width="70" height="29"><div class="STYLE1" align="center">编号</div></td>
						<td width="80"><div class="STYLE1" align="center">用户名称</div></td>
						<td width="100"><div class="STYLE1" align="center">性别</div></td>
						<td width="100"><div class="STYLE1" align="center">年龄</div></td>
						<td width="150"><div class="STYLE1" align="center">电话</div></td>
						<td width="150"><div class="STYLE1" align="center">地址</div></td>
						<td width="150"><div class="STYLE1" align="center">权限</div></td>
					</tr>
                     <c:forEach items="${userList }" var="user" varStatus="vs">
					<tr>
						<td height="23"><span class="STYLE1">${user.userId }</span></td>
						<td><span class="STYLE1"><a href="toUserUpdate?userId=${user.userId }">${user.userName }</a></span></td>
						<td><span class="STYLE1">${user.userSex==0?"女":"男"}</span></td>
						<td><span class="STYLE1">${user.userAge==0?"":user.userAge}</span></td>
						<td><span class="STYLE1">${user.userTel==0?"":user.userTel}</span></td>
						<td><span class="STYLE1">${user.userAddress }</span></td>
						<td><span class="STYLE1">
						<c:choose>
						<c:when test="${user.userRole==0 }">
						普通用户
						</c:when>
						<c:when test="${user.userRole==1 }">
						经理
						</c:when>
						<c:otherwise>
						管理员
						</c:otherwise>
						</c:choose>
						 </span></td>

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