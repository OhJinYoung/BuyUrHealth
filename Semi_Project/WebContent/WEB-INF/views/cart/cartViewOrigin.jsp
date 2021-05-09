<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, Cart.model.vo.Cart" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("cartlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html, body {
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#cartTitle{
		color: red; 
		padding-left: 180px; 
		padding-top: 30px;
		font-size: 24px;
	}
	
	.cartdiv {
	    width: 80%;
	    min-width: 80%;
	    border-top: 1px solid black;
	    margin-left: auto; 
	    margin-right: auto; 
	}
	
    .cartdiv .cart.head {
        border-top: 1px solid black;
        /* box-sizing: border-box; /* box-sizing은 박스의 크기를 어떤 것을 기준으로 계산할지 : content-box : 콘텐트 영역을 기준 border-box : 테두리를 기준*/
        font-weight: bold;
        width: 100%;
    }
    
    .cartdiv .cart.head .subdiv {
        background-color: white;
        border-bottom: 2px dashed black;
    }
    
    .cartdiv .cart.data {
        border-bottom: 1px dashed #888;
        box-sizing: border-box;
        cursor: pointer;
        float: left;
        width: 100%;
    }

    .cartdiv .cart > .subdiv {
    	/* display: block; */ 
        float: left;
    }
    
    .cartdiv .cart > .subdiv:nth-child(1) {
        width: 50%;
    }
    .cartdiv .cart > .subdiv:nth-child(2) {
        width: 40%;
    }
    .cartdiv .cart > .subdiv:nth-child(3) {
        width: 10%;
    }

    .cartdiv .cart > div > div {
        /* display: block; */ 
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
        color: #E81224;
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

    .deleteButton{
        background-color: #383838;
        border: 1px solid #888888;
        color: #ffffff;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
    .paybutton{
    	background: #E81224;
    	border: 1px solid black;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
    	cursor: pointer;
    }
    
    #selectDelete {
    	background-color: #FFC83D;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        margin-right: auto;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
        margin-left: 80%;
    }
    
    #selectAll {
        font-weight: bold;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
    .buttondiv{
        background: blue;
        width: 98%; 
        float: left; 
        margin-left: 30px; 
		margin-top: 15px;
    }
    
    input[type=checkbox] {
		transform: scale(1.5);
		margin-top: 10px;
		margin-bottom: 15px;
		margin-left: 10px;
	}	
    
    .calc{
		width: 80%; height: 100px;
		border: 1px solid #FFC83D;
		background: #FFC83D;
		margin-left: auto; margin-right: auto; margin-top:50px; padding-bottom:20px;
	}
	
	.calcinfo {
		float: left;
		margin: 30px;
		width: 80%;
	}
	
	#calcinfo1{
		width: 40%;
		text-align: center; 
		font-size: 20px;
		position: absolute; left:5%
	}
	
	#calcinfo2{
		width: 35%;
		text-align: center; 
		font-size: 20px;
		vertical-align: middle;
		padding-top: 15px;
		position: absolute; left: 40%
		
	}
	
	#calcinfo3{
		width: 10%;
		text-align: center; 
		font-size: 20px;
		vertical-align: middle;
		position: absolute; left: 75%
	}
	
	
</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<h3 id=cartTitle>장바구니</h3>
    <form name="cartform" id="cartform" method="post" class="cartform" action="<%= request.getContextPath() %>/orderPage">
		<div id="buttondiv">
			<button id="selectDelete">선택삭제</button>
			<label id="selectAll">전체선택 <input type="checkbox"></label>
		</div>
    
            <table class="cartdiv" id="cart">
                <tr class="cart head">
                    <!-- <div class="subdiv"> -->
                        <th class="img"></th>
                        <th class="iname">상품명</th>
                    <!-- </div> -->
                    <!-- <div class="subdiv"> -->
                        <th class="cartprice">가격</th>
                        <th class="num">수량</th>
                        <th class="sum">합계</th>
                    <!-- </div> -->
                    <!-- <div class="subdiv"> -->
                        <th class="cartDelete">삭제</th>
                        <th class="check">선택</th>
                   <!--  </div> -->
                </tr>
        
                <tr class="cart data">
                    <!-- <div class="subdiv"> -->
                        <td class="img"><img src="" width="60"></div>
                        <div class="iname">
                            <span>클리어런스 - 타게티드 초이스, 블러드 프레셔 서포트 60 베지캡슐</span>
                        </div>
                    <!-- </div> -->
                    <div class="subdiv">
                        <div class="cartprice"><input type="hidden" name="i_price" id="i_price1" class="i_price" value="12500">12,500원</div>
                        <div class="num">
                            <div class="cartnum">
                                <input type="text" name="i_num1" id="i_num1" size="1" maxlength="4" class="i_num" value="2" onkeyup="">
                            </div>
                        </div>
                        <div class="sum">25,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="cartDelete"><a href="" class="deleteButton" onclick="">삭제</a></div>
                        <div class="check"><input type="checkbox" name="buy" checked></div>
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
                    <div class="subdiv">
                        <div class="cartDelete"><a href="" class="deleteButton" onclick="">삭제</a></div>
                        <div class="check"><input type="checkbox" name="buy" checked></div>
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
                    <div class="subdiv">
                        <div class="cartDelete"><a href="" class="deleteButton" onclick="">삭제</a></div>
                        <div class="check"><input type="checkbox" name="buy" checked></div>
                    </div>
                </div>
        
            </table>
    		<br clear="all">
          <div class="calc">
          	<div class="calcinfo" id="calcinfo1">
          		총 상품가격: <b>00</b>원 (총 <b>3</b>종) + 배송비: <b>2,500</b>원<br>
          		수령 예상일: <b>5월 14일</b> 도착 예정
          	</div>
          	<div class="calcinfo" id="calcinfo2">
          		총 결제할 금액: <b>00</b>원
          	</div>
          	<div class="calcinfo" id="calcinfo3">
          		<button class="paybutton" onclick="location.href='<%= request.getContextPath() %>/orderPage'">주문서 작성하기</button>
          	</div>
          </div>
        </form>

</body>
</html>
