<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
.product-list { width: 70%; 
				max-width:900px;
				padding: 20px; 
				margin-bottom: 10px; 
				margin-top: 20px; 
 				float: left; 
 				border-left: 1px solid #bcbcbc; 
 				border-right: 1px solid #bcbcbc; 
 				}
.product-list span {font-size: 20px;}


.cell { float: left; box-sizing: border-box;}
/* .row::after { content: ""; display: block; clear: both; } */


.listArea {
	mergin-left: 20px;
	mergin-right: 20px;
	border-collapse: collapse;
	}
.listArea tr {height: 40px; border-bottom: 1px solid #ccc;}
.listArea th {font-size: 18px;}
.listArea td {font-size: 15px; text-align: center;}


.list-name {margin: 10px; font-weight: bold; font-size: 30px;}
.list-name span {margin: 0 0 0 10px;}
.list {align: center;}


#test_btn1 {
	background-color: orange;
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 5px;
	float: right;
}

#prod-submit {
	background-color: orange;
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
	align: center;
}


/* 제품등록 */
.product-upload { position: center; width: auto; box-sizing: border-box;}
.product-upload2 { table-layout:fixed}


.product-upload table th { text-align : left; }
.product-upload2 { border-spacing : 15px; border-collapse: collapse;}
.product-upload2 tr {border-bottom: 1px solid #ccc; height: 40px; font-size: 18px;}




</style>
</head>
<body>
		<%@include file="../title_header.jsp"  %>
		<%@include file="productNav.jsp"%>

	<div class="product-list">
			<div class="list-name">
				<span>제품등록</span>
				<hr>
			</div>
			<div class="product-upload">
				<div align="center">
					<!--  파일 업로드를 위해 enctype을 지정해줘야 된다. -->
					<form action="<%= request.getContextPath() %>/insert.pro" method="post" encType="multipart/form-data">
						<table class="product-upload2">
							<tr>
								<th><label for=""> | 상품유형</label></th>
								<td>
									 <select name="category" id="category" required>
										<option value="1">기초영양</option>
										<option value="2">항산화</option>
										<option value="3">뼈/관절</option>
										<option value="4">면역</option>
										<option value="5">눈건강</option>
										<option value="6">장건강</option>
										<option value="7">피부건강</option>
									</select>
								</td>
							</tr>

							<tr>
								<th>| 제품명</th>
								<td><input type="text" name="name"></td>
							</tr>

							<tr>
								<th>| 제품가격</th>
								<td><input type="text" name="price"></td>
							</tr>

							<tr>
								<th>| 재고수량</th>
								<td><input type="number" min="1" value ="10" name="volume"></td>
							</tr>

							<tr>
								<th>| 제품상세정보</th>
							</tr>


							<tr>
								<th colspan="2"><textarea rows="10" cols="80" name="detail"></textarea></th>
							</tr>
							<tr>
								<th >| 썸네일이미지 첨부</th>
								<!--  파일 업로드 하는 부분  -->
								<td><input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
								<div id="titleImgArea">
								<img id="titleImg" width="350" height="200">
								</div>
								
								 
								</td>
								
							</tr>
							<tr>
								<th>| 상세이미지 첨부</th>
								<td><input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
								<div id="contentImgArea">
								<img id="contentImg" width="350" height="200"> 
							</div>
								</td>

							</tr>

						</table>
					<div>
						<button type="submit" id="prod-submit">제품등록</button>
					</div>
					</form>
				</div>


			</div>
		</div>
		
		<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#thumbnailImg1").hide();
						$("#thumbnailImg2").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea").click(function(){
							$("#thumbnailImg2").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					// e.target.result --> 이미지 경로 
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
</body>
</html>