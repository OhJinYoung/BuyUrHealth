<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
	
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<style>

* {
	padding: 0px;
	margin: 0px;
}

#header {
	border-bottom: 1px solid #9a9a9a;
	padding: 8px;
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
			<div class="mainMenu" id="memberList.do">사용자 관리</div>
			<div class="mainMenu" id="orderList.do">주문 관리</div>
			<div class="mainMenu" id="goProduct">제품 관리</div>
			<div class="mainMenu" id="goNotice">고객센터</div>
			<%
			if (loginUser == null) {
			%>
			<div class="mainMenu" id="login">로그인</div>
			<%
			} else {
			%>
			<div class="mainMenu" id="logout">로그아웃</div>
			<%
			}
			%>
		</nav>
	</div>
</div>
<script>
	$('.mainMenu').on('click', function() {
		location.href='<%=request.getContextPath()%>/'+$(this).attr('id');
	});
</script>
