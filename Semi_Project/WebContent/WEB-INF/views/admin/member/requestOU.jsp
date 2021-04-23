<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.RequestOrder"%>
<%
System.out.println("?????");
RequestOrder req = (RequestOrder) request.getAttribute("req");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUH</title>
</head>
<body>
	<h3>[<%=req.getType() %>] 요청서</h3>
	<table>
		<tr>
			<td>주문번호</td>
			<td><%=req.getOrderNo() %></td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td><%=req.getPayment() %></td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td><%=req.getPrice() %></td>
		</tr>
		<tr>
			<td>주문상태</td>
			<td><%=req.getState() %></td>
		</tr>
		<tr>
			<td>요청타입</td>
			<td><%=req.getType() %></td>
		</tr>
		<tr>
			<td>사유</td>
			<td><%=req.getInfo() %></td>
		</tr>
		<tr>
			<td>요청일</td>
			<td><%=req.getDate() %></td>
		</tr>
	</table>
</body>
</html>