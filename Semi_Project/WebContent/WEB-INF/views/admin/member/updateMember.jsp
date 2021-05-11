<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
Member member = (Member) request.getAttribute("member");
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
	padding: 0px;
	margin: 0px;
}

li {
	text-decoration: none;
	padding-bottom: 5px;
}

table {
	border-collapse: collapse;
	display: inline-block;
	text-align: left;
}

td {
	border: 1px solid #a2a2a2;
	padding: 5px 10px;
}

tr td:first-child {
	width: 35%;
	background: lightgray;
}

input {
	width: 160px;
	outline: none;
}

#contents {
	width: 300px;
	height: 345px;
}

#contents-wrap {
	text-align: center;
	padding: 10px;
}

#contents-wrap div:first-child {
	padding-bottom: 2px;
}

input[type=email], input[type=text] {
	padding: 3px 0 3px 1px;
}

select {
	width: 80px;
	padding: 3px 0;
}

#btns {
	padding: 5px;
}

#btns button {
	width: 60px;
	height: 30px;
	font-size: 15px;
	margin: 0 10px;
	color: white;
	border: 0px;
	border-radius: 2px;
	cursor: pointer;
}

#btns button:first-child {
	background: #666666;
}

#btns button:first-child:hover {
	background: #666666d9;
}

#btns button:last-child {
	background: orange;
}

#btns button:last-child:hover {
	background: #ffa500d9;
}

input[type=text]:hover {
	-webkit-box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	box-shadow: inset 0 0 2px 0 rgb(115 128 150/ 20%);
	z-index: 2;
	outline: none;
}

input{
	outline: none;
}
</style>
</head>
<body>
	<div id="contents">
		<div id="contents-wrap">
			<div id="table">
				<input type="hidden" id="no" value="<%=member.getUserNo()%>">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" value="<%=member.getUserId()%>"
							readonly></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" id="name"
							value="<%=member.getUserName()%>"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><select id="gender">
								<option value="M">남성</option>
								<option value="F">여성</option>
						</select></td>
					</tr>
					<tr>
						<td>생일</td>
						<td><input type="date" id="birth"
							value="<%=member.getBirth()%>"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" id="phone"
							value="<%=member.getPhone()%>"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" id="email"
							value="<%=member.getEmail()%>"></td>
					</tr>
					<tr>
						<td>가입일</td>
						<td><input type="date" value="<%=member.getUserDate()%>"
							readonly></td>
					</tr>
				</table>
			</div>
			<div id="btns">
				<button>취소</button>
				<button>수정</button>
			</div>
		</div>
	</div>
</body>
<script>
	function check() {
		var name = $('#name').val().trim();
		var phone = $('#phone').val().trim();
		var email = $('#email').val().trim();

		if (name == "") {
			alert('이름을 입력해주세요');
			$('#name').focus();
			return false;
		} else if (phone == "") {
			alert('전화번호를 입력해주세요');
			$('#phone').focus();
			return false;
		} else if (email == "") {
			alert('이메일을 입력해주세요');
			$('#email').focus();
			return false;
		} else {
			var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if (!phoneNumberRegex.test(phone)) {
				alert("전화번호를 다시 입력해주세요");
				$('#phone').val("");
				$('#phone').focus();
				return false;
			} else {
				return true;
			}
		}
	}

	$('#btns button').on('click', function() {
		if ($(this).text() == '취소')
			window.close();
		else {
			var name = $('#name').val().trim();
			var birth = $('#birth').val();
			var phone = $('#phone').val().trim();
			var gender = $('#gender').val();
			var email = $('#email').val().trim();

			if (check()) {
				$.ajax({
					type : 'post',
					url : 'updateMember.do',
					data : {
						no : $('#no').val(),
						name : name,
						gender : gender,
						birth : birth,
						phone : phone,
						email : email
					},
					success : function(data) {
						alert(data);
						if (data == '수정 성공') {
							opener.parent.location.reload();
							window.close();
						}
					}
				});
			}
		}
	});
</script>
</html>