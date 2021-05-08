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
				<span>상품수정</span>
				<hr>
			</div>
			<div class="product-upload">
				<div align="center">
					<form action="">
						<table class="product-upload2">
							<tr>
								<th><label for=""> | 상품유형</label></th>
								<td><select id="" name="">
										<option value="">기초영양</option>
										<option value="">항산화</option>
										<option value="">뼈/관절</option>
										<option value="">면역</option>
										<option value="">눈건강</option>
										<option value="">장건강</option>
										<option value="">피부건강</option>
								</select></td>
							</tr>

							<tr>
								<th>| 상품명</th>
								<td><input type="text"></td>
							</tr>

							<tr>
								<th>| 대표이미지</th>
								<td><input type="file"></td>
							</tr>

							<tr>
								<th>| 재고수량</th>
								<td><input type="number" min="1" value="1"></td>
							</tr>

							<tr>
								<th>| 상품상세정보</th>
							</tr>


							<tr>
								<th colspan="2"><textarea name="" rows="10" cols="80"></textarea></th>
							</tr>

							<tr>
								<th>| 상세이미지 첨부</th>
								<td><input type="file"></td>

							</tr>

						</table>
					</form>
					<div>

						<button type="submit" id="prod-submit">상품수정</button>
					</div>
				</div>


			</div>
		</div>


	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/prolist.no";
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/noticelist.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
	</script>
</body>
</html>