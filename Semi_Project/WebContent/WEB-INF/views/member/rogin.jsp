<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | HUB</title>
<style type="text/css">
#idFind {
	color: black;
}

input {
	width: 265px;
	height: 30px;
	text-align: center;
}

.int-area {
	width: 265px;
}

#btn {
	background-color: #e4a127;
	text-align: center;
	color: white;
	font-size: 20px;
	width: 273px;
}

.log {
	display: flex;
	justify-content: center;
	border: 100px solid white;
	color: white;
	background-position: center bottom;
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
<script src="../js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@include file="../title_header.jsp"%>

	<div class="log">
		<section class="login-form">
			<h1>
				<img class="mainLogo" src="image/logo.png" width="180px"
					height="120px" alt="My Image">
			</h1>
			<form id="loginForm"
				action="<%= request.getContextPath() %>/login.me" method="post">
				<div class="int-area">
					<input type="text" name="userId" id="userId" autocomplete="off"
						placeholder="아이디를 입력해주세요."> <label class="id">USERNAME</label>
				</div>
				<div class="int-area">
					<input type="password" name="userPwd" id="userPwd"
						autocomplete="off" placeholder="비밀번호를 입력해주세요."> <label
						class="id">PASSWORD</label>
				</div>
				<div class="btn-area">
					<input type="submit" id="btn" value="로그인">
				</div>
				<div class="caption">
					<!-- <input type="button" value="아이디 찾기">
							<input type="button" value="비밀번호 찾기">
							<input type="button" value="회원가입"> -->
					<a href="">아이디 찾기</a> <a href="">비밀번호 찾기</a> <a href="">회원가입</a>
				</div>

			</form>
		</section>
	</div>

</body>
</html>