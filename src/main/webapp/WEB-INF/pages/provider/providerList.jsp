<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="menu">
		<table><tbody>
		<tr><td><form method="post" action="providerList">
							<input name="flag" value="search" type="hidden" /> 供应商名称：<input
								name="providerName"
								value="${providerName }"
								class="input-text" type="text" /> &nbsp;&nbsp;&nbsp;&nbsp;
							供应商描述：<input name="providerInfo"
								value="${providerInfo }"
								class="input-text" type="text" />&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" name="submit" value="组合查询" class="button" />
						</form></td></tr>
			</tbody></table>
	</div>
	<div class="main">
		<div class="optitle clearfix">
			<em><input value="添加数据" class="input-button"
				onclick="window.location='toProviderAdd'" type="button" /></em>
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
					<c:forEach items="${providerList }" var="provider" varStatus="vs">
					<tr>
						<td height="23"><span class="STYLE1">${provider.providerId }</span></td>
						<td><span class="STYLE1"><a
							href="toProviderUpdate?providerId=${provider.providerId }">${provider.providerName }</a></span></td>
						<td><span class="STYLE1">${provider.providerInfo }</span></td>
						<td><span class="STYLE1">${provider.providerAtten }</span></td>
						<td><span class="STYLE1">${provider.providerTel==0?"": provider.providerTel }</span></td>
						<td><span class="STYLE1">${provider.providerAddress }</span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>