<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cart.model.vo.UserOrder" %>
<%
	UserOrder order = (UserOrder)request.getAttribute("order");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html, body {
	    height: 100%; 
	    overflow: auto;
	    margin: 0px auto;
	    letter-spacing: -1px;
	    min-width: 1500px;
  		align: center;
  		margin: auto;
	}	
	
	h1{
		color: red;
		padding-top: 50px;
	}
	
	table{
  		margin: auto;
		width: 80%;
		border : 1px solid black;
  		border-collapse : collapse;
  		cellpadding: 10px;
  		margin-bottom: 50px;
  		align: center;
	}
	
	th{
		width: 30%;
		padding: 10px;
		background: lightgray;
	}
	
	td{
		width: 70%;
		padding: 10px;
	}
	
	#goMain{
		background: lightgray;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
	}
	
	#goOrderDetail{
		background: #FFC83D;
    	border: 1px solid #FFC83D;
    	color: red;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
	}
	
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
		<h1 align="center">주문이 완료 되었습니다!</h1>
	<form>
		
		<table border="1" align="center">
			<tr>
				<th>주문하신 분</th>
				<td><%= order.getUserName() %></td>
			</tr>
			<tr>
				<th>받는분</th>
				<td><%= order.getName() %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%= order.getAddress() %></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><%= order.getPhone() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%= order.getEmail() %></td>
			</tr>
			<tr>
				<th>결제 수단</th>
				<td><%= order.getPayment() %></td>
			</tr>
		</table>

						
		<div align="center" class="pay button">
			<button onclick="goDetail();" id="goOrderDetail">주문 상세보기</button>
			<button onclick="goMain();" id="goMain">홈으로 가기</button>
		</div>
	</form>
	
	<script>
		function goMain() {
			location.href="<%= request.getContextPath() %>";
		}
		
		function goDetail() {
			location.href="<%= request.getContextPath() %>";
		}
	</script>
	
</body>
</html>