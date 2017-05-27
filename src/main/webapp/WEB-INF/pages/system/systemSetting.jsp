<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript" >
var xmlhttp;
if (window.XMLHttpRequest){
  xmlhttp=new XMLHttpRequest();
}else{
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
var billSkip;
var billItemsPerPage;
var supplierSkip;
var supplierItemsPerPage;
var userSkip;
var userItemsPerPage;

function sub() {
	var adminPermission =${sessionScope.userRole!=0};
	billSkip=document.getElementById("billSkip").checked;
	billItemsPerPage=document.getElementById("billItemsPerPage").value;
	if(adminPermission){
	supplierSkip=document.getElementById("supplierSkip").checked;
	supplierItemsPerPage=document.getElementById("supplierItemsPerPage").value;
	userSkip=document.getElementById("userSkip").checked;
	userItemsPerPage=document.getElementById("userItemsPerPage").value;
	}
    xmlhttp.open("POST", "saveSetting", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	if(adminPermission){
		xmlhttp.send("billSkip="+billSkip+"&billItemsPerPage="+billItemsPerPage+"&supplierSkip="+supplierSkip
					+"&supplierItemsPerPage="+supplierItemsPerPage+"&userSkip="+userSkip+"&userItemsPerPage="+userItemsPerPage);
		xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4 && xmlhttp.status==200){
					  var text=xmlhttp.responseText;
					  if(text=="success"){
					     alert("${displaykey['systemsetting.modifiedsuccess']}");
					  }else{
					     alert("${displaykey['systemsetting.modifiedfail']}");
					  }
					  location.href="toSystemSetting";
					}
	    }
	 }else{
	 xmlhttp.send("billSkip="+billSkip+"&billItemsPerPage="+billItemsPerPage);
	 xmlhttp.onreadystatechange=function(){
		 if (xmlhttp.readyState==4 && xmlhttp.status==200){
			var text=xmlhttp.responseText;
				 if(text=="success"){
				    alert("${displaykey['systemsetting.modifiedsuccess']}");
				   }else{
				    alert("${displaykey['systemsetting.modifiedfail']}");
				   }
				 location.href="toSystemSetting";
			 }
		}
 }
}
function def(){
	var isdef=confirm("确认要恢复默认设置吗?");
	if(isdef){
	xmlhttp.open("POST", "defaultSetting", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4 && xmlhttp.status==200){
					  var text=xmlhttp.responseText;
					  if(text=="success"){
					     alert("恢复默认成功");
					  }else{
					     alert("恢复默认失败");
					  }
					  location.href="toSystemSetting";
					}
		}
}
}
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
			<td><input  id="billSkip" type="checkbox" name="billSkip" ${billSkip =="true"?"checked='checked'":"" }/></td></tr>
			<tr><td>&nbsp;&nbsp;帐单列表每页显示条数&nbsp;</td>
	              <td><select id="billItemsPerPage" name="billItemsPerPage" class="input-text">
	              <option value="5" ${billItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${billItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${billItemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
            <c:if test="${sessionScope.userRole!=0}">
			<tr><td>&nbsp;&nbsp;添加供应商列表完成后直接添加下一个</td>
			<td><input id="supplierSkip" type="checkbox" name="supplierSkip" ${supplierSkip =="true"?"checked='checked'":"" }/></td></tr>
			<tr><td>&nbsp;&nbsp;供应商列表每页显示条数&nbsp;</td>
	              <td><select id="supplierItemsPerPage" name="supplierItemsPerPage" class="input-text">
	              <option value="5" ${supplierItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${supplierItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${supplierItemsPerPagee==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			<tr><td>&nbsp;&nbsp;添加用户列表完成后直接添加下一个</td>
			<td><input id="userSkip" type="checkbox" name="userSkip"  ${userSkip =="true"?"checked='checked'":"" }/>&nbsp;&nbsp;</td></tr>
			<tr><td>&nbsp;&nbsp;用户列表每页显示条数&nbsp;</td>
	              <td><select id="userItemsPerPage" name="userItemsPerPage" class="input-text">
	              <option value="5" ${userItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${userItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${userItemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			</c:if>	
			</table>
		</div>
		<div class="buttons">
			<input type="button" onclick="sub()" value="修改" class="input-button"/>
			<input type="reset" name="res"  value="重置" class="input-button"/> 
			<input type="button" onclick="def()" value="恢复默认" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
