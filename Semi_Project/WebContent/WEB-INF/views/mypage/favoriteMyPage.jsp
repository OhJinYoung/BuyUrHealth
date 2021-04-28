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
	 
	 li:hover {
		background: beige; 
		color:orangered; 
		font-weight:bold; 
		cursor:pointer;
	}
	
	.likeitem.data{
		width: 85%;
        margin-top: 30px; 
		position: absolute;
		margin-left: 200px;
	}

	
	.likeitem.head{
		min-width: 95%; 
		float: left; 
		margin-left: 30px; 
		margin-top: 15px;
		position: absolute;
	}
	
  	.likeitem.body{
  		margin-top: 70px;
		width: 95%; 
		min-width: 1000px;
		position: absolute;
		padding-bottom: 10px; 
	    text-align: center;
	}
	
	.item {
		margin-left: 20px;
	    border: 1px solid #ccc;
	    float: center;
	    min-width: 21%;
	    display: inline-block;
	    text-align: center;
	    overflow: hidden;
	}

	
	.item.bottom{
		margin-top: 10px;
	}

	
	.item:hover {
	    border: 1px solid #777;
	    background: lightblue;
	}

	.itemTitle{
		margin: 5px;
		margin-top: 10px;
		letter-spacing: -1px;
	}
	
	h3{
		color: black; 
		margin: 0px auto;
		font-size: 20px;
		margin-left: 15px;
	}
	
	.subdiv{
		margin-left: 15px;
		margin: 0px auto;
		float: left;
	}
	
	.buttondiv{
		margin: 0px auto;
		float: right;
		margin-right: 10px;
	}
	
	.line{
		border-bottom: 2px solid gray;
		margin-top: 13px;
		width: 100%;
		height: 1px;
		background-color: #dfdfdf;
	}
	
	.button {
    	background-color: #FFC83D;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }
    
	input[type=checkbox] {
		transform: scale(1.5);
		margin-top: 10px;
		margin-bottom: 15px;
		margin-left: 10px;
	}	
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="myPageNav.jsp"%>
 
    <div class="likeitem data" >
	
		<div class="likeitem head">
			<div class="subdiv">
				<h3>마이페이지>관심상품</h3>
			</div>
			
			<div class="buttondiv">
				<button class="button">장바구니 담기</button>
				<button class="button">선택삭제</button>
				<label>전체선택</label><input type="checkbox">
			</div>
			<br>
			<div class="line"></div>
		</div>

		<div class="likeitem body">
			<div class="item top" id="item1">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/13. 이뮨 시스템 서포트.png" width="200" height="200" alt="likeItem1">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템1</a>
				</div>
			</div>
			
			<div class="item top" id="item2">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/15. 나우푸드 세라펩타제.png" width="200" height="200" alt="likeItem2">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템2</a>
				</div>
			</div>
			
			<div class="item top" id="item3">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/2세라필업_대표.jpg" width="200" height="200" alt="likeItem3">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템3</a>
				</div>
			</div>
			
			<div class="item top" id="item4">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/3. 성인용 구미 멀티비타민.png" width="200" height="200" alt="likeItem4">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템4</a>
				</div>
			</div>
		
			<div class="item bottom" id="item5">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/4. 리제너레이션 멀티비타민.png" width="200" height="200" alt="likeItem5">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템5</a>
				</div>
			</div>
			
			<div class="item bottom" id="item6">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/7. 오가닉 인증 스피루리나.png" width="200" height="200" alt="likeItem6">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템6</a>
				</div>
			</div>
			
			<div class="item bottom" id="item7">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/7. 오가닉 인증 스피루리나.png" width="200" height="200" alt="likeItem6">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템7</a>
				</div>
			</div>
			
			<div class="item bottom" id="item8">
				<input type="checkbox"><br>
				<a href="https://www.naver.com">
				<img src="images/7. 오가닉 인증 스피루리나.png" width="200" height="200" alt="likeItem6">
				</a>
				<div class="itemTitle">
					<a href="https://www.naver.com">아이템8</a>
				</div>
			</div>
		</div>
	</div>
    
	<script>
		$('#goViewProduct').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCommunity').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goCart').on('click', function(){
			location.href="<%= request.getContextPath() %>/cart.me"; <!-- 이부분은 지워도 됨(test) -->
		});
		$('#goMypage').on('click', function(){
			location.href="<%= request.getContextPath() %>/updateMyPage.me";
		});
		$('#goService').on('click', function(){
			location.href="<%= request.getContextPath() %>/test.no"; <!-- 이부분은 지워도 됨(test) -->
		});
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