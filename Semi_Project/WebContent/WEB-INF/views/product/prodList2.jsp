<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member, product.model.vo.Product, product.model.vo.ProductFile,  product.model.vo.PageInfo, common.MyFileRenamePolicy"%>
<%
	Member authority = (Member) session.getAttribute("loginUser");
	
	ArrayList<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
	ArrayList<ProductFile> fList = (ArrayList<ProductFile>) request.getAttribute("fList");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	System.out.println(pList);
	System.out.println(fList);
	System.out.println(pi);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품보기</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
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

.list>ul>li {width: calc(100%/3); }


.img-box>img {width: 100%; width:170px; height:170px;}
.list>ul>li>.product-name {text-align: center; 
						   font-weight: bold;}
.list>ul>li:hover>.product-name { text-decoration: underline;}
.list>ul>li>.product-price { text-align: center; 
							 font-weight: bold;}
.list>ul>li>.product-price::after { content: "원"; 
									font-size: 1rem; font-weight: bold;}

.list-name {margin: 10px; font-weight: bold; font-size: 30px;}
.list-name span {margin: 0 0 0 10px;}
.list {align: center;}

/*라이브러리*/
.cell { float: left; box-sizing: border-box;}

#test_btn1 {
	background-color: orange;
	border: none;
	color: #fff;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 5px;
	float: right;
}

/* 페이징 */
.paging {
	text-align: center;

	
}

.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	color: #000;
	background-color: lightgray;
}
/* 현재 페이징에 select 클래스를 적용한다*/
.paging a.select {
	color: #fff;
	background-color: orange;

</style>
</head>
<body>
<% if(authority == null) {%>
		<%@include file="../title_header.jsp"  %>
	<% } else if(authority != null && authority.getUserId().equals("admin")) {%>
		<%@include file="../admin/header.jsp"%>
	<% } else if(authority != null && !authority.getUserId().equals("admin")) {%>
		<%@include file="../title_header.jsp"  %>
	<% } %>
		
		<%@include file="productNav.jsp"%>

	<div class="product-list">
		<div class="list-name">
			<span>제품보기 > 항산화</span>
			<%
				if (authority != null && authority.getUserId().equals("admin")) {
			%>
			<button id="test_btn1"
				onclick="location.href='<%=request.getContextPath()%>/writeProductForm.pro'">상품등록</button>
			<%
				}
			%>

			<hr>

		</div>
		<div class="list">
			<ul>
				<%
					for (int i = 0; i < pList.size(); i++) {
				%>
				<%
					Product p = pList.get(i);
				%>
				<li class="cell">
					<div class="img-box">
						<input type="hidden" id="pNo" name="pNo" value="<%=p.getProductNo()%>">
						<%
							for (int j = 0; j < fList.size(); j++) {
						%>
						<%
							ProductFile f = fList.get(j);
						%>
						<%
							if (p.getProductNo() == f.getProductNo()) {
						%>
						<img src="<%=request.getContextPath()%>/uploadFiles/productUpload/<%=f.getChangeName()%>">
						<%
							}
						%>
						<%
							}
						%>
					</div>
					<div class="product-name"><%=p.getProductName()%></div>
					<div class="product-price"><%=p.getProductPrice()%></div> <%
 	}
 %>
				</li>
			</ul>


			<!-- 페이징 -->
			<div class="paging">
				<!-- 맨 처음으로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/goProduct?currentPage=1'">&lt;&lt;</a>
				<!-- 이전 페이지로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/goProduct?currentPage=<%=currentPage - 1%>'"
					id="beforeBtn">&lt;</a>
				<script>
				
			
			if(<%=currentPage%> <= 1 ) {
					var before = $('#beforeBtn');
					before.attr('disabled', true);
				}
			</script>
				<!-- 숫자 버튼 -->
				<%
					for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
				%>
				<a class="select" href="#"><%=p%></a>
				<%
					} else {
				%>
				<a href="#" id="numBtn"
					onclick="location.href='<%=request.getContextPath()%>/goProduct?currentPage=<%=p%>'"><%=p%></a>
				<%
					}
				}
				%>
				<!-- 다음 페이지로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/goProduct?currentPage=<%=currentPage + 1%>'"
					id="afterBtn">&gt;</a>
				<!-- 맨 뒤로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/goProduct?currentPage=<%=maxPage%>'">&gt;&gt;</a>
			</div>
			
			
			<script >
						$(function(){
						$('.img-box').click(function(){
							var pNo = $(this).children().eq(0).val();
							console.log(pNo);
							location.href='<%= request.getContextPath() %>/detail.pro?pNo='+pNo;
							});
						});
			</script>
		</div>
	</div>
</body>
</html>
