<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*"%>
    
<% 
Product p = (Product)request.getAttribute("p"); 
System.out.println(p);


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품수정</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
		<%@include file="productNav.jsp"%>

	<div class="product-list">
			<div class="list-name">
				<span>제품수정</span>
				<hr>
			</div>
			<div class="product-upload">
				<div align="center">
					<form action="<%= request.getContextPath() %>/update.pro" method="post">
						<table class="product-upload2">
							<tr>
								<th><label for=""> | 제품유형</label></th>
								<td>
 								<select name="category" id="category" required>
										<option value="1">기초영양</option>
										<option value="2">항산화</option>
										<option value="3">뼈/관절</option>
										<option value="4">면역</option>
										<option value="5">눈건강</option>
										<option value="6">장건강</option>
										<option value="7">피부건강</option>
								</select></td>
							</tr>

							<tr>
								<th>| 제품명</th>
								<td>
								<input type="text" name="productName" value="<%= p.getProductName() %>">
								<input type="hidden" name="productNo" value="<%= p.getProductNo() %>">
								</td>
							</tr>
							<tr>
								<th>| 제품가격</th>
								<td><input type="text" name="price" value="<%= p.getProductPrice() %>"></td>
							</tr>
							<tr>
								<th>| 재고수량</th>
								<td><input type="number" min="1" value="<%= p.getProductVolume() %>" name="volume"></td>
							</tr>
							<tr>
								<th>| 제품상세정보</th>
							</tr>


								<tr>
								<th colspan="2"><textarea name="" rows="10" cols="80" name="detail">
								
								</textarea></th>
								
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

						<button type="submit" id="prod-submit" onclick="location.href='<%=request.getContextPath()%>/goProduct'">제품수정</button>
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