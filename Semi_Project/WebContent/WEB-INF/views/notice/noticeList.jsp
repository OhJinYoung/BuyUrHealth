<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, notice.model.vo.Notice, notice.model.vo.PageInfo"%>
    <%
    	Member authority = (Member) session.getAttribute("loginUser");
    	
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	PageInfo pi = (PageInfo) request.getAttribute("pi");
    	int listCount = pi.getListCount();
    	int currentPage = pi.getCurrentPage();
    	int maxPage = pi.getMaxPage();
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage();
    	
    	System.out.println(list);
    	System.out.println(pi);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항-리스트</title>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
/* 공지리스트 */
.notice-list {
	width: 70%;
	max-width: 900px;
	padding: 20px;
	margin-bottom: 10px;
	margin-top: 20px;
	float: left;
	border-left: 1px solid #bcbcbc;
	border-right: 1px solid #bcbcbc;
}

.notice-list span {
	font-size: 20px;
}

.list-name {
	margin: 10px;
	font-weight: bold;
	font-size: 30px;
}

.list-name span {
	margin: 0 0 0 10px;
}

/*공지사항 리스트*/
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

/* 페이징 */
.paging {
	text-align: center;
}

.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	color: #000;
	background-color: lightgray;
}

.paging a.select {
	color: #fff;
	background-color: orange;
}

#test_btn1 {
	background-color: orange;
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 5px;
	float: right;
}
</style>

</head>
<body>
	<% if(authority == null) {%>
		<%@include file="../title_header.jsp"  %>
	<% } else if(authority != null && authority.getUserId().equals("admin")) {%>
		<%@include file="../admin/header.jsp"%>
	<% } else if(authority != null && !authority.getUserId().equals("admin")) {%>
		<%@include file="../title_header.jsp"  %>
	<% } %>


	<%@include file="customerCenterNav.jsp"%>


	<div class="notice-list">
		<div class="list-name">
			<span>공지사항</span>

			<%  if(authority != null && authority.getUserId().equals("admin")) {  %>
			<!-- 로그인한 유저중 admin만 공지등록 버튼이 노출됨.  -->
			<input type="button" onclick="location.href='noticeWrite.no'"
				id="test_btn1" value="공지등록">
			<%   }  %>

			<hr>
		</div>

		<table class="listArea" id="listArea">
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
		<!-- 페이징 -->
		<div class="paging">
			<!-- 맨 처음으로 -->
			<a href="#"
				onclick="location.href='<%=request.getContextPath()%>/goNotice?currentPage=1'">&lt;&lt;</a>
			<!-- 이전 페이지로 -->
			<a href="#"
				onclick="location.href='<%=request.getContextPath()%>/goNotice?currentPage=<%=currentPage - 1%>'"
				id="beforeBtn">&lt;</a>
			<script>
			if(<%=currentPage%> <= 1 ) {
					var before = $('#beforeBtn');
					before.attr('disabled', ture);
				}
			</script>
			<!-- 숫자 버튼 -->
			<%
					for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
				%>
			<a class="select" href="#"><%=p%></a>
			<%
					} else {
				%>
			<a href="#" id="numBtn"
				onclick="location.href='<%=request.getContextPath()%>/goNotice?currentPage=<%=p%>'"><%=p%></a>
			<%
					}
				}
				%>
			<!-- 다음 페이지로 -->
			<a href="#"
				onclick="location.href='<%=request.getContextPath()%>/goNotice?currentPage=<%=currentPage + 1%>'"
				id="afterBtn">&gt;</a>
			<!-- 맨 뒤로 -->
			<a href="#"
				onclick="location.href='<%=request.getContextPath()%>/goNotice?currentPage=<%=maxPage%>'">&gt;&gt;</a>
		</div>
	</div>
	<script>
		
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