<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.humanBody{
		width: 100%; min-width: 1400px; height: 30%; text-align: center; 
		display: inline-block; position: relative;
	}
	
	.humanBody div{
		display: inline;
	}
	
	.desc1 {position: relative; left: -120px; top: 30px;}
	
	.mainBody{width: 900px; height: 900px; display: block;}
	
	.supplementsImg1 {position: relative; left: 150px; top: -900px;}
	
	.supplementsImg2 {position: relative; left: -150px; top: -670px;}
	
	.supplementsImg3 {position: relative; left: -400px; top: -440px;}
	
	.supplementsImg4 {position: relative; left: -650px; top: -210px;}
	
	.supplements1 img {width: 150px; height: 100px;}
	
	.supplementsImg5 {position: relative; left: 150px; top: -900px;}
	
	.supplementsImg6 {position: relative; left: -70px; top: -650px;}
	
	.supplementsImg7 {position: relative; left: 850px; top: -540px;}
	
	.supplementsImg8 {position: relative; left: 600px; top: -350px;}
	
	.supplementsImg9 {position: relative; left: 350px; top: -200px;}
	
	.supplements2 img {width: 150px; height: 100px;}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="humanBody">
		<h2>신체부위별 영양소 추천</h2>
		
		<div id="mainBody" align="center">
			<img class="mainBody" src="<%= request.getContextPath() %>/images/sample.png" alt="My Image">
		</div>
		
		<div class="supplements1">
			<div class="supplementsImg1">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" alt="My Image">
		  		<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg2">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg3">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg4">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
		</div>
		
		<div class="supplements2">
			<div class="supplementsImg5">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
		  		<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg6">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg7">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg8">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
			<div class="supplementsImg9">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1">영양소이름</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			var hairRandn = Math.floor(Math.random() * 2);
			var brainRandn = Math.floor(Math.random() * 3);
			var eyesRandn = Math.floor(Math.random() * 2);
			var skinRandn = Math.floor(Math.random() * 3);
			var heartRandn = Math.floor(Math.random() * 4);
			var muscleRandn = Math.floor(Math.random() * 3);
			var lungsRandn = Math.floor(Math.random() * 2);
			var stomachRandn = Math.floor(Math.random() * 3);
			var boneRandn = Math.floor(Math.random() * 2);
			
			var hairArr = ["<%= request.getContextPath() %>/images/niacin.jpg", "<%= request.getContextPath() %>/images/vitamin_a.jpg"];
			var brainArr = ["<%= request.getContextPath() %>/images/choline.jpg", "<%= request.getContextPath() %>/images/niacin.jpg", "<%= request.getContextPath() %>/images/folic_acid.jpg"];
			var eyesArr = ["<%= request.getContextPath() %>/images/niacin.jpg", "<%= request.getContextPath() %>/images/vitamin_a.jpg"];
			var skinArr = ["<%= request.getContextPath() %>/images/cysteine.jpg", "<%= request.getContextPath() %>/images/vitamin_c.jpg", "<%= request.getContextPath() %>/images/niacin.jpg"];
			var muscleArr = ["<%= request.getContextPath() %>/images/vitamin_a.jpg", "<%= request.getContextPath() %>/images/pyritinol.jpg", "<%= request.getContextPath() %>/images/choline.jpg"];
			var lungsArr = ["<%= request.getContextPath() %>/images/cysteine.jpg", "<%= request.getContextPath() %>/images/pyritinol.jpg"];
			var heartArr = ["<%= request.getContextPath() %>/images/pantothenic_acid.jpg", "<%= request.getContextPath() %>/images/folic_acid.jpg", "<%= request.getContextPath() %>/images/omega-3_acid.jpg", "<%= request.getContextPath() %>/images/pyritinol.jpg"];
			var stomachArr = ["<%= request.getContextPath() %>/images/lactobacillus.jpg", "<%= request.getContextPath() %>/images/niacin.jpg", "<%= request.getContextPath() %>/images/magnesium_citrate.jpg"];
			var boneArr = ["<%= request.getContextPath() %>/images/vitamin_d.jpg", "<%= request.getContextPath() %>/images/biotin.jpg"];
			
			$(".supplementsImg1 img").attr("src", eyesArr[eyesRandn]);
			$(".supplementsImg2 img").attr("src", skinArr[skinRandn]);
			$(".supplementsImg3 img").attr("src", muscleArr[muscleRandn]);
			$(".supplementsImg4 img").attr("src", lungsArr[lungsRandn]);
			$(".supplementsImg5 img").attr("src", hairArr[hairRandn]);
			$(".supplementsImg6 img").attr("src", brainArr[brainRandn]);
			$(".supplementsImg7 img").attr("src", heartArr[heartRandn]);
			$(".supplementsImg8 img").attr("src", stomachArr[stomachRandn]);
			$(".supplementsImg9 img").attr("src", boneArr[boneRandn]);
			
		});
	</script>
</body>
</html>