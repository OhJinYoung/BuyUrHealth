<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
Member authority = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 틀</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
body{
	min-width: 1220px;
}
.nutrientIntro {
	padding-top: 40px;
}

div.nutrientImg {
	margin: 5px;
	border: 1px solid #ccc;
	width: 17%;
	text-align: center;
	cursor: pointer;
	display: inline-block;
}

div.nutrientImg:hover {
	border: 1px solid #777;
}

div.nutrientImg img {
	width: 150px;
	height: 100px;
}

div.desc {
	padding: 15px;
	text-align: center;
}

.mainFootWrap {
	text-align: right;
	padding: 30px 15px 15px 15px;
}

.mainFoot {
	display: inline-block;
	cursor: pointer;
	color: gray;
	border: 1px solid lightgray;
	border-radius: 2px;
	padding: 5px;
}

.mainFoot:hover {
	cursor: pointer;
	border-color: #777;
}

.mainBottom {
	margin-top: -70px;
}

.navigationBar {
	position: fixed;
	top: 600px;
	/* width: 100% */
	left: 1450px;
}

.navigationBar button {
	border: 1px solid skyblue;
	color: white;
	padding: 5px;
}

.navigationBar button:hover {
	color: white;
	background-color: gray;
}

#navigationBtn1 {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	background-color: rgb(232, 18, 36);
}

#navigationBtn1:hover {
	background-color: gray;
}

#navigationBtn2 {
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: rgb(255, 200, 61);
}

#navigationBtn2:hover {
	background-color: gray;
}

.mainFootWrap div {
	display: inline-block;
	padding-right: 5px;
}

#nutrientInfo{
	margin-left: 7%;
}
</style>
</head>
<body>
	<%
	if (authority == null) {
	%>
	<%@include file="../title_header.jsp"%>
	<%
	} else if (authority.getAuthority() == 'Y') {
	%>
	<%@include file="../admin/header.jsp"%>
	<%
	} else if (authority.getAuthority() == 'N') {
	%>
	<%@include file="../title_header.jsp"%>
	<%
	}
	%>

	<div id="top"></div>
	<%@include file="humanBody.jsp"%>
	<div id="bottom"></div>
	<%@include file="nutrientCalc.jsp"%>

	<div class="nutrientIntro">
	<h2 align="center">영양소 소개</h2>
	<div id="nutrientInfo">
		<div>
			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/vitamin_c.jpg"
					id="vitamin_c" alt="My Image">
				<div class="desc">비타민C</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/vitamin_d.jpg"
					id="vitamin_d" alt="My Image">
				<div class="desc">비타민D</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/lactobacillus.jpg"
					id="lactobacillus" alt="My Image">
				<div class="desc">유산균</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/vitamin_a.jpg"
					id="vitamin_a" alt="My Image">
				<div class="desc">비타민A</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/omega-3_acid.jpg"
					width="300" height="200" id="omega3_acid" alt="My Image">
				<div class="desc">오메가-3 지방산</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/choline.jpg"
					width="300" height="200" id="choline" alt="My Image">
				<div class="desc">콜린</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/cysteine.jpg"
					width="10%" height="10%" id="cysteine" alt="My Image">
				<div class="desc">시스테인</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/folic_acid.jpg"
					width="10%" height="10%" id="folic_acid" alt="My Image">
				<div class="desc">엽산(비타민B9)</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/biotin.jpg"
					width="10%" height="10%" id="biotin" alt="My Image">
				<div class="desc">바이오틴(비타민B7)</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/pantothenic_acid.jpg"
					width="10%" id="pantothenic_acid" height="10%" alt="My Image">
				<div class="desc">판토텐산(비타민B5)</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/niacin.jpg"
					width="10%" height="10%" id="niacin" alt="My Image">
				<div class="desc">나이아신(비타민B3)</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/phytic_acid.jpg"
					width="10%" height="10%" id="phytic_acid" alt="My Image">
				<div class="desc">이노시톨</div>
			</div>

			<div class="nutrientImg">
				<img src="<%=request.getContextPath()%>/images/pyritinol.jpg"
					width="10%" height="10%" id="pyritinol" alt="My Image">
				<div class="desc">피리독신(비타민B6)</div>
			</div>

			<div class="nutrientImg">
				<img
					src="<%=request.getContextPath()%>/images/magnesium_citrate.jpg"
					width="10%" height="10%" id="magnesium_citrate" alt="My Image">
				<div class="desc">구연산 마그네슘</div>
			</div>
		</div>
	</div>
</div>

	<script>
		$('.nutrientImg').on('click', function(){
			var url = $(this).children('img').attr('id');
			window.open("<%=request.getContextPath()%>/popup/" + url + '.html', "a", "width=600, height=400, left=100, top=50 resizable=no");
		});
	</script>

	<div class="mainFootWrap">
		<div>
			<p class="mainFoot" id="goRules">이용약관</p>
		</div>
		<div>
			<p class="mainFoot" id="goRules2">개인정보처리방침</p>
		</div>
		<div>
			<p class="mainFoot" id="goNotice">고객센터</p>
		</div>
	</div>

	<%@include file="footer.jsp"%>

	<div class="navigationBar">
		<button id="navigationBtn1">상단</button>
		<br>
		<button id="navigationBtn2">하단</button>
		<br>
	</div>

	<script>
		$('.mainFoot').click(function() {
			location.href='<%=request.getContextPath()%>/' + $(this).attr('id');
		});

		$('#navigationBtn1').click(function() {
			var offset = $('#top').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});

		$('#navigationBtn2').click(function() {
			var offset = $('#bottom').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});
	</script>

</body>
</html>