<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | HUB</title>
<style type="text/css">

#loginForm{
	vertical-align: middle;
	width: 150px;
	height: 50px;
	display: table-cell;
}
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


.btn { display:block; border-radius: 12px; width: 200px; height:40px; 
line-height:40px; border:1px #3399dd solid;; margin:15px auto; background-color: #e4a127; 
text-align:center; cursor: pointer; color:#333; transition:all 0.9s, color 0.3; 
}
.btn:hover{color:#fff;}

.hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; } 
.hover2:hover{ box-shadow:-200px 0 0 0 rgba(0,0,0,0.5) inset; } 
.hover3:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; }


.log {
	display: flex;
	justify-content: center;
	border: 100px solid white;
	color: white;
	background-position: center bottom;
}

</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@include file="../title_header.jsp"%>


	<div class="log">
		<section class="login-form">
			<h1>
				<img class="mainLogo2" src="<%= request.getContextPath() %>/images/mainlogo.png" width="200px"
					height="100px" alt="My Image">
			</h1>
				<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
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
						<input type="submit" id="btn" class="btn hover1" value="로그인">
					</div>
					<div class="caption">
						<input type="button" id="InfoFind" onclick="infoFind();" class="btn hover2" value="아이디 / 비밀번호 찾기">
						<input type="button" id="JoinBtn"  onclick="joinBtn();"  class="btn hover3" value="회원가입">
					</div>

			</form>
		</section>
	</div>
	
	<script>
	
		function infoFind(){
			location.href='<%= request.getContextPath() %>/infoFind.me';
		}
		function joinBtn(){
			location.href='<%= request.getContextPath() %>/signUpForm.me';
		}
		
		
	</script>
</body>
</html>