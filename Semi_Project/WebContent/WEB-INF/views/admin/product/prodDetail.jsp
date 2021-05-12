<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*, member.model.vo.Member, java.util.*, Cart.model.vo.Cart, java.text.DecimalFormat" %>
<% 
Member authority = (Member) session.getAttribute("loginUser");
Product p = (Product)request.getAttribute("product"); 
ArrayList<ProductFile> fileList = (ArrayList<ProductFile>)request.getAttribute("fileList");
ProductFile titleImg = fileList.get(0);
ArrayList<Cart> cartlist = (ArrayList<Cart>)request.getAttribute("cartlist"); 

%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세보기</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
.product-list {
	width: 70%;
	max-width: 900px;
	padding: 20px;
	margin-bottom: 10px;
	margin-top: 20px;
	float: left;
	border-left: 1px solid #bcbcbc;
	border-right: 1px solid #bcbcbc;
}

.product-list span {
	font-size: 20px;
}

.product_view table .length a:nth-of-type(1) {
	background: url("../img/ico_up.png") no-repeat center;
	border: 1px solid #c6c6c6;
}

.product_view table .length a:nth-of-type(2) {
	bottom: 17px;
	background: url("../img/ico_down.png") no-repeat center;
	border: 1px solid #c6c6c6;
}

.list-name {
	margin: 10px;
	font-weight: bold;
	font-size: 30px;
}

.list-name span {
	margin: 0 0 0 10px;
}

.listArea {
	margin: auto;
	border-collapse: collapse;
	float: center;
}

.listArea tr {
	height: 40px;
	border-bottom: 1px solid #ccc;
}

.listArea th {
	font-size: 18px;
}

.listArea td {
	font-size: 15px;
	text-align: center;
}

/* 제품 상세보기 */
.product_view {
	position: relative;
	padding: 20px 0 0 395px;
	width: auto;
	box-sizing: border-box;
}

.product_view .img {
	position: absolute;
	left: 0;
	top: 0;
}

.product_view .img>img {
	width: 250px;
	height: 250px;
	position: absolute;
	left: 25px;
	top: 0;
}

.product_view .product_name {
	margin: 15px;
	padding: 10px 0 20px;
	font-size: 30px;
	font-weight: bold;
	color: #232323;
	line-height: 26px;
}

.product_view .product_exp {
	margin: 15px;
	padding: 10px 0 20px;
	font-size: 25px;
	font-weight: bold;
	color: lightgray;
	line-height: 50px;
}

.product_view table th, .product_view table td {
	padding: 18px 20px;
	font-size: 15px;
	color: #444;
	text-align: left;
}

.product_view table td.price {
	font-size: 22px;
	color: red;
}

.product_view table td.total {
	font-size: 22px;
	color: green;
	font-weight: bold;
}

.product_view .length {
	position: relative;
	width: 20px;
	height: 30px;
	text-align: center;
}

.product_view table .length input {
	wigth: 20px;
	height: 30px;
	border: none;
	border: 1px solid #c6c6c6;
}

.product_view table .length a {
	right: -7px;
	position: absolute;
	width: 26px;
	height: 16px;
	color: transparent;
	margin-left: 10px;
}

.product_view table .length a:nth-of-type(1) {
	background: url("../img/ico_up.png") no-repeat center;
	border: 1px solid #c6c6c6;
}

.product_view table .length a:nth-of-type(2) {
	bottom: 17px;
	background: url("../img/ico_down.png") no-repeat center;
	border: 1px solid #c6c6c6;
}

.product_view .btns {
	padding: 10px 0 0;
	text-align: center;
}

.btn1 {
	display: inline-block;
	height: 30px;
	font-size: 15px;
	color: #fff;
	border-radius: 4px;
	line-height: 30px;
}

.btn1 {
	background: lightgray;
	width: 150px;
}

.btn2 {
	display: inline-block;
	height: 30px;
	font-size: 15px;
	color: #fff;
	border-radius: 4px;
	line-height: 30px;
}

.btn2 {
	background: lightgray;
	width: 150px;
}

.btn3 {
	display: inline-block;
	height: 30px;
	font-size: 15px;
	color: #fff;
	border-radius: 4px;
	line-height: 30px;
}

.btn3 {
	margin-top: 3px;
	background: orange;
	width: 305px;
}

.product_detailimg {
	width: 90%;
	padding: 20px;
	margin-bottom: 10px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.product_detailimg img {
	width: 800px;
	object-fit: cover;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<div class="product-list">
	<form  method="post">
		<div class="list-name">
			<span>제품상세보기</span>
			<input type="hidden" name="pcategoryNo" value="<%= p.getCategoryNo() %>">

			<input type="hidden" id="test_btn1" class="updateBtn" value="수정" onClick="this.form.action='productUpdateForm.pro'" value="수정">
			<input type="button" id="test_btn1" class="deleteBtn" value="삭제">

			<hr>
		</div>
	<!-- <form action="getcart" method="post"> -->
		<div class="product_view">
			<span class="product_name">
			<input type="hidden" name="productNo" value="<%= p.getProductNo() %>">
			<input type="hidden" name="productName" value="<%= p.getProductName() %>">
			<%= p.getProductName() %></span>
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>구매수량</th>
						<td class="length"><input type="number" min="1" value="1" name="number">
					</tr>
					<tr>
						<th>금액</th>
						<td class="total">
						<input type="hidden" name="total" value="<%= p.getProductPrice() %>">
						<%= p.getProductPrice() %></td>
					</tr>
				</tbody>
			</table>
			<div class="img">
				<img id="titleImg" src="<%=request.getContextPath()%>/uploadFiles/productUpload/<%=titleImg.getChangeName()%>">
				<input type="hidden" name="titleImg" value="<%=titleImg.getChangeName()%>">
				
			</div>
			<div class="btns">
				<input type ="submit" class="btn1" onClick="this.form.action='InsertFavorite'" value="찜하기">
				<input type ="submit" class="btn2" onClick="this.form.action='getcart'" value="장바구니">
			</div>
			<div class="btns">
				<input type ="hidden" class="btn3" onClick="this.form.action='gocart'" value="즉시 구매하기">
			</div>
		</div>
		<!-- product_view 끝 -->
</form>
		<br> <br>
		<hr>
		<div class="product_detailimg" align="center">
		<% for(int i = 1; i<fileList.size(); i++) {%>
			<img id="detailImg" src="<%=request.getContextPath()%>/uploadFiles/productUpload/<%=fileList.get(i).getChangeName() %>">
			<input type="hidden" name="detailImg" value="<%=fileList.get(i).getChangeName() %>">
			<input type="hidden" name="fileNo" value="<%=fileList.get(i).getFileNo() %>">
			<% } %>
			<input type="hidden" name="detail" value="<%= p.getProductDetail() %>">
			<p><%= p.getProductDetail() %></p>
		</div>
	</div>
	
	
	<Script>
	$('.deleteBtn').on('click', function(){
		var bool = confirm('정말 삭제하시겠습니까?');
		
		if(bool) {
			location.href='<%=request.getContextPath()%>/delete.pro?no='+<%= p.getProductNo() %>;
				}
				});
	
	
	 <%-- $('.addCartBtn').on('click', function(){
		var bool = confirm('쇼핑카트에 담으시겠습니까?');
		
		if(bool) {
			document.getElementById("getcart").submit();
			location.href='<%=request.getContextPath()%>/getcart';
				}
				});  --%>
	</script>
	
</body>
</html>
