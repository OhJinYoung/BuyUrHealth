<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
	
<%
		Member loginUserNav = (Member) session.getAttribute("loginUser");
%>
<style>
.product-menubar {
	width: 20%;
	height: 100%;
	max-width: 170px;
	padding: 30px 20px;
	float: left;
	display: inline-block;
	border-right: 1px solid black;
}

#product-menubar-name {
	text-align: center;
	font-size: 20px;
	padding:10px 0;
}

.product-menubar ul, li {
	list-style: none;
	padding: 10px;
	margin: 0;
	text-align: center;
}

.product-menubar li:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

</style>
<div class="product-menubar">
	<hr>
	
			<% if (loginUserNav != null && loginUserNav.getUserId().equals("admin")) { %>
        	<h2 id="product-menubar-name">제품관리</h2>
			<%} else {%>	
		    <h2 id="product-menubar-name">제품보기</h2>
			<% } %>
    <hr>
        <ul>
          <li class="link" id="goProduct">기초영양</li>
          <li class="link" id="goProduct2">항산화</li>
          <li class="link" id="goProduct3">뼈/관절</li>
          <li class="link" id="goProduct4">면역</li>
          <li class="link" id="goProduct5">눈건강</li>
          <li class="link" id="goProduct6">장건강</li>
          <li class="link" id="goProduct7">피부건강</li>
        </ul>
        
    </div>
<script>
$('.link').on('click', function() {
	location.href='<%=request.getContextPath()%>/'+$(this).attr('id');
});
</script>