<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member, order.model.vo.*, product.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("userId");
	ArrayList<Order> orderList = (ArrayList<Order>)request.getAttribute("orderList");
	ArrayList<OrderDetail> orderDetail = (ArrayList<OrderDetail>)request.getAttribute("orderDetail");
	ArrayList<Product> product = (ArrayList<Product>)request.getAttribute("product");
	ArrayList<ProductFile> productFile = (ArrayList<ProductFile>)request.getAttribute("productFile");
	ArrayList<RequestOrder> requestOrder = (ArrayList<RequestOrder>)request.getAttribute("orderRequest");
	
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
	body {width: 1500px; height: 800px;}
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .buy-list {
	  	width: 800px; margin-left: 50px;
	  	margin-top: 20px; border: 1px solid black; display: inline-block;
	 }
	 .buy-list-head{margin: 10px;}
	 #buy-detail{float: right;}
	 .buy-product {
	 	width: auto; min-width: 770px; height: auto; margin: 10px; 
	 	border: 1px solid black; display: inline-block;
	 }
	 .product-intro {
	 	width: 620px; height: 230px; border-right: 1px solid black; 
	 	float: left; margin: 5px;	
	 }
	 .product-status {margin: 5px;}
	 div.product-content img {float: left;}
	 div.product-content p {margin-top: 40px; float: left;}
	 .product-request {
	 	width: 130px; height: auto; float: right;
	  	margin: 60px 5px;
	  }
	 .product-request button {width: 100px; margin: 5px;}
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="myPageNav.jsp"%>
    
    <h1 id="myPage-head">구매목록</h1>
        
    <hr>
    
    <div class="buy-list">
    	<% if(orderList.isEmpty()){ %>
					
				주문하신 상품이 없습니다.
					
		<% } else{ %>
			<% 	for(int i = 0; i < orderList.size(); i++){ %>
				<% Order o = orderList.get(i); %>
				<% OrderDetail od = orderDetail.get(i); %>
				<% Product p = product.get(i); %>
				<% ProductFile pf = productFile.get(i); %>
				<% RequestOrder ro = requestOrder.get(i); %>
				<div class="buy-product">
					<div class="buy-list-head">
    					<label></label>
    					<label id="buy-detail"><a href="<%= request.getContextPath() %>/detailMyProductForm.me">주문 상세 보기 ></a></label>
    				</div>
					<div class="product-intro">
						<div class="product-status">
							<label>구매한 날짜 : <%= o.getOrderDate() %></label> / <label><%= o.getState() %></label>
					</div>
						<div class="product-content">
						<img src="<%= request.getContextPath() %>/uploadFiles/productUpload/<%=pf.getFileNo()%>.png" width="130px" height="100px" alt="My Image">
						<h1><%= p.getProductName() %>...외 2개</h1>
							<p>가격 : <%=p.getProductPrice() %></p><p style="float: right; margin-right: 50px;">개수 : <%= od.getVolume() %></p>
		
						</div>
						<% if(ro.getType() == null) { %>
						
						<% } else { %>
								<h2 id="requestCheck" style="color: red;"><%=ro.getType()%></h2>
						<% } %>
					</div>
			
					<div class="product-request">
						<button type="button" id="product-return">교환/반품신청</button>
						<button type="button" id="delive-search">배송조회</button>
						<button type="button" id="goBuy-review">구매후기쓰기</button>
					</div>
				</div>
			<%	} 
			} %>
			
    	
    	
    </div>
    
    
	<script>
		$(function(){
			if($('#requestCheck').attr('id') == "requestCheck"){
				$('#product-return').on('click', function(){
					alert('이미 신청되었습니다.');
					location.href="<%= request.getContextPath() %>/buyMyPage.me";
				});
			}
		});
		
		$('#product-return').on('click', function(){
			location.href="<%= request.getContextPath() %>/productReturnForm.me";
		});
		
		$('#delive-search').on('click', function(){
			location.href="<%= request.getContextPath() %>/deliverySearchForm.me";
		});
		
		$('#goBuy-review').on('click', function(){
			location.href="<%= request.getContextPath() %>/goCommunity";
		});
	</script>
</body>
</html>