<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.nutrientCalc{text-align: center; padding-top:40px;}
	select[name=calcSelect]{width:20%; height:40px; margin:10px; cursor:pointer;}
	
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
		<button onclick="calcResult();" style="cursor:pointer;">계산하기</button>
		<script>
			function calcResult(){
				var old = document.getElementById('old');
				var oldSelect = old.options[old.selectedIndex].text;
				var height = document.getElementById('height');
				var heightSelect = height.options[height.selectedIndex].text;
				var subHeight = heightSelect.substring(0,3);
				var weight = document.getElementById('weight');
				var weightSelect = weight.options[weight.selectedIndex].text;
				var subWeight = weightSelect.substring(0,2);
				var gender = document.getElementById('gender');
				var genderSelect = gender.options[gender.selectedIndex].text;
				
				var nutrient = "비타민C"
				
				switch(genderSelect){
				
				case '남': 
					switch(oldSelect){
					case "10대":
						if(Number(subHeight) < 160 && Number(subWeight) < 70){
							var nutrient = "칼슘";
						} else {
							var nutrient = "비타민A, 비타민D"
						}
						break;
					case "20대":
						if(Number(subHeight) < 160 && Number(subWeight) < 70){
							var nutrient = "비타민A, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "비타민C, 나이아신";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "마그네슘";
						}
						break;
					case "30대":
						if(Number(subHeight) < 160 && Number(subWeight) < 70){
							var nutrient = "유산균, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "마그네슘, 나이아신";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "오메가3 지방산";
						}
						break;
					case "40대":
						if(Number(subHeight) < 160 && Number(subWeight) < 70){
							var nutrient = "나이아신, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "오메가3 지방산, 비타민C";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "비타민A";
						}
						break;
					case "50대":
						if(Number(subHeight) < 160 && Number(subWeight) < 70){
							var nutrient = "비타민A, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "비타민C, 나이아신";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "마그네슘";
						}
						break;
					}
					break;
				case '여': 
					switch(oldSelect){
					case "10대":
						if(Number(subHeight) < 160 && Number(subWeight) < 60){
							var nutrient = "칼슘";
						} else {
							var nutrient = "비타민A, 비타민D"
						}
						break;
					case "20대":
						if(Number(subHeight) < 150 && Number(subWeight) < 60){
							var nutrient = "비타민C, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "비타민D, 핀토텐산";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "마그네슘";
						}
						break;
					case "30대":
						if(Number(subHeight) < 150 && Number(subWeight) < 60){
							var nutrient = "유산균, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "이노시톨, 콜린";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "바이오틴";
						}
						break;
					case "40대":
						if(Number(subHeight) < 150 && Number(subWeight) < 60){
							var nutrient = "나이아신, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "오메가3 지방산, 시스테인";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "비타민A";
						}
						break;
					case "50대":
						if(Number(subHeight) < 150 && Number(subWeight) < 60){
							var nutrient = "칼슘, 엽산"; 
						} else if((Number(subHeight) - Number(subWeight)) >= 90){
							var nutrient = "비타민C, 나이아신";
						} else if((Number(subHeight) - Number(subWeight)) < 90){
							var nutrient = "마그네슘";
						}
						break;
					}
					break;
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