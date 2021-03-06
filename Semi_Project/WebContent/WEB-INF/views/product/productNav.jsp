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
	<h2 id="product-menubar-name">제품보기</h2>
	<ul>
		<li class="link">기초영양</li>
		<li class="link">항산화</li>
		<li class="link">뼈/관절</li>
		<li class="link">면역력</li>
		<li class="link">눈건강</li>
		<li class="link">장건강</li>
		<li class="link">피부건강</li>
	</ul>
</div>
<script>
$('.link').on('click', function() {
	location.href='<%=request.getContextPath()%>/goProduct?cate=' + $(this).text();
});
</script>