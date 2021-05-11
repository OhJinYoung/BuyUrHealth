<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Board.model.vo.*, java.util.ArrayList" %>
    
<% 
	Community c = (Community)request.getAttribute("community"); 
	ArrayList<AddFile> fileList = (ArrayList<AddFile>)request.getAttribute("fileList");
	AddFile titleImg = fileList.get(0);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
        
</style>
</head>
<body>
	<%@include file="../title_header.jsp"  %>
		
	<div class="community body">
		<br>
		<h2 align="center">상세보기</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/communityUpdateForm.co" id="detailForm" method="post">
			
				<table>
					<tr>
						<th>제목</th>
						<td align="center"colspan="3"><%= c.getCommTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%= c.getUserName()%></td>
						<th>작성일</th>
						<td><%= c.getCommDate() %></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="6">
							<img src="<%= request.getContextPath() %>/uploadFiles/communityUpload/<%= titleImg.getChangeName() %>" 
							width="400px" height="350px" id="image" alt="My Image">
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<textarea cols="60" rows="15" style="resize:none;" readonly><%= c.getCommContent() %></textarea>
						</td>
					</tr>
				</table>
				
				
				<div align="center">
					<% if(loginUser != null){ %>
					<input type="submit" id="updateBtn" value="수정">
					<input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
					<% } %>
					<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.bo'" id="menuBtn" value="메뉴로">
				</div>
			</form>
		</div>
	</div> 
			<div align="center" class="replyArea">
			<div class="replyWriterArea"><!-- 댓글 작성 부분 -->
				<table>
					<tr>
						<td>댓글 작성</td>
						<td><textarea rows="3" cols="80" id="replyContent" style="resize:none;"></textarea>
						<td><button id="addReply">댓글 등록</button></td>
					</tr>
				</table>
			</div>
			
		</div> 
	<script>
		$(function(){
			$('#addReply').on('click', function(){
				var writer = '<%= loginUser.getUserId() %>';
				var bId = <%= c.getCommNo() %>;
				var content = $('#replyContent').val();
				
				$.ajax({
					url: 'insertReply.bo',
					data:{writer:writer, bId:bId, content:content},
					success: function(data){
						console.log(data);
						$replyTable = $('#replySelectTable');
						$replyTable.html('');  // 이어져서 나오지 않도록, 비워두는 역할
						
						for(var key in data){
							var $tr = $('<tr>');
							var $writerTd = $('<td>').text(data[key].nickName).css('width', '100px');
							var $contentTd = $('<td>').text(data[key].replyContent).css('width', '400px');
							var $dateTd = $('<td>').text(data[key].createDate).css('width', '200px');
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$replyTable.append($tr); // tr을 eplyTable에 붙이기
						}
						
						$('#replyContent').val('');  // 다 적었으면 댓글작성부분 없앰
					}
				});
			});
		});
	</script>
</body>
</html>