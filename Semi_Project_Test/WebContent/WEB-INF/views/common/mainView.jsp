<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 틀</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	h2{text-align:center;}
	.wrap{background: white; width: 100%; height: 50px;}
	.mainMenu{
			background: white; color: gray; text-align: center; font-weight: bold; 
			vertical-align: middle; width: 150px; height: 50px; display: table-cell;
		}
	.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
	.nutrientCalc{text-align: center;}
	select[name=calcSelect]{width:20%; height:40px; margin:10px;}
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="../img/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
			<div class="mainMenu" onclick="goTest();">제품보기</div>
			<div class="mainMenu" onclick="">커뮤니티</div>
			<div class="mainMenu" onclick="">장바구니</div>
			<div class="mainMenu" onclick="">마이페이지</div>
			<div class="mainMenu" onclick="">로그인</div>
			<div class="mainMenu" onclick="">고객센터</div>
			<hr>
		</nav>
	</div>
	
	<div class="humanBody">
		<h2>신체부위별 영양소 추천</h2>
		<img class="mainLogo" src="../img/sample.jpg" width="100%" height="30%" alt="My Image">
	</div>
	<div class="nutrientCalc">
		<h2>영양소 계산기</h2>
		<select name="calcSelect" id='old'>
			<option value="te">10대</option>
			<option value="tw" selected>20대</option>
			<option value="th">30대</option>
			<option value="fo">40대</option>
			<option value="fi">50대</option>
		</select>
		<select name="calcSelect" id="height">
			<option value="hund_fo">140~149cm</option>
			<option value="hund_fi">150~159cm</option>
			<option value="hund_si">160~169cm</option>
			<option value="hund_se" selected>170~179cm</option>
			<option value="hund_ei">180~189cm</option>
			<option value="hund_ni">190~199cm</option>
		</select>
		<select name="calcSelect" id="weight">
			<option value="foty">40~49kg</option>
			<option value="fity">50~59kg</option>
			<option value="sity">60~69kg</option>
			<option value="sety" selected>70~79kg</option>
			<option value="eity">80~89kg</option>
			<option value="nity">90~99kg</option>
		</select>
		<select name="calcSelect" id="gender">
			<option value="m" selected>남</option>
			<option value="f">여</option>
		</select>
		<br><br>
		<br>
		키<label id="calcResult1"></label> 체중<label id="calcResult2"></label>인 <label id="calcResult3"></label> <label id="calcResult4"></label>성의 필요영양소는
		<br><br>
		<button onclick="calcResult();">계산하기</button>
		<script>
			function calcResult(){
				var old = document.getElementById('old');
				var oldSelect = old.options[old.selectedIndex].text;
				var height = document.getElementById('height');
				var heightSelect = height.options[height.selectedIndex].text;
				var weight = document.getElementById('weight');
				var weightSelect = weight.options[weight.selectedIndex].text;
				var gender = document.getElementById('gender');
				var genderSelect = gender.options[gender.selectedIndex].text;
				
				document.getElementById('calcResult1').innerHTML = heightSelect;
				document.getElementById('calcResult2').innerHTML = weightSelect;
				document.getElementById('calcResult3').innerHTML = oldSelect;
				document.getElementById('calcResult4').innerHTML = genderSelect;
			}
		</script>
	</div>
	<div class="nutrientintro">
		<h2>영양소 소개</h2>
		<img class="intro" src="../img/vitamin_c.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/vitamin_d.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/lactobacillus.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/vitamin_c.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/vitamin_d.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/lactobacillus.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/vitamin_c.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/vitamin_d.jpg" width="10%" height="10%" alt="My Image">
		<img class="intro" src="../img/lactobacillus.jpg" width="10%" height="10%" alt="My Image">
		<p>비타민c : 비타민c는 시다</p>
		
		<p>비타민d : 비타민d는 시다</p>
	</div>
	<script>
		function goTest(){
			location.href="<%= request.getContextPath() %>/test.no";
		}
	</script>
</body>
</html>