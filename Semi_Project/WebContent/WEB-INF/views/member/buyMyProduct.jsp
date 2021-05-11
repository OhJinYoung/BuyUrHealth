<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, order.model.vo.*, product.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("userId");
	Order order = (Order)request.getAttribute("orderList");
	OrderDetail orderDetail = (OrderDetail)request.getAttribute("orderDetail");
	Product product = (Product)request.getAttribute("product");
	ProductFile productFile = (ProductFile)request.getAttribute("productFile");
	
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
<title>마이페이지|주문상세</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .buy-list {
	  	width: 600px; height: 300px; margin-left: 50px; 
	 	margin-top: 20px; border: 1px solid black; display: inline-block;
	 }
	 .buy-list-head{margin: 10px;}
	 #buy-detail{float: right;}
	 .buy-product {
	 	width: auto; min-width: 550px; height: auto; margin: 10px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .product-intro {width: 500px; height: 150px; float: left; margin: 5px;}
	 .product-status {margin: 5px;}
	 div.product-content img {float: left;}
	 div.product-content p {float: left;}
	 div.product-content button {float: right; margin-right: 50px;}
	 
	 .order-lnfo h3 {margin-left: 250px; margin-top: 30px; margin-bottom: 20px;}
	 .order-lnfo p {margin-left: 250px; margin-top: 15px; margint-bottom: 15px;}
	 
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="../mypage/myPageNav.jsp"%>
    
    <h1 id="myPage-head">주문상세</h1>
        
    <hr>
    
    <div class="buy-list">
    	<div class="buy-list-head">
    		<label>주문하신 날짜 : <%=order.getOrderDate() %>     </label>/<label>운송장번호 : <%=order.getTrackingNo() %></label>
    	</div>
    	
    	<div class="buy-product">
			<div class="product-intro">
				<div class="product-status">
					<label><%=order.getState() %></label>
				</div>
				<div class="product-content">
					<img src="<%= request.getContextPath() %>/uploadFiles/productUpload/<%=productFile.getFileNo()%>.png" width="130px" height="100px" alt="My Image">
					<h1><%= product.getProductName() %></h1>
							<p>가격 : <%=product.getProductPrice() %></p><p style="float: right; margin-right: 50px;">개수 : <%= orderDetail.getVolume() %></p>
				</div>
			</div>
    	</div>
    </div>
    
    <div class="order-lnfo">
    <br>
    <h3>받는 사람 정보</h3>
    <hr>
	    <p>받는 사람 : <%=order.getName() %></p>
	    <p>연락처 : <%=order.getPhone() %></p>
	    <p>받는 주소 : <%=order.getAddress() %></p>
	    <p>배송시 요청 사항 : <% if(order.getRequest() == null){%>
	    					없음
	    				 <% } else { %>
	    					<%=order.getRequest() %>
	    				 <% } %>				
	    </p>
    <hr>
    <h3>결제 정보</h3>
    <hr>
    <p style="float: left; margin-left: 30px;">결제수단 : <%=order.getPayment() %></p>
    	<p id="lastPay" style="float: right; margin-right: 200px;">총상품금액 : </p>
    </div>
    	
    
    
	<script>
		$(function(){
			var price = <%= product.getProductPrice() %>;
			var volume = <%= orderDetail.getVolume() %>;
			$('#lastPay').text("총상품금액 : " + (price * volume));
		});
		
	</script>
</body>
</html>