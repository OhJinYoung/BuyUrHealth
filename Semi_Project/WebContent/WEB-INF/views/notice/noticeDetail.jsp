<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" import="notice.model.vo.Notice"%>
    <%@ page import="java.util.ArrayList" %>
    <%
    	Notice notice = (Notice)request.getAttribute("notice");
    	Member loginUser = (Member)session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품보기</title>
<link rel="stylesheet" href="css/style.css">
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
	
		<div class="product-menubar">
			<hr>
			<h2 id="product-menubar-name">고객센터</h2>
			<hr>
			<ul>
				<li>공지사항</li>
				<li>자주묻는질문</li>
				<li>Q&A</li>
				<li>약관및방침</li>
			</ul>
		</div>

		<div class="product-list">
			<div class="list-name">
				<span>공지사항</span>
				<hr>
			</div>
			<div class="notice-detail">
				<div align="center">
					<form action="noticeupdate.no" id="detailForm" name="detailForm" method="post">
						<table class="notice-detail2">
							<tr>
								<th>제목</th>
								<td colspan="3">
								<input type="hidden" size="50" name="no" value="<%= notice.getNoticeNo() %>">
								<input type="hidden" size="50" name="title" value="<%= notice.getNoticeTitle() %>"><%= notice.getNoticeTitle() %></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td width="410px">
								<%= notice.getNoticeWrtier()  %>
								<input type="hidden" name="noticeWrtier" value="<%= notice.getNoticeWrtier()  %>">
								</td>
								<th>작성일</th>
								<td><input type="hidden" name="date" value="<%= notice.getNoticeDate() %>"><%= notice.getNoticeDate() %></td>
							
							</tr>
							<tr>
								<th>내용</th>
							</tr>
							<tr>
								<td colspan="4"><textarea name="content" rows="20" cols="80" readonly><%= notice.getNoticeContent() %></textarea></td>
							</tr>
						</table>
						<div align="center">
						<%  if(loginUser != null && loginUser.getUserId().equals("admin")) {  %> 
					<input type="submit" id="prod-submit" class="updateBtn" value="수정">
					<input type="button" id="prod-submit" class="deleteBtn" value="삭제">
						<% } %>
					<input type="button" onclick="location.href='javascript:history.go(-2);'" id="prod-submit" value="목록">
				</div>
					</form>
				</div>
			</div>
		</div>
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/prolist.no";
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; 
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no";
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no";
		});
		$('#goNotice').on('click', function(){
			location.href="<%= request.getContextPath() %>/noticelist.no";
		});

		$('#goFaq').on('click', function(){
			location.href="<%= request.getContextPath() %>/faq.no";
		});
	</script>
	<Script>
	$('.deleteBtn').on('click', function(){
		var bool = confirm('정말 삭제하시겠습니까?');
		
		if(bool) {
			location.href='<%= request.getContextPath() %>/noticedelete.no?no=' + <%= notice.getNoticeNo() %>;
		}
	});
	
	
	</Script>
</body>
</html>