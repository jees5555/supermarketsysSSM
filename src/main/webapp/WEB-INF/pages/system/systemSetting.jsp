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
var language;

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
	language=document.getElementById("language").value;
    xmlhttp.open("POST", "saveSetting", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	if(adminPermission){
		xmlhttp.send("billSkip="+billSkip+"&billItemsPerPage="+billItemsPerPage+"&supplierSkip="+supplierSkip
					+"&supplierItemsPerPage="+supplierItemsPerPage+"&userSkip="+userSkip+"&userItemsPerPage="+userItemsPerPage+"&language="+language);
		xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4 && xmlhttp.status==200){
					  var text=xmlhttp.responseText;
					  if(text=="success"){
					     alert("${displaykey['common.modifiedsuccess']}");
					  }else{
					     alert("${displaykey['common.modifiedfail']}");
					  }
					  window.parent.leftFrame.location.href="${pageContext.request.contextPath}/showLeft";
					  window.parent.topFrame.location.href="${pageContext.request.contextPath}/showTop";
					  location.href="toSystemSetting";
					}
	    }
	 }else{
	 xmlhttp.send("billSkip="+billSkip+"&billItemsPerPage="+billItemsPerPage+"&language="+language);
	 xmlhttp.onreadystatechange=function(){
		 if (xmlhttp.readyState==4 && xmlhttp.status==200){
			var text=xmlhttp.responseText;
				 if(text=="success"){
				    alert("${displaykey['common.modifiedsuccess']}");
				   }else{
				    alert("${displaykey['common.modifiedfail']}");
				   }
				 window.parent.leftFrame.location.href="${pageContext.request.contextPath}/showLeft";
				  window.parent.topFrame.location.href="${pageContext.request.contextPath}/showTop";
				 location.href="toSystemSetting";
			 }
		}
 }
}
function def(){
	var isdef=confirm("${displaykey['systemsetting.todefault']}");
	if(isdef){
	xmlhttp.open("POST", "defaultSetting", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send();
		xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4 && xmlhttp.status==200){
					  var text=xmlhttp.responseText;
					  if(text=="success"){
					     alert("${displaykey['common.todefaultsuccess']}");
					  }else{
					     alert("${displaykey['common.todefaultfail']}");
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
		<div class="title">${displaykey['systemsetting.title']}&gt;&gt;</div>

	</div>
	<form id="systemform" method="post" action="saveSetting">
		<div class="content">
			<table class="box">
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.billtonext']}</td>
			<td><input  id="billSkip" type="checkbox" name="billSkip" ${billSkip =="true"?"checked='checked'":"" }/></td></tr>
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.billperpage']}&nbsp;</td>
	              <td><select id="billItemsPerPage" name="billItemsPerPage" class="input-text">
	              <option value="5" ${billItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${billItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${billItemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
            <c:if test="${sessionScope.userRole!=0}">
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.suppliertonext']}</td>
			<td><input id="supplierSkip" type="checkbox" name="supplierSkip" ${supplierSkip =="true"?"checked='checked'":"" }/></td></tr>
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.supplierperpage']}&nbsp;</td>
	              <td><select id="supplierItemsPerPage" name="supplierItemsPerPage" class="input-text">
	              <option value="5" ${supplierItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${supplierItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${supplierItemsPerPagee==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.usertonext']}</td>
			<td><input id="userSkip" type="checkbox" name="userSkip"  ${userSkip =="true"?"checked='checked'":"" }/>&nbsp;&nbsp;</td></tr>
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.userperpage']}&nbsp;</td>
	              <td><select id="userItemsPerPage" name="userItemsPerPage" class="input-text">
	              <option value="5" ${userItemsPerPage==5?'selected':''}>5</option>
	              <option value="10" ${userItemsPerPage==10?'selected':''}>10</option>
	              <option value="20" ${userItemsPerPage==20?'selected':''}>20</option>
	              </select>
	        </td></tr>
			</c:if>
			<tr><td>&nbsp;&nbsp;${displaykey['systemsetting.language']}&nbsp;</td>
	              <td><select id="language" name="language">
			    <option value="en-us" ${language=='en-us'?"selected='selected'":"" }>English</option>
			    <option value="ja-jp" ${language=='ja-jp'?"selected='selected'":"" }>日本語</option>
			    <option value="zh-cn" ${language=='zh-cn'?"selected='selected'":"" }>简体中文</option>
			    </select>
	        </td></tr>	
			</table>
		</div>
		<div class="buttons">
			<input type="button" onclick="sub()" value="${displaykey['common.modify']}" class="input-button"/>
			<input type="reset" name="res"  value="${displaykey['common.reset']}" class="input-button"/> 
			<input type="button" onclick="def()" value="${displaykey['common.default']}" class="input-button"/> 
		</div>

	</form>
</div>
</body>
</html>
