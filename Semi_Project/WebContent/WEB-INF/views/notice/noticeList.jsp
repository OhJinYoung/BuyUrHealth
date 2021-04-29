<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, notice.model.vo.*"%>
    <%
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항-리스트</title>
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
				<li id="goNotice">공지사항</li>
				<li id="goFaq">자주묻는질문</li>
				<li>Q&A</li>
				<li>약관및방침</li>
			</ul>
		</div>

		<div class="product-list">
			<div class="list-name">
				<span>공지사항</span>
				
				<%  if(loginUser != null && loginUser.getUserId().equals("admin")) {  %> 
						<!-- 로그인한 유저중 admin만 공지등록 버튼이 노출됨.  --> 
				<input type="button" onclick="location.href='noticeWrite.no'" id="test_btn1" value="공지등록">
				<%   }  %>  
				
				<hr>
			</div>

			<table class="listArea" align="center" id="listArea">
				<tr>
					<th>글번호</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">작성일</th>
				</tr>
				<% if(list.isEmpty()) {%>
				<tr>
					<td colspan="5">존재하는 공지사항이 없습니다.</td>
				</tr>
				<% } else {
					for(Notice n : list) {%>
					<tr>
					<td><%= n.getNoticeNo() %></td>
					<td><%= n.getNoticeTitle() %></td>
					<td><%= n.getNoticeWrtier() %></td>
					<td><%= n.getNoticeDate() %></td>
					</tr>
				<% } 
				  } %>
				
				
				
			</table>
		<br>
		 <div class="paging">
			<a href="#"><</a> 
			<a class="select" href="#">1</a> 
			<a href="#">2</a>
			<a href="#">3</a> 
			<a href="#">4</a> 
			<a href="#">></a>
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
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/noticelist.no";
		});
		
		$('#goNotice').on('click', function(){
			location.href="<%= request.getContextPath() %>/noticelist.no";
		});

		$('#goFaq').on('click', function(){
			location.href="<%= request.getContextPath() %>/faq.no";
		});
		
		$(function(){
			$('#listArea td').on({'mouseenter':function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/noticedetail.no?no='+num;
			}});
		});
	</script>
</body>
</html>