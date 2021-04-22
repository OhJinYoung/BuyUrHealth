<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.outer{
		width: 48%; height: 450px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 5%;
	}
	#myForm td {text-align: center;}
	#myForm>table{margin: auto;}
	#updateBtn {background: #D1B2FF; color: white;}
	#updatePwdBtn {background: #FFD8D8; color: white;}
	#deleteBtn {background: #D5D5D5; color: white;}
	#goMain {background: #B2CCFF; color: white;}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">내 정보 보기</h2>
		
		<form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm" name="myForm">
			<table>
				<tr>
					<td width="200px">아이디</td>
					<td width="200px"><input type="hidden" maxlength="13" name="myId" required value="<%= member.getUserId() %>">
									  <%= member.getUserId() %>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="hidden" name="myName" required value="<%= member.getUserName() %>">
						<%= member.getUserName() %>
					</td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="hidden" maxlength="15" name="myNickName" required value="<%= member.getBirth() %>">
						<%= member.getBirth() %>
					</td>
					<td><input type="hidden" maxlength="15" name="pwd" required value="<%= member.getPassword() %>">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="hidden" maxlength="11" name="myPhone" placeholder="(-없이)01012345678" value="<%= member.getPhone() %>">
						<%= member.getPhone() == null ? "-" : member.getPhone() %>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="hidden" name="myEmail" value="<%= member.getEmail() %>">
						<%= member.getEmail() == null ? "-" : member.getEmail() %>
					</td>
				</tr>
				<tr>
					<td>권한</td>
					<td><input type="hidden" name="myAddress" value="<%= member.getAuthority() %>">
						<%= member.getAuthority() %>
					</td>
				</tr>
				<tr>
				
				</tr>
			</table>
			
			<br>
			
			<div class="myPageBtns" align="center">
				<input id="updateBtn" type="submit" value="수정하기">
				<input id="updatePwdBtn" type="button" value="비밀번호 변경 하기" onclick="location.href='updatePwdForm.me'">
				<input id="deleteBtn" type="button" value="탈퇴하기" onclick="deleteMember();">
				<input type="button" id="goMain" onclick="goMain();" value="메인으로">
			</div>
		</form>
	</div>
	
	<script>
		function deleteMember(){
			// 정말 삭제할거냐고 물어본 후, 삭제하겠다고 하면 delete.me로 요청
			var bool = confirm('정말로 탈퇴하시겠습니가?');
			
			if(bool){
				location.href='<%= request.getContextPath() %>/delete.me';
			}
		}
	</script>
</body>
</html>