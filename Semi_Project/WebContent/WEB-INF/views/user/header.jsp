<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<style>
#header {
	border-bottom: 1px solid #9a9a9a;
	padding:8px;
}

.wrap {
	background: white;
	width: 100%;
	height: 50px;
}

.mainMenu {
	background: white;
	color: gray;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
	width: 150px;
	height: 50px;
	display: table-cell;
}

.mainMenu:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

.mainLogo {
	float: left;
	margin-right: 100px;
	margin-left: 30px;
	clear: both;
}

hr {
	margin-top: 8px;
}
</style>
<div id="header">
	<div class="wrap">
		<nav>
			<div>
				<a href="<%=request.getContextPath()%>"><img class="mainLogo"
					src="<%=request.getContextPath()%>/images/mainlogo.png"
					width="100px" height="50px" alt="My Image"></a>
			</div>
			<div class="mainMenu" id="goProduct">제품보기</div>
			<div class="mainMenu" id="goCommunity">커뮤니티</div>
			<div class="mainMenu" id="goCart">장바구니</div>
			<div class="mainMenu" id="goMypage">마이페이지</div>
			
			
			<!-- 로그인 했을 때랑 안했을 때 헤더 다른 건 ifelse문으로 헤더 처리 해주세요...-->
			<!-- 아이디: 'update.do' < 이런 식으로 설정해주세요 아래 이동 스크립트문 걸어놨습니다! -->
			<% if(loginUser == null){ %>
				<div class="mainMenu" id="login">로그인</div>
			<% } else{%>
				<div class="mainMenu" id="login">로그아웃</div>
			<% } %>
			<div class="mainMenu" id="goNotice">고객센터</div>

		</nav>
	</div>
</div>
<script>
	$('.mainMenu').on('click', function() {
		location.href='<%=request.getContextPath()%>/'+$(this).attr('id');
	});
</script>
