<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<% 
	Member member = (Member)request.getAttribute("UserInfo2"); 
	request.setCharacterEncoding("UTF-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">

input{
  width:500px;
  height:70px;
  font-size:20px;
}
input::placeholder{
	font-size: 25px;
}
.btn:hover{color:#fff;}
.hover1:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; }

#ebtn{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 12px;
}


.harea{
	position: relative;
	bottom: 40px;

}

.ediv{
	float: left;
	margin: 8px;

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

</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="../title_header.jsp"%>


	<div class="log_find">
	
		<h2 class="title">비밀번호 찾기</h2>
		<div class="area">
			
			<form action="<%= request.getContextPath() %>/pwFindPo.me" id="findForm" name="findForm" method="post"> 
					<div class="harea">
						<h4>등록된 정보로 찾기</h4>
					</div>
				<br>
					<div class="ediv">
						<span class="espan">
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"required>
						<br>
						<input type="text" id="nameArea" name="userName" placeholder="이름을 입력해주세요"required>
						<br>
						<input type="text" id="emailArea" name="email"placeholder="이메일을 입력해주세요"required>
						<br>
						<input type="text" placeholder="연락처('-'제외)를 입력해 주세요" name="phone" required>
						<br>
						<br>
						<input type="submit" value="비밀번호 찾기" id="ebtn" class="btn hover1"> 
						
						</span>
					</div>
			</form>
		</div>
	</div>
	<script>
	
		$('#pwFindPo').on('click', function(){
			location.href="<%= request.getContextPath() %>/pwFindPo.me";
		});
	</script>


</body>
</html>