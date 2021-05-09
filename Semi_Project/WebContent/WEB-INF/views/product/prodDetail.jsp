<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.Product, member.model.vo.Member" %>
<% 

Member loginUser = (Member)session.getAttribute("loginUser");
Product p = (Product)request.getAttribute("product"); 
%>    
  
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
			<span>제품보기 > <%= p.getCategoryNo() %></span>
			<%  if(loginUser != null && loginUser.getUserId().equals("admin")) {  %> 
			<button id="test_btn1" onclick="location.href='<%= request.getContextPath() %>/deleteProduct.pro'">삭제</button>
			<button id="test_btn1" onclick="location.href='<%= request.getContextPath() %>/updateProductForm.pro'">수정</button>
			<%   }  %>  
			<hr>
		</div>

		<div class="product_view">
			<span class="product_name">
			<input type="hidden" name="productNo" value="<%= p.getProductNo() %>">
			<input type="hidden" name="cartNo" value="1">
			<input type="hidden" name="productname" value="<%= p.getProductName() %>">
			<%= p.getProductName() %></span><br> <span
				class="product_exp"> #간 #면역 #항산화 </span>

			<table>

				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>


				<tbody>
					<tr>
						<th>구매수량</th>
						<td class="length"><input type="number" name="number" min="1" value="1">
							<a href="#a">증가</a> <a href="#a">감소</a></td>
					</tr>

					<tr>
						<th>금액</th>
						<td class="total"><input type="hidden" name="total" value="<%= p.getProductPrice() %>">
						<%= p.getProductPrice() %></td>
					</tr>
				</tbody>


			</table>

			<div class="img">
				<img src="images/prodImg/omega1.png" art="">
			</div>

			<div class="btns">
				<a href="#a" class="btn1">찜하기</a> <a href="#a" class="btn1">장바구니</a>
			</div>
			<div class="btns">
				<a href="#a" class="btn3">바로 구매하기</a>
			</div>
		</div>
		<!-- product_view 끝 -->

		<br> <br>
		<hr>
		<div class="product_detailimg" align="center">
			<p><%= p.getProductDetail() %></p>
			<img src="images/prodImg/omega2.jpeg" art="">
			

		</div>
	</div>


	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/list.pro";
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
			location.href="<%= request.getContextPath() %>/list.no";
		});
		
	</script>
</body>
</html>