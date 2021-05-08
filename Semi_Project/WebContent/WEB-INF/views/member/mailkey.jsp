<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%
 	String key = (String)request.getAttribute("key");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<p>인증번호를 입력하세요</p>
	<form action="<%= request.getContextPath() %>/sendtrue.do" method="post">  
		<input type="text"name="AuthenticationUser">
		<input type="submit" value="전 송">
		<!-- <button>확인</button> -->
		<input type="button" value="취소" onclick="window.close();">
	</form>
	
	<script>
	
	<%-- function subclick(){
		location.href='<%= request.getContextPath() %>/sendtrue.do';
	} --%>
	
	
	</script>
</body>
</html>