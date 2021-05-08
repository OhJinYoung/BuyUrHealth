<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
    <%@ page import="java.util.ArrayList, notice.model.vo.Notice" %>
    <%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    	Notice n = (Notice)request.getAttribute("n");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품보기</title>
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

/* 공지등록 */
.notice-upload {
	position: center;
	width: auto;
	box-sizing: border-box;
}

.notice-upload2 {
	table-layout: fixed
}

.notice-upload table th {
	text-align: left;
}

.notice-upload2 {
	border-spacing: 15px;
	border-collapse: collapse;
}

.notice-upload2 tr {
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
	<%@include file="../admin/header.jsp"%>
	<%@include file="customerCenterNav.jsp"%>

	<div class="notice-list">
		<div class="list-name">
			<span>공지수정</span>
			<hr>
		</div>
		<div class="notice-upload">
			<div align="center">
				<form action="<%= request.getContextPath() %>/update.no"
					method="post">
					<table class="notice-upload2">
						<tr>
							<th>| 제목</th>
							<td colspan="3"><input type="hidden" name="no"
								value="<%= n.getNoticeNo() %>"> <input type="text"
								name="title" value="<%= n.getNoticeTitle() %>"></td>
						</tr>
						<tr>
							<th>| 작성자</th>
							<td><%= n.getNoticeWrtier() %></td>

							<th>| 작성일</th>
							<td><input type="date" name="date"
								value="<%= n.getNoticeDate() %>"></td>
						</tr>
						<tr>
							<th>| 내용</th>
						</tr>
						<tr>
							<th colspan="4"><textarea name="content" rows="20" cols="80"><%= n.getNoticeContent() %></textarea></th>
						</tr>
					</table>
					<div>
						<input type="submit" id="btn" value="등록"> <input
							type="button" id="btn" value="취소"
							onclick="location.href='<%=request.getContextPath()%>/goNotice'">
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>