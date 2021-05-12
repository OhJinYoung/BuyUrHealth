<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>

<%
Member loginUserNav = (Member) session.getAttribute("loginUser");
%>
<style>
.product-menubar {
	width: 20%;
	max-width: 170px;
	padding: 30px 20px;
	float: left;
	display: inline-block;
}

#product-menubar-name {
	text-align: center;
	font-size: 20px;
	padding: 10px 0;
	border-top: 1px solid #9a9a9a;
	border-bottom: 1px solid #9a9a9a;
}

.product-menubar ul, li {
	list-style: none;
	padding: 10px;
	margin: 0;
	text-align: center;
}

.product-menubar li:hover {
	color: gray;
	cursor: pointer;
}
</style>
<div class="product-menubar">
	<h2 id="product-menubar-name">제품 관리</h2>
	<ul>
		<li class="link">제품 목록</li>
	</ul>
</div>
<script>
$('.link').on('click', function() {
	location.href='<%=request.getContextPath()%>/productList.do';
});
</script>