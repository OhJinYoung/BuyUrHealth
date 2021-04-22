<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.wrap {
	background: white;
	width: 100%;
	height: 50px;
	margin: 8px;
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
	margin-right: 100px;
	margin-left: 30px;
	clear: both;
}

hr {
	margin-top: 8px;
}
</style>
<div class="wrap">
	<nav>
		<div>
			<img class="mainLogo"
				src="<%=request.getContextPath()%>/images/mainlogo.png"
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