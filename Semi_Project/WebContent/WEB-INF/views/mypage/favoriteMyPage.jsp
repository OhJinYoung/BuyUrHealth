<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("userId");
	String authority = null;
	if(member.getAuthority() == 'Y'){
		authority = "관리자";
	} else {
		authority = "회원";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUH</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body{min-width: 1000px; min-height: 1000px;}
	.wrap{background: white; width: 100%; height: 50px;}
	.mainMenu{
			background: white; color: gray; text-align: center; font-weight: bold; 
			vertical-align: middle; width: 150px; height: 50px; display: table-cell;
		}
	.mainMenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	.mainLogo{float:left; margin-right:100px; margin-left:30px; clear:both;}
	
	.myPage-menubar {
        width: 20%;
        max-width: 170px;
        height: 1000px;
        padding: 20px;
        margin-top: 14px;
        float: left;
        border-right: 1px solid black;
        display: inline-block;
     }
     
     #myPage-menubar-name { text-align: center; font-size: 20px;}
	 .myPage-menubar ul, li { list-style: none; padding: 10px; margin: 0; text-align: center;}
	 .myPage-menubar li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	 #myInfo-head {text-align:left; margin-top:50px; margin-left:250px;}
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
	<div class="myPage-menubar">
	<hr>
        <h2 id="myPage-menubar-name">마이페이지</h2>
    <hr>
        <ul>
          <li id="goBuy">구매목록</li>
          <li id="goPage">개인 정보 조회</li>
          <li id="goFavorite">관심상품</li>
        </ul>
        
    </div>
 
    <div class="myPage-myInfo">
    	<h1 id="myInfo-head">관심상품</h1>
    </div>
    
    <div>
    <hr>
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
	</script>
</body>
</html>