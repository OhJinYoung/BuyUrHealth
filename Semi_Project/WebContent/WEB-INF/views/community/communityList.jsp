<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, Board.model.vo.*, member.model.vo.Member"%>
<%
	ArrayList<Community> cList = (ArrayList<Community>)request.getAttribute("cList");
	ArrayList<AddFile> fList = (ArrayList<AddFile>)request.getAttribute("fList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
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
		<br>
		<h2 align="center">커뮤니티</h2>
		<div class="thumbnailArea">
		
	 <% if(cList.isEmpty()){ %>  
			등록된 사진이 없습니다.
			<% } else { %>
				<% for(int i = 0; i < cList.size(); i++){ %>
				<% Community c = cList.get(i); %> 
					<div class="thumb-list" align="center">
						<div>
							<input type="hidden" name="bId" value="<%= c.getCommNo() %>">
							<% for(int j = 0; j < fList.size(); j++){ %>
								<% AddFile a = fList.get(j); %>
								<% if(c.getCommNo() == a.getCommNo()){ %>
									<img src="<%= request.getContextPath() %>/uploadFiles/communityUpload/<%= a.getChangeName() %>" width="200px" height="150px">
								<% }  %>
							<% } %>
						</div>
						 
						<p>
							No. <%= c.getCommNo()%> <%= c.getCommTitle() %><br>
						</p>
					</div>
				<% } %>
			<% } %> 
		</div> 
		
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
	</script>
</body>
</html>