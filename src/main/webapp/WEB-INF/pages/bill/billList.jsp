<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<tr><td><form method="get" action="billList">
			商品名称：<input type="text" name="productName"
				value="${productName==null?'':productName }" class="input-text" />&nbsp;&nbsp;&nbsp;&nbsp;
			是否付款：<select name="payStatus">
				<option value=""
					${payStatus==null?'selected':''}>请选择</option>
				<option value="1"
					${payStatus==1?'selected':''}>已付款</option>
				<option value="0"
					${payStatus==0?'selected':''}>未付款</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="submit"
				value="组合查询" class="button" />
		</form></td></tr>
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
</body>
</html>
