<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	
%>
<%@page import="javax.mail.Transport"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

.ddiv{
	position: absolute;
	top: 290px;
	left: 850px;
}

/* input[type="button"]{
	background-color: #e4a127;
	color: white;
	border: 0;
} */


.big {
		display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
        align-items: center;
        justify-content: center;
}
a{
font-weight: bold;
}
input[type="text"]{

width:290px; height:30px;

padding:15px;

font-size:16px;

color: red;

      }

h2{
	position: absolute;
	left: 440px;
	bottom: 700px;
}

.wrap{background: white; width: 100%; height: 50px;}
.mainMenu
{
	background: white; color: gray; text-align: center; font-weight: bold; 
	vertical-align: middle; width: 150px; height: 50px; display: table-cell;
}
.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
.mainLogo2 {
	float: left;
	margin-right: 150px;
	margin-left: 30px;
	clear: both;
}
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="<%= request.getContextPath() %>/images/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
			
			<% if(loginUser == null){ %>
				<div class="mainMenu" id="goViewProduct">제품보기</div>
				<div class="mainMenu" id="goCommunity">커뮤니티</div>
				<div class="mainMenu" id="goCart">장바구니</div>
				<div class="mainMenu" id="goMypage">마이페이지</div>
				<div class="mainMenu" id="login">로그인</div>
				<div class="mainMenu" id="goService">고객센터</div>
				
			<% } else { %>
				<div class="mainMenu" id="goViewProduct">제품보기</div>
				<div class="mainMenu" id="goCommunity">커뮤니티</div>
				<div class="mainMenu" id="goCart">장바구니 <label id="link">/cart.me</label></div>
				<div class="mainMenu" id="goMypage">마이페이지 <label id="link1">/updateMyPage.me</label></div>
				<div class="mainMenu" id="logout">로그아웃</div>
				<div class="mainMenu" id="goService">고객센터</div>
				<div class="mainMenu" style='display:none;' id="checkLogin">Login</div>
			<% } %>
			<hr>
		</nav>
	</div>
	
	<div class="big">
			<h2>회원가입</h2>
			<div class="ddiv">
					<form action="<%= request.getContextPath() %>/insert.me" id="mailForm" name="mailForm"  onsubmit="return checkValue()">  
						이름 <br>
						<input type="text" placeholder="이름을 입력해 주세요" name="userName"required>
						
						<br><br>
						
						연락처 <br>
						<input type="text" placeholder="연락처('-'제외)를 입력해 주세요" name="phone" required>
						
						<br><br><br>
						
						이메일 <br>
						<input id="receive" placeholder="이메일을 입력해주세요"type="text" name="email" required>
						<input type="button" value="인증번호" id="mailCheck">
						<%-- <% if(AuthKey == null){ %>
							<p>인증이 되어있지않습니다.</p>
						<% } else { %>
							<p>인증이 완료되었습니다.</p>
						<% } %> --%>
						
						
						<br><br><br>
						성별<br>
						<input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="W">여
                        
                        
                        <br><br><br>
						 <select name="getBirthyy">
					       <%for(int i=2013; i>=1900; i--){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>년&nbsp;
					     <select name="getBirthmm">
					       <%for(int i=1; i<=12; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>
					     <select name="getBirthdd">
					       <%for(int i=1; i<=31; i++){ %>
					       <option value="<%=i %>"><%=i %></option>
					       <%} %>
					     </select>일<br><br>
                        
                       <%--  <%=member.getBirthyy() %>년 <%=member.getBirthmm() %>월 <%=member.getBirthdd() %>일 --%>

                        
						<br><br><br>
						<hr>
						<br><br>
					
						아이디<br>
						<input type="text" placeholder="아이디를 입력해 주세요" name="userId"required>
						<input type="button" value="중복체크">
						<br><br>
						비밀번호<br>
						<input type="text" placeholder="비밀번호를 입력해 주세요" name="passWord" required>
						<br><br>
						비밀번호 확인<br>
						<input type="text" placeholder="비밀번호를 다시 입력해 주세요" name="passWord" required>
						<input type="button" value="중복체크"> 
						
						<hr>
						
						
						 <!-- 
  						 <input type="text" style="border-width: 0px" size="20" 
  						 name="chk"	 value="비밀번호를 입력하세요" readonly="readonly">
  						 
						 <input type="password" size="15" maxlength="20" name="pass">
  						 <br><br>
						
						비밀번호 확인 : 
						<input type="password" size="15" maxlength="20" name="pass2" onblur="passchk()"> -->
						
						
						
						
						
						
						
						
						<br><br>
						<input type="checkbox"> <a>모두 동의하기</a>
						
						<br><br>
						<hr>
						<br><br>
						<input type="checkbox"> <a>이용 약관 동의 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">전문보기</a>
						<br>
						<input type="checkbox"> <a>개인정보처리방침 동의</a>  <a href="">전문보기</a>
						<br>
						<input type="checkbox"> <a>마케팅 수신 동의(선택) </a><a href="">전문보기</a>
						<br>
							<div class="btns" id="signUpBtns">
								<input id="signUpBtn" type="submit" value="가입하기">
								<input type="button" id="goMain" onclick="login();" value="메인으로">
							</div>
					</form> 
			</div>
	</div>
	
	<script>
	
	
		/* function passchk(){
				 var pass = document.form.pass.value;
				 var pass2 = document.form.pass2.value;
				 if (pass2.length == 0 || pass2 == null) {
				  document.form.chk.value = "비밀번호를 입력하세요..";
				 } else if (pass != pass2) {
				  document.form.chk.value = "비밀번호가 다릅니다.";
				 } else {   
				  document.form.chk.value = "비밀번호가 동일합니다.";
				 }
				 	return;
		} */
	
	
			
	
		
		function checkValue()
	    {
	        if(!document.userInfo.id.value){
	            alert("아이디를 입력하세요.");
	            return false;
	        }
	        
	        if(!document.userInfo.password.value){
	            alert("비밀번호를 입력하세요.");
	            return false;
	        }
	        
	        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	        if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
	            alert("비밀번호를 동일하게 입력하세요.");
	            return false;
	        }
	    }


		
	
	
	
		
		function infoFind(){
			location.href='<%= request.getContextPath() %>/infoFind.me';
		}
		function joinBtn(){
			location.href='<%= request.getContextPath() %>/signUpForm.me';
		}
		
		
	
	
		
		
		$('#login').on('click', function(){
			location.href="<%= request.getContextPath() %>/login.main";
		});
		
		$('#logout').on('click', function() {
			location.href="<%= request.getContextPath() %>/logout.main";
		});
		
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/login.main";
		});
		
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		
		$('#goCart').on('click', function(){
			checkLogin(this);
		});
		
		$('#goMypage').on('click', function(){
			checkLogin(this);
		});
		
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/updateMyPage.me";
		});
		$('#mailCheck').on('click', function(){
			window.open('checkmail.me','mailcheck','width=420, height=330'); 
		});
		
	</script>
	
</body>
</html>