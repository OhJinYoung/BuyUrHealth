<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member myPwd = (Member)request.getAttribute("myPwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.outer{
		width: 600px; height: 500px; margin-left: 300px; margin-top: 50px;
	}
	#cancelBtn{margin-left: 170px}
	/* #updatePwdForm td{height: 50px;}
	#updatePwdBtn{background: #D1B2FF;}
	
	#updatePwdForm>table{margin: auto;}*/
</style>

<title>마이페이지|비밀번호 변경</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
		
		<%@include file="../mypage/myPageNav.jsp"%>
	
	<div class="outer">
		<br>
		<h2>비밀번호 수정하기</h2>
		
		<form action="<%= request.getContextPath() %>/updatePwd.me" method="post" id="updatePwdForm" name="updatePwdForm" onsubmit="return send();">
			<table>
				<tr>
					<td><label>현재 비밀번호</label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<td><label>변경 비밀번호</label></td>
					<td><input type="password" name="newPwd"></td>
				</tr>
				<tr>
					<td><label>변경 비밀번호 확인</label></td>
					<td><input type="password" name="newPwd2"></td>
				</tr>
			</table>
			
			<br><br>
			
			<div class="btns">
				<input id="updatePwdBtn" type="submit" value="변경하기">
				<input type="button" id="cancelBtn" onclick="location.href='javascript:history.back();'" value="취소하기">
			</div>
		</form>
	</div>
	
	<script>
		function send(){
			var newPwd = $('input[name="newPwd"]');
			var newPwd2 = $('input[name="newPwd2"]');
			
			if(newPwd.val().trim() != newPwd2.val().trim()){
				alert('비밀번호가 다릅니다.');
				newPwd2.val('');
				newPwd2.focus();
				
				return false;
			} else if(newPwd.val().trim() == '' || newPwd2.val().trim() == ''){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>