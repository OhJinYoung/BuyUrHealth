<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, order.model.vo.*"%>
<%
Order order = (Order) request.getAttribute("order");
ArrayList<OrderDetail> olist = (ArrayList) request.getAttribute("olist");
int price = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
<body>
	<table>
		<tr>
			<td>주문번호</td>
			<td><%=order.getNo()%></td>
		</tr>
		<tr>
			<td>주문자</td>
			<td><%=order.getUserName()%> (<%=order.getUserId()%>)</td>
		</tr>
		<tr>
			<td>주문상태</td>
			<td><%=order.getState()%></td>
		</tr>
		<tr>
			<td>결제방법</td>
			<td><%=order.getPayment()%></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>상품명</td>
			<td>가격</td>
			<td>수량</td>
			<td>합계</td>
		</tr>
		<%
		for (OrderDetail od : olist) {
			int sum = od.getPrice() * od.getVolume();
			price += sum;
		%>
		<tr>
			<td><%=od.getProductName()%></td>
			<td><%=od.getPrice()%></td>
			<td><%=od.getVolume()%></td>
			<td><%=sum%>
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="3">총합</td>
			<td><%=price%></td>
		</tr>
	</table>
</body>
</html>