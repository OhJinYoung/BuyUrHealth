<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member, common.PageInfo"%>
<%
ArrayList<Member> list = (ArrayList) request.getAttribute("list");
PageInfo paging = (PageInfo) request.getAttribute("page");
String input = (String) request.getAttribute("input");
String filter = (String) request.getAttribute("filter");
if (input == null)
	input = "";
if (filter == null)
	filter = "Id";
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

#updateBtn {
	background: orange;
}

#updateBtn:hover {
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
							<h4>사용자 관리</h4>
						</div>
						<div id="top-right">
							<div>
								<select id="filter">
									<option value="Id">아이디</option>
									<option value="Name">이름</option>
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
								<th>사용자 ID</th>
								<th>이름</th>
								<th>가입일</th>
								<th>글/댓글/문의</th>
							</tr>
							<tbody id="tableBody">
								<%
								if (list != null && list.size() > 0) {
									for (Member m : list) {
								%>
								<tr class="click">
									<td><input type="checkbox" name="checkbox"
										value="<%=m.getUserId()%>"></td>
									<td onclick="memberInfo('<%=m.getUserId()%>')"><%=m.getUserId()%></td>
									<td onclick="memberInfo('<%=m.getUserId()%>')"><%=m.getUserName()%></td>
									<td onclick="memberInfo('<%=m.getUserId()%>')"><%=m.getUserDate()%></td>
									<td><%=m.getCountComm()%>/<%=m.getCountReply()%>/<%=m.getCountQna()%></td>
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
							<button value="1" class="beforeBtn">&lt;&lt;</button>
							<button value="<%=paging.getCurrentPage() - 1%>"
								class="beforeBtn">&lt;</button>
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
						var currentPage = <%=paging.getCurrentPage()%>
						var maxPage = <%=paging.getMaxPage()%>
						
						if (currentPage==1)
							$('.beforeBtn').attr('disabled', true);
						if (currentPage>=maxPage)
							$('.afterBtn').attr('disabled', true);
						</script>
						<div id="btns">
							<button id="updateBtn">수정</button>
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
	$('#searchBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/searchMember.do?filter=' + $('#filter').val() + '&&input=' + $('#inputSearch').val().trim(); 
	});

	$('#updateBtn').on('click', function() {
		var checkArr = [];
		$('input[name="checkbox"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		
		if(checkArr.length<1){
			alert('수정할 회원을 선택해주세요.');
		} else if(checkArr.length>1){
			alert('회원 수정은 한 명씩 가능합니다.');
		} else{
			var url ='<%=request.getContextPath()%>/updateMemberForm.do?id='+ checkArr[0];
			window.open(url, 'update', 'width=300px, height=320px');
		}
	});

	$('#deleteBtn').on('click', function() {
		var checkArr = [];
		$('input[name="checkbox"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		
		if (confirm('해당 회원들을 삭제하시겠습니까?')) {
			$.ajax({
				type: 'post',
				url:'deleteMember.do',
				data:{
					check:checkArr
				},
				success:function(data){
					alert(data);
					window.location.reload();
				}		
			});
		}
	});
	
	$('#pagingBtns button').on('click', function(){
		var page = $(this).val();
		if('<%=input%>'!='')
			location.href = '<%=request.getContextPath()%>/searchMember.do?filter=<%=filter%>&&input=<%=input%>&&page='+page;
		else
			location.href = '<%=request.getContextPath()%>/memberList.do?page=' + page;
	});
	
	$('.click').on('mouseover',function(){
		$(this).closest('tr').css({"background":"beige","color":"orangered","cursor":"pointer"});
	}).on('mouseout',function(){
		$(this).closest('tr').css({"background":"","color":"","cursor":""});
	});
	
	function memberInfo(member_id){
		var url ='<%=request.getContextPath()%>/updateMemberForm.do?id=' + member_id;
		window.open(url, 'memberInfo', 'width=300px, height=320px');
	}
</script>
</html>