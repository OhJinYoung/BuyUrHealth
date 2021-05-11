<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"
	import="notice.model.vo.Notice"%>
<%@ page import="java.util.ArrayList"%>
<%
	Notice notice = (Notice) request.getAttribute("notice");
Member authority = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품보기</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
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

/* 공지등록 */
.notice-detail {
	position: center;
	width: auto;
	box-sizing: border-box;
}

.notice-detail2 {
	table-layout: fixed
}

.notice-detail th {
	text-align: left;
	width: 60px;
	padding-left: 10px;
}

.notice-detail p {
	padding-left: 10px;
	padding-right: 10px;
}

.notice-detail2 {
	border-spacing: 15px;
	border-collapse: collapse;
}

.notice-detail2 tr {
	border-bottom: 1px solid #ccc;
	height: 40px;
	font-size: 18px;
}

#btn {
	background-color: orange;
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
	align: center;
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
			<hr>
		</div>
		<div class="notice-detail">
			<div align="center">
				<form action="noticeupdate.no" id="detailForm" name="detailForm" method="post">
					<table class="notice-detail2">
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="hidden" size="50" name="no"
								value="<%=notice.getNoticeNo()%>"> <input
								type="hidden" size="50" name="title"
								value="<%=notice.getNoticeTitle()%>"><%=notice.getNoticeTitle()%></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td width="410px"><%=notice.getNoticeWrtier()%> <input
								type="hidden" name="noticeWrtier"
								value="<%=notice.getNoticeWrtier()%>"></td>
							<th>작성일</th>
							<td><input type="hidden" name="date"
								value="<%=notice.getNoticeDate()%>"><%=notice.getNoticeDate()%></td>

						</tr>
						<tr>
							<th>내용</th>
						</tr>
						<tr>
							<td colspan="4"><textarea name="content" rows="20" cols="80"
									readonly><%=notice.getNoticeContent()%></textarea></td>
						</tr>
					</table>
					<div align="center">
						<%
							if (authority != null && authority.getUserId().equals("admin")) {
						%>
						<input type="submit" id="btn" class="updateBtn" value="수정">
						<input type="button" id="btn" class="deleteBtn" value="삭제">
						<%
							}
						%>
						<input type="button"
							onclick="location.href='<%=request.getContextPath()%>/goNotice'"
							id="btn" value="목록">
					</div>
				</form>
			</div>
		</div>
	</div>
	<Script>
	$('.deleteBtn').on('click', function(){
		var bool = confirm('정말 삭제하시겠습니까?');
		
		if(bool) {
			location.href='<%=request.getContextPath()%>/noticedelete.no?no='+<%=notice.getNoticeNo()%>;
				}
				});
	</Script>
</body>
</html>