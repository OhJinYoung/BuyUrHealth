<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel='stylesheet'
	href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
</style>
</head>
<body>
	<%@include file="../admin/header.jsp"%>
	<%@include file="../notice/customerCenterNav.jsp"%>
	<div class="product-list">
		<div class="list-name">
			<span>자주묻는질문</span>
			<hr>
		</div>

		<div class="accordion">
			<div class="accordion-item">
				<a>Q. 상품을 반품/교환하고 싶을땐 어떻게 하나요?</a>
				<div class="content">
					<p>
						A. 상품에 문제가 있는 경우에는 Q&A게시판에 문의해주시거나 고객센터로 전화주시면 확인 후 반품, 환불처리
						진행해드려요. <br> 단, 고객님의 단순 변심이나 부주의로 인해 훼손된 제품에 대한 교환/환불은 불가합니다.
						<br> (제품 수령일기준 7일 이내 접수 한함)
					</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 영양제는 언제 먹으면 좋은가요?</a>
				<div class="content">
					<p>
						A. 섭취 가이드 안내드립니다.<br> <br> 비타민C<br> 잊지 않고 꾸준히 섭취하는게
						중요해요. 편한 시간에 드셔도 되지만 그래도 아침이나 점심 식사 직후에 드시는 것이 좋아요.<br> <br>
						루테인<br> 잊지 않고 꾸준히 섭취하는게 중요해요. 편한 시간에 드셔도 되지만 아침식사 후에 드시는 것이
						좋아요.<br> <br> 오메가3<br> 잊지 않고 꾸준히 섭취하는게 중요해요. 편한 시간에
						드셔도 되지만 점심 이나 저녁식사 후에 드시는 것이 좋아요.<br> <br> 밀크씨슬<br>
						술자리가 잦다면 매일 잊지 않고 드시는게 좋아요. 편한 시간에 드셔도 되지만 점심이나 저녁식사 후에 드시는 것이
						좋아요.<br> <br> 프로바이오틱스<br> 공복에 섭취하는 것이 좋아요. 보통 아침 식사
						전 또는 기상 직후에 섭취하는 것이 가장 좋아요.<br> <br> 비타민B<br> 아침이나
						점심 식사 전에 드시는 것이 흡수에 좋으나, 속쓰림을 자주 느끼시는 분은 식사 직후에 드시는게 좋아요. 오후 늦은시간
						이후에는 숙면을 방해할 수 있어요.
					</p>

				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 회원 탈퇴를 하고싶어요.</a>
				<div class="content">
					<p>
						A. 회원 탈퇴를 원하시나요?<br> 불편한 점이 있으면 알려주세요. 담당자가 최선을 다해 개선해 드릴게요.<br>
						(Q&A 게시판 또는 전화 상담)<br> <br> 회원 탈퇴는 홈페이지 -> 마이페이지 ->
						회원탈퇴에서 탈퇴하실 수 있어요.
					</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 비밀번호가 생각나지 않아요.</a>
				<div class="content">
					<p>A. BUH 홈페이지에서 -> 로그인 -> 비밀번호 찾기 항목을 이용해주세요.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 여러군데로 배송이 가능한가요?</a>
				<div class="content">
					<p>A. 제품에 따라 배송지가 각기 다르다면 각각 주문번호를 다르게 별도접수를 해야 합니다.</p>
				</div>
			</div>
			<div class="accordion-item">
				<a>Q. 영양제를 여러개 섭취해도 되나요?</a>
				<div class="content">
					<p>
						A. 정확한 상담을 위해서는 드시고 계신 타사 영양제의 성분을 알기 위해 품명을 알아야 해요.<br> 제품명과
						함께 Q&A게시판에 문의하시면 빠르고 정확하게 답변을 드릴게요
					</p>
				</div>
			</div>
		</div>
		<br>
	</div>

	<script>
		const items = document.querySelectorAll(".accordion a");
		
		function toggleAccordion(){
		  this.classList.toggle('active');
		  this.nextElementSibling.classList.toggle('active');
		}
		
		items.forEach(item => item.addEventListener('click', toggleAccordion));
</script>
</body>
</html>
