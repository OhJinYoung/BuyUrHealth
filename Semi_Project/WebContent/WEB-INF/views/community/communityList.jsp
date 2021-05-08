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
	.buttonArea {width:80px; margin-left:auto; margin-right:auto;}
	.thumb-list {width:220px; border:1px solid white; display:inline-block; margin:10px; align:center;}
	.thumb-list:hover {opacity:0.8; cursor:pointer;}
	#insertBtn{background: #B2CCFF;}
</style>
</head>
<body>
	<%@include file="../title_header.jsp"  %>
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<div class="thumbnailArea">
		
	 <% if(cList.isEmpty()){ %>  
			<!-- 둘 중 하나라도 비어있으면 -> 등록된 사진x -->
			등록된 사진이 없습니다.
			<% } else { %>
				<!-- bList가 몇개가 들어있는지 모르니까 for문 돌리기 / get메소드 이용해서(i) 뽑아오기 -->
				<% for(int i = 0; i < cList.size(); i++){ %>
				<% Community c = cList.get(i); %> 
					<div class="thumb-list" align="center">
						<div>
							<!-- 상세조회까지 할꺼니까 -> BoardId도 넣어주기, name도 필요 -->
							<input type="hidden" name="bId" value="<%= c.getCommNo() %>">
							<!-- 안에 또 for문을 돌리는데 -> i라고 쓰면 오류남!!  -->
							<% for(int j = 0; j < fList.size(); j++){ %>
								<% AddFile a = fList.get(j); %>
								<!--  BoardId -> 게시판번호 고유, 중복 x getCommNO 에 맞춰서 썸네일을 매칭시켜 줘야하니까 / 안에 이미지 들어감-->
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
				<input type="button" onclick="location.href='writeThumbForm.th'" id="insertBtn" value="작성하기">
			<% } %>
		</div>
	</div>
	
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				var bId = $(this).children().children().eq(0).val();

		
				location.href="<%= request.getContextPath() %>/detail.th?bId=" + bId; 
	
			});
		});
	</script>
</body>
</html>