<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.customerCenter-menubar {
	width: 20%;
	height: 100%;
	max-width: 170px;
	padding: 30px 20px;
	float: left;
	display: inline-block;
	border-right: 1px solid black;
}

#customerCenter-menubar-name {
	text-align: center;
	font-size: 20px;
	padding:10px 0;
}

.customerCenter-menubar ul, li {
	list-style: none;
	padding: 10px;
	margin: 0;
	text-align: center;
}

.customerCenter-menubar li:hover {
	background: beige;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

</style>
<div class="customerCenter-menubar">
	<hr>
        <h2 id="customerCenter-menubar-name">마이페이지</h2>
    <hr>
        <ul>
          <li class="link" id="goNotice">공지사항</li>
          <li class="link" id="goFAQ">자주묻는질문</li>
          <li class="link" id="goQNA">Q&A</li>
          <li class="link" id="goRules">약관및방침</li>
        </ul>
        
    </div>
<script>
$('.link').on('click', function() {
	location.href='<%=request.getContextPath()%>/'+$(this).attr('id');
});
</script>