<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html{
		min-width: 1000px;
	}

	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#service-menubar-name { 
		margin-top: 5px;
		text-align: center; 
		font-size: 20px;
	}
	
	.service-menubar ul, li {
		list-style: none; 
		padding: 10px; margin: 0; text-align: center;
	}
	
	.service-menubar {
        width: 170px;
        max-width: 170px;
        padding: 20px;
        margin-top: 14px; 
        float: left;
        position: absolute;
        min-height: 100%;
        overflow: auto;
	}
	
	.qa.data{
	    width: 85%;
        margin-top: 30px; 
		position: absolute; /* 없애지 말 것 */
		margin-left: 200px;
	}

	.qa.head{
		width: 98%; float: left; margin-left: 30px; 
		margin-top: 15px;
	}
	
	h3{
		color: black; 
		margin: 0px auto;
		font-size: 20px;
		margin-left: 15px;
		margin-bottom: 7px;
	}
	
	.line{
		border-bottom: 2px solid gray;
		width: 100%;
	}
	
	.qa.body{
		width: 90%; 
		min-height:350px; 
		margin-top: 10px;
		float: left;
		padding-bottom: 10px; 
	    margin-left: 50px;
	}

	.contentBox{
		margin-left: 15px;
		margin-top: 20px;
		width: 100%;
		min-height: 500px;
		background: #EAEAEA;
		float: left;
	}
	
	nav{margin-left: 25px; margin-top: 10px;}
	
	.content{
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		width: 95%;
		min-height: 500px;
	}
	
	li:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	
	.rulesmenu{
	color: gray;
	text-align: center;
	vertical-align: middle;
	width: 130px;
	float: left;
	}
	
	.rulesdiv{
	color: gray;
	text-align: center;
	font-weight: bold;
	width: 10px;
	margin-right: 30px;
	float: left;
	}

	.rulesmenu:hover {
		font-weight: bold;
		cursor: pointer;
	}
	
	#goRules{
		color: black;
	}

</style>
</head>
<body>
	<%@ include file="../title_header.jsp" %>
	
	<div class="service-menubar">
	<hr>
		<h2 id="service-menubar-name">고객센터</h2>
	<hr>
		<ul>
		<li class="servicemenu" id="goNotice">공지사항</li>
		<li class="servicemenu" id="goFAQ">자주묻는질문</li>
		<li class="servicemenu" id="goQNA">Q&A</li>
		<li class="servicemenu" id="goRules"><b>약관 및 방침</b></li>
		</ul>
	</div>
	
	<div class="qa data">
	
		<div class="qa head">
			<div class="subdiv">
				<h3>고객센터>약관 및 방침</h3>
			</div>

			<div class="line"></div>
		</div>
		
		<div class="qa body">
		<nav>
			<div class="rulesmenu" id="goRules"><b>이용약관</b></div>
			<div class="rulesdiv"> | </div>
			<div class="rulesmenu" id="goRules2">개인정보 처리방침</div>
		</nav>
			<div class="contentBox">
				<div class="content">
				
<br>			
<b>제1조(목적)</b> <br>
<br>
이 약관은 (주)강건강(사업자등록번호 : 021-03-00514, 통신판매업신고번호 : 제2020-서울강남-03029호, 대표자 : 강건강)가 운영하는 온라인 웹사이트 BUH에서 제공하는 전자상거래 관련 서비스(이하 “서비스”라 한다.)를 이용함에 있어 BUH와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. 

*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다. <br>
<br><br>

<b>제2조(정의)</b><br>
<br>
① “BUH"란 (주)강건강이 재화 또는 용역(이하 “재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장 및 그에 부수되는 콘텐츠 서비스를 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다. 
<br><br>
② “이용자"란 “BUH"에 접속하여 이 약관에 따라 “BUH"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 
<br><br>
③ “회원"이라 함은 “BUH"에 회원등록을 한 자로서, 계속적으로 “BUH"가 제공하는 서비스를 이용할 수 있는 자를 말합니다. 
<br><br>
④ “비회원"이라 함은 회원으로 가입하지 않고 “BUH"가 제공하는 서비스를 이용하는 자를 말합니다. 
<br><br><br>


<b>제3조 (약관 등의 명시와 설명 및 개정) </b><br>
<br>
① “BUH”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 BUH의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. 
<br><br>
② “BUH"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. 
<br><br>
③ “BUH”는「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 
<br><br>
④ “BUH”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "BUH“는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
<br><br>
⑤ “BUH”가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “BUH”에 송신하여 “BUH”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. 
<br><br>
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다. 
<br><br><br>


<b>제4조(서비스의 제공 및 변경)</b><br>
<br>
① “BUH”는 다음과 같은 서비스를 제공합니다. 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 구매계약이 체결된 재화 또는 용역의 배송
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;3. 이용자의 “BUH” 서비스 이용에 도움이 되는 알람 및 콘텐츠 제공 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;4. 기타 “BUH”가 정하는 업무 
<br><br>
② “BUH”가 제공하는 재화 또는 용역 서비스는 비의료 건강관리서비스로서 질환의 치료 목적의 서비스가 아닌 보조적 건강관리 서비스입니다. 특히 만성질환자의 경우 본 서비스 이용대상자가 아니며 의사 또는 의료기관의 도움을 받으시기를 권고 드립니다. 
<br><br>
③ “BUH”는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다. 
<br><br>
④ “BUH”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
<br><br>
⑤ 전항의 경우 “BUH”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “BUH”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. 
<br><br><br>


<b>제5조(서비스의 중단)</b><br> 
<br>
① “BUH”는 연중무휴, 1일 24시간 제공을 원칙으로 합니다. 단, 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 
<br><br>
② “BUH”는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “BUH”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. 
<br><br>
③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “BUH”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 “BUH”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “BUH”가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 포인트 또는 적립금 등을 “BUH”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다. 
<br><br>
④ 제3항에도 불구하고 “BUH”가 이용자에게 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
<br><br><br>


<b>제6조(회원가입)</b><br> 
<br>
① 이용자는 “BUH”가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. 
<br><br>
② “BUH”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “BUH”의 회원재가입 승낙을 얻은 경우에는 예외로 함.
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;3. 기타 회원으로 등록하는 것이 “BUH”의 기술상 현저히 지장이 있다고 판단되는 경우 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;4. 회원가입 및 전자상거래상의 계약에 관한 서비스는 만 14세 이상인자에 한함 
<br><br>
③ 회원가입계약의 성립 시기는 “BUH”의 승낙이 회원에게 도달한 시점으로 합니다. 
<br><br>
④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “BUH”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다. 
<br><br><br>


<b>제7조(회원 탈퇴 및 자격 상실 등) </b><br> 
<br>
① 회원은 “BUH”에 언제든지 탈퇴를 요청할 수 있으며 “BUH”는 즉시 회원탈퇴를 처리합니다. 
<br><br>
② 회원이 다음 각 호의 사유에 해당하는 경우, “BUH”는 회원자격을 제한 및 정지시킬 수 있습니다. 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1. 가입 신청 시에 허위 내용을 등록한 경우 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;2. “BUH”를 이용하여 구입한 재화 등의 대금, 기타 “BUH”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;3. 다른 사람의 “BUH” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;4. “BUH”를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 
<br><br>
③ “BUH”가 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “BUH”는 회원자격을 상실시킬 수 있습니다. 
<br><br>
④ “BUH”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다. 
<br><br><br>


<b>제8조(구매신청)</b><br>  
<br>
“BUH”이용자는 “BUH”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “BUH”는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 
<br><br>
1. 재화 등의 검색 및 선택 
<br><br>
2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 
<br><br>
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료 등의 비용부담과 관련한 내용에 대한 확인 
<br><br>
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭) 
<br><br>
5. 재화등의 구매신청 및 이에 관한 확인 또는 “BUH”의 확인에 대한 동의 
<br><br>
6. 결제방법의 선택 
<br><br><br>


<b>제9조(지급방법)</b><br>   
<br>
“BUH”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “BUH”는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다. 
<br><br>
① 선불카드, 직불카드, 신용카드 등의 각종 카드의 인증식 일반결제 
<br><br>
② 온라인무통장입금 
<br><br><br>


<b>제10조(재화 등의 공급)</b><br>    
<br>
① “BUH”는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “BUH”가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “BUH”는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다. 
<br><br>
② “BUH”는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “BUH”가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “BUH”가 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다. 
<br><br>
③ 이용자는 “BUH”가 지정하는 일부 서비스 항목 또는 “BUH”가 지정한 기한에 한하여 회원가입 없이 무상으로 서비스를 이용할 수 있습니다. 
<br><br><br>



<b>제11조(환급)</b><br> 
<br>
“BUH”는 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 
<br><br><br>


<b>제12조(회원의 ID 및 비밀번호에 대한 의무)</b><br>  
<br>
① ID와 비밀번호에 관한 관리책임은 회원에게 있으며, 어떠한 경우에도 본인의 ID 또는 비밀번호를 양도하거나 대여할 수 없습니다. 
<br><br>
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안되며, “BUH”의 귀책사유 없이 이를 유출, 양도, 대여한 행위로 인하여 발생하는 손실이나 손해에 대하여는 회원 본인이 그에 대한 책임을 부담합니다.  
<br><br>
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “BUH”에 통보하고 “BUH”의 안내가 있는 경우에는 그에 따라야 합니다. 
<br><br><br>

				</div>
			</div>
		</div>
		
		<script>
			
			$('.servicemenu').on('click', function() {
				var id = $(this).attr('id');
				location.href='<%=request.getContextPath()%>/' + id;
			});
			
			$('.rulesmenu').on('click', function() {
				var id = $(this).attr('id');
				location.href='<%=request.getContextPath()%>/' + id;
			});
		</script>
	</div>
</body>
</html>