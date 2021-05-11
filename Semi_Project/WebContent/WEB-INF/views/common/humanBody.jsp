<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="product.model.vo.Product"%>
<%
Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#mainBody {
	background: url("images/sample.png");
	background-size: cover;
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
    position: relative;
    right: 40px;
}

.supplements1 img, .supplements2 img {
	width: 100px;
	height: 100px;
	border: 2px solid black;
	border-radius: 4px;
}
.supplements1 img:hover, .supplements2 img:hover{
	cursor: pointer;
	filter: brightness(0.95);
}
.supplements1 div, .supplements2 div {
	width: 100px;
	height: 100px;
	position: relative;
	display: inline-block;
}

.supplements1 {
	width: 50%;
	float: left;
}

.supplements1 div:first-child {
	top: 70px;
}

.supplements1 div:nth-child(2) {
	top: 295px;
    right: 175px;
}

.supplements1 div:nth-child(3) {
	    top: 570px;
    right: 280px;
}

.supplements1 div:last-child {
	    top: 810px;
    right: 380px;
}

.supplements2 {
	width: 50%;
	float: right;
}

.supplements2 div:first-child {
	top: 50px;
    left: 380px;
}

.supplements2 div:nth-child(2) {
	    top: 290px;
    left: 300px;
}

.supplements2 div:nth-child(3) {
	    top: 520px;
    left: 230px;
}

.supplements2 div:nth-child(4) {
	top: 715px;
    left: 100px;
}

.supplements2 div:last-child {
	    top: 780px;
    left: 280px;
}

.humanBody {
	padding-top: 20px;
	text-align: center;
}

h2{
	font-size: 22px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="humanBody">
		<h2>신체부위별 영양소 추천</h2>
		<div id="mainBody" align="center">
			<div class="supplements1">
				<div class="supplementsImg1">
					<img>
				</div>
				<div class="supplementsImg2">
					<img>
				</div>
				<div class="supplementsImg3">
					<img>
				</div>
				<div class="supplementsImg4">
					<img>
				</div>
			</div>

			<div class="supplements2">
				<div class="supplementsImg5">
					<img>
				</div>
				<div class="supplementsImg6">
					<img>
				</div>
				<div class="supplementsImg7">
					<img>
				</div>
				<div class="supplementsImg8">
					<img>
				</div>
				<div class="supplementsImg9">
					<img>
				</div>
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
			
			var hairArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/1.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/3.png"];
			var brainArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/7.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/13.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/19.png"];
			var eyesArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/31.jpeg", "<%=request.getContextPath()%>/uploadFiles/productUpload/33.jpeg", "<%=request.getContextPath()%>/uploadFiles/productUpload/27.png"];
			var skinArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/43.jpeg", "<%=request.getContextPath()%>/uploadFiles/productUpload/45.jpg", "<%=request.getContextPath()%>/uploadFiles/productUpload/47.jpg"];
			var muscleArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/15.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/17.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/19.png"];
			var lungsArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/29.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/9.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/23.png"];
			var heartArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/9.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/11.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/13.png"];
			var stomachArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/37.jpeg", "<%=request.getContextPath()%>/uploadFiles/productUpload/39.jpeg", "<%=request.getContextPath()%>/uploadFiles/productUpload/41.jpeg"];
			var boneArr = ["<%=request.getContextPath()%>/uploadFiles/productUpload/21.png", "<%=request.getContextPath()%>/uploadFiles/productUpload/7.png"];
			
			$(".supplementsImg1 img").attr("src", eyesArr[eyesRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct5";
			});
			$(".supplementsImg2 img").attr("src", skinArr[skinRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct7";
			});
			$(".supplementsImg3 img").attr("src", muscleArr[muscleRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct3";
			});
			$(".supplementsImg4 img").attr("src", lungsArr[lungsRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct2";
			});
			$(".supplementsImg5 img").attr("src", hairArr[hairRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct";
			});
			$(".supplementsImg6 img").attr("src", brainArr[brainRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct4";
			});
			$(".supplementsImg7 img").attr("src", heartArr[heartRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct6";
			});
			$(".supplementsImg8 img").attr("src", stomachArr[stomachRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct7";
			});
			$(".supplementsImg9 img").attr("src", boneArr[boneRandn]).on("click", function(){
				location.href="<%=request.getContextPath()%>/goProduct3";
			});
		});
	</script>
</body>
</html>