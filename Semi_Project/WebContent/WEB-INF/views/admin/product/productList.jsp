<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, product.model.vo.Product, common.PageInfo"%>
<%
ArrayList<Product> list = (ArrayList) request.getAttribute("list");
PageInfo paging = (PageInfo) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUH</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
button {
	border: 0px;
	border-radius: 2px;
}

h3 {
	font-size: 20px;
	padding-bottom: 20px;
}

#inputSearch {
	padding-left: 7px;
	width: 140px;
	height: 30px;
	font-size: 12px;
	border: 1px solid #c3c3c3;
	border-radius: 2px;
}

select {
	height: 30px;
	font-size: 12px;
	width: 70px;
	border-color: #c3c3c3;
	border-radius: 2px;
}

table {
	width: 100%;
	border-collapse: collapse;
	color: #424242;
}

tr {
	text-align: center;
}

td {
	padding: 15px;
	border-bottom: 1px solid #8282821a;
	padding-top: 18px !important;
}

th {
	padding: 15px 25px;
	color: #828282;
}

#firstTr {
	border-bottom: 1px solid #82828278;
}

tr td:last-child {
	width: 120px;
}

#searchBtn {
	height: 30px;
	width: 50px;
	margin-top: 1px;
	font-size: 12px;
}

#top {
	padding-bottom: 3px;
}

#top-right {
	float: right;
}

#top-right>div {
	display: inline-block;
}

#contents {
	display: inline-block;
	border-left: 1px solid #9a9a9a;
}

#contents {
	display: inline-block;
	border-left: 1px solid #9a9a9a;
	width: 80%;
}

#contents-wrap {
	padding: 30px;
}

body {
	min-width: 1200px;
}

#top div:first-child h4 {
	font-size: 25px;
	font-weight: 700;
	padding-bottom: 10px;
}

#top>div {
	display: inline-block;
}

#bottom {
	padding-top: 20px;
	text-align: center;
}

#update {
	padding-left: 10px;
	text-align: left;
	padding-bottom: 25px;
}

#update button {
	height: 30px;
	width: 50px;
	margin-top: 1px;
	font-size: 12px;
	color: white;
	background: orange;
}

#update p {
	font-size: 15px;
	font-weight: 600;
	display: inline-block;
	padding-right: 10px;
}

#update select {
	width: 90px !important;
}

#pagingBtns {
	padding-bottom: 30px;
}

#pagingBtns button {
	background: #efefef;
	width: 30px;
	height: 30px;
}

#pagingBtns button:hover {
	cursor: pointer;
	background: #d6d6d6;
}

#pagingBtns button:disabled:hover {
	cursor: default;
	background: #efefef;
}

#currentPage {
	background: orange !important;
	color: white;
	cursor: default !important;
}

#currentPage:hover {
	background: orange !important
}

li>a {
	color: black;
}

#id {
	font-size: 12px;
	color: #828282a6;
}

#btns button {
	width: 100px;
	height: 40px;
	font-size: 15px;
	margin: 0 20px;
	color: white;
}

#updateBtn {
	background: orange;
}

#updateBtn:hover {
	background: #ffa500d9;
	cursor: pointer;
}

#deleteBtn {
	background: #666666;
}

#deleteBtn:hover {
	background: #666666d9;
	cursor: pointer;
}

td a:hover {
	cursor: pointer;
}

input[type=search]:hover {
	-webkit-box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	z-index: 2;
}

input {
	outline: none;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">
		<div id="container-wrap">
			<%@include file="productNav.jsp"%>
			<div id="contents">
				<div id="contents-wrap">
					<div id="top">
						<div>
							<h4>상품 관리</h4>
						</div>
						<div id="top-right">
							<div>
								<select id="filter">
									<option value="Id">아이디</option>
									<option value="Name">이름</option>
								</select>
							</div>
							<div id="searchBox">
								<input type="search" id="inputSearch" name="inputSearch"
									placeholder="검색어를 입력해주세요." value="">
								<button id="searchBtn">검색</button>
							</div>
						</div>
					</div>
					<div id="table">
						<table>
							<tr id="firstTr">
								<th>선택</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>가격</th>
								<th>재고</th>
							</tr>
							<tbody id="tableBody">
								<%
								if (list != null && list.size() > 0) {
									for (Product p : list) {
								%>
								<tr class="click">
									<td><input type="checkbox" name="checkbox"
										value="<%=p.getProductNo()%>"></td>
									<td onclick="productInfo(<%=p.getProductNo()%>)"><%=p.getCateName()%></td>
									<td onclick="productInfo(<%=p.getProductNo()%>)"><%=p.getProductName()%></td>
									<td onclick="productInfo(<%=p.getProductNo()%>)"><%=p.getProductPrice() %></td>
									<td onclick="productInfo(<%=p.getProductNo()%>)"><%=p.getProductVolume() %></td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="5">등록된 상품이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div id="bottom">
						<div id="pagingBtns">
							<button value="1" class="beforeBtn">&lt;&lt;</button>
							<button value="<%=paging.getCurrentPage() - 1%>"
								class="beforeBtn">&lt;</button>
							<%
							for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
								if (i == paging.getCurrentPage()) {
							%>
							<button id="currentPage" disabled><%=i%></button>
							<%
							} else {
							%>
							<button value="<%=i%>"><%=i%></button>
							<%
							}
							}
							%>
							<button value="<%=paging.getCurrentPage() + 1%>" class="afterBtn">&gt;</button>
							<button value="<%=paging.getMaxPage()%>" class="afterBtn">&gt;&gt;</button>
						</div>
						<script>
						var currentPage = <%=paging.getCurrentPage()%>
						var maxPage = <%=paging.getMaxPage()%>
						
						if (currentPage==1)
							$('.beforeBtn').attr('disabled', true);
						if (currentPage>=maxPage)
							$('.afterBtn').attr('disabled', true);
						</script>
						<div id="btns">
							<button id="updateBtn">등록</button>
							<button id="deleteBtn">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
<script>
	$('#searchBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/searchMember.do?filter=' + $('#filter').val() + '&&input=' + $('#inputSearch').val().trim(); 
	});

	$('#updateBtn').on('click', function() {
		location.href='<%=request.getContextPath()%>/writeProductForm.pro'; 
	});

	$('#deleteBtn').on('click', function() {
		var checkArr = [];
		$('input[name="checkbox"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		
		if (confirm('해당 제품을 삭제하시겠습니까?')) {
			$.ajax({
				type: 'post',
				url:'deleteProduct.do',
				data:{
					check:checkArr
				},
				success:function(data){
					alert(data);
					window.location.reload();
				}		
			});
		}
	});
	
	$('#pagingBtns button').on('click', function(){
		var page = $(this).val();
			location.href = '<%=request.getContextPath()%>/productList.do?page=' + page;
	});
	
	$('.click').on('mouseover',function(){
		$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
	}).on('mouseout',function(){
		$(this).closest('tr').css({"background":"","color":"","cursor":""});
	});
	
	function productInfo(product_no){
		location.href = '<%=request.getContextPath()%>/productDetail.do?product_no=' + product_no;
	}
</script>
</html>