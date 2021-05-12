<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member, order.model.vo.*, product.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("userId");
	Order order = (Order)request.getAttribute("orderList");
	OrderDetail orderDetail = (OrderDetail)request.getAttribute("orderDetail");
	Product product = (Product)request.getAttribute("product");
	ProductFile productFile = (ProductFile)request.getAttribute("productFile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록|배송조회</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
	
	.delivery_data{
		width: 85%;
        margin-top: 30px; 
		margin-left: 200px;
	}

	.delivery_head{
		min-width: 95%;  
		margin-left: 30px; 
		margin-top: 15px;
	}
	
	.delivery_body{
  		margin-top: 70px;
		width: 95%; 
		min-width: 1000px;
		padding-bottom: 10px; 
	    text-align: center;
	}
	
	.delivery_body label{
  		font-size: 25px;
	}
	
	.delivery_foot{
		width: 800px;
		height: 400px;
		margin-left: 400px;
	    text-align: center; 
	}
	
	.company{
		width: 400px;
		height: 300px;
		float: left;
		border-right: 1px solid black;
	}
	
	.company label{
		position: relative;
		top: 100px;
		left: 30px;
	}
	
	.orderlistDetail{
		width: 350px;
		height: 300px;
		float: right;
	}
	
	.orderlistDetail label{
		position: relative;
		top: 100px;
		right: 30px;
	}
	
	h3{
		color: black; 
		margin: 0px auto;
		font-size: 20px;
		margin-left: 15px;
	}
		
	.line{
		border-bottom: 2px solid gray;
		margin-top: 13px;
		width: 100%;
		height: 1px;
		background-color: #dfdfdf;
	}
	
	
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="myPageNav.jsp"%>
 
    <div class="delivery_data" >
	
		<div class="delivery_head">
			<div class="subdiv">
				<h3>구매목록>배송조회</h3>
			</div>
			<div class="line"></div>
		</div>
		<div class="delivery_body">
			<label><%=order.getOrderDate().substring(0, 10)%> 구매</label><br>
			<label><%= ((Integer.parseInt(order.getOrderDate().substring(0, 10).replace("-", ""))+3) + "").substring(0, 4) + "-" + ((Integer.parseInt(order.getOrderDate().substring(0, 10).replace("-", ""))+3) + "").substring(4, 6) + "-" + ((Integer.parseInt(order.getOrderDate().substring(0, 10).replace("-", ""))+3) + "").substring(6, 8)%> 도착예정</label>
		 </div>
	</div>
	
	<div class="delivery_foot">
		<div class="company">
			<label><%=product.getProductName() %></label><br>
			<label>xx택배</label><br>
			<label>송장번호  
			<% if(order.getTrackingNo() != null){ %>
				<%=order.getTrackingNo() %>
			<% } else {%>
				-
			<% } %>
			</label>
		</div>
		<div class="orderlistDetail">
			<label>받는사람 : <%=order.getName() %></label><br>
			<label>받는 사람 주소 : <%=order.getAddress() %></label><br>
			<% if(order.getRequest() == null){ %>
				<label>배송 요청 사항 : 없음</label><br>
			<% } else {%>
				<label>배송 요청 사항 : <%=order.getRequest() %></label><br>
			<% } %>
			
		</div>
	</div>
	
    
	<script>
	
	</script>
</body>
</html>