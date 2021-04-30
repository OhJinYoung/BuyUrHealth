<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {
	    height: 100%; 
	    overflow-y: auto;
	    overflow-x: hidden;
	    margin: 0px auto;
	    letter-spacing: -1px;
	}	
	
	#service-menubar-name { 
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
        border-right: 1px solid;
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
		width: 100%;
		min-height: 500px;
		background: lightgray;
		float: left;
	}
	
	.content{
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		width: 95%;
		min-height: 500px;
		
	}

</style>
</head>
<body>
	<%@ include file="../user/header.jsp" %>
	
	<div class="service-menubar">
	<hr>
		<h2 id="service-menubar-name">Q&A</h2>
	<hr>
		<ul>
		<li>공지사항</li>
		<li>자주묻는질문</li>
		<li>Q&A</li>
		<li><b>약관 및 방침</b></li>
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
			<div class="contentBox">
				<div class="content">
					So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

So are you happy now

Finally happy now are you

뭐 그대로야 난

다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나

이대로는 무엇도 사랑하고 싶지 않아

다 해질 대로 해져버린

기억 속을 여행해

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 이별 따위는 없어

아름다웠던 그 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬

예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지

그리움과 같이 맞이하는 아침

서로가 이 영겁을 지나

꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작

한 뼘짜리 추억을 잊는 게 참 쉽지 않아

시간이 지나도 여전히

날 붙드는 그곳에

우리는 오렌지 태양 아래

그림자 없이 함께 춤을 춰

정해진 안녕 따위는 없어

아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워

슬프지 않은 이야기를 나눠

우울한 결말 따위는 없어

난 영원히 널 이 기억에서 만나

Forever young

우우우 우우우우 우우우 우우우우

Forever we young

우우우 우우우우

이런 악몽이라면 영영 깨지 않을게
				</div>
			</div>
		</div>
	</div>
</body>
</html>