<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 | 비밀번호 찾기</title>
<style type="text/css">

#h22{
	top: 100px;

}

#UserFind{
	width: 200px;
  	height: 200px;
  	text-align: center;
  	align-items: center;
	margin: 10px;
	
	text-align: center;
	color: black;
	font-size: 20px;
}
#UserFind2{
	visibility: hidden;
	width: 200px;
}

.center{
  	position: absolute;
  	bottom: 120px;
  	
  	
	width: 600px;
 	text-align: center;
 	justify-content: center;
 	display: flex;
}

.logFind{
	background-color: #e4a127;
	display: flex;
	justify-content: center;
	color: white;
	height: 500px;
	width: 1200px;
	position: absolute;
	left: 410px;
	top: 200px;
	
	
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
.mainLogo2 {
	float: left;
	margin-right: 150px;
	margin-left: 30px;
	clear: both;
}
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>../js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrap">
		<nav>
			<div>
				<img class="mainLogo"
					src="<%= request.getContextPath() %>/images/mainlogo.png"
					width="100px" height="50px" alt="My Image">
			</div>
			<div class="mainMenu" id="goViewProduct">제품보기</div>
			<div class="mainMenu" id="goCommunity">커뮤니티</div>
			<div class="mainMenu" id="goCart">장바구니</div>
			<div class="mainMenu" id="goMypage">마이페이지</div>
			<div class="mainMenu" id="login">로그인</div>
			<div class="mainMenu" id="goService">고객센터</div>
			<hr>
		</nav>
	</div>



 
 

	<div class="logFind">
		<h2 id="h22">계정 찾기</h2>
		<div class="center">
			<input type="button" id="UserFind" onclick="userIdFind();" value="아이디 찾기 ">
			<input type="button" id="UserFind2">
			<input type="button" id="UserFind"  onclick="userPwFind();"  value="비밀번호 찾기">
		</div>
	</div>
	
	<script>
		function userIdFind(){
			location.href='<%= request.getContextPath() %>/find.id';
		}
		function userPwFind(){
			location.href='<%= request.getContextPath() %>/find.pw';
		}
		
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#login').on('click', function(){
			location.href="<%= request.getContextPath() %>/login.main"; 
		});
		
	</script>
</body>
</html>