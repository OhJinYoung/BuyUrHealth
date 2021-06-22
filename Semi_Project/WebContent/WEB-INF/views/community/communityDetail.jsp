<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Board.model.vo.*, java.util.ArrayList" %>
    
<% 
	Community c = (Community)request.getAttribute("community"); 
	ArrayList<AddFile> fileList = (ArrayList<AddFile>)request.getAttribute("fileList");
	
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

	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}
	
	.community.head{
		width: 98%; float: left; margin-left: 30px; 
		margin-top: 15px;	
		}
    #updateBtn{
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
        float: center;
    }
    
    #deleteBtn{
        float: center;
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
    
   #menuBtn{
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
        float: center;
    }
 
   #addReply{
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
        float: center;
        text-align: center;
    }    
   
	 textarea {
	border-radius: 5px;
	}  
  
</style>
</head>
<body>
	<%@include file="../title_header.jsp"  %>
		
	<div class="community head" align="center">
		<h3 align="center">상세내용</h3>
		<br>
	</div>	
		<div class="tableArea" align="center">
			<form action="<%= request.getContextPath() %>/communityUpdateForm.co" id="detailForm" method="post" enctype="multipart/form-data" ></form>
			<div align="center">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><%= c.getCommTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= c.getUserName()%></td> 
					</tr>
					<tr>	
						<th>작성일</th>
						<td><%= c.getCommDate() %></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
						<textarea name="content" rows="20" cols="80" readonly><%=c.getCommContent()%></textarea></td>
				</table>
			</div>	
		</div>	
				<div align="center">
					<% if(loginUser != null){ %>
					<input type="submit" id="updateBtn" value="수정">
					<input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
					<% } %>
					<input type="button" onclick="location.href='<%= request.getContextPath() %>/goCommunity'" id="menuBtn" value="목록으로">
				</div>
			</form>
		</div>

		<div align="center" class="replyArea">
			<div class="replyWriterArea"><!-- 댓글 작성 부분 -->
				<table>
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="70" id="replyContent" style="resize:none;"></textarea>
						<td><button id="addReply">댓글 등록</button></td>
					</tr>
				</table>
			</div>
		</div> 
</body>
</html>