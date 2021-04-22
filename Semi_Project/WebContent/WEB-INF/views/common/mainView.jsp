<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
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
	.humanBody{width: 100%; height: 30%; text-align: center; display: inline-block;}
	.mainBody{width: 80%; height: 30%;}
	.nutrientCalc{text-align: center;}
	select[name=calcSelect]{width:20%; height:40px; margin:10px;}
	.nutrientIntro{display: inline-block; margin-left: 70px;}
	div.nutrientImg {
	    margin: 5px;
	    border: 1px solid #ccc;
	    float: left;
	    width: 180px;
	    text-align: center;
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
	.mainFootWrap{background: white; width: 100%; height: 100px; text-align: center; margin-top: 100px;}
	.mainFoot{background: white; text-align: center; font-weight: bold; 
			 vertical-align: middle; width: 150px; height: 30px; display: table-cell;
			 border: 1px inset black; border-radius: 2em 1em 4em / 0.5em 3em;
		}
	.mainFoot:hover {background: gray; color:blue; font-weight:bold; cursor:pointer;}
	
	.mainBottom{margin-top: -70px;}
	.buyurhealth{display: inline-block; vertical-align: top;}
	.cs{margin-left: 50px; margin-top: 8px; display: inline-block; vertical-align: top;}
	
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="<%= request.getContextPath() %>/images/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
			<div class="mainMenu" id="goViewProduct">제품보기</div>
			<div class="mainMenu" id="goCommunity">커뮤니티</div>
			<div class="mainMenu" id="goCart">장바구니</div>
			<div class="mainMenu" id="goMypage">마이페이지</div>
			<div class="mainMenu" id="login">로그인</div>
			<div class="mainMenu" id="goService">고객센터</div>
			<hr>
		</nav>
	</div>
	
	<div class="humanBody">
		<h2>신체부위별 영양소 추천</h2>
		<img class="mainBody" src="<%= request.getContextPath() %>/images/sample.png" alt="My Image">
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
	<h2>영양소 소개</h2>
	<div class="nutrientIntro">
		
		<div class="nutrientImg">
		  <a target="_blank" href="fjords.jpg">
		    <img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" alt="My Image">
		  </a>
		  <div class="desc">비타민C</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="forest.jpg">
		    <img src="<%= request.getContextPath() %>/images/vitamin_d.jpg" alt="My Image">
		  </a>
		  <div class="desc">비타민D</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="lights.jpg">
		    <img src="<%= request.getContextPath() %>/images/lactobacillus.jpg" alt="My Image">
		  </a>
		  <div class="desc">유산균</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/vitamin_a.jpg" alt="My Image">
		  </a>
		  <div class="desc">비타민A</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/omega-3_acid.jpg" width="300" height="200" alt="My Image">
		  </a>
		  <div class="desc">오메가-3 지방산</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/choline.jpg" width="300" height="200" alt="My Image">
		  </a>
		  <div class="desc">콜린</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/cysteine.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">시스테인</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/folic_acid.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">엽산</div>
		</div>
		
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/biotin.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">바이오틴(비타민B7)</div>
		</div>
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/pantothenic_acid.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">판토텐산(비타민B5)</div>
		</div>	
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/niacin.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">나이아신</div>
		</div>	
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/phytic_acid.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">이노시톨</div>
		</div>	
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/pyritinol.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">피리독신(비타민B6)</div>
		</div>	
		<div class="nutrientImg">
		  <a target="_blank" href="mountains.jpg">
		    <img src="<%= request.getContextPath() %>/images/magnesium_citrate.jpg" width="10%" height="10%" alt="My Image">
		  </a>
		  <div class="desc">구연산 마그네슘</div>
		</div>	
	</div>
	<div class="mainFootWrap">
		<nav>
			<div class="mainFoot">이용약관</div>
			<div class="mainFoot">개인정보처리방침</div>
			<div class="mainFoot">고객센터</div>
			<hr>
		</nav>
	</div>
	
	<div class="mainBottom">
		<div class="buyurhealth">
		<h4>BuyUrHealth</h4>
			<p> 강건강 <em>|</em> <span>조원: 김도영, 김채원, 이새린</span><em>|</em> <span>조장: 오진영</span><br/><span>강사님: 박신우</span></p>
			<p><span>서울특별시 강남구 선릉로 661, 3층 303호</span>
				<em class="only-pc">|</em><br class="only-mobile"/>
				<span>연구소: 서울 강남구 선릉로 661, 석영빌딩 303호</span>
			</p>
			<p><span>통신판매업신고: 제 2020-서울강남-03029 호 
				<a class="link" href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=7598700821" target="_blank">사업자정보확인</a></span><br/>
				<span>유통판매업신고: 제 2018-0107314 호</span><br/>
				<span>건강기능식품판매업신고: 제 2018-0107318 호</span>
			</p>
		</div>
		<div class="cs">
		<h4>고객센터</h4>
			<p><span>고객문의: <a href="mailto:cs@carewith.us">cs@carewith.us</a></span><em>|</em>
				<span>전화: <a href="tel://02-6203-9810">02-6203-9810</a></span>
			</p>
			<p><span>제휴문의: <a href="mailto:marketing@carewith.us">marketing@carewith.us</a></span><em>|</em>
				<span>전화: <a href="tel://02-6203-9811">02-6203-9811</a></span>
			</p>
		</div>
	</div>
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/updateMyPage.me";
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
	</script>
</body>
</html>