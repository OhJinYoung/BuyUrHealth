<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.*, java.util.*"%>
<%
	Community = (Community)request.getAttribute("Community");
	ArrayList<AddFile> fileList = (ArrayList<AddFile>)request.getAttribute("fileList");
	AddFile titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px; height:735px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.detail{text-align:center;}
	.detail th, .detail td{width: 1000px; padding: 10px; background: rgba(255, 255, 255, 0.4);}
	.detail th{background: white;}
	#titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
	#contentArea{height:30px;}
	.detailImgArea{width:250px; height:210px; margin-left:auto; margin-right:auto;}
	#titleImg{width:500px; height:300px;}
	.detailImg{width:250px; height:180px;}
	.downBtn{background: #D1B2FF;}
	#thumbTable{margin: auto;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<table class="detail" id="thumbTable">
			<tr>
				<th width="50px">제목</th>
				<td colspan="5"><%= c.getCommTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= c.userNo() %></td>
				<th>조회수</th>
				<td><%= c.getCommCount() %></td>
				<th>작성일</th>
				<td><%= c.getModifyDate() %></td>
			</tr>
			<tr>
				<th>대표<br>사진</th>
				<td colspan="4">
					<%-- <!--  thumbnail_uploadFiles에는 rename된게 들어가있기 때문에, 대표사진이니까 titleImg로해서 .getChangeName 가져옴 --> --%>
					<div id="titldImgArea" align="center">
						<a href="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>"
							download="<%= titleImg.getOriginName() %>">
							<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>">
						</a>
						<%-- 이미지 자체를 a태그로 감싸줌, 이미지 다운로드를  getChangeName()로하면 바뀐이름으로 저장되고 getOriginName()하면 원래이름으로 저장됨 --%>	
					</div>
				</td>
			</tr>
			<tr>
				<th>사진<br>메모</th>
				<td colspan="6">
					<p id="contentArea">
						<%= c.getCommContent() %>
					</p>
				</td>
			</tr>
		</table>
		
		<table class="detail">
			<tr>
				<% for(int i = 1; i < fileList.size(); i++){ %>
					<td>
						<%-- 이미지 다운받을 수 잇게하려면 a태그 안에 넣어주는게 좋음 --%> 
						<div class="detailImgArea">
							<a href="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>"
								download="<%= fileList.get(i).getOriginName() %>">
								<img id="detailImg<%= i %>" class="detailImg" 
									src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>">
							</a>
						</div>
					</td>
				<% } %>
			</tr>
		</table>
	</div>
</body>
</html>