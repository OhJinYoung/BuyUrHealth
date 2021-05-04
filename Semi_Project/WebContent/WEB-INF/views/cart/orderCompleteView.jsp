<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		color: red;
		padding-top: 50px;
	}
	
	table{
		width: 80%;
		border : 1px solid black;
  		border-collapse : collapse;
  		cellpadding: 10px;
  		margin-bottom: 50px;
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
				<th>주문번호</th>
				<td></td>
			</tr>
			<tr>
				<th>주문 접수일</th>
				<td></td>
			</tr>
			<tr>
				<th>수령 예상일</th>
				<td></td>
			</tr>
			<tr>
				<th>결제 수단</th>
				<td></td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td></td>
			</tr>
			<tr>
				<th>결제 상태</th>
				<td></td>
			</tr>
		</table>

						
		<div align="center" class="pay button">
			<button onclick="" id="goOrderDetail">주문 상세보기</button>
			<button onclick="" id="goMain">홈으로 가기</button>
		</div>
	</form>
	
</body>
</html>