<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("userId");
	String authority = null;
	if(member.getAuthority() == 'Y'){
		authority = "관리자";
	} else {
		authority = "회원";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|구매목록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>

	.myPage-menubar {
        width: 20%;
        max-width: 170px;
        height: 1000px;
        padding: 20px;
        margin-top: 14px;
        float: left;
        border-right: 1px solid black;
        display: inline-block;
     }
     
     #myPage-menubar-name { text-align: center; font-size: 20px;}
	 .myPage-menubar ul, li { list-style: none; padding: 10px; margin: 0; text-align: center;}
	 .myPage-menubar li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .buy-list {
	  	width: 800px; height: 350px; margin-left: 50px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .buy-list-head{margin: 10px;}
	 #buy-detail{float: right;}
	 .buy-product {
	 	width: auto; min-width: 770px; height: auto; margin: 10px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .product-intro {width: 620px; height: 230px; border-right: 1px solid black; float: left; margin: 5px;}
	 .product-status {margin: 5px;}
	 div.product-content img {float: left;}
	 div.product-content p {float: left;}
	 div.product-content button {float: right; margin-right: 50px;}
	 .product-request {width: 130px; height: auto; float: right; margin: 60px 5px;}
	 .product-request button {width: 100px; margin: 5px;}
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
	<div class="myPage-menubar">
	<hr>
        <h2 id="myPage-menubar-name">마이페이지</h2>
    <hr>
        <ul>
          <li id="goBuy">구매목록</li>
          <li id="goPage">개인정보조회</li>
          <li id="goFavorite">관심상품</li>
        </ul>
        
    </div>
    
    <h1 id="myPage-head">구매목록</h1>
        
    <hr>
    
    <div class="buy-list">
    	<div class="buy-list-head">
    		<label>주문하신 날짜</label>
    		<label id="buy-detail"><a href="">주문 상세 보기 ></a></label>
    	</div>
    	
    	<div class="buy-product">
    		<%--  <% if(list.isEmpty()){ %>
					
					주문하신 상품이 없습니다.
					
				<% } else{
						for(Notice n : list){ %>
							
				<%		} 
					} %> --%>
			<div class="product-intro">
				<div class="product-status">
					<label>상품상태</label>
				</div>
				<div class="product-content">
					<img src="<%= request.getContextPath() %>/images/vitamin_c.jpg" width="130px" height="100px" alt="My Image">
					<h1>상품 설명</h1>
					<p>가격</p> <button type="button">장바구니 담기</button>
				</div>
			</div>
			
			<div class="product-request">
				<button type="button" id="product-return">교환/반품신청</button>
				<button type="button" id="delive-search">배송조회</button>
				<button type="button" id="goBuy-review">구매후기쓰기</button>
			</div>
    	</div>
    	
    </div>
    
    
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/updateMyPage.me";
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
		
		$('#goBuy').on('click', function(){
			location.href="<%= request.getContextPath() %>/buyMyPage.me";
		});
		
		$('#goPage').on('click', function(){
			location.href="<%= request.getContextPath() %>/updateMyPage.me";
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