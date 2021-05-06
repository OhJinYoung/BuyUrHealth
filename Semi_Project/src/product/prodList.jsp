<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member, product.model.vo.Product, product.model.vo.ProductFile,  product.model.vo.PageInfo, common.MyFileRenamePolicy"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");

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
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
h2 {
	text-align: center;
}

.wrap {
	background: white;
	width: 100%;
	height: 50px;
}

.mainMenu {
	background: white;
	color: gray;
	text-align: center;
	font-weight: bold;
	vertical-align: middle;
	width: 150px;
	height: 50px;
	display: table-cell;
}

.mainMenu:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

.mainLogo {
	float: left;
	margin-right: 100px;
	margin-left: 30px;
	clear: both;
}
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div>
				<img class="mainLogo"
					src="<%=request.getContextPath()%>/images/mainlogo.png"
					width="100px" height="50px" alt="My Image">
			</div>
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
			<span>제품보기 > 기초영양</span>
			<%
				if (loginUser != null && loginUser.getUserId().equals("admin")) {
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
						<img
							src="<%=request.getContextPath()%>/uploadFiles/productUpload/<%=f.getChangeName()%>">
						<script >
						$(function(){
						$('#pNo').click(function(){
							var pNo = $(this).eq(0).val();
							location.href="<%=request.getContextPath()%>/detail.pro?pNo"+pNo;
							});
						});
						</script>
						
						
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
					onclick="location.href='<%=request.getContextPath()%>/list.pro?currentPage=1'">&lt;&lt;</a>
				<!-- 이전 페이지로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/list.pro?currentPage=<%=currentPage - 1%>'"
					id="beforeBtn">&lt;</a>
				<script>
				
			
			if(<%=currentPage%> <= 1 ) {
					var before = $('#beforeBtn');
					before.attr('disabled', ture);
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
					onclick="location.href='<%=request.getContextPath()%>/list.pro?currentPage=<%=p%>'"><%=p%></a>
				<%
					}
				}
				%>
				<!-- 다음 페이지로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/list.pro?currentPage=<%=currentPage + 1%>'"
					id="afterBtn">&gt;</a>
				<!-- 맨 뒤로 -->
				<a href="#"
					onclick="location.href='<%=request.getContextPath()%>/list.pro?currentPage=<%=maxPage%>'">&gt;&gt;</a>
			</div>
		</div>
	</div>
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%=request.getContextPath()%>/list.pro";
		});
		$('#goCommunity').on('click', function(){
			location.href="<%=request.getContextPath()%>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%=request.getContextPath()%>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%=request.getContextPath()%>/updateMyPage.me"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goService').on('click', function(){
			location.href="<%=request.getContextPath()%>/list.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		
		
	</script>
</body>
</html>