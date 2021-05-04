<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	html, body {
	    height: 100%; 
	    overflow: auto;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#orderTitle{
		width: 80%;
		color: red; 
		padding-top: 50px;
		padding-bottom: 20px;
		margin: 0px auto;
		font-size: 24px;
	}
	
	.infodiv{
		padding-bottom: 15px;
	}
	
	.payspan{
		padding: 5px;
	}
	
	.cartdiv{
		width: 80%;
		border-top: 2px solid black;
		margin: 0px auto;
		height: auto;
		min-height: 30%;
		padding: 30px;
	}	
	
	.addressdiv{
    	width: 80%;
		border-top: 2px solid black;
		margin: 0px auto;
		height: auto;
		min-height: 30%;
		border-collapse : collapse;
		padding: 30px;
    }
    
    .paymentdiv{
    	width: 80%;
		border-top: 2px solid black;
		margin: 0px auto;
		min-height: 30%;
		padding: 30px;
    }
    
    .pay.head{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding-bottom: 25px;
		padding-top: 15px;
		padding-left: 35px;
    }
    
	.pay.data{
		border-top: 2px solid black;
		height: 130px;
		border: 1px solid lightgray;
		background: lightgray;
		margin-top: 50px; 
	}
	
	.pay.foot{
		margin-bottom: 50px; 
		float: left;
	}
	
	.calcinfo {
		float: left;
	}
	
	#calcinfo1{
		width: 10%;
		font-size: 20px;
		text-align: top; 
		margin: 5px;
	}
	
	#calcinfo2{
		width: 60%;
		height: 130px;
		font-size: 20px;
		text-align: left;
		display: flex; align-items: center;
		
	}
	#calcinfo3{
		width: 25%;
		height: 130px;
		text-align: center; 
		font-size: 20px;
		display: flex; align-items: center; justify-content: center;
	}
    
    table, td, th, tr{
    	border : 1px solid black;
  		border-collapse : collapse;
    }
    
    table{
    	width: 100%;
    }
    
    .orderli{
    	width: 20%;
    	text-align: center;
    	background: lightgray;
    }
    .orderan{
    	width: 80%;
    }
    
    .cartdiv .data {
        border-bottom: 1px dashed #888;
        box-sizing: border-box;
        cursor: pointer;
        float: left;
        width: 100%;
    }
    .cartdiv .cart.head .subdiv {
        background-color: white;
        font-weight: bold;
        width: 100%;
        border-top: 1px solid black;
        border-bottom: 2px dashed black;
    }
    
    .foot{
    	padding: 15px;
    	float: right;
    	width: 100%;
    }
    
    .foot .total{
    	float: right;
    }
    
    .cartdiv .cart > .subdiv {
    	/* display: block; */ 
        float: left;
    }
    
    .cartdiv .cart > .subdiv:nth-child(1) {
        width: 60%;
    }
    .cartdiv .cart > .subdiv:nth-child(2) {
        width: 40%;
    }
    .cartdiv .cart > div > div {
        float: left;
        text-align: center;
        margin: 0;
        padding: 12px 0;
    }
    
    .cartdiv .cart.data > div > div {
        height: 60px;
        line-height: 60px;
    }
    
	.cartnum {
	    color: blue;
	}
	
	.check {
	    width: 50%;
	}
	
	input[type=checkbox] {
	transform: scale(1.5);
	}
	
    .img{
        width: 20%;
    }
    .iname{
        width: 70%;
        /*height: 100%*/
    }
    
    .cartprice {
        width: 33%;
    }
    .num {
        width: 33%;
    }
    .sum {
        width: 34%;
      	max-width: 80px;
    }
    
    .cartDelete{
        width: 50%;
    }
    
    .i_num {
	    text-align: center;
	    width: 40px;
	    font-size: 1em;
	}
    
    /* div 안 잘리는 방법 찾기ㅜㅜ */
    .cartdiv .data .iname {
      text-align: center !important; /* 같은 속성을 여러 번 정의했을 때 나중에 설정한 값이 적용. 만약 나중에 설정한 값이 적용되지 않게 하려면 속성값 뒤에 !important */
      line-height: 1 !important;
    }
    
    .baseform > tbody > tr > td:first-child {
        width: 100px;
    }
    
	#backBtn{
		background: lightgray;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
    	float: left;
    	cursor: pointer;
	}
	
	#payBtn{
		background: #E81224;
    	border: 1px solid #E81224;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 55px;
    	cursor: pointer;
	}
    
    
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<h3 id=orderTitle>주문하기</h3>
    
					
					<div class="paymentdiv" id="paymentdiv">
						<h3>결제 정보</h3>
						
						<div class="pay head">
							<div class="infodiv">
								<b>결제 수단 선택</b>
							</div>
							<div class="subdiv">
								<div class="payspan">
									<input type="radio" name="payMethod" value="신용카드" checked>신용카드(카카오페이, 네이버페이, 페이코 및 토스 이용 가능)
								</div>
							</div>
						</div>
						
						<div class="pay data">
							<div class="subdiv">
					          	<div class="calcinfo" id="calcinfo1">
					          		<b>총 결제내역</b>
					          	</div>
					          	<div class="calcinfo" id="calcinfo2">
					          		<div id="subdiv">
					          			총 상품가격: <b>00</b>원 (총 <b>3</b>종)<br>
					          			배송비: <b>2,500</b>원
					          		</div>
					          	</div>
					          	<div class="calcinfo" id="calcinfo3" >
					          		<div id="subdiv">
					          			총 결제할 금액: <b>00</b>원
					          		</div>
					          	</div>
							</div>
			   			</div>
			   			
						<div class="pay foot">
							<div id="subdiv">
								구매 조건을 확인하였으며 결제에 동의합니다.&nbsp;
								<input type="checkbox" value="confirm" required checked>
							</div>
						</div>
						
						<div align="center" class="pay button">
							<button type="button" onClick="history.back(-1);" id="backBtn" value="이전페이지">이전페이지</button>
							<button type="submit" id="payBtn">결제하기</button>
						</div>
					</div>
	    <script>
	    	$("#payBtn").click(function () {
				var IMP = window.IMP; 
				IMP.init('imp43623305');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg: 'html5_inicis', // version 1.1.0부터 지원.
				/*
				'kakao':카카오페이,
				html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				*/
				pay_method: 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				*/
				merchant_uid: 'merchant_' + new Date().getTime(),
				/*
				merchant_uid에 경우
				https://docs.iamport.kr/implementation/payment
				위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				참고하세요.
				나중에 포스팅 해볼게요.
				*/
				name: '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount: 1000,
				//가격
				buyer_email: 'buyourhealth@gmail.com',
				buyer_name: '강건강',
				buyer_tel: '010-1234-5678',
				buyer_addr: '서울특별시 강남구 삼성동',
				buyer_postcode: '123-456',
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				/*
				모바일 결제시,
				결제가 끝나고 랜딩되는 URL을 지정
				(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
				*/
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					/*var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;*/
					location.href='<%=request.getContextPath()%>/com.or';
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
			</script>
			
			


        
</body>
</html>