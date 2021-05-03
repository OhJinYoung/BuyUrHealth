<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="QABoard.model.vo.QABoard, QABoard.model.vo.QAFile, java.util.ArrayList, java.io.*" %>
<% 
	QABoard qab = (QABoard)request.getAttribute("b"); 
	ArrayList<QAFile> qaf = (ArrayList<QAFile>)request.getAttribute("qafile"); 
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#qaboard-menubar-name { 
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
        border-right: 1px solid;
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

    
    
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<div class="qaboard-menubar">
	<hr>
		<h2 id="qaboard-menubar-name">Q&A</h2>
	<hr>
		<ul>
		<li>공지사항</li>
		<li>자주묻는질문</li>
		<li><b>Q&A</b></li>
		<li>약관 및 방침</li>
		</ul>
	</div>
	
	<form action="<%= request.getContextPath() %>/QAUpdate.bo" method="post">
	
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
						<input type="hidden" name="bId" value="<%= qab.getQaNo() %>">
						<select name="category" value="<%= qab.getQacateNo() %>">
						<%= qab.getQacateNo() %>
							<option value="10">주문/결제</option>
							<option value="20">배송</option>
							<option value="30">상품</option>
							<option value="40">반품</option>
							<option value="50">교환</option>
							<option value="60">취소</option>
							<option value="70">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<textarea type="text" name="qaTitle" id="qaTitle" style="resize:none;" value="<%=qab.getQaTitle()%>"><%=qab.getQaTitle()%></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<textarea type="text" name="qaContent" id="qaContent" style="resize:none;" value="<%= qab.getQaContent() %>"><%= qab.getQaContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td class="td1">
						<label>첨부파일</label>
						<% if(qaf.isEmpty()) {%>
						<input type="file" id="uploadFile" name="uploadFile" multiple accept=".jpg, .png, .jpeg">
						<% } else { %>
						<a href="<%= request.getContextPath() %>/uploadFiles/qafile_uploadFiles/<%= qaf.get(0).getFileChangeName() %>" target='_blank'><%= qaf.get(0).getFileChangeName() %></a>
						<input type="button" id="deleteFile" onclick="deleteQAFile();" value="첨부파일 삭제">
						<% } %>
						<input type="submit" id="enterBtn" value="등록">
						<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
					</td>
				</tr>
			</table>
		</div>
		
		<script>
			$("#deleteFile").on("click", function(){
			   if (confirm("첨부파일을 삭제하시겠습니까?")) {
				   
					String fileName = qaf.get(0).getFileChangeName(); 
					String root = request.getSession().getServletContext().getRealPath("/");
					String savePath = root + "uploadFiles/qafile_uploadFiles/";
					
					File f = new File(savePath); 
						if(f.exists()) {
							f.remove(); 
						}
			   }
			});
		</script>
	</div>
		</form>
</body>
</html>