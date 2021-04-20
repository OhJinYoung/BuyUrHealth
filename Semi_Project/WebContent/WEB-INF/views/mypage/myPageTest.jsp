<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Member member = (Member)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 틀</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.wrap{background: white; width: 100%; height: 50px;}
	.mainMenu{
			background: white; color: gray; text-align: center; font-weight: bold; 
			vertical-align: middle; width: 150px; height: 50px; display: table-cell;
		}
	.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
	
	.myPage-menubar {
        width: 20%;
        max-width: 170px;
        height: 1000px;
        padding: 20px;
        margin-top: 14px;
        float: left;
        border-right: 1px solid black;
        display: inline-block;
     }
     
     #myPage-menubar-name { text-align: center; 
					    font-size: 20px;}
	 .myPage-menubar ul, li { list-style: none; 
						  padding: 10px; margin: 0; text-align: center;}
	 #myInfo-head{text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .outer{
		width: 48%; height: 450px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 30%; display: inline-block; float: both; 
	}
	.updown { border: 1px solid black; width: 0.1px; height: 50xp; }

	
	.myPage-certification{position: absolute; width: 100%; max-width: 1100px; height: 200px;
						  margin-top: 20xp; border: 1px solid black;
						  padding: 50px; vertical-align: middle; display: inline-block; 
						  float: right; 
	}
	.myPage-certification button{width: 60px; height: 60px;}
	.myPage-pwd{width: 400px; margin-top: -20px; float: left;}
	.myPage-pwd input{width: 300px; height: 30px;}
	.myPage-pwd button{float: right; position: relative; top: -30px;}
	.myPage-email{width: 600px; margin-top: -20px; float: right; margin-left: 50px; visibility: visible;}
	.myPage-email input{width: 400px; height: 30px;}
	.myPage-email button{float: right; position: relative; top: -30px; margin-left: 20px;}
	
	#myForm td {text-align: center;}
	#myForm>table{margin: auto;}
	#updateBtn {background: #D1B2FF; color: white;}
	#updatePwdBtn {background: #FFD8D8; color: white;}
	#deleteBtn {background: #D5D5D5; color: white;}
	#goMain {background: #B2CCFF; color: white;}
	
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="<%= request.getContextPath() %>/images/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
			<div class="mainMenu" id="goViewProduct">제품보기</div>
			<div class="mainMenu" id="goCommunity">커뮤니티</div>
			<div class="mainMenu" id="goCart">장바구니</div>
			<div class="mainMenu" id="goMypage">마이페이지</div>
			<div class="mainMenu" id="login">로그인</div>
			<div class="mainMenu" id="goService">고객센터</div>
			<hr>
		</nav>
	</div>
	
	<div class="myPage-menubar">
	<hr>
        <h2 id="myPage-menubar-name">마이페이지</h2>
    <hr>
        <ul>
          <li>구매목록</li>
          <li>개인 정보 조회</li>
          <li>관심상품</li>
        </ul>
        
    </div>
    
    
    
    <div class="myPage-myInfo">
    	<h1 id="myInfo-head">개인 정보 조회</h1>
    </div>
    
    <div class="myPage-certification">
    	<div class="myPage-pwd">
    		<h2>비밀번호 재확인</h2>
	    	<input id="loginId" type="text" autocapitalize="none" class="input-text input-full" placeholder="아이디를 입력하세요." required="" data-parsley-required-message="아이디를 입력하세요."><br>
	    	<input id="loginPw" type="password" class="input-text input-full" placeholder="비밀번호를 입력하세요." required="" data-parsley-required-message="비밀번호를 입력하세요." data-parsley-minlength="4" data-parsley-minlength-message="비밀번호는 4자 이상입니다." data-parsley-maxlength="30"/>
	    	<button class="">확인</button>
    	</div>
    	
    	<div class="myPage-email">
    		<h2>이메일 인증</h2>
	    	<input id="loginId" type="text" autocapitalize="none" class="input-text input-full" placeholder="이메일을 입력하세요." required="" data-parsley-required-message="이메일을 입력하세요."><br>
	    	<button class="">확인</button>
	    	<input id="loginPw" type="password" class="input-text input-full" placeholder="인증번호를 입력하세요." required="" data-parsley-required-message="인증번호를 입력하세요." data-parsley-minlength="4" data-parsley-minlength-message="비밀번호는 4자 이상입니다." data-parsley-maxlength="30"/>
    		<button class="">인증번호 발송</button>
    	</div>
    </div>
    	
    
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
					<td><input type="hidden" maxlength="15" name="pwd" required value="<%= member.getUserPwd() %>">
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
			var bool = confirm('정말로 탈퇴하시겠습니가?');
			
			if(bool){
				location.href='<%= request.getContextPath() %>/delete.me';
			}
		}
	</script>
	
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/myPage.me";
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
	</script>
</body>
</html>