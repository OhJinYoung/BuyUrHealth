<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, order.model.vo.*, java.text.DecimalFormat"%>
<%
Order order = (Order) request.getAttribute("order");
ArrayList<OrderDetail> olist = (ArrayList) request.getAttribute("olist");
int total = 0;

if (order.getTrackingNo() == null)
	order.setTrackingNo("");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세정보</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

body {
	padding: 10px;
	width: 650px;
}

table {
	border-collapse: collapse;
	display: inline-block;
	text-align: left;
}

#orderInfo>div>div {
	display: inline-block;
}

#top {
	padding: 10px;
	border: 1px solid #a2a2a2;
	width: 618px;
}

#top>div:first-child {
	padding-right: 15px;
	border-right: 1px solid #a2a2a2;
}

#top>div:first-child p {
	margin-top: 2px;
}

#top>div:last-child {
	padding-left: 11px;
}

p {
	display: inline-block;
}

#product {
	margin-top: 15px;
	border: 1px solid #a2a2a2;
	margin-right: 10px;
}

#product tr:first-child {
	border-bottom: 1px solid #a2a2a2;
}

#product tr:first-child td {
	padding: 10px;
	text-align: center;
}

td {
	padding: 5px 10px;
}

#product tr:first-child>td:first-child {
	width: 110px;
}

#product tr:first-child>td:nth-child(2) {
	width: 70px;
}

#product tr:first-child>td:nth-child(3) {
	width: 250px;
}

#product tr:first-child>td:nth-child(4) {
	width: 70px;
}

#product tr:first-child>td:nth-child(5) {
	width: 50px;
}

#product tr:first-child>td:nth-child(6) {
	width: 80px;
}

#product tr:nth-child(2)>td {
	padding-top: 10px;
}

#product tr:first-child td{
	background: lightgray;
}
h3 {
	padding-bottom: 5px;
}

img {
	width: 50px;
	height: 50px;
}

th {
	padding: 20px;
	text-align: right;
}

.plist {
	border-bottom: 1px solid #a2a2a2;;
}

#product td {
	text-align: center;
}

.plist td:nth-child(3) {
	font-size: 15px;
	text-align: left;
}

#delivery {
	padding-top: 20px;
}

#delivery tr:first-child>td:first-child {
	width: 100px;
}

#delivery tr:first-child>td:nth-child(2) {
	width: 320px;
}

#delivery tr:first-child>td:nth-child(3) {
	width: 154px;
}

th>p:first-child {
	font-size: 14px;
	font-weight: 500;
	padding-right: 10px;
}

th>p:last-child {
	font-size: 18px;
}

#top div>p:first-child {
	padding-right: 10px;
}

#delivery td {
	border: 1px solid #a2a2a2;
	padding: 10px;
}

#delivery td input, #delivery td textarea{
	padding: 5px;
	width: 200px;
}

#userInfo {
	padding-bottom: 162px !important;
}

.title{
	background: lightgray;
}

button {
	padding: 5px;
	margin-left: 5px;
	width: 50px;
	color: white;
	border: 0px;
	border-radius: 2px;
	cursor: pointer;
	background: orange;
}

button:hover {
	background: #ffa500d9;
}

button:disabled:hover {
	background: orange;
}

#trackingNo:hover {
	-webkit-box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	z-index: 2;
}

input{
	outline: none;
}
</style>
</head>
<body>
	<div id="orderInfo">
		<h3>주문 상세 정보</h3>
		<div id="top">
			<div>
				<p>주문일자</p>
				<p><%=order.getOrderDate()%></p>
			</div>
			<div>
				<p>주문번호</p>
				<p id="orderNo"><%=order.getNo()%></p>
			</div>
		</div>
		<table id="product">
			<tr>
				<td>상품주문번호</td>
				<td></td>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>합계</td>
			</tr>
			<%
			for (OrderDetail od : olist) {
				int sum = od.getPrice() * od.getVolume();
				total += sum;
			%>
			<tr class="plist">
				<td class="odNo"><%=od.getNo()%></td>
				<td><img src="<%=od.getFilePath()+od.getFileName()%>"></td>
				<td><%=od.getProductName()%></td>
				<td><%=new DecimalFormat("###,###").format(od.getPrice())%></td>
				<td><%=od.getVolume()%></td>
				<td><%=new DecimalFormat("###,###").format(sum)%>
			</tr>
			<%
			}
			%>
			<tr id="total">
				<th colspan="6"><p>주문금액</p>
					<p><%=new DecimalFormat("###,###").format(total)%></p></th>
			</tr>
		</table>
	</div>
	<div id="delivery">
		<h3>배송지 정보</h3>
		<table>
			<tr>
				<td class="title">수령인</td>
				<td><%=order.getName()%></td>
				<td class="title">주문자 정보</td>
			</tr>
			<tr>
				<td class="title">연락처</td>
				<td><%=order.getPhone()%></td>
				<td rowspan="5" id="userInfo"><%=order.getUserName()%><br><%=order.getUserId()%></td>
			</tr>
			<tr>
				<td class="title">이메일</td>
				<td><%=order.getEmail()%></td>
			</tr>
			<tr>
				<td class="title">배송지</td>
				<td><%=order.getAddress()%></td>
			</tr>
			<tr>
				<td class="title">요청사항</td>
				<td><%=order.getRequest()%></td>
			</tr>
			<tr>
				<td class="title">운송장번호</td>
				<td><input type="number" placeholder="숫자만 입력해주세요."
					value="<%=order.getTrackingNo()%>" id="trackingNo">
					<button id="updateTrackingNo" disabled="disabled">저장</button></td>
			</tr>
		</table>
	</div>
</body>
<script>
	$('#updateTrackingNo').on('click', function() {
		var trackingNo = $('#trackingNo').val().trim();
		var regex = /^[0-9]/g;
		if (trackingNo == '') {
			alert('운송장번호를 입력해주세요.');
		} else {
			if (!regex.test(trackingNo)) {
				alert('숫자만 입력해주세요.');
				$('#trackingNo').val('');
				$('#trackingNo').focus();
			} else {
				$.ajax({
					url : 'updateTrackingNo.do',
					data : {
						orderNo : $('#orderNo').text(),
						trackingNo : trackingNo
					},
					success : function(data) {
						alert(data);
						if (data != '')
							window.location.reload();
						else
							$('#trackingNo').focus();
					}
				});
			}
		}
	});
	
	$('#trackingNo').on('change keyup paste', function(){
		if($(this).val()!='<%=order.getTrackingNo()%>')
			$('#updateTrackingNo').attr('disabled', false);
		else
			$('#updateTrackingNo').attr('disabled', true);
	});
</script>
</html>