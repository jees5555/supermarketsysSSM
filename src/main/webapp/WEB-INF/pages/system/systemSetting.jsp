<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" >
</script>
</head>
<body>
<div class="main">
	<div class="optitle clearfix">
		<div class="title">系统设置&gt;&gt;</div>

	</div>
	<form id="systemform" method="post" action="saveSetting">
		<div class="content">
			<table class="box">
			<tr><td>&nbsp;&nbsp;添加帐单列表完成后直接添加下一个</td>
			<td><input type="checkbox" name="billSkip"/></td></tr>
			<tr><td>&nbsp;&nbsp;帐单列表每页显示条数&nbsp;</td>
	              <td><select id="billItemsPerPage" name="billItemsPerPage" class="input-text" onchange="changeItemsPerPage()">
	              <option value="5" ${page.itemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${page.itemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${page.itemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
            <c:if test="${sessionScope.userRole!=0}">
			<tr><td>&nbsp;&nbsp;添加供应商列表完成后直接添加下一个</td>
			<td><input type="checkbox" name="supplierSkip"/></td></tr>
			<tr><td>&nbsp;&nbsp;供应商列表每页显示条数&nbsp;</td>
	              <td><select id="supplierItemsPerPage" name="supplierItemsPerPage" class="input-text">
	              <option value="5" ${page.itemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${page.itemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${page.itemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			<tr><td>&nbsp;&nbsp;添加用户列表完成后直接添加下一个</td>
			<td><input type="checkbox" name="userSkip"/>&nbsp;&nbsp;</td></tr>
			<tr><td>&nbsp;&nbsp;用户列表每页显示条数&nbsp;</td>
	              <td><select id="userItemsPerPage" name="userItemsPerPage" class="input-text">
	              <option value="5" ${page.itemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${page.itemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${page.itemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			</c:if>	
			</table>
		</div>
		<div class="buttons">
			<input type="submit" value="修改" class="input-button"/>
			<input type="reset" name="res"  value="重置" class="input-button"/> 
			<input type="button" onclick="def()" value="恢复默认" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
