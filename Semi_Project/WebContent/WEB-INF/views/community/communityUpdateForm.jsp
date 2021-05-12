<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Board.model.vo.Community"%>
    <%@ page import="java.util.ArrayList, Board.model.vo.Community, java.io.*, Board.model.dao.CommunityDAO," %>
<%
    ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list");
   	 Community c = (Community)request.getAttribute("c");
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
	
	.community.head{
		width: 98%; float: left; margin-left: 30px; 
		margin-top: 15px;	
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
		text-align: 
	}
	
	.community.body{
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
    
    #category{
    border-radius: 5px;
    }
    
    #title{
    	width: 50%;
		height: 43px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		float: center;
    }
    
    #content{
    	width: 50%;
		min-height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid gray;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
		font-align: left;
		overflow: auto;
    }
   
   #inputimag{
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
        float: center;
    }
    
    #enterBtn{
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

</style>
</head>
<body>
	<%@include file="../title_header.jsp" %>
	
	<form action="<%= request.getContextPath() %>/communityUpdateForm.co" method="post" enctype="multipart/form-data">

	<div class="community data">
	
		<div class="community head">
			<div class="subdiv">
				<h3>커뮤니티>커뮤니티</h3>
			</div>

			<div class="line"></div>
		</div>
		
		<div class="community body">
			<table>
				<tr>
					<td>
						<label>카테고리</label>
						<select name="category">
							<option value="10">#잡담게시판</option>
							<option value="30">#자유글</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="title" id="title" placeholder="제목을 입력해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<textarea name="content" id="content" cols="60" rows="15" style="resize:none;" placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<td class="td1">
						<div class="image-container">
						<h3>첨부파일</h3>
						    <input style="display: block;" type="file" id="input-image" name="upfile">
						    <img style="width: 500px;" id="preview-image">
						</div>
						<input type="submit" id="enterBtn" onclick="checkConfirm();" value="등록">
						<button id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/clist.bo'" >취소</button> 
					</td>
				</tr>
			</table>
		</div>
		
		<script>
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = function(e){
		            const previewImage = document.getElementById("preview-image");
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", function(e){
		    readImage(e.target)
		});
		
		function checkConfirm(){
			var result = confirm('글 등록 후에는 첨부파일 추가와 수정이 불가합니다.'); 
		};
		
		$('.servicemenu').on('click', function() {
			var id = $(this).attr('id');
			location.href='<%=request.getContextPath()%>/' + id;
		});
		
		$('.servicemenu').on('click', function() {
			var id = $(this).attr('id');
			location.href='<%=request.getContextPath()%>/' + id;
		});
		
		function deleteCommunity(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			
		<%--	if(bool){
				location.href='<%= request.getContextPath() %>/Commdelete.bo?bId=' + <%= c.getCommNo() %>;
			} --%>
		};
		</script>
	</div>
	</form>
</body>
</html>