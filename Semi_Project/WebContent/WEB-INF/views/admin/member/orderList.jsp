<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,order.model.vo.Order, java.text.DecimalFormat, common.PageInfo"%>
<%
ArrayList<Order> list = (ArrayList) request.getAttribute("list");
PageInfo paging = (PageInfo) request.getAttribute("page");
String input = (String) request.getAttribute("input");
String filter = (String) request.getAttribute("filter");
if(input==null)
	input="";
if(filter==null)
	filter="Id";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUH</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
* {
	padding: 0px;
	margin: 0px;
}

button {
	border: 0px;
	border-radius: 2px;
}

h3 {
	font-size: 20px;
	padding-bottom: 20px;
}

#inputSearch {
	padding-left: 7px;
	width: 140px;
	height: 30px;
	font-size: 12px;
	border: 1px solid #c3c3c3;
	border-radius: 2px;
}

select {
	height: 30px;
	font-size: 12px;
	width: 70px;
	border-color: #c3c3c3;
	border-radius: 2px;
}

table {
	width: 100%;
	border-collapse: collapse;
	color: #424242;
}

tr {
	text-align: center;
}

td {
	padding: 15px;
	border-bottom: 1px solid #8282821a;
	padding-top: 18px !important;
}

td a:hover{
	cursor: pointer;
}

th {
	padding: 15px 25px;
	color: #828282;
}

#firstTr {
	border-bottom: 1px solid #82828278;
}

#firstTr>th:nth-child(4) {
	width: 200px;
}

tr td:last-child {
	width: 120px;
}

#searchBtn {
	height: 30px;
	width: 50px;
	margin-top: 1px;
	font-size: 12px;
}

#top {
	padding-bottom: 3px;
}

#top-right {
	float: right;
}

#top-right>div {
	display: inline-block;
}

#contents {
	display: inline-block;
	border-left: 1px solid #9a9a9a;
	width: 80%;
}

#contents-wrap {
	padding: 30px;
}

body {
	min-width: 1200px;
}

#top div:first-child h4 {
	font-size: 25px;
	font-weight: 700;
	padding-bottom: 10px;
}

#top>div {
	display: inline-block;
}

#bottom {
	padding-top: 10px;
	text-align: center;
}

#update {
	padding-left: 10px;
	text-align: left;
	padding-bottom: 25px;
}

#update button {
	height: 30px;
	width: 50px;
	margin-top: 1px;
	font-size: 12px;
	color: white;
	background: orange;
}

#updateBtn:hover {
	background: #ffa500d9;
	cursor: pointer;
}

#update p {
	font-size: 15px;
	font-weight: 600;
	display: inline-block;
	padding-right: 10px;
}

#update select {
	width: 90px !important;
}

#pagingBtns {
	padding-bottom: 20px;
}

#pagingBtns button {
	background:#efefef;
	width: 30px;
	height: 30px;
}

#pagingBtns button:hover {
	cursor: pointer;
	background: #d6d6d6;
}

#pagingBtns button:disabled:hover {
	cursor: default;
	background: #efefef;
}

li>a {
	color: black;
}

#id {
	font-size: 12px;
	color: #828282a6;
}

.requestBtn, .trackingBtn {
	font-size: 10px;
	padding: 4px;
}

.requestBtn:hover, #searchBtn:hover, .trackingBtn:hover {
	background: lightgray;
	cursor: pointer;
}

#currentPage {
	background: orange !important;
	color: white;
	cursor: default !important;
}

#currentPage:hover {
	background: orange !important
}

input[type=search]:hover {
	-webkit-box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	z-index: 2;
}

input{
	outline: none;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">
		<div id="container-wrap">
			<%@include file="memberNav.jsp"%>
			<div id="contents">
				<div id="contents-wrap">
					<div id="top">
						<div>
							<h4>주문 관리</h4>
						</div>
						<div id="top-right">
							<div>
								<select id="filter">
									<option value="Id">아이디</option>
									<option value="Name">이름</option>
									<option value="State">상태</option>
								</select>
								<script>
								$('#filter').val('<%=filter%>').prop("selected", true);
								</script>
							</div>
							<div id="searchBox">
								<input type="search" id="inputSearch" name="inputSearch"
									placeholder="검색어를 입력해주세요." value="<%=input%>">
								<button id="searchBtn">검색</button>
							</div>
						</div>
					</div>
					<div id="table">
						<table>
							<tr id="firstTr">
								<th>선택</th>
								<th>결제일</th>
								<th>주문자명(ID)</th>
								<th>상품명</th>
								<th>결제금액</th>
								<th>상태</th>
							</tr>
							<tbody id="tableBody">
								<!-- for문 -->
								<%
								if (list != null && list.size() > 0) {
									for (Order o : list) {
										String price = new DecimalFormat("###,###").format(o.getPrice());
								%>
								<tr>
									<td><input type="checkbox" name="checkbox"
										value="<%=o.getNo()%>"></td>
									<td><%=o.getOrderDate()%></td>
									<td class="click" onclick="orderDetail(<%=o.getNo()%>)"><div>
											<p><%=o.getUserName()%></p>
											<p id="id"><%=o.getUserId()%></p>
										</div></td>
									<td class="click" onclick="orderDetail(<%=o.getNo()%>)"><%=o.getpList()%></td>
									<td><%=price%> 원</td>
									<td><div>
											<p><%=o.getState()%></p>
											<%
											String state = o.getState();
											if (state.substring(state.length() - 2, state.length()).equals("요청")) {
											%>
											<p>
												<button class="requestBtn" value="<%=o.getNo()%>">요청서
													확인</button>
											</p>
											<%
											} else if (state.equals("배송중")&&o.getTrackingNo()!=null&&!o.getTrackingNo().equals("")){
											%>
											<p>
												<button class="trackingBtn" value="<%=o.getTrackingNo()%>">배송 조회</button>
											</p>
											<%
											}
											%>
										</div></td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="6">등록된 주문건이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div id="bottom">
						<div id="update">
							<p>선택한 주문건을</p>
							<select id="selectUpdate">
								<option>주문상태선택</option>
								<option>결제완료</option>
								<option>주문취소</option>
								<option>배송준비중</option>
								<option>배송중</option>
								<option>배송완료</option>
								<option>반품요청</option>
								<option>반품완료</option>
								<option>교환완료</option>
							</select>
							<p>으로</p>
							<button id="updateBtn">변경</button>
						</div>
						<div id="pagingBtns">
							<button value="1" class="beforeBtn">&lt;&lt;</button>
							<button value="<%=paging.getCurrentPage() - 1%>" class="beforeBtn">&lt;</button>
							<%
							for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
								if (i == paging.getCurrentPage()) {
							%>
							<button id="currentPage" disabled><%=i%></button>
							<%
							} else {
							%>
							<button value="<%=i%>"><%=i%></button>
							<%
							}
							}
							%>
							<button value="<%=paging.getCurrentPage() + 1%>" class="afterBtn">&gt;</button>
							<button value="<%=paging.getMaxPage()%>" class="afterBtn">&gt;&gt;</button>
						</div>
						<script>
						var currentPage = <%=paging.getCurrentPage() %>
						var maxPage = <%=paging.getMaxPage() %>
						
						if (currentPage==1)
							$('.beforeBtn').attr('disabled', true);
						if (currentPage>=maxPage)
							$('.afterBtn').attr('disabled', true);
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
<script>
	$('#searchBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/searchOrder.do?filter=' + $('#filter').val() 
				+ '&&input=' + $('#inputSearch').val().trim(); 
	});

	$('#updateBtn').on('click', function() {
		if ($('input[name=checkbox]:checked').length < 1) {
			alert('선택된 주문이 없습니다.')
		} else if ($('#selectUpdate').val() == '주문상태선택') {
			alert('주문 상태를 선택해주세요.');
		} else {
			var checkArr = [];
			$('input[name="checkbox"]:checked').each(function() {
				checkArr.push($(this).val());
			});

			$.ajax({
				type : 'post',
				url : 'updateOrder.do',
				data : {
					check : checkArr,
					select : $('#selectUpdate').val()
				},
				success : function(data) {
					alert(data);
					window.location.reload();
				},
				error : function() {
					console.log('주문 수정에 실패했습니다.');
				}
			});
		}
	});
	
	$('.requestBtn').on('click', function(){
		var option='width=470px, height=330px';
		var url = '<%=request.getContextPath()%>/requestOUForm.do?no=' + $(this).val();
		window.open(url,'request',option);
	});
	
	$('.trackingBtn').on('click', function(){
		var url = 'https://service.epost.go.kr/trace.RetrieveDomRigiTraceList.comm?displayHeader=N&sid1=' + $(this).val();
		window.open(url,'tracking');
	});
	
	$('#pagingBtns button').on('click', function(){
		var page = $(this).val();
		if('<%=input%>'!='')
			location.href = '<%=request.getContextPath()%>/searchOrder.do?filter=<%=filter%>&&input=<%=input%>&&page='+page;
		else
			location.href = '<%=request.getContextPath()%>/orderList.do?page=' + page;
	});
	
	$('.click').on('mouseover',function(){
		$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
	}).on('mouseout',function(){
		$(this).closest('tr').css({"background":"","color":"","cursor":""});
	});
	
	function orderDetail(order_no){
		var option='width=670px, height=330px';
		var url = '<%=request.getContextPath()%>/orderDetail.do?no=' + order_no;
		window.open(url,'orderDetail',option);
	}
</script>
</html>