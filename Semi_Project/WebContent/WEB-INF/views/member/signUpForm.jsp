<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

input[type="button"]{
	position: absolute;
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
}


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
	
	<div class="big">
			<h2>회원가입</h2>
			<div class="ddiv">
				이름 <br>
				<input type="text" placeholder="이름을 입력해 주세요">
				
				<br><br>
				
				연락처 <br>
				<input type="text" placeholder="연락처('-'제외)를 입력해 주세요">
				
				<br><br><br>
				
				이메일 <br>
				<input type="text" placeholder="이메일을 입력해 주세요">
				<input type="button" value="인증번호 발송">
				<br>
				<input type="text" placeholder="인증번호를 입력해 주세요">
				<input type="button" value="확인">
			
			<br><br>
			<hr>
			<br><br>
			
			아이디<br>
			<input type="text" placeholder="아이디를 입력해 주세요">
			<input type="button" value="중복체크">
			<br><br>
			비밀번호<br>
			<input type="text" placeholder="비밀번호를 입력해 주세요">
			<br><br>
			비밀번호 확인<br>
			<input type="text" placeholder="비밀번호를 다시 입력해 주세요">
			<input type="button" value="중복체크">
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
				</div>
			</div>
			
	</div>
	
</body>
</html>