<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("userId");
	String authority = null;
	if(member.getAuthority() == 'Y'){
		authority = "관리자";
	} else {
		authority = "회원";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|개인정보조회</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}

	.myPage-certification{position: absolute; width: 1100px; height: 200px;
						  margin-top: 20xp; padding: 50px; vertical-align: middle; 
						  display: inline-block; float: right; 
	}
	.myPage-certification button{width: 60px; height: 60px;}
	.myPage-pwd{width: 400px; margin-top: -20px; float: left;}
	.myPage-pwd input{width: 300px; height: 30px;}
	.myPage-pwd button{float: right; position: relative; top: -30px;}
	.myPage-email{width: 600px; margin-top: -20px; float: right; 
				  margin-left: 50px; opacity: 0.5; pointer-events: none;}
	.myPage-email input{width: 400px; height: 30px;}
	.myPage-email button{float: right; position: relative; top: -30px; margin-left: 20px;}
	
	.outer{
		width: 500px; height: 450px; margin-top: 300px; margin-left: 50px; 
		display: inline-block; opacity: 0.5; pointer-events: none;
	}
	#myForm table{border-collapse: separate; border-spacing: 0 10px;}
	.myPageBtns{opacity: 0.5;}
	
/*	#updateBtn {background: #D1B2FF; color: white;}
	#updatePwdBtn {background: #FFD8D8; color: white;}
	#deleteBtn {background: #D5D5D5; color: white;}
	#goMain {background: #B2CCFF; color: white;} */
	
</style>
</head>
<body>
	<% if(member.getAuthority() == 'Y') {%>
		<%@include file="../admin/header.jsp"%>
	<% } else {%>
		<%@include file="../title_header.jsp"%>
	<% } %>
	
	
		<%@include file="myPageNav.jsp"%>
    
    <h1 id="myPage-head">개인정보조회</h1>
    <hr>
    
    <div class="myPage-certification">
    	<div class="myPage-pwd">
    		<h2>비밀번호 재확인</h2>
	    	<input id="id" type="text" value="<%= member.getUserId() %>" readonly><br>
	    	<input id="loginPwdCheck" onkeyup="loginEnterKey();" type="password">
	    	<button class="pwdCheck">확인</button>
    	</div>
    	
    	<div class="myPage-email">
    		<h2>이메일 인증</h2>
	    	<input id="emailCert" type="text"><br>
	    	<button class="emailCheck">확인</button>
	    	<input id="certNum" type="text">
    		<button class="numCheck" onkeyup="emailEnterKey();">인증번호 발송</button>
    	</div>
    </div>
    	
    
    <div class="outer">
		<br>
		<h2>내 정보 보기</h2>
		
		<form action="<%= request.getContextPath() %>/updateMyPageForm.do" method="post" id="myForm" name="myForm">
			<table>
				<tr>
					<td width="200px">아이디
						<input type="hidden" name="myNo" value="<%=member.getUserNo()%>">
						<input type="hidden" name="myPwd" value="<%=member.getPassword()%>">
					</td>
					<td width="200px"><input type="hidden" maxlength="13" name="id" required value="<%= member.getUserId() %>">
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
					<td>성별</td>
					<td><input type="hidden" name="myGender" required value="<%= member.getGender() %>">
						<%= member.getGender() %>
					</td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="hidden" maxlength="15" name="myBirth" required value="<%= member.getBirth() %>">
						<%= member.getBirth() %>
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
					<td>가입날짜</td>
					<td><input type="hidden" name="myUserDate" value="<%= member.getUserDate() %>">
						<%= member.getUserDate() %>
					</td>
				</tr>
				<tr>
					<td>권한</td>
					<td><input type="hidden" name="myAuthority" value="<%= authority %>">
						<%= authority %>
					</td>
				</tr>
				<tr>
				
				</tr>
			</table>
			
			<br>
			
			<div class="myPageBtns">
				<input id="updateBtn" type="submit" value="수정하기">
				<input id="updatePwdBtn" type="button" value="비밀번호 변경 하기" onclick="location.href='updatePwdForm.me'">
				<input id="deleteBtn" type="button" value="탈퇴하기" onclick="deleteMember();">
			</div>
		</form>
	</div>
	
	<script>
		function deleteMember(){
			var bool = confirm('정말로 탈퇴하시겠습니가?');
			
			if(bool){
				location.href='<%= request.getContextPath() %>/delete.me';
			}
		}
		
		function loginEnterKey() {
	        if (window.event.keyCode == 13) {
	 
	        	$('.pwdCheck').click();
	        }
		}
		
		
		$('#goBuy').on('click', function(){
			location.href="<%= request.getContextPath() %>/buyMyPage.me";
		});
		
		$('#goPage').on('click', function(){
			location.href="<%= request.getContextPath() %>/goMypage";
		});
		
		$('#goFavorite').on('click', function(){
			location.href="<%= request.getContextPath() %>/favoriteMyPage.me";
		});
		
		
		$('.pwdCheck').on('click', function(){
			if($('#loginPwdCheck').val() == "<%= member.getPassword() %>"){
				alert('회원정보와 일치합니다!');
				$('.myPage-pwd').css("pointer-events", "none");
				$('.myPage-email').css("opacity",  "1");
				$('.myPage-email').css("pointer-events", "auto");
				$('.myPageBtns').css("opacity", "0.5");
				$('.outer').css("opacity", "1");
				$('.myPageBtns').css("pointer-events", "auto");
			} else {
				alert('회원정보와 일치하지 않습니다. 다시입력해주세요.');
				$('.myPage-email').css("opacity", "0.3");
				$('.myPageBtns').css("opacity", "0.3");
				$('.outer').css("opacity", "0.3");
			}
		});
		
	</script>
</body>
</html>