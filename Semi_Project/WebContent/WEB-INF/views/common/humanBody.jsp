<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		min-width: 1500px;
	}
	.humanBody{
		width: 100%; min-width: 1400px; height: 30%; text-align: center; 
		display: inline-block; position: relative;
	}
	
	.humanBody div{
		display: inline;
	}
	
	.desc1 {position: relative; left: -120px; top: 30px;}
	
	.mainBody{width: 900px; height: 900px; display: block;}
	
	.supplementsImg1 {position: relative; left: 150px; top: -850px;}
	
	.supplementsImg2 {position: relative; left: -50px; top: -650px;}
	
	.supplementsImg3 {position: relative; left: -190px; top: -400px;}
	
	.supplementsImg4 {position: relative; left: -360px; top: -200px;}
	
	.supplements1 img {width: 150px; height: 100px; cursor:pointer;}
	
	.supplementsImg5 {position: relative; left: 450px; top: -870px;}
	
	.supplementsImg6 {position: relative; left: 300px; top: -650px;}
	
	.supplementsImg7 {position: relative; left: 200px; top: -450px;}
	
	.supplementsImg8 {position: relative; left: 70px; top: -250px;}
	
	.supplementsImg9 {position: relative; left: -100px; top: -100px;}
	
	.supplements2 img {width: 150px; height: 100px; cursor:pointer;}
	
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
		  		<div class="desc1"></div>
			</div>
			<div class="supplementsImg2">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" alt="My Image">
			  	<div class="desc1"></div>
			</div>
			<div class="supplementsImg3">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
			<div class="supplementsImg4">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
		</div>
		
		<div class="supplements2">
			<div class="supplementsImg5">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
		  		<div class="desc1"></div>
			</div>
			<div class="supplementsImg6">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
			<div class="supplementsImg7">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
			<div class="supplementsImg8">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
			<div class="supplementsImg9">
				<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg"  alt="My Image">
			  	<div class="desc1"></div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			var hairRandn = Math.floor(Math.random() * 2);
			var brainRandn = Math.floor(Math.random() * 3);
			var eyesRandn = Math.floor(Math.random() * 3);
			var skinRandn = Math.floor(Math.random() * 3);
			var heartRandn = Math.floor(Math.random() * 3);
			var muscleRandn = Math.floor(Math.random() * 3);
			var lungsRandn = Math.floor(Math.random() * 2);
			var stomachRandn = Math.floor(Math.random() * 3);
			var boneRandn = Math.floor(Math.random() * 2);
			
			var hairArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/1.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/3.png"];
			var brainArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/7.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/13.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/19.png"];
			var eyesArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/31.jpeg", "<%= request.getContextPath() %>/uploadFiles/productUpload/33.jpeg", "<%= request.getContextPath() %>/uploadFiles/productUpload/27.png"];
			var skinArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/43.jpeg", "<%= request.getContextPath() %>/uploadFiles/productUpload/45.jpg", "<%= request.getContextPath() %>/uploadFiles/productUpload/47.jpg"];
			var muscleArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/15.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/17.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/19.png"];
			var lungsArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/29.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/9.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/23.png"];
			var heartArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/9.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/11.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/13.png"];
			var stomachArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/37.jpeg", "<%= request.getContextPath() %>/uploadFiles/productUpload/39.jpeg", "<%= request.getContextPath() %>/uploadFiles/productUpload/41.jpeg"];
			var boneArr = ["<%= request.getContextPath() %>/uploadFiles/productUpload/21.png", "<%= request.getContextPath() %>/uploadFiles/productUpload/7.png"];
			
			$(".supplementsImg1 img").attr("src", eyesArr[eyesRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct5";
			});
			$(".supplementsImg2 img").attr("src", skinArr[skinRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct7";
			});
			$(".supplementsImg3 img").attr("src", muscleArr[muscleRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct3";
			});
			$(".supplementsImg4 img").attr("src", lungsArr[lungsRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct2";
			});
			$(".supplementsImg5 img").attr("src", hairArr[hairRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct1";
			});
			$(".supplementsImg6 img").attr("src", brainArr[brainRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct4";
			});
			$(".supplementsImg7 img").attr("src", heartArr[heartRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct6";
			});
			$(".supplementsImg8 img").attr("src", stomachArr[stomachRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct7";
			});
			$(".supplementsImg9 img").attr("src", boneArr[boneRandn]).on("click", function(){
				location.href="<%= request.getContextPath() %>/goProduct3";
			});
			
		});
	</script>
</body>
</html>