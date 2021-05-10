<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@page import="javax.mail.Transport"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

#birth{
	width: 50px;

}

.ddiv{
	position: absolute;
	top: 290px;
	left: 850px;
}
#idCheck{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 12px;
	width: 80px;
}
#signUpBtn{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 12px;
	width: 80px;
}
#mailCheck{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 12px;
	width: 80px;
}
#button{
	background-color: #e4a127;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 12px;
	width: 80px;
}
.btn:hover{color:#fff;}
.hover1:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; }


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
.mainLogo2 {
	float: left;
	margin-right: 150px;
	margin-left: 30px;
	clear: both;
}
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="../title_header.jsp"%>
	
	<div class="big">
			<h2>회원가입</h2>
			<div class="ddiv">
					<form action="<%= request.getContextPath() %>/insert.me" id="mailForm" name="mailForm"  onsubmit="return checkValue()">  
						이름 <br>
						<input type="text" placeholder="이름을 입력해 주세요" name="userName"required>
						
						<br><br>
						
						연락처 <br>
						<input type="text" placeholder="연락처('-'제외)를 입력해 주세요" name="phone" required>
						
						<br><br><br>
						
						이메일 <br>
							<input id="receive" placeholder="이메일을 입력해주세요"type="text" name="email" required>
							<input type="button" value="인증번호" id="mailCheck" class="btn hover1">
						

						<br><br><br>
						
						성별<br>
						<input type="radio" name="gender" value="M" checked>남
                        <input type="radio" name="gender" value="W">여
                        
                        
                        <br><br><br>
						
                         <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                        
						<br><br><br>
						<hr>
						<br><br>
					
						아이디<br>
						<input type="text" placeholder="아이디를 입력해 주세요" name="userId"required readonly>
						<input type="button"id="idCheck" value="중복체크" class="btn hover1">
						<br><br>
						
						비밀번호<br>
						<input type="text" placeholder="비밀번호를 입력해 주세요" name="passWord" required>
						<br><br>
						
						
						<hr>
						
						
						<br><br>
						
						
					<input type="checkbox" value="전체선택" id="all" onclick="selectAll();"><a>모두 동의하기</a>
					<br><br>
						<hr>
					<br><br>
					<input type="checkbox" name="category" value="이용약관" id="comp" onclick="selectOne();"><a>이용 약관 동의 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">전문보기</a>
					<br>
					<input type="checkbox" name="category" value="개인정보" id="novel" onclick="selectOne();"><a>개인정보처리방침 동의</a> &nbsp;&nbsp;<a href="">전문보기</a>
					<br>
					<input type="checkbox" name="category" value="마케팅수신" id="essay" onclick="selectOne();"><a>마케팅 수신 동의(선택)&nbsp;&nbsp;&nbsp;</a><a href="">전문보기</a>
					<br>
							<div class="btns" id="signUpBtns">
								<input id="signUpBtn" type="submit" value="가입하기" class="btn hover1">
								<button id="button" class="btnArea" onclick="goHome();">메인으로</button>
							</div>
					</form> 
			</div>
	</div>
<script>   

		function goHome(){
			location.href='<%= request.getContextPath() %>'
		}
		function chk(){
			 var req = document.form.req.checked;
			 var num = 0;
			 if(req == true){
			  num = 1;
			 }
			 if(num==1){
			  document.form.submit();
			 }else{
			  alert("개인정보 약관에 동의하셔야 합니다.");
			 }
			}
			function nochk(){
			 alert("동의하지 않으면 가입하실 수 없습니다");
			 location.href="../index.jsp";
			}
		
		var all = document.getElementById("all");
		var category = document.getElementsByName("category");
	
		function selectAll(){
			if(all.checked){
				for(var i = 0; i < category.length; i++){
					category[i].checked = true;
				}
			} else{
				for(var i = 0; i < category.length; i++){
					category[i].checked = false;
				}
			} 
		}
		
		function selectOne(){
			var count = 0;
			
			for(var i = 0; i < category.length; i++){
				if(category[i].checked){
					count++;
				} 
			}
			
			if(count != 12){
				all.checked = false;
			} else{
				all.checked = true;
			}
		}
	
		function infoFind(){
			location.href='<%= request.getContextPath() %>/infoFind.me';
		}
		function joinBtn(){
			location.href='<%= request.getContextPath() %>/signUpForm.me';
		}
	
		$('#idCheck').on('click',function(){
			window.open('checkIdForm.me','idCheckForm','width=300, height=200');
		})
		
		$('#login').on('click', function(){
			location.href="<%= request.getContextPath() %>/login.main";
		});
		
		$('#logout').on('click', function() {
			location.href="<%= request.getContextPath() %>/logout.main";
		});
		
		$('#mailCheck').on('click', function(){
			window.open('checkmail.me','mailcheck','width=420, height=330'); 
		});
	</script>
	
</body>
</html>