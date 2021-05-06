<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품보기</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	h2{text-align:center;}
	.wrap{background: white; width: 100%; height: 50px;}
	.mainMenu{
			background: white; color: gray; text-align: center; font-weight: bold; 
			vertical-align: middle; width: 150px; height: 50px; display: table-cell;
		}
	.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
	.humanBody{width: 100%; height: 30%; text-align: center; display: inline-block;}
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="<%= request.getContextPath() %>/images/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
			<div class="mainMenu" id="goViewProduct">제품보기</div>
			<div class="mainMenu" id="goCommunity">커뮤니티</div>
			<div class="mainMenu" id="goCart">장바구니</div>
			<div class="mainMenu" id="goMypage">마이페이지</div>
			<div class="mainMenu" id="login">로그인</div>
			<div class="mainMenu" id="goService">고객센터</div>
			<hr>
		</nav>
	</div>
	
		<div class="product-menubar">
	<hr>
        <h2 id="product-menubar-name">제품보기</h2>
    <hr>
        <ul>
          <li>기초영양</li>
          <li>항산화</li>
          <li>뼈/관절</li>
          <li>면역</li>
          <li>눈건강</li>
          <li>장건강</li>
          <li>피부건강</li>
        </ul>
      </div>

	<div class="product-list">
			<div class="list-name">
				<span>상품등록</span>
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
								<th>| 상품명</th>
								<td><input type="text" name="name"></td>
							</tr>

							<tr>
								<th>| 상품가격</th>
								<td><input type="text" name="price"></td>
							</tr>

							<tr>
								<th>| 재고수량</th>
								<td><input type="number" min="1" value="1" name="volume"></td>
							</tr>

							<tr>
								<th>| 상품상세정보</th>
							</tr>


							<tr>
								<th colspan="2"><textarea name="" rows="10" cols="80" name="detail"></textarea></th>
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
						<button type="submit" id="prod-submit">상품등록</button>
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
				


	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/list.pro";
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no";
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/list.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
	</script>
</body>
</html>