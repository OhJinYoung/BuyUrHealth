<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">

input::placeholder{
	font-size: 5px;
}


#ebtn{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
}
#aubtn{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
}


#authArea{
	width:70px;
}
.harea{
	position: relative;
	bottom: 40px;

}

.auspan{
	float: left;
	margin: 8px;
	position: relative;
	top: 40px;
	right: 240px;

}


.ndiv{
	float: left;
	margin: 8px;

}
.nspan{
 	position: relative;
	 left: 167px;
}

.ediv{
	float: left;
	margin: 8px;

}

.espan{
	position: relative;
	left: 60px;
}

.msg{
font-size: 10px;
position: relative;
float: right;
top: 80px;
}

.log_find{
	
	display: flex;
	justify-content: center;
	padding: 100px;
	
}

.area{
	background: lightgray;
	margin: 30px;
	padding: 70px;
	width:  600px; 
	
}
.wrap {
	background: white;
	width: 100%;
}

.mainMenu {
	background: white;
	color: gray;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
	width: 150px;
	height: 50px;
	display: table-cell;
}

.mainMenu:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

.mainLogo {
	float: left;
	margin-right: 150px;
	margin-left: 30px;
	clear: both;
}
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


	<div class="log_find">
	
		<h2 class="title">아이디 찾기</h2>
		<div class="area">
					<div class="harea">
						<h4>등록된 이메일로 찾기</h4>
					</div>
					
					<div class="ndiv">
						이름
						<span class="nspan">
						<input type="text" id="nameArea">
						</span>
					</div>
				<br>
					<div class="ediv">
						등록한 이메일 주소
					<span class="espan">
					<input type="text" id="emailArea">&nbsp;
					<input type="button" value="인증번호 전송" id="ebtn"> 
					
					</span>
					</div>
				<br>
					<span class="auspan">
							 <input type="text" id="authArea" placeholder="인증번호 입력">&nbsp;
							 <input type="button" value="확인" id="aubtn">
					</span>
					<p class="msg">인증번호를 받지 못하셨다면, 입력하신 정보가 맞는지 확인해주세요</p>
		</div>
	</div>

</body>
</html>