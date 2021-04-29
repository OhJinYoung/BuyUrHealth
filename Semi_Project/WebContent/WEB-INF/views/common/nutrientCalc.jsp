<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.nutrientCalc{text-align: center;}
	select[name=calcSelect]{width:20%; height:40px; margin:10px;}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<br> <label id="calcResult5"></label>입니다.
		<br>
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
				
				var nutrient = "비타민C"
				
				if(oldSelect == '10대' && genderSelect == '남'){
					var nutrient = "칼슘"
				}
				document.getElementById('calcResult1').innerHTML = heightSelect;
				document.getElementById('calcResult2').innerHTML = weightSelect;
				document.getElementById('calcResult3').innerHTML = oldSelect;
				document.getElementById('calcResult4').innerHTML = genderSelect;
				document.getElementById('calcResult5').innerHTML = nutrient;
			}
		</script>
	</div>
</body>
</html>