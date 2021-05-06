<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cart.model.vo.Order" %>

<%  
	Order order = (Order)request.getAttribute("order");
	int orderNo = (int)request.getAttribute("orderNo");
	String phone = (String)request.getAttribute("phone");
	String name = (String)request.getAttribute("name");
	String email = (String)request.getAttribute("email");
	String address = (String)request.getAttribute("address");
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
	    min-width: 1500px;
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
			</div>
		 		<div>	
			<div align="center" class="pay button">
				<button type="button" onClick="history.back(-1);" id="backBtn" value="이전페이지">이전페이지</button>
				<button type="submit" id="payBtn" onclick="pay();">결제하기</button>
			</div>
		</div> 
					

		<script>
		
    	$("#payBtn").click(function () {
    		var IMP = window.IMP;
			IMP.init('imp43623305');
			
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 1000,
			    buyer_email : <%= email %>,
			    buyer_name : <%= name %>,
			    buyer_tel : <%= phone %>,
			    buyer_addr : <%= address %>,
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/pay.or", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid,
				    		pay_method : rsp.pay_method,
				    		status : rsp.status,
				    		orderNo : <%= orderNo %>
				    		
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n구매자 : ' + rsp.buyer_name;
			    			msg += '\n핸드폰 번호 : ' + rsp.buyer_tel;
			    			msg += '\n이메일 : ' + rsp.buyer_email;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;

			    			alert(msg);
			    		} else {
			    			var msg = '아직 제대로 결제가 되지 않았습니다.';
			    			
			    			alert(msg);
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			        alert(msg);
			    }
			});
    	})
		</script>

	    	
</body>
</html>