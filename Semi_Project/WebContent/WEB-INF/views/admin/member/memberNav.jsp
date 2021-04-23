<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.myPage-menubar {
	width: 20%;
	max-width: 170px;
	padding: 30px 20px;
	float: left;
	display: inline-block;
}

#myPage-menubar-name {
	text-align: center;
	font-size: 20px;
	padding:10px 0;
	border-top: 1px solid #9a9a9a;
	border-bottom: 1px solid #9a9a9a;
}

.myPage-menubar ul, li {
	list-style: none;
	padding: 10px;
	margin: 0;
	text-align: center;
}

.myPage-menubar li:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

</style>
<div class="myPage-menubar">
	<h2 id="myPage-menubar-name">마이페이지</h2>
	<ul>
		<li class="link" id="orderList.do">주문 관리</li>
		<li class="link" id="memberList.do">회원 관리</li>
		<li class="link" id="">관심상품</li>
	</ul>
</div>
<script>
$('.link').on('click', function() {
	location.href='<%=request.getContextPath()%>/'+$(this).attr('id');
});
</script>