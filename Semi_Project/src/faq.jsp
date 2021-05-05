<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel='stylesheet' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../../../js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	h2{text-align:center;}
	.wrap{background: white; width: 100%; height: 50px;}
	.mainMenu{
			background: white; color: gray; text-align: center; font-weight: bold; 
			vertical-align: middle; width: 150px; height: 50px; display: table-cell;
		}
	.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
</style>
</head>
<body>
	<div class="wrap">
		<nav>
			<div><img class="mainLogo" src="<%= request.getContextPath() %>/images/mainlogo.png" width="100px" height="50px" alt="My Image"></div>
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
			<h2 id="product-menubar-name">고객센터</h2>
			<hr>
			<ul>
				<li id="goNotice">공지사항</li>
				<li id="goFaq">자주묻는질문</li>
				<li>Q&A</li>
				<li>약관및방침</li>
			</ul>
		</div>

		<div class="product-list">
			<div class="list-name">
				<span>자주묻는질문</span>
				<hr>
			</div>

			<div class="accordion">
			<div class="accordion-item">
				<a>Q. 상품을 반품/교환하고 싶을땐 어떻게 하나요?</a>
				<div class="content">
					<p>A. 상품에 문제가 있는 경우에는 Q&A게시판에 문의해주시거나 고객센터로 전화주시면 확인 후 반품, 환불처리
						진행해드립니다. 단, 고객님의 단순 변심이나 부주의로 인해 훼손된 제품에 대한 교환/환불은 불가합니다. (제품 수령일
						기준 7일 이내 접수 한함)</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 반품/교환시 배송비는 어떻게 하나요?</a>
				<div class="content">
					<p>A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra
						suspendisse potenti.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 반품 된 상품을 다시 받을 수 있나요?</a>
				<div class="content">
					<p>A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra
						suspendisse potenti.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 주문했는데 취소하고 싶어요.</a>
				<div class="content">
					<p>A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra
						suspendisse potenti.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 반품 요청시 환불 소요기간이 어떻게 되나요?</a>
				<div class="content">
					<p>A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra
						suspendisse potenti.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 주문 후 수량을 변경 할 수 있나요?</a>
				<div class="content">
					<p>A. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra
						suspendisse potenti.</p>
				</div>
			</div>
		</div>
		<br>
		</div>
		</div>


	<script>
	
	$('#goViewProduct').on('click', function(){
		location.href="<%= request.getContextPath() %>/prolist.no";
	});
	$('#goCommunity').on('click', function(){
		location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
	});
	$('#goCart').on('click', function(){
		location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
	});
	$('#goMypage').on('click', function(){
		location.href="<%= request.getContextPath() %>/updateMyPage.me";
	});
	
	$('#goService').on('click', function(){
		location.href="<%= request.getContextPath() %>/noticelist.no"; 	
	});
	
	$('#goNotice').on('click', function(){
		location.href="<%=request.getContextPath()%>/noticelist.no";
	});
			
	$('#goFaq').on('click', function(){
		location.href="<%=request.getContextPath()%>/faq.no";
	});
	</script>




</body>
</html>