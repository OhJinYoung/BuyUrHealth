<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>인증</title>
</head>
<body onload="inputValue();">	
	<table>
		<tr>
			<td>
					<form action="<%= request.getContextPath() %>/sendEmail.do">  
					<b>이메일</b> <br>
					<input id="receiver" type="text" name="receiver"  required>
					<button>확인</button>
					<input type="button" value="취소" onclick="window.close();">
					</form> 
			</td>
		</tr> 
	</table>



	<script>
		function inputValue(){
			document.getElementById('receiver').value = opener.document.mailForm.receive.value;
		}
	</script>
</body>
</html> 