<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<% int orderNo = (int)(Math.random()*10000000)+1; %>
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
	    min-width: 1500px;
	}	
	
	h3{
		margin-bottom: 10px;
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
		border-top: 2px solid black;
    	width: 80%;
		margin: 0px auto;
		height: auto;
		min-height: 30%;
		border-collapse : collapse;
		padding: 30px;
    }
    
    .pay.button{
    	width: 80%;
    	margin-top: 50px;
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
    	padding: 8px;
    }
    .orderan{
    	width: 80%;
    	padding: 5px;
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
	
	input{
		padding: 3px;
	}

    .iname{
        width: 90%;
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
    
    .none{
		display: none;
	}
	
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<h3 id=orderTitle>주문하기</h3>
	
	
	
	
            		<div class="cartdiv" id="cart">
            	
	            	<h3>주문 내역</h3>
		                <div class="cart head">
		                    <div class="subdiv">
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
		            	
		   <form action="pay();" name="orderform" id="orderform" method="post" class="orderform">  
		   	
		            	<table border="1" class="addressTable" cellpadding="10px">
		            	
		            		<tr class="none">
		            			<td class="none">
		            			<input type="hidden" name="orderNo" id="orderNo" value="<%= orderNo %>"> <!-- 주문번호 생성 -->
		            			</td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 받으시는 분</td>
		            			<td class="orderan"><input type="text" name="name" id="name" size="50px" placeholder="받으시는 분의 성함을 입력해주세요" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 주소</td>
		            			<td class="orderan">
		            				<input type="text" name="postcode" id="postcode" placeholder="우편번호" required>
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" name="roadAddres" id="roadAddress" size="80px" placeholder="도로명주소" required><br>
									<span id="guide" style="color:#999;display:none"></span>
									<input type="text" name="detailAddress" id="detailAddress" size="80px" placeholder="상세주소" required><br>
									<input type="text" name="extraAddress" id="extraAddress" size="50px" placeholder="참고항목"><br>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 휴대전화번호</td>
		            			<td class="orderan"><input type="tel" name="phone" id="phone" placeholder="전화번호를 입력해주세요" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli needed">* 이메일</td>
		            			<td class="orderan"><input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" size="80px" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli notNeeded">배송시 요청사항</td>
		            			<td class="orderan"><input type="text" name="forrequest" id="forrequest" size="80px" placeholder="선택사항"></td>
		            		</tr>
		            	</table>
			</form>
					</div>
			
			
					<div class="paymentdiv" id="paymentdiv">
			<h3>결제 정보</h3>
			
			<div class="pay head">
				<div class="infodiv">
					<b>결제 수단 선택</b>
				<div class="none">
						<input type="hidden" name="orderNo" value="<%=orderNo%>">
				</div>
				
				
				</div>
				<div class="subdiv">
					<div class="payspan">
						<input type="radio" name="payMethod" id="payMethod" value="신용카드" checked>신용카드(카카오페이, 네이버페이, 페이코 및 토스 이용 가능)
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
			</div>
		 		<div>	
			<div align="center" class="pay button">
				<button type="button" onClick="history.back(-1);" id="backBtn" value="이전페이지">이전페이지</button>
				<button type="submit" id="payBtn" onclick="pay();">결제하기</button>
			</div>
		</div> 
		
		
		 
		
		<script>
			function pay(){	
				var orderNo = $("#orderNo").val(); 
				var Username = $("#name").val();
				var phone = $("#phone").val();	
				var email = $("#email").val();
				var address = $("#postcode").val() + " " + $("#roadAddress").val() + " " 
								+ $("#detailAddress").val() + " " + $("#extraAddress").val();
				var forrequest = $("#forrequest").val();
				var price = 1000;
				var payment = $('input[name=payMethod]:checked').val();
				
				var IMP = window.IMP; // 생략가능
				IMP.init('imp43623305');
				
				IMP.request_pay({
				pg: 'html5_inicis', // version 1.1.0부터 지원.
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: orderNo,  
				amount: 1000,  
				
				buyer_email: email,
				buyer_name: Username,
				buyer_tel: phone,
				buyer_addr: address,
				
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				}, function (rsp) {
				 	console.log(rsp);
				
					if (rsp.success) {
						$.ajax({
			       			url:"order.or",
			        		type : "post",
			        		data : {
			        			orderNo : orderNo,
			        			Username : Username,
			        			phone : phone,
			        			email : email,
			        			forrequest : forrequest,
			        			payment : payment,
			        			address : address,
			        			price : price
			        		},
			        		success : function(data){
			        			console.log(data);
			        			console.log(typeof(data));
			        		},
			        		error : function(e){
								console.log(e);
							}
			        		
			       		});
						
						var msg = '결제가 완료되었습니다.' + '\n';
						msg += '고유ID : ' + rsp.imp_uid + '\n';
						msg += '주문번호 : ' + rsp.name + '\n';
						msg += '받으시는 분 : ' + rsp.buyer_name + '\n';
						msg += '휴대폰 번호 : ' + rsp.buyer_tel + '\n';
						msg += '이메일 : ' + rsp.buyer_email + '\n';
						msg += '주소 : ' + rsp.buyer_addr + '\n';
						msg += '결제 금액 : ' + rsp.paid_amount;
						

						location.href='<%=request.getContextPath()%>/com.or?no=' + orderNo;	
						
						
					} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					
					}
					alert(msg);
				
				});
			}
			</script>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
			    function execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var roadAddr = data.roadAddress; // 도로명 주소 변수
			                var extraRoadAddr = ''; // 참고 항목 변수
			
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('postcode').value = data.zonecode;
			                document.getElementById("roadAddress").value = roadAddr;
			                
			                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			                if(roadAddr !== ''){
			                    document.getElementById("extraAddress").value = extraRoadAddr;
			                } else {
			                    document.getElementById("extraAddress").value = '';
			                }
			
			                var guideTextBox = document.getElementById("guide");
			                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			                if(data.autoRoadAddress) {
			                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
			                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
			                    guideTextBox.style.display = 'block';
			
			                }  else {
			                    guideTextBox.innerHTML = '';
			                    guideTextBox.style.display = 'none';
			                }
			            }
			        }).open();
			    };
			</script>

	    	
</body>
</html>