<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
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
		/* background: lightpink; */
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
	
	#goRules2{
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
			<div class="rulesmenu" id="goRules">이용약관</div>
			<div class="rulesdiv"> | </div>
			<div class="rulesmenu" id="goRules2"><b>개인정보 처리방침</b></div>
		</nav>
			<div class="contentBox">
				<div class="content">
<br>
(주)강건강는 (이하 "회사"는) 고객님의 개인정보를 중요시하며 개인정보보호법 등 관련 법령을 준수하고 있습니다. 회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

<br><br><br>

 ■ 수집하는 개인정보 항목 및 수집방법 
<br><br>
가. 수집하는 개인정보의 항목 
<br><br>
* 회사는 회원가입, 고객 상담, 서비스 신청 및 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;- 회원가입시(필수): 이메일(로그인ID), 비밀번호, 이름, 휴대전화번호 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;- 설문 참여시(선택): 성별, 연령대, 건강과 관련된 정보
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;- 구매 또는 서비스 신청시(필수): 결제 정보, 수취인의 배송지 정보(수취인명, 휴대전화번호, 수취인 주소) 
<br><br>
* 서비스 이용 과정이나 사업 처리 과정에서 서비스 이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록, ADID/IDFA(광고식별자)가 생성되어 수집될 수 있습니다. 
<br><br>
나. 수집방법 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;- 홈페이지, 설문 진행, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집 


<br><br><br><br>
■ 개인정보의 수집 및 이용목적 
<br><br>
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 
<br><br>
* 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스 
<br><br>
* 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달 
<br><br>
* 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 
<br><br><br><br>


■ 개인정보의 보유 및 이용기간 
<br><br>
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. 
<br><br>
가. 회사 내부방침에 의한 정보보유 사유 회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 3년간 회원의 정보를 보유할 수 있습니다. 
<br><br>
나. 관련 법령에 의한 정보 보유 사유 전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 
<br><br>
* 계약 또는 청약철회 등에 관한 기록 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존이유: 전자상거래등에서의소비자보호에관한법률 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존기간: 5년 
<br><br>
* 대금 결제 및 재화 등의 공급에 관한 기록 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존이유: 전자상거래등에서의소비자보호에관한법률 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존기간: 5년 
<br><br>
* 소비자 불만 또는 분쟁처리에 관한 기록 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존이유: 전자상거래등에서의소비자보호에관한법률 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존기간: 3년 
<br><br>
* 로그 기록 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존이유: 통신비밀보호법 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;-보존기간: 3개월 
<br><br><br><br>


■ 개인정보의 파기절차 및 방법 
<br><br>
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. 
<br><br>
* 파기절차 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다. 
<br><br>
* 파기방법 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 
<br><br><br><br>


■ 개인정보 제공 
<br><br>
회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. 
<br><br>
* 이용자들이 사전에 동의한 경우 
<br><br>
* 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 
<br><br><br><br>


■ 수집한 개인정보의 위탁 
<br><br>
회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다. 
<br><br>
* NICE페이먼츠 (결제서비스) 
<br><br>
* 아마존 웹 서비스 (보안 및 서비스 인프라 강화) 
<br><br>
* (주)두손컴퍼니, CJ대한통운(주) (택배 배송 서비스) 
<br><br>
* (주)링크허브, 카카오 (카카오알림톡, SMS/LMS/MMS 발송서비스) 
<br><br>
* 메일침프, 아마존 웹 서비스 (이메일 서비스) 
<br><br><br><br>


■ 이용자 및 법정대리인의 권리와 그 행사방법 
<br><br>
* 이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 
<br><br>
* 이용자들의 개인정보 조회, 수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 
<br><br>
* 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다. 
<br><br>
* 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
<br><br>
* 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다. 
<br><br><br><br>


■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 
<br><br>
* 회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다. 
모바일 어플리케이션과 같이 쿠키 기능을 사용할 수 없는 경우에는 쿠키와 유사한 기능을 수행하는 기술(광고식별자 등)을 사용할 수도 있습니다.
<br><br>
* 쿠키 등 사용 목적 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 
<br><br>
* 쿠키 설정 거부 방법 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1. 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용 하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 설정방법 예(인터넷 익스플로어의 경우): 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;3. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다. 			
<br><br><br><br>

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