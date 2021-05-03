<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QABoard.model.dao.QABoardDAO, QABoard.model.vo.QAFile, java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

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
    
    img { display: block; margin: 0px auto; }
    
    
</style>
</head>
<body>
	<%@include file="../title_header.jsp" %>
	
	<div class="service-menubar">
	<hr>
		<h2 id="service-menubar-name">Q&A</h2>
	<hr>
		<ul>
			<li class="servicemenu" id="">공지사항</li>
			<li class="servicemenu" id="">자주묻는질문</li>
			<li><b>Q&A</b></li>
			<li class="servicemenu" id="goRules">약관 및 방침</li>
		</ul>
	</div>
	
	<form action="<%= request.getContextPath() %>/QAInsert.bo" method="post" enctype="multipart/form-data">
	
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
						<select name="category">
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
						<textarea type="text" name="qaTitle" id="qaTitle" placeholder="제목을 입력해주세요" style="resize:none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<textarea type="text" name="qaContent" id="qaContent" style="resize:none;">주문번호 : &#13;&#10;주문자 성함 : &#13;&#10;문의하실 상품 : &#13;&#10;&#13;&#10;문의내용 : </textarea>
					</td>
				</tr>
				<tr>
					<td class="td1">
						<div class="image-container">
						<h3>첨부파일</h3>
						    <input style="display: block;" type="file" id="input-image" name="upfile">
						    <img style="width: 500px;" id="preview-image">
						</div>
						<input type="submit" id="enterBtn" onclick="checkConfirm();" value="등록">
						<button id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/qalist.bo'" >취소</button>
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

		</script>
	</div>
		</form>
</body>
</html>