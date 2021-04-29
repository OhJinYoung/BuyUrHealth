<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|상품상세설명</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .buy-list {
	  	width: 600px; height: 300px; margin-left: 50px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .buy-list-head{margin: 10px;}
	 #buy-detail{float: right;}
	 .buy-product {
	 	width: auto; min-width: 550px; height: auto; margin: 10px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .product-intro {width: 400px; height: 150px; float: left; margin: 5px;}
	 .product-status {margin: 5px;}
	 div.product-content img {float: left;}
	 div.product-content p {float: left;}
	 div.product-content button {float: right; margin-right: 50px;}
	 
	 .order-lnfo h3{margin-left:250px;}
	 
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="../mypage/myPageNav.jsp"%>
    
    <h1 id="myPage-head">상세상품설명</h1>
        
    <hr>
    
    <div class="buy-list">
    	<div class="buy-list-head">
    		<label>주문하신 날짜     </label><label>      주문번호:</label>
    	</div>
    	
    	<div class="buy-product">
			<div class="product-intro">
				<div class="product-status">
					<label>상품상태</label>
				</div>
				<div class="product-content">
					<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" width="130px" height="100px" alt="My Image">
					<h1>상품 설명</h1>
					<p>가격</p>
				</div>
			</div>
    	</div>
    </div>
    
    <div class="order-lnfo">
    <h3>받는 사람 정보</h3>
    <hr>
    </div>
    
	<script>
		
		$('#goBuy').on('click', function(){
			location.href="<%= request.getContextPath() %>/buyMyPage.me";
		});
		
		$('#goPage').on('click', function(){
			location.href="<%= request.getContextPath() %>/goMypage";
		});
		
		$('#goFavorite').on('click', function(){
			location.href="<%= request.getContextPath() %>/favoriteMyPage.me";
		});
		
		
		
		$('#product-return').on('click', function(){
			location.href="<%= request.getContextPath() %>/productReturnForm.me";
		});
		
		$('#delive-search').on('click', function(){
			location.href="<%= request.getContextPath() %>/deliveSearchForm.me";
		});
		
		$('#goBuy-review').on('click', function(){
		
		});
	</script>
</body>
</html>