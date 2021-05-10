<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, QABoard.model.vo.*, member.model.vo.Member"%>
<%
	ArrayList<QABoard> list = (ArrayList<QABoard>)request.getAttribute("list");
	QABoard b = new QABoard();
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<%
	Member authority = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html{
		min-width: 1000px;
	}
	
	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#service-menubar-name { 
		text-align: center; 
		font-size: 20px;
	}
	
	.service-menubar ul, li {
		list-style: none; 
		padding: 10px; margin: 0; text-align: center;
	}
	
	.service-menubar {
        width: 170px;
        max-width: 170px;
        padding: 20px;
        margin-top: 14px; 
        float: left;
        position: absolute;
        min-height: 100%;
        overflow: auto;
	}
	
	.qa.data{
	    width: 85%;
        margin-top: 30px; 
        margin-right: 10px;
		position: absolute; /* 없애지 말 것 */
		margin-left: 200px;
	}
	
	.qa.head{
		width: 98%; float: left; margin-left: 30px; 
		margin-top: 15px;
	}
	
	h3{
		color: black; 
		margin: 0px auto;
		font-size: 20px;
		margin-left: 15px;
	}
	
	.item:hover {
	    border: 1px solid #777;
	    /* background: lightblue; */
	}
	.itemTitle{
		margin: 5px;
		margin-top: 10px;
	}
	
	.subdiv{
		margin-left: 15px;
		margin: 0px auto;
		float: left;
	}
	
	.buttondiv{
		float: right;
	}
	
	.line{
		border-bottom: 2px solid gray;
		width: 100%;
		display: flex; align-items: center; justify-content: center;
	}
	
	.button {
    	background-color: #FFC83D;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 10px 30px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
	th{
		border-bottom: 5px solid grey;
		padding-bottom: 5px;
	}
	
	td{
		padding-top: 7px;
		padding-bottom: 7px;
	}
	
	#listArea{
		text-align: center; 
		width: 95%;
	}
	
	.tableArea{
		width:100%; 
		min-height:350px; 
		margin-left:auto;	
		margin-right:auto;
		margin-top: 10px;
		float: left;
		padding-bottom: 10px; 
		display: inline-block;
	    text-align: center;
	    margin-left: 10px;
	}
	
	
	li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	
	.pagingArea button{width: 30px; height: 30px;}
	#pagingArea button:hover {
		cursor: pointer;
		background: #d6d6d6;
	}
	.buttonArea{margin-right: 50px;}
	.buttonArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	#numBtn{background: lightgray;}
	#choosen{
		background: orange;
		color: white;
		cursor: default !important;
	}
	#choosen:hover {
	background: orange !important
	}
	#listArea{margin: auto;}
	
	.none{
		display: none;
	}
	
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<div class="service-menubar">
	<hr>
		<h2 id="service-menubar-name">Q&A</h2>
	<hr>
		<ul>
			<li class="servicemenu" id="noticelist.no">공지사항</li>
			<li class="servicemenu" id="faq.no">자주묻는질문</li>
			<li><b>Q&A</b></li>
			<li class="servicemenu" id="goRules">약관 및 방침</li>
		</ul>
	</div>
	
	<div class="qa data">
	
		<div class="qa head">
			<div class="subdiv">
				<h3>고객센터>Q&A</h3>
			</div>
			<div class="buttondiv">
				 
				<button class="button" onclick="location.href='<%= request.getContextPath() %>/QABoardWriteForm.bo'">문의하기</button>
				 
			</div>
			<br>
			<div class="line"></div>
		</div>
		
		<div class="tableArea">
			<table id="listArea">
				<tr>
					<th class="none"></th>
					<th width="15%">작성일</th>
					<th width="70%">글제목</th>
					<th width="15%">상태</th>
				</tr>
				
			<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="3">조회된 리스트가 없습니다.</td>
				</tr>
			<% } else { 
				for (QABoard bo : list){ %>
				<tr>
					<td class="none"><%= bo.getQaNo() %></td>
					<td><%= bo.getQaQuestionDate() %></td>
					<td><%= bo.getQaTitle() %></td>
					<% if(bo.getQaAnswer() != null) { %>
						<td>답변완료</td>
					<% } else { %>
						<td>답변대기</td>
				<% } %>
			<% } %> 
				</tr>
			<% } %> 
			</table>
		</div>
	
		<!-- 페이징 -->
		 <div class="pagingArea" align="center">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/qalist.bo?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/qalist.bo?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', true);
				}
			</script>
			
			<!-- 숫자 버튼 -->
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage){
			%>
			<button id="choosen" disabled><%= p %></button>
			<%		
				} else {
			%>
			<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/qalist.bo?currentPage=<%= p %>'"><%= p %></button>			
			<% } %>
			<% } %>				
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/qalist.bo?currentPage=<%= currentPage+1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', true);
				}
			</script>
			
			<!-- 맨 뒤로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/qalist.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		</div>
		
		
		<script>
			$(function(){
				$('#listArea td').on({'mouseenter':function(){ 
					$(this).parent().css({'background': 'lightsky', 'cursor':'pointer'});
				}, 'mouseout':function(){
					$(this).parent().css('background', 'none');
				}, 'click':function(){
					var num = $(this).parent().children().eq(0).text();
					location.href='<%= request.getContextPath() %>/QADetail.bo?bId=' +  num; 
				}}); 
			});
			
			$('.servicemenu').on('click', function() {
				var id = $(this).attr('id');
				location.href='<%=request.getContextPath()%>/' + id;
			});
		</script>
	</div>
</body>
</html>