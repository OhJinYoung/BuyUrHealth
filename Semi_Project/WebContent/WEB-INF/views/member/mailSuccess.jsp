<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
 	String key = (String)request.getAttribute("key");
 	String email = (String)request.getAttribute("email");
 	request.setAttribute("email", email);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>
<style>
.btn:hover{color:#fff;}
.hover1:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; }

input::placeholder{
	font-size: 17px;
	text-align: center; 
}
#acolor{
	color: red;
}


	input{
  width:300px;
  height:70px;
  font-size:20px;
}


#ebtn{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
}


.harea{
	position: relative;
	bottom: 40px;

}

.ediv{
	width: 600px;
	float: left;
	margin: 5px;

}

.espan{
	position: relative;
	left: 60px;
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

	#button{
		margin-left: 150px;
		margin-top: 70px;
		font-size: 20px;
		border: none;
		width:300px;
		height: 60px;
		border-radius: 20%;
		float: left;
	}
	
	
	#userInfo{
		text-align: center;
		color: #1f4e5f;
		font-size:15px;
	}
	
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
	<div class="log_find">
		
			<h2 class="title">비밀번호 찾기</h2>
			<div class="area">
				
			<div class="harea">
					<h4>등록된 이메일로 인증</h4>
			</div>
				<div class="ediv">
					<div id="userInfo"> 
						<h2>인증에 성공하셨습니다</h2>
						<form action="<%= request.getContextPath() %>/newPw.me" id="findForm" name="findForm" method="post"> 
						<input type="text" id="newPwd" name="newPwd"placeholder="새로운 비밀번호를 입력해주세요"required>
						<br>
						<input type="submit" value="비밀번호 찾기" id="ebtn"> 
						</form>

					</div>
				</div>
			</div>
	</div>
	
		
		
<script>
		$('#pwFindPo').on('click', function(){
			location.href="<%= request.getContextPath() %>/newPw.me";
		});

</script>
</body>




</html>