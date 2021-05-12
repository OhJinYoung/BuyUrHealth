<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>
<style>
	input{
  width:300px;
  height:70px;
  font-size:20px;
}

.btn:hover{color:#fff;}
.hover1:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; }

input::placeholder{
	font-size: 25px;
}
#acolor{
	color: red;
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


	#button{
		background-color: #e4a127;
		margin-left: 150px;
		margin-top: 70px;
		font-size: 20px;
		border: none;
		width:300px;
		height: 60px;
		border-radius: 12px;
		float: left;
		color: white;
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
			</div>
				<div class="ediv">
					<div id="userInfo"> 
					</div>
								 
					<h4>비밀번호 수정에 성공하였습니다.</h4>
					<br> 
						<button id="button" class="btn hover1" onclick="goHome();">메인으로 돌아가기</button>
				</div>
			</div>
	</div>
	
	<script>
	function goHome(){
		location.href='<%= request.getContextPath() %>'
	}
	</script>
</body>
</html>