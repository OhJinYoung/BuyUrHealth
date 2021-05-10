<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입에 성공하셨습니다.</title>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
	<div align="center">
		<button id="button" class="btnArea" onclick="goHome();">메인으로 돌아가기</button>
	</div>
</body>

<script>
	function goHome(){
		location.href='<%= request.getContextPath() %>'
	}
	</script>
</html>