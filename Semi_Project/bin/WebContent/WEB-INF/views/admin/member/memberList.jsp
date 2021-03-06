<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member"%>
<%
ArrayList<Member> list = (ArrayList) request.getAttribute("list");
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
}

table {
	width: 100%;
}

tr {
	text-align: center;
}


th {
	padding: 5px 0;
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
	padding-bottom: 10px;
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
}

#contents-wrap{
padding: 40px 20px 0 20px;
}

#container {
	min-width: 930px;
}

#container-wrap {
	padding: 0 50px 0 30px;
}

#top div:first-child h4 {
	font-size: 20px;
	font-weight: 400;
	padding-bottom: 10px;
}

#top>div {
	display: inline-block;
}

#bottom {
	padding-top: 15px;
	text-align: center;
}

#Btns button {
	width: 100px;
	height: 40px;
	font-size: 15px;
	margin: 0 20px;
	color: white;
}
#pagingBtns{
padding-bottom: 20px;
}
#pagingBtns button {
	width: 30px;
	height: 30px;
}

li>a {
	color: black;
}
</style>
<body>
	<%@include file="../header.jsp"%>
	<div id="container">
		<div id="container-wrap">
			<div id="contents">
				<div id="contents-wrap">
					<div id="top">
						<div>
							<h4>사용자 관리</h4>
						</div>
						<div id="top-right">
							<div>
								<select id="filter">
									<option value="id">아이디</option>
									<option value="name">이름</option>
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
						<table  border="1">
							<tr>
								<th>선택</th>
								<th>사용자 ID</th>
								<th>이름</th>
								<th>가입일</th>
								<th>글/댓글/문의</th>
							</tr>
							<tbody id="tableBody">
								<!-- for문 -->
								<%
								if (list != null && list.size() > 0) {
									for (Member m : list) {
								%>
								<tr>
									<td><input type="checkbox" name="checkbox"
										value="<%=m.getUserNo()%>"></td>
									<td><%=m.getUserId()%></td>
									<td><%=m.getUserName()%></td>
									<td><%=m.getUserDate()%></td>
									<td>사용자 글수</td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="5">등록된 회원이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div id="bottom">
						<div id="pagingBtns">
							<button id="prePage">&lt;</button>
							<%
							for (int i = 0; i < 9; i++) {
							%>
							<button value=<%=i + 1%>><%=i + 1%></button>
							<%
							}
							%>
							<button id="nextPage">&gt;</button>
						</div>
						<div id="Btns">
							<button id="updateBtn">수정</button>
							<button id="deleteBtn">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
		var url ='<%=request.getContextPath()%>/updateMemberForm.do?id='+ $(this).val();
		window.open(url, 'update', 'width=300px, height=450px');
		});

	$('.deleteBtn').on('click', function() {
		if (confirm('해당 회원을 삭제하시겠습니까?')) {

		}
	});
</script>
</html>