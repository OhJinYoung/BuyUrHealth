<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	
	<form name="orderform" id="orderform" method="post" class="orderform" action="<%= request.getContextPath() %>/order.or">
	
	
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
            		<div></div>
		            	<h3>배송지 정보</h3>
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
		            			<td class="orderan"><input type="email" name="email" id="email" placeholder="주문하시는 분의 이메일을 입력해주세요" size="80px" required></td>
		            		</tr>
		            		<tr>
		            			<td class="orderli notNeeded">배송시 요청사항</td>
		            			<td class="orderan"><input type="text" name="forrequest" id="forrequest" size="80px" placeholder="선택사항"></td>
		            		</tr>
		            	</table>
					</div>
					
					<div align="center" class="pay button">
							<button type="button" onClick="history.back(-1);" id="backBtn" value="이전페이지">이전페이지</button>
							<button type="submit" id="payBtn">다음페이지로</button>
						</div>
					</div>
		 </form>
		
		<script>
		$("#payBtn").one("click", function() {
			  console.log("한 번만 실행됨")
			});
		</script>

	    	
</body>
</html>