<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member myInfo = (Member)request.getAttribute("myInfo");
	int userNo = myInfo.getUserNo();
	String userId = myInfo.getUserId();
	String userName = myInfo.getUserName();
	char gender = myInfo.getGender();
	String birth = myInfo.getBirth();
	String phone = myInfo.getPhone().equals("null") ? "" : myInfo.getPhone();
	String email = myInfo.getEmail().equals("null") ? "" : myInfo.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|개인정보조회</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}

	.myPage-certification{position: absolute; width: 1100px; height: 200px;
						  margin-top: 20xp; padding: 50px; vertical-align: middle; 
						  display: inline-block; float: right; 
	}
	
	.outer{
		width: 500px; height: 450px; margin-left: 50px; 
		display: inline-block;
	}
	
	#updateForm>table {border-collapse: separate; border-spacing: 0 10px;}
	/*#nickCheck{background: #FFD8D8;}
	#updateBtn {background: #D1B2FF;}
	#cancelBtn {background: #B2CCFF;}*/
	
	/*.outer{
		width: 500px; height: 450px; margin-top: 300px; margin-left: 50px; 
		display: inline-block; opacity: 0.5; pointer-events: none;
	}
	#myForm table{border-collapse: separate; border-spacing: 0 10px;}
	.myPageBtns{opacity: 0.5;}*/
	
/*	#updateBtn {background: #D1B2FF; color: white;}
	#updatePwdBtn {background: #FFD8D8; color: white;}
	#deleteBtn {background: #D5D5D5; color: white;}
	#goMain {background: #B2CCFF; color: white;} */
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
	<%@include file="../mypage/myPageNav.jsp"%>

    <div class="outer">
		<br>
		<h2>내 정보 수정하기</h2>
		
		<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
			<table>
				<tr>
					<td width="200px"><label class="must"><input type="hidden" id="myNo" name="myNo" value="<%= userNo %>"></label> 아이디</td>
					<td width="200px"><input type="text" name="id" value="<%= userId %>">
					</td>
				</tr>
				<tr>
					<td><label class="must"></label> 이름</td>
					<td><input type="text" name="myName" required value="<%= userName %>">
					</td>
				</tr>
				<tr>
					<td>성별<input type="hidden" id="myGender" name="myGender" required value="<%= gender %>"></td>
						<td><select id="gender" onChange="changeGender();">
								<option value="M">남성</option>
								<option value="F">여성</option>
						</select></td>
						
					</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="tel" maxlength="11" name="myPhone" placeholder="(-없이)01012345678" value="<%= phone %>">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="myEmail" value="<%= email %>"></td>
				</tr>
			</table>
			
			<br>
			
			<div class="btns">
				<input id="updateBtn" type="submit" value="수정하기">
				<input type="button" id="cancelBtn" onclick="location.href='javascript:history.go(-1)'" value="취소하기">
			</div>
		</form>
	</div>
	
	<script>
		
		$('#goBuy').on('click', function(){
			location.href="<%= request.getContextPath() %>/buyMyPage.me";
		});
		
		$('#goPage').on('click', function(){
			location.href="<%= request.getContextPath() %>/goMypage";
		});
		
		$('#goFavorite').on('click', function(){
			location.href="<%= request.getContextPath() %>/favoriteMyPage.me";
		});
		
		function changeGender(){
			var select = document.getElementById("gender");
		    var selectValue = select.options[select.selectedIndex].value;
		    
		    $('#myGender').val(selectValue);
		}
		
		
	</script>
</body>
</html>