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
	padding-top: 20px;
	text-align: center;
}

#insert {
	padding-left: 10px;
	text-align: left;
	padding-bottom: 25px;
}

#insert button {
	height: 30px;
	width: 50px;
	margin-top: 1px;
	font-size: 12px;
	color: white;
	background: orange;
}

#insert p {
	font-size: 15px;
	font-weight: 600;
	display: inline-block;
	padding-right: 10px;
}

#insert select {
	width: 90px !important;
}

#pagingBtns {
	padding-bottom: 30px;
}

#pagingBtns button {
	background: #efefef;
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

#currentPage {
	background: orange !important;
	color: white;
	cursor: default !important;
}

#currentPage:hover {
	background: orange !important
}

li>a {
	color: black;
}

#id {
	font-size: 12px;
	color: #828282a6;
}

#btns button {
	width: 100px;
	height: 40px;
	font-size: 15px;
	margin: 0 20px;
	color: white;
}

#insertBtn {
	background: orange;
}

#insertBtn:hover {
	background: #ffa500d9;
	cursor: pointer;
}

#deleteBtn {
	background: #666666;
}

#deleteBtn:hover {
	background: #666666d9;
	cursor: pointer;
}

td a:hover {
	cursor: pointer;
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
							<h4>관리자 관리</h4>
						</div>
					</div>
					<div id="table">
						<table>
							<tr id="firstTr">
								<th>선택</th>
								<th>관리자 ID</th>
								<th>이름</th>
								<th>이메일</th>
							</tr>
							<tbody id="tableBody">
								<%
								if (list != null && list.size() > 0) {
									for (Member m : list) {
								%>
								<tr class="click">
									<td><input type="checkbox" name="checkbox"
										value="<%=m.getUserId()%>"></td>
									<td onclick="adminInfo('<%=m.getUserId()%>')"><%=m.getUserId()%></td>
									<td onclick="adminInfo('<%=m.getUserId()%>')"><%=m.getUserName()%></td>
									<td onclick="adminInfo('<%=m.getUserId()%>')"><%=m.getEmail() %></td>
									</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
					<div id="bottom">
						<div id="btns">
							<button id="insertBtn">등록</button>
							<button id="deleteBtn">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
<script>
	$('#insertBtn').on('click', function() {
		var url ='<%=request.getContextPath()%>/insertAdminForm.do';
		window.open(url, 'insert', 'width=330px, height=355px');
	});

	$('#deleteBtn').on('click', function() {
		var checkArr = [];
		$('input[name="checkbox"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		
		if (confirm('선택한 관리자를 삭제하시겠습니까?')) {
			$.ajax({
				type: 'post',
				url:'deleteMember.do',
				data:{
					check:checkArr
				},
				success:function(data){
					data = (data.replace('회원','관리자')).replace('을','를');
					alert(data);
					window.location.reload();
				}		
			});
		}
	});
	
	$('.click').on('mouseover',function(){
		$(this).closest('tr').css({"background":"beige","color":"orangered","cursor":"pointer"});
	}).on('mouseout',function(){
		$(this).closest('tr').css({"background":"","color":"","cursor":""});
	});
	
	function adminInfo(id){
		var url ='<%=request.getContextPath()%>/updateMemberForm.do?id=' + id;
		window.open(url, 'adminInfo', 'width=300px, height=320px');
	}
</script>
</html>