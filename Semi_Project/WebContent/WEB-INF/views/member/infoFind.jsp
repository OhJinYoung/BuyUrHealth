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
  .btn:hover{color:#fff;}
  .hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; } 
  .hover2:hover{ box-shadow:-200px 0 0 0 rgba(0,0,0,0.5) inset; }

#UserFind{
	display:block; width:200px; height:200px; line-height:40px; border:1px #3399dd solid; border-radius: 12px;
	margin:15px auto; background-color:orange; text-align:center; cursor: pointer; color:#333; transition:all 0.9s, color 0.3;

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
	background-color: gray;
	display: flex;
	justify-content: center;
	color: white;
	height: 500px;
	width: 1200px;
	position: absolute;
	left: 410px;
	top: 200px;
	
	
}
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@include file="../title_header.jsp"%>



 
 

	<div class="logFind">
		<h2 id="h22">계정 찾기</h2>
		<div class="center">
			<input type="button" id="UserFind" onclick="userIdFind();" class="btn hover1" value="아이디 찾기 ">
			<input type="button" id="UserFind2">
			<input type="button" id="UserFind"  onclick="userPwFind();" class="btn hover2" value="비밀번호 찾기">
		</div>
	</div>
	
	<script>
		function userIdFind(){
			location.href='<%= request.getContextPath() %>/find.id';
		}
		function userPwFind(){
			location.href='<%= request.getContextPath() %>/find.pw';
		}
		

		
	</script>
</body>
</html>