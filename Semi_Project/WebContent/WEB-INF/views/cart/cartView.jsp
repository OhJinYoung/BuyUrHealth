<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, Cart.model.vo.Cart, java.text.DecimalFormat" %>
<% ArrayList<Cart> cartlist = (ArrayList<Cart>)request.getAttribute("cartlist"); %>
<% 
int total = 0; 
int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
	var target = $("#cartVol").val(); 
	var productPrice = price * target;
</script>
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
    
    .img {width: 15%;}
    .iname {width: 45%;}
    .cartprice {width: 10%;}
    .num {width: 10%;}
    .sum {width: 10%;}
    .cartDelete {width: 10%;}
	
	input[type=checkbox] {transform: scale(1.5);}
    
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
<%--     <form name="cartform" id="cartform" method="post" class="cartform" action="<%= request.getContextPath() %>/orderPage"> --%>
		<!-- <div id="buttondiv">
			<button id="selectDelete">선택삭제</button>
			<label id="selectAll">전체선택 <input type="checkbox" name="selectAll" onclick="selectAll();"></label>
		</div> -->
    
            <table class="cartdiv" id="cart">
                <tr class="cart head">
                        <th class="img">이미지</th>
                        <th class="iname">상품명</th>
                        <th class="cartprice">가격</th>
                        <th class="num">수량</th>
                        <th class="sum">합계</th>
                        <th class="cartDelete">삭제</th>
                </tr>
        
                <% if(cartlist.isEmpty()) {%>
					<tr>
						<td colspan="7" align="center">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				<%  } else {
						for(Cart c : cartlist){ 
							sum = c.getProductPrice() * c.getCartVolume();
							total += sum;
						%>
							<tr>
								<td class="img" align="center"></td>
								<td class="iname" align="center">
									
									<input type="hidden" size="3" name="cartNo" value="<%= c.getCartNo() %>">
									<input type="hidden" size="3" name="proName" value="<%= c.getProductName() %>">
									<a><%= c.getProductName() %></a>
								</td>
								<td class="cartprice" align="center">
									<input type="hidden" size="3" name="proPrice" value="<%= c.getProductPrice() %>">
									<%= new DecimalFormat("###,###").format(c.getProductPrice()) %>
								</td>
								<td class="num" align="center">
								<form name="volchange" method="POST" action="<%= request.getContextPath() %>/volchange">
									<input type="hidden" size="3" name="proNo" value="<%= c.getProductNo() %>">
									<input type="text" size="3" name="cartVol" id="cartVol" value="<%= c.getCartVolume() %>">
									<input type="submit" name="cartVolChange" value="변경">
								</form>
								</td>
								<td class="sum" align="center">
									<input type="hidden" name="cartPrice" size="3" name="cartVol" value="<%= sum %>">
									<%= new DecimalFormat("###,###").format(sum) %>
								</td>
								
								<td class="cartDelete" align="center">
								<form name="deleteCart" method="POST" action="<%= request.getContextPath() %>/deleteCart">
									<input type="hidden" size="3" name="proNo" value="<%= c.getProductNo() %>">
									<input type="submit" name="deleteButton" value="삭제">
								</form>
								</td>
							</tr>
				<%			}
					} %>       
            </table>
    		<br clear="all">
          <div class="calc">
          	<div class="calcinfo" id="calcinfo1">
          		총 상품가격: <b><%= new DecimalFormat("###,###").format(total) %></b>원  + 배송비: <b>2,500</b>원<br>
          		수령 예상일: <b>5월 14일</b> 도착 예정
          	</div>
          	<div class="calcinfo" id="calcinfo2">
          		총 결제할 금액: <b><%= new DecimalFormat("###,###").format(total + 2500)%></b>원
          	</div>
          	<div class="calcinfo" id="calcinfo3">
          		<input type="button" class="paybutton" onclick="location.href='<%= request.getContextPath() %>/orderPage'" value="주문서 작성하기">
          	</div>
          </div>
        <!-- </form> -->

</body>
</html>
