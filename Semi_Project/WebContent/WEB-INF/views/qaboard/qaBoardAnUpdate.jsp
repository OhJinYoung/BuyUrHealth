<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="QABoard.model.vo.QABoard, QABoard.model.vo.QAFile, java.util.ArrayList, java.io.*" %>
<% 
	QABoard qab = (QABoard)request.getAttribute("b"); 
	QABoard abo = (QABoard)request.getAttribute("abo"); 
	ArrayList<QAFile> qaf = (ArrayList<QAFile>)request.getAttribute("qafile"); 
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
	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#qaboard-menubar-name { 
		margin-top: 5px;
		text-align: center; 
		font-size: 20px;
	}
	
	.qaboard-menubar ul, li {
		list-style: none; 
		padding: 10px; 
		margin: 0; 
		text-align: center;
	}
	
	.qaboard-menubar {
        width: 170px;
        max-width:170px;
        padding: 20px;
        margin-top: 14px; 
        float: left;
        position: absolute;
        height: 100%;
        overflow: auto;
	}
	
	.qa.data{
	    width: 85%;
        margin-top: 30px; 
		position: absolute; /* 없애지 말 것 */
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
	
	.qa.data{
	    width: 85%;
		float: right;
        margin-top: 30px; 
        margin-right: 10px;
		position: absolute; 
		margin-left: 200px;
	}
	
	table{
    	width: 95%;
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
		border-radius: 5px;
		font-size: 16px;
		resize: both;
    }
    
    #qaContent{
    	width: 100%;
		min-height: 500px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		font-align: left;
		overflow: auto;
    }
    
    #cancelBtn{
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
    
    #enterBtn{
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
    
    li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	
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
		font-size: 16px;
		resize: both;
		font-align: left;
		overflow: auto;
		resize: none;
    }
    
    #writeDate{
    	font-size: 16px;
    	float: right;
    }
    
    
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<div class="qaboard-menubar">
	<hr>
		<h2 id="qaboard-menubar-name">고객센터</h2>
	<hr>
		<ul>
			<li class="servicemenu" id="goNotice">공지사항</li>
			<li class="servicemenu" id="goFAQ">자주묻는질문</li>
			<li class="servicemenu" id="goQNA"><b>Q&A</b></li>
			<li class="servicemenu" id="goRules">약관 및 방침</li>
		</ul>
	</div>


	<div class="qa data">
		<div class="qa head">
			<div class="subdiv">
				<h3>고객센터>Q&A</h3>
			</div>

			<div class="line"></div>
		</div>
		
			<form action="<%= request.getContextPath() %>/updateQAAnswer.bo" method="post">
			<div class="qa body">
			<table>
				<tr>
					<td>
						<label>분류</label>
						<input type="hidden" size="50" name="bId" value="<%= abo.getQaNo() %>">
						<input type="hidden" size="50" name="category" value="<%= abo.getQacateName() %>">
						<%= abo.getQacateName() %>
						<label id="writeDate">작성일 : <%= abo.getQaQuestionDate() %></label>
						<input type="hidden" size="50" name="date" value="<%= abo.getQaQuestionDate() %>">
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" size="50" name="title" value="<%= abo.getQaTitle() %>">
						<div id="qaTitle"><%= abo.getQaTitle() %></div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="qaContent">
							<input type="hidden" name="content" cols="60" rows="15" style="resize:none;" value="<%= abo.getQaContent() %>"><%= abo.getQaContent() %>
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
						
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<label>답변</label>
					</td>
				</tr>
				<tr>				
					<td>
						<div id="anContent">
						<textarea type="text" name="anContent" id="anContent" style="resize:none;" value="<%= abo.getQaAnswer() %>"><%= abo.getQaAnswer() %></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" id="goListBtn" onclick="location.href='<%= request.getContextPath() %>/goQNA'" value="목록">
						<input type="submit" id="updateBtn" value="답변등록">
					</td>
				</tr>
			</table>
		</div>
		</form>
		</div>
		
		<script>
			$('.servicemenu').on('click', function() {
				var id = $(this).attr('id');
				location.href='<%=request.getContextPath()%>/' + id;
			});
		</script>
</body>
</html>