<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" import="common.PageInfo, product.model.vo.ProductFile, java.util.ArrayList"%>
<%
	Member member = (Member)request.getAttribute("userId");
	PageInfo paging = (PageInfo) request.getAttribute("page");
	ArrayList<FavoriteProduct> favoriteList = (ArrayList<FavoriteProduct>)request.getAttribute("favoriteList"); 
	ArrayList<ProductFile> fList = (ArrayList<ProductFile>) request.getAttribute("fList");
	System.out.println(fList);
	String authority = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지|관심상품</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	body {width: 1500px; height: 800px;}
	
	.likeitem_data{
		width: 85%;
        margin-top: 30px; 
		position: absolute;
		margin-left: 200px;
	}

	.likeitem_head{
		min-width: 95%; 
		float: left; 
		margin-left: 30px; 
		margin-top: 15px;
		position: absolute;
	}
	
  	.likeitem_body{
  		margin-top: 70px;
		width: 95%; 
		min-width: 1000px;
		position: absolute;
		padding-bottom: 10px; 
	    text-align: left;
	}
	
	.item {
		margin-left: 20px;
	    border: 1px solid #ccc;
	    float: center;
	    min-width: 30%;
	    display: inline-block;
	    text-align: center;
	    overflow: hidden;
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
	
	#pagingBtns {
	margin-top: 50px;
	padding-bottom: 20px;
	}

	#pagingBtns button {
		width: 30px;
		height: 30px;
	}
	
	#pagingBtns button:hover {
		cursor: pointer;
		background: #d6d6d6;
	}
	
	#currentPage {
		background: orange;
		color: white;
		cursor: default !important;
	}
	
	#currentPage:hover {
		background: orange !important
	}	
	
</style>
</head>
<body>
	<%@include file="../title_header.jsp"%>
	
		<%@include file="myPageNav.jsp"%>
 
    <div class="likeitem_data" >
	
		<div class="likeitem_head">
			<div class="subdiv">
				<h3>마이페이지>관심상품</h3>
			</div>
			
			<div class="buttondiv">
				<button class="button" id="addCart">장바구니 담기</button>
				<button class="button" id="checkDelete">선택삭제</button>
				<label>전체선택</label><input type="checkbox" id="allCheck">
			</div>
			<br>
			<div class="line"></div>
		</div>

		<div class="likeitem_body">
		<% if(favoriteList.isEmpty()) {%>
					
					<p style="margin-left: 50px;">찜하신 상품이 없습니다.</p>
					
				<%  } else { %>
					<%	for(FavoriteProduct pf : favoriteList){ 
						%>
			<div class="item" id="item1">
					<input type="checkbox" id="check" name="checking"><br>
							<%
							for (int j = 0; j < fList.size(); j++) {
								%>
								<%
									ProductFile f = fList.get(j);
								%>
								<%
									if (pf.getProductNo() == f.getProductNo()) {
								%>
									<img width="120px" height="120px" src="<%=request.getContextPath()%>/uploadFiles/productUpload/<%=f.getChangeName()%>">
									<input type="hidden" id="pNo" name="pNo" value="<%=f.getProductNo() %>">
								<%
									}
								%>
								<%
									}
								%>
								<div class="itemTitle">
					<a><%= pf.getProductName() %></a><br>
					<a ><%= pf.getProductPrice() %></a>
				</div>
			</div>
				<% }	%>
				<% }	%>
			
		</div>
	</div>
    
	<script>
	
		var currentPage = <%=paging.getCurrentPage() %>
		var maxPage = <%=paging.getMaxPage() %>
						
		if (currentPage==1)
			$('.beforeBtn').attr('disabled', true);
		if (currentPage>=maxPage)
			$('.afterBtn').attr('disabled', true);
		
		
		$('#allCheck').on('click', function(){
			$('.likeitem_body input').each(function(){
				if(this.checked == false){
					this.checked = true;
				}
			});
		});
		 
		$('#checkDelete').on('click', function(){
			$("input[name=checking]:checked").each(function(){
				var pNo = $('#pNo').val();
				location.href="<%= request.getContextPath() %>/DeleteFavoriteMypage?pNo="+pNo;
            });          
		});
		
		$('.item img').on('click', function(){
			var pNo = $(this).next().val();
			location.href="<%= request.getContextPath() %>/detail.pro?pNo="+pNo;
		});
		
		$('#addCart').on('click', function(){
			$("input[name=checking]:checked").each(function(){
				var pNo = $('#pNo').val();
				location.href="<%= request.getContextPath() %>/addCartMypage?pNo="+pNo;
            });  
		});
	</script>
</body>
</html>