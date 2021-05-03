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
		padding: 10px;
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
	}
	
	#payBtn{
		background: #E81224;
    	border: 1px solid #E81224;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 55px;
	}
    
    
</style>
</head>
<body>
	<%@ include file="../user/header.jsp" %>
	
	<h3 id=orderTitle>주문하기</h3>
	
	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page">
    
            		<div class="cartdiv" id="cart">
            	
	            	<h3>주문 내역</h3>
		                <div class="cart head">
		                    <div class="subdiv">
		                        <div class="img"></div>
		                        <div class="iname">상품명</div>
		                    </div>
		                    <div class="subdiv">
		                        <div class="cartprice">가격</div>
		                        <div class="num">수량</div>
		                        <div class="sum">합계</div>
		                    </div>
		                </div>
		        
		                <div class="cart data">
		                    <div class="subdiv">
		                        <div class="img"><img src="" width="60"></div>
		                        <div class="iname">
		                            <span>클리어런스 - 타게티드 초이스, 블러드 프레셔 서포트 60 베지캡슐</span>
		                        </div>
		                    </div>
		                    <div class="subdiv">
		                        <div class="cartprice"><input type="hidden" name="i_price" id="i_price1" class="i_price" value="12500">12,500원</div>
		                        <div class="num">
		                            <div class="cartnum">
		                                <input type="text" name="i_num1" id="i_num1" size="1" maxlength="4" class="i_num" value="2" onkeyup="">
		                            </div>
		                        </div>
		                        <div class="sum">25,000원</div>
		                    </div>
		                </div>
		                
		                <div class="cart data">
		                    <div class="subdiv">
		                        <div class="img"><img src="" width="60"></div>
		                        <div class="iname">
		                            <span>비타민 A 10,000 IU 100 소프트젤</span>
		                        </div>
		                    </div>
		                    <div class="subdiv">
		                        <div class="cartprice"><input type="hidden" name="i_price" id="i_price2" class="i_price" value="4200">4,200원</div>
		                        <div class="num">
		                            <div class="cartnum">
		                                <input type="text" name="i_num2" id="i_num2" size="1" maxlength="4" class="i_num" value="1" onkeyup="">
		                            </div>
		                        </div>
		                        <div class="sum">4,200원</div>
		                    </div>
		                </div>
		                
		                <div class="cart data">
		                    <div class="subdiv">
		                        <div class="img"><img src="" width="60"></div>
		                        <div class="iname">
		                            <span>울트라 프리미엄 어드밴스드 프리바이오틱 60 베지캡슐</span>
		                        </div>
		                    </div>
		                    <div class="subdiv">
		                        <div class="cartprice"><input type="hidden" name="i_price" id="i_price3" class="i_price" value="24000">24,000원</div>
		                        <div class="num">
		                            <div class="cartnum">
		                                <input type="text" name="i_num3" id="i_num3" size="1" maxlength="4" class="i_num" value="1" onkeyup="">
		                            </div>
		                        </div>
		                        <div class="sum">24,000원</div>
		                    </div>
		                </div>
		                
		                <div class="foot">
		                	<div class="subdiv1">
		                		<div></div>
		                		<div></div>
		                	</div>
		                	<div class="subdiv1">
		                		<div></div>
		                		<div></div>
		                		<div class="total"><input type="hidden" name="i_priceTotal" id="i_priceTotal" class="i_price" value="24000">총 결제금액 : <b>00</b> 원</div>
		                	</div>
		                </div>
					</div>
	    		<br clear="all">
	    		
    
            		<div class="addressdiv" id="address">
            	
		            	<h3>배송지 정보</h3>
		            	<table border="1" class="addressTable" cellpadding="10px">
		            		<tr>
		            			<td class="orderli needed">* 주문자</td>
		            			<td class="orderan"><input type="text" name="addressForm" id="sendName" size="50px" placeholder="주문하시는 분의 성함을 입력해주세요" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 받으시는 분</td>
		            			<td class="orderan"><input type="text" name="addressForm" id="getName" size="50px" placeholder="받으시는 분의 성함을 입력해주세요" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 주소</td>
		            			<td class="orderan">
		            				<input type="text" name="addressForm" id="orderName" placeholder="우편번호" required><button id="addressSearch" onclick="">주소 검색</button><br>
		            				<input type="text" name="addressForm" id="orderName" size="80px" required><br>
		            				<input type="text" name="addressForm" id="orderName" size="100px" placeholder="나머지 주소를 입력해주세요" required>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 휴대전화번호</td>
		            			<td class="orderan"><input type="tel" name="number" placeholder="전화번호를 입력해주세요" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 이메일</td>
		            			<td class="orderan"><input type="email" name="addressForm" id="getEmail" placeholder="주문하시는 분의 이메일을 입력해주세요" size="80px" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli notNeeded">배송시 요청사항</td>
		            			<td class="orderan"><textarea type="text" name="addressForm" id="request" style="resize:none;" cols="40" rows="5" placeholder="선택사항"></textarea></td>
		            		</tr>
		            	</table>
					</div>
					
					<div class="paymentdiv" id="paymentdiv">
						<h3>결제 정보</h3>
						
						
						
						<div class="pay head">
							<div class="infodiv">
								<b>결제 수단 선택</b>
							</div>
							<div class="subdiv">
								<span class="payspan">
									<input type="radio" name="payMethod" value="신용카드" onclick="">신용카드
								</span>
								<span class="payspan">
									<input type="radio" name="payMethod" value="무통장입금" onclick="">무통장입금
								</span>
								<span class="payspan">
									<input type="radio" name="payMethod" value="카카오페이" onclick="">카카오페이
								</span>
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
								<input type="checkbox" value="confirm" required>
							</div>
						</div>
						
						<div align="center" class="pay button">
							<button onclick="history.back();" id="backBtn">이전페이지</button>
							<button type="submit" id="payBtn">결제하기</button>
						</div>
					</div>
	    </form>	
	    
	    <script>
	    
		    var IMP = window.IMP; 
		    IMP.init("imp43623305");
		    
			$("#check_module").click(function () {
				var IMP = window.IMP; // 생략가능
				IMP.init('가맹점식별코드를 넣어주세요');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg: 'inicis', // version 1.1.0부터 지원.
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
				buyer_email: 'iamport@siot.do',
				buyer_name: '구매자이름',
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
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
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