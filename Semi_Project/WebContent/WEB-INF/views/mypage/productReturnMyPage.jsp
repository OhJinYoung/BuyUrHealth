<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|구매목록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
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
	 #myPage-head {text-align:left; margin-top:50px; margin-left:250px;}
	 
	 .returnBackground{
	 	width: 100%; min-width: 1000px; height: 100%; border: 1px solid black; 
	 	margin-left: 230px; background-color: lightgray;
	 }
	 
	 .returnDetail{
	 	width: 700px; height: 650px; border: 1px solid black; 
	 	margin: 50px; background-color: white;
	 }
	 
	 .returnDetail h2{
	 	text-align: center;
	 }
	 
	 textarea{
	 	margin-left: 50px; resize:none; display: none;
	 }
	 
	 input[type=radio]{
	 	font-size:17px; width:20px; height:20px;
	    margin-left: 50px;
	 }
	 
	 p{
	 	font-size:17px; margin-left: 50px; font-weight: bold;
	 }
	 
	 button{
	 	width: 90px; height: 40px; margin-left: 50px; background-color: black; 
	 	font-weight: bold; color: white;
	 }
	 
	 button[type=submit]{
	  	margin-left: 400px;
	 }
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
          <li id="goPage">개인정보조회</li>
          <li id="goFavorite">관심상품</li>
        </ul>
        
    </div>
    
    <h1 id="myPage-head">취소/반품/교환 신청</h1>
        
    <hr>
    
    <div class="returnBackground">
    	<div class="returnDetail">
	    	<form action="<%= request.getContextPath() %>/subProductReturn.me" method="post">
	    	<h2>사유 선택</h2>
				<input type="radio" name="requestSelect" value="취소요청"><label>취소</label>
				<input type="radio" name="requestSelect" value="반품요청"><label>반품</label>
				<input type="radio" name="requestSelect" value="교환요청"><label>교환</label>
				
				<p>단순변심</p>
				<input type="radio" name="requestResult" value="상품이 마음에 들지않음"><label>상품이 마음에 들지않음</label><br>
				<textarea id="textarea" rows="6" cols="50" placeholder="상세 사유를 입력해주세요."></textarea>
				<p>배송문제</p>
				<input type="radio" name="requestResult" value="배송된 장소에 상품이 없음"><label>배송된 장소에 상품이 없음</label><br>
				<input type="radio" name="requestResult" value="선택된 주소가 아닌 다른 주소로 배송됨"><label>선택된 주소가 아닌 다른 주소로 배송됨</label><br>
				<input type="radio" name="requestResult" value="주문된 상품 중 일부 상품이 배송되지 않음"><label>주문된 상품 중 일부 상품이 배송되지 않음</label><br>
				<p>상품문제</p>
				<input type="radio" name="requestResult" value="상품이 설명과 다름<"><label>상품이 설명과 다름</label><br>
				<input type="radio" name="requestResult" value="다른 상품이 배송됨"><label>다른 상품이 배송됨</label><br>
				<input type="radio" name="requestResult" value="상품이 파손됨"><label>상품이 파손됨</label><br>
				<br>
				<button type="reset" onclick="backBuyMyPage();">취소</button>
				<button type="submit">제출하기</button>
				
	    	</form>
    	</div>
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
		
		
		$('#product-return').on('click', function(){
			location.href="<%= request.getContextPath() %>/productReturnForm.me";
		});
		
		$('#delive-search').on('click', function(){
			location.href="<%= request.getContextPath() %>/deliveSearchForm.me";
		});
		
		$('#goBuy-review').on('click', function(){
		
		});
		
		
		$('input:radio[name=requestResult]').click(function(){
			if($(this).val() == "dislike"){
		    	$('#textarea').css('display', 'inline-block'); 
		    	
		    }else{
		    	$('#textarea').css('display', 'none');
		    }
		});
		
		function subProductReturn(){
			console.log('hi');
			
			var requestType = $('input[name=requestSelect]:checked').val();
			var requestResult = $('input[name=requestResult]:checked').children().text();
			
			if(requestResult == "dislike"){
				var requestInfo = $('#textarea').text();
			}
		}
		
		function backBuyMyPage(){
			location.href="<%= request.getContextPath() %>/buyMyPage.me";
		}
	</script>
</body>
</html>