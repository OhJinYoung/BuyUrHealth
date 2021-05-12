<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member, product.model.vo.Product, product.model.vo.ProductFile,  product.model.vo.PageInfo, common.MyFileRenamePolicy"%>
<%
Member authority = (Member) session.getAttribute("loginUser");

ArrayList<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
ArrayList<ProductFile> fList = (ArrayList<ProductFile>) request.getAttribute("fList");
PageInfo paging = (PageInfo) request.getAttribute("pi");
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

#productlist img {
	width: 80px;
	height: 100px;
}

table {
	text-align: center;
	width: 100%;
}

.cell {
	padding: 20px 0 10px 0;
	border: 1px solid #9a9a9a;
}

.img-box {
	padding-bottom: 20px;
	width:300px;
}

#product-info {
	padding-top: 10px;
	border-top: 1px solid #9a9a9a;
}

.list td {
	padding-right: 15px;
	padding-bottom: 15px;
}

.product-name{
padding: 5px 0;
}

</style>
<body>
	<%@include file="../title_header.jsp"%>
	<div id="container">
		<div id="container-wrap">
			<%@include file="productNav.jsp"%>
			<div id="contents">
				<div id="contents-wrap">
					<div id="top">
						<div>
							<h4><%=pList.get(0).getProductDetail()%></h4>
						</div>
					</div>
					<div id="productlist">
						<div class="list">
							<table>
								<%
								for (int i = 0; i < pList.size(); i++) {
									if (i == 0 || (i - 2 > 0 && ((i - 2) % 3) == 0)) {
								%>
								<tr>
									<%
									}
									Product p = pList.get(i);
									%>
									<td>
										<div class="cell">
										<input type="hidden" id="pNo" name="pNo"
														value="<%=p.getProductNo()%>">
											<div>
												<div class="img-box">
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
													<%
													}
													%>
													<%
													}
													%>
												</div>
												<div id="product-info">
													<div class="product-name"><%=p.getProductName()%></div>
													<div class="product-price"><%=p.getProductPrice()%></div>
												</div>
											</div>
										</div>
									</td>
									<%
									if (((i - 2) % 3) == 0) {
									%>
								</tr>
								<%
								}
								}
								%>
							</table>

						</div>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
<script>
	$('#pagingBtns button').on('click', function(){
		location.href = '<%=request.getContextPath()%>/goProduct7?currentPage='+ page;
	});
	
	$('.cell').click(function(){
			var pNo = $(this).children().eq(0).val();
			console.log(pNo);
			location.href='<%= request.getContextPath() %>/detail.pro?pNo='+pNo;
	});
	
	$('.cell').on('mouseover',function(){
		$(this).css({"background":"#f2f2f2","cursor":"pointer"});
		$(this).children().find('img').css({"filter":"brightness(0.95)"});
	}).on('mouseout',function(){
		$(this).css({"background":"","color":"","cursor":""});
		$(this).children().find('img').css({"filter":""});
	});
</script>
</html>