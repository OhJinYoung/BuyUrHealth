<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, Board.model.vo.*, member.model.vo.Member, Board.model.vo.Community, Board.model.vo.PageInfo"%>
   
<%
    Member authority = (Member) session.getAttribute("loginUser");
    ArrayList<Community> cList = (ArrayList<Community>)request.getAttribute("cList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>

.listArea {
	margin: auto;
	border-collapse: collapse;
	float: center;
}

.listArea tr {
	height: 40px;
	border-bottom: 1px solid #ccc;
}

.listArea th {
	font-size: 18px;
}

.listArea td {
	font-size: 15px;
	text-align: center;
}

	.outer{width:1000px; height:700px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.thumbnailArea {width:760px; height:550px; margin-left:auto; margin-right:auto;}
	.buttonArea {width:80px; margin-left:auto; margin-right:auto; position: bottom;}
	.thumb-list {width:220px; border:1px solid white; display:inline-block; margin:10px; align:center;}
	.thumb-list:hover {opacity:0.8; cursor:pointer;}
	#insertBtn{background: #FFC83D;border: 1px solid white;  color: white; font-weight: bold; cursor: pointer;  letter-spacing: -1px;  padding: 10px 30px;
	margin: 2px 3px; width: auto; word-break: keep-all; border-radius: 5px; text-decoration: none; font-size: 0.9375em;}
</style>

</head>
<body>
	<%@include file="../title_header.jsp"  %>
	<div class="outer">
		
		<h2 align="center">커뮤니티</h2>
		<br>
		<div class="thumbnailArea">
		
		<table class="listArea" id="listArea">
			<tr>
				<th width="300px">글번호</th>
				<th width="300px">글제목</th>
				<th width="100px">작성자</th>
				<th width="100px">작성일</th>
			</tr>
			<% if(cList.isEmpty()) {%>
			<tr>
				<td colspan="4">존재하는 게시글이 없습니다.</td>
			</tr>
			<% } else {
					for(Community c : cList) {%>
			<tr>
				<td><%= c.getCommNo() %></td>
				<td><%= c.getCommTitle() %></td>
				<td><%= c.getUserNo() %></td>
				<td><%= c.getCommDate() %></td>
			</tr>
			<% } 
				  } %>
		</table>
		<br>
		
		<!--  로그인 했을때 '글쓰기작성하기' 버튼 나타남 -->
		<div class="buttonArea">
			<% if(loginUser != null) { %>
				<input type="button" onclick="location.href='communityWriteThumbForm.th'" id="insertBtn" value="작성하기">
			<% } %>
		</div>
	</div>
	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				if('<%=loginUser%>'=='null')
				{
					alert('로그인을 먼저 해주세요.');
					location.href="<%= request.getContextPath() %>/login"
				} else{
					var bId = $(this).children().children().eq(0).val();
	
					location.href="<%= request.getContextPath() %>/detail.th?bId=" + bId; 
				}
			});
		});
		
		$(function(){
			$('#listArea td').on({'mouseenter':function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
			}, 'mouseout':function(){
				$(this).parent().css('background', 'none');
			}, 'click':function(){
				var num = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/detail.th?bId='+num;
			}});
		});
		
	</script>
</body>
</html>