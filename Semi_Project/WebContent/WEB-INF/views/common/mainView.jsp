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
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.nutrientIntro{display: inline-block; margin-left: 70px;}
	
	div.nutrientImg {
	    margin: 5px;
	    border: 1px solid #ccc;
	    float: left;
	    width: 180px;
	    text-align: center;
	    cursor:pointer;
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
	
	.mainFootWrap{background: white; width: 100%; height: 100px; 
		text-align: center; margin-top: 100px;
	}
	
	.mainFoot{
		background: white; text-align: center; font-weight: bold; 
		vertical-align: middle; width: 150px; height: 30px; 
		display: table-cell; border: 1px inset black; border-radius: 2em 1em 4em / 0.5em 3em;
		cursor:pointer;
	}
	
	.mainFoot:hover {
		background: gray; color:blue; font-weight:bold; 
		cursor:pointer;
	}
	
	.mainBottom{margin-top: -70px;}
	
</style>
</head>
<body>
	<% if(authority == null) {%>
		<%@include file="../title_header.jsp"  %>
	<% } else if(authority.getAuthority() == 'Y') {%>
		<%@include file="../admin/header.jsp"%>
	<% } else if(authority.getAuthority() == 'N') {%>
		<%@include file="../title_header.jsp"  %>
	<% } %>
	
	
	<%@include file="humanBody.jsp"%>
	
	<%@include file="nutrientCalc.jsp"%>
	
	<h2 align="center" style="margin-top: 100px;">영양소 소개</h2>
	<div class="nutrientIntro">
		
		<div class="nutrientImg">
			<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" id="vitamin_c" alt="My Image">
		  	<div class="desc">비타민C</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/vitamin_d.jpg" id="vitamin_d" alt="My Image">
		    <div class="desc">비타민D</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/lactobacillus.jpg" id="lactobacillus" alt="My Image">
		    <div class="desc">유산균</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/vitamin_a.jpg" id="vitamin_a" alt="My Image">
		    <div class="desc">비타민A</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/omega-3_acid.jpg" width="300" height="200" id="omega3_acid" alt="My Image">
		    <div class="desc">오메가-3 지방산</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/choline.jpg" width="300" height="200" id="choline" alt="My Image">
		    <div class="desc">콜린</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/cysteine.jpg" width="10%" height="10%" id="cysteine" alt="My Image">
		    <div class="desc">시스테인</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/folic_acid.jpg" width="10%" height="10%" id="folic_acid" alt="My Image">
		    <div class="desc">엽산(비타민B9)</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/biotin.jpg" width="10%" height="10%" id="biotin" alt="My Image">
		    <div class="desc">바이오틴(비타민B7)</div>
		</div>
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/pantothenic_acid.jpg" width="10%" id="pantothenic_acid" height="10%" alt="My Image">
		    <div class="desc">판토텐산(비타민B5)</div>
		</div>	
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/niacin.jpg" width="10%" height="10%" id="niacin" alt="My Image">
		    <div class="desc">나이아신(비타민B3)</div>
		</div>	
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/phytic_acid.jpg" width="10%" height="10%" id="phytic_acid" alt="My Image">
		    <div class="desc">이노시톨</div>
		</div>	
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/pyritinol.jpg" width="10%" height="10%" id="pyritinol" alt="My Image">
		    <div class="desc">피리독신(비타민B6)</div>
		</div>	
		
		<div class="nutrientImg">
		    <img src="<%= request.getContextPath() %>/images/magnesium_citrate.jpg" width="10%" height="10%" id="magnesium_citrate" alt="My Image">
		    <div class="desc">구연산 마그네슘</div>
		</div>	
	</div>
	
	<script>
		$('.nutrientImg').on('click', function(){
			var url = $(this).children('img').attr('id');
			window.open("<%= request.getContextPath() %>/popup/" + url + '.html', "a", "width=600, height=400, left=100, top=50 resizable=no");
		});
	</script>

	<div class="mainFootWrap">
		<nav>
			<div class="mainFoot" onclick="goRules1();">이용약관</div>
			<div class="mainFoot" onclick="goRules2();">개인정보처리방침</div>
			<div class="mainFoot" onclick="qalist();">고객센터</div>
		</nav>
	</div>
	
	<div class="mainBottom">
		<%@include file="footer.jsp"%>
	</div>
	
	<script>
		function goRules1(){
			location.href='<%=request.getContextPath()%>/goRules';
		}
		
		function goRules2(){
			location.href='<%=request.getContextPath()%>/goRules2';
		}
		
		function qalist(){
			location.href='<%=request.getContextPath()%>/goQNA';
		}
	</script>
	
</body>
</html>