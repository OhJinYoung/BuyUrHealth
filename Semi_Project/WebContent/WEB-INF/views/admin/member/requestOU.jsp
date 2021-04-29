<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="order.model.vo.RequestOrder, java.text.DecimalFormat"%>
<%
RequestOrder req = (RequestOrder) request.getAttribute("req");
String reqType = req.getType().substring(0, req.getType().length() - 2);
String price = new DecimalFormat("###,###").format(req.getPrice());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUH</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#contents {
	text-align: center;
	padding: 10px 0;
	width: 470px;
	height: 330px;
}

#contents div:nth-child(2) {
	padding: 10px 20px;
}

#btns button {
	width: 80px;
	height: 30px;
	font-size: 15px;
	margin: 0 10px;
	color: white;
	border: 0px;
	border-radius: 2px;
	cursor: pointer;
}

#btns button:first-child {
	background: orange;
}

#btns button:first-child:hover {
	background: #ffa500d9;
}

#btns button:last-child {
	background: #666666;
}

#btns button:last-child:hover {
	background: #666666d9;
}

table {
	width: 100%;
	border-collapse: collapse;
	color: #424242;
}

td {
	border: 1px solid #a2a2a2;
	padding: 2px;
}

tr td:first-child {
	width: 35%;
	background: lightgray;
}

#info {
	height: 80px;
}

textarea {
	width: 100%;
	height: 90%;
	border: none;
	overflow: scroll;
	cursor: default;
}
</style>
</head>
<body>
	<div id="contents">
		<div>
			<h3>
				[<%=reqType%>] 요청서
			</h3>
		</div>
		<div>
		<input type="hidden" id="no" value="<%=req.getNo()%>">
			<table>
				<tr>
					<td>주문번호</td>
					<td><%=req.getOrderNo()%></td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td><%=req.getPayment()%></td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td><%=price %>원</td>
				</tr>
				<tr>
					<td>주문상태</td>
					<td><%=req.getState()%></td>
				</tr>
				<tr>
					<td>요청타입</td>
					<td id="type"><%=reqType%></td>
				</tr>
				<tr>
					<td>사유</td>
					<td id="info"><textarea readonly><%=req.getInfo()%></textarea></td>
				</tr>
				<tr>
					<td>요청일</td>
					<td><%=req.getDate()%></td>
				</tr>
			</table>
		</div>
		<div id="btns">
			<button>반려</button>
			<button>접수</button>
		</div>
	</div>
</body>
<script>
	$('#btns button').on('click', function() {
		var state = $('#type').text() + $(this).text();
		$.ajax({
			type : 'post',
			url : 'requestOU.do',
			data : {
				no : $('#no').val(),
				state : state,
				reqNo : $('#reqNo').val()
			},
			success : function(data) {
				if(data==null)
					alert(state + " 접수 도중 오류가 발생했습니다.");
				else{
					alert(data);
					opener.parent.location.reload();
					window.close();
				}
			}
		});
	});
</script>
</html>