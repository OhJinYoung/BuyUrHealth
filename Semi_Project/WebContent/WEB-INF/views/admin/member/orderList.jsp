<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Order"%>
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

#container {
	min-width: 930px;
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
	width: 30px;
	height: 30px;
}

li>a {
	color: black;
}

#id {
	font-size: 12px;
	color: #828282a6;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">
		<div id="container-wrap">
		<%@include file="memberNav.jsp" %>
			<div id="contents">
				<div id="contents-wrap">
					<div id="top">
						<div>
							<h4>주문 관리</h4>
						</div>
						<div id="top-right">
							<div>
								<select id="filter">
									<option value="id">아이디</option>
									<option value="name">이름</option>
									<option value="state">상태</option>
								</select>
							</div>
							<div id="searchBox">
								<input type="search" id="inputSearch" name="inputSearch"
									placeholder="검색어를 입력해주세요.">
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
								for (int i = 0; i < 10; i++) {
								%>
								<tr>
									<td><input type="checkbox" name="checkbox" value=""></td>
									<td>2021-03-03</td>
									<td><div>
											<p>이름</p>
											<p id="id">아이디</p>
										</div></td>
									<td>밀크씨슬 외 2개</td>
									<td>30,000원</td>
									<td>발송완료</td>
								</tr>
								<!-- 
								<tr>
									<td colspan="6">등록된 주문건이 없습니다.</td>
								</tr>
								 -->
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div id="bottom">
						<div id="update">
							<p>선택한 주문건을</p>
							<select>
								<option>주문상태선택</option>
								<option>결제완료</option>
								<option>주문취소</option>
								<option>배송준비중</option>
								<option>배송중</option>
								<option>배송완료</option>
								<option>반품요청</option>
								<option>반품진행중</option>
								<option>반품완료</option>
								<option>교환진행중</option>
								<option>교환완료</option>
							</select>
							<p>으로</p>
							<button>변경</button>
						</div>
						<div id="pagingBtns">
							<button id="firstPage" value="">&lt;&lt;</button>
							<button class="pageBtn" value="">&lt;</button>
							<%
							for (int i = 0; i < 9; i++) {
							%>
							<button class="pageBtn" value=<%=i + 1%>><%=i + 1%></button>
							<%
							}
							%>
							<button value="nextPage">&gt;</button>
							<button value="lastPage">&gt;&gt;</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
</body>
<script>
	$('#searchBtn').on(
			'click',
			function() {
				$.ajax({
					url : 'searchMember.do',
					data : {
						filter : $('#filter').val(),
						input : $('#inputSearch').val()
					},
					success : function(data) {
						var button = $('#btns').html();
						var str = "";

						for ( var key in data) {
							str = str + '<tr><td>' + data[key].id + '</td><td>'
									+ data[key].name + '</td><td>'
									+ data[key].grade_name + '</td><td>'
									+ data[key].point + '</td><td id="btns">'
									+ button + '</td></tr>';
						}
						$('#tableBody').html(str);
					}
				});
			});

	$('.updateBtn').on('click', function() {
		var url ='<%=request.getContextPath()%>
	/updateMemberForm.do?id='
								+ $(this).val();
						window.open(url, 'update', 'width=300px, height=450px');
					});

	$('.deleteBtn').on('click', function() {
		if (confirm('해당 회원을 삭제하시겠습니까?')) {

		}
	});
</script>
</html>