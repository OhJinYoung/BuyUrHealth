<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="QABoard.model.vo.QABoard, QABoard.model.vo.QAFile, java.util.ArrayList" %>
<% 
	QABoard qab = (QABoard)request.getAttribute("qaboard");
	ArrayList<QAFile> qaf = (ArrayList<QAFile>)request.getAttribute("qafile"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {
	    min-height: 1000px; 
	    min-width: 1000px; 
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
	
	li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	
	.qa.data{
	    width: 85%;
		float: right;
        margin-top: 30px; 
        margin-right: 10px;
		position: absolute; 
		margin-left: 200px;
	}
	.qa.head{
		width: 98%; float: left; margin-left: 30px; 
		margin-top: 15px;
		/* background: lightpink; */
	}
	
	h3{
		color: black; 
		margin: 0px auto;
		font-size: 20px;
		margin-left: 15px;
		margin-bottom: 7px;
	}
	
	.line{
		border-bottom: 2px solid gray;
		width: 100%;
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
		border-bottom: 1px solid grey;
	}
	
	#listArea{
		width: 95%;
	}
	
	.qa.body{
		width: 90%; 
		min-height:350px; 
		margin-top: 10px;
		float: left;
		padding-bottom: 10px; 
	    margin-left: 50px;
	}
	
	table{
    	width: 95%;
    	border-bottom: 3px solid gray;
    	margin-bottom: 30px;
    }
    
    label{
    	font-size: 20px;
    	margin-right: 10px;
    }
    
    select{
    	width: 200px;
		padding: .8em .5em;
		border: 1px solid #999;
    }
    
    td{
    	padding: 10px;
    }
    
    #qaTitle{
    	width: 100%;
		height: 43px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		font-size: 16px;
		resize: none;
		background: lightgray;
    }
    
    #qaContent{
    	width: 100%;
		min-height: 500px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		font-size: 16px;
		resize: both;
		font-align: left;
		overflow: auto;
		resize: none;
		background: lightgray;
    }
    
    #anContent{
    	width: 100%;
		min-height: 500px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		font-size: 16px;
		resize: both;
		font-align: left;
		overflow: auto;
		resize: none;
		background: lightgray;
    }
    
    #deleteButton{
    	background-color: #FFC83D;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 20px;
        margin: 3px 4px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
        float: right;
    }
    
    #goListBtn{
        float: right;
    	background-color: #FFC83D;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 20px;
        margin: 3px 4px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
    #updateBtn{
        float: right;
    	background-color: #E81224;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 20px;
        margin: 3px 4px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
    #writeDate{
    	font-size: 16px;
    	float: right;
    }
    #answerDate{
    	font-size: 16px;
    	float: right;
    }
    
    #titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
	#titleImg{width:500px; height:300px;}
    
    
    
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<div class="service-menubar">
	<hr>
		<h2 id="service-menubar-name">약관 및 방침</h2>
	<hr>
		<ul>
			<li class="servicemenu" id="">공지사항</li>
			<li class="servicemenu" id="">자주묻는질문</li>
			<li><b>Q&A</b></li>
			<li class="servicemenu" id="goRules">약관 및 방침</li>
		</ul>
	</div>
	<form action="<%= request.getContextPath() %>/updateQABoardForm.bo" id="detailForm" method="post">
	<div class="qa data">
	
		<div class="qa head">
			<div class="subdiv">
				<h3>고객센터>Q&A</h3>
			</div>

			<div class="line"></div>
		</div>
		
		<div class="qa body">
			<table>
				<tr>
					<td>
						<label>분류</label>
						<input type="hidden" size="50" name="bId" value="<%= qab.getQaNo() %>">
						<input type="hidden" size="50" name="category" value="<%= qab.getQacateName() %>">
						<%= qab.getQacateName() %>
						<label id="writeDate">작성일 : <%= qab.getQaQuestionDate() %></label>
						<input type="hidden" size="50" name="date" value="<%= qab.getQaQuestionDate() %>">
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" size="50" name="title" value="<%= qab.getQaTitle() %>">
						<div id="qaTitle"><%= qab.getQaTitle() %></div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="qaContent">
						<input type="hidden" name="content" cols="60" rows="15" style="resize:none;" value="<%= qab.getQaContent() %>" readonly><%= qab.getQaContent() %>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label>첨부파일</label>
						<% if(qaf.isEmpty()) {%>
						첨부파일이 없습니다.
						<% } else { %>
						<a href="<%= request.getContextPath() %>/uploadFiles/qafile_uploadFiles/<%= qaf.get(0).getFileChangeName() %>" target='_blank'><%= qaf.get(0).getFileChangeName() %></a>
						<% } %>
						<% if(qab.getQaAnswer() == null){ %>
						<input type="submit" id="updateBtn" value="수정">
						<input type="button" id="deleteButton" onclick="deleteQNA();" value="삭제">
						<input type="button" id="goListBtn" onclick="location.href='<%= request.getContextPath() %>/qalist.bo'" value="목록">
						<% } else { %>
						<input type="button" id="goListBtn" onclick="location.href='<%= request.getContextPath() %>/qalist.bo'" value="목록">
						<% } %>
					</td>
				</tr>
			</table>
			
			
			<% if(qab.getQaAnswer() != null){ %>
			<table>
				<tr>
					<td>
						<label>답변</label>
						<label id="answerDate">작성일 : <%= qab.getQaAnswerDate() %></label>
						<input type="hidden" size="50" name="answerDate" value="<%= qab.getQaAnswerDate() %>">
					</td>
				</tr>
				<tr>				
					<td>
						<div id="anContent">
						<input type="hidden" name="anContent" cols="60" rows="15" style="resize:none;" value="<%= qab.getQaAnswer() %> %>" readonly><%= qab.getQaAnswer() %></textarea>
						</div>
					</td>
				</tr>
			</table>
			<% } %> 
		</div>
	</div>
	</form>
	
	<script>
	$('.servicemenu').on('click', function() {
		var id = $(this).attr('id');
		location.href='<%=request.getContextPath()%>/' + id;
	});
	
	function deleteQNA(){
		var bool = confirm("정말로 삭제하시겠습니까?");
		
		if(bool){
			location.href='<%= request.getContextPath() %>/QADelete.bo?bId=' + <%= qab.getQaNo() %>;
		}
	};
	

	</script>
</body>
</html>