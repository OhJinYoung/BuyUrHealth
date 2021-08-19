# BuyUrHealth


## 개요 : 영양제 판매 사이트

+ 인체 모형을 만들어 신체 부위별을 클릭 할 때 마다 그 부위의 추천 영양제로 이동
+ 영양소 계산기를 통해 하루 권장 영양소 섭취량에 맞게 영양제 선택 가능
+ 커뮤니티 활성화를 통해 영양제에 대한 자유로운 의견 공유와 후기 작성 가능

## 사용기술 및 개발 환경

+ Front-end : <img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
+ Back-end : <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> 
+ Data-base : <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
+ Server : <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">  
+ Version-control: <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

## 구현 기능 

+ 제품을 보는 것과 커뮤니티, 메인화면 컨텐츠 부분은 로그인하지 않고도 구경할 수 있게 구현
+ 구매, 커뮤니티 글작성, 댓글작성 등 제품을 구매하고 의견과 정보를 공유하는 좀 더 구체적인 컨텐츠들은 회원만 접근 가능하도록 구현 

◆ 회원 서비스
+ 마이페이지 : 가입 / 정보수정 / 탈퇴 / 비밀번호, 아이디찾기 / 주문확인 / 환불, 교환, 취소 요청 / 관심상품
+ 장바구니 : 제품 주문 / 제품 수량 지정 / 장바구니에서 삭제
+ 커뮤니티 : 자유글, 토론글, 후기 등 글 작성 / 글 수정 / 글 삭제 / 댓글

◆ 관리자 서비스
+ 회원 관리 : 모든 회원 정보 조회, 수정, 삭제 / 검색 / 권한 부여
+ 주문 관리 : 모든 주문 정보 조회, 관리 / 사용자 주문 요청 확인 / 송장번호
+ 제품 관리 : 모든 제품 정보 조회, 수정, 삭제 / 제품 추가
+ 게시판 관리 : 모든 게시판 조회, 수정, 삭제 / 공지사항 추가, 수정, 삭제
         
## 핵심 특징
<img src ="https://user-images.githubusercontent.com/82019175/129987135-1a4bd433-17a4-4436-a93a-b970ee1c328c.png" width="50%" height="50%">

* 사이트의 메인페이지 
  * 회원이 아니더라도 이용할 수 있음 
  * 영양제 추천은 랜덤으로 바뀜
  * 타이틀 메뉴로 다른 컨텐츠를 사용하려고 하면 로그인 페이지로 이동됨
---------------------------------------------------------------------------------------------------------------------------------------------------
<img src ="https://user-images.githubusercontent.com/82019175/129987517-c06dd007-54c9-46ff-bb54-5b16d42fd7c0.PNG" width="50%" height="50%">

* 사용자가 해당 페이지에서 제품을 구매할 수 있는 기능
  * 제품품목들에서 찜버튼을 누르면 장바구니에 담김
  * 담긴 제품들은 장바구니에서 확인 후 구매 
---------------------------------------------------------------------------------------------------------------------------------------------------
<img src ="https://user-images.githubusercontent.com/82019175/129987744-daa61164-c468-4e2a-8868-a2c82485107c.png" width="50%" height="50%"><img src ="https://user-images.githubusercontent.com/82019175/129987753-cedd912a-f677-4e80-bbf7-cfbd70aef876.png" width="50%" height="50%">

* 관리자 기능 : 관리자 페이지를 통해 사용자들의 정보와 주문, 게시판들을 관리 할 수 있다.
  * 회원 관리 페이지에서는 회원가입한 모든 회원에 대해서 확인하고 관리할 수 있다.
  * 주문 관리 페이지에서는 회원들이 주문한 모든 주문에 관해서 관리할 수 있다.

## 설계 주안점
+ 영양자 판매를 할 뿐만 아니라 영양제에 들어있는 영양소에 대한 정보와 영양제에 효능, 사용자들끼리의 정보공유까지 도모한다.
+ 메인 페이지에서 신체부위별 영양제를 추천하여 몸에 맞는 영양제 정보 획득
+ 메인 페이지에서 영양소 계산기를 통해 신체조건, 연령에 맞는 영양소 정보 획득
+ 메인 페이지에서 영양소 소개를 통해 영양소에 대한 추가적인 정보 획득
+ 커뮤니티를 통해 영양소와 영양제에 대한 구매후기, 자유로운 토론 가능

## 팀원별 단위 업무

오 진 영 (팀장) : 프로젝트 메인화면, 마이페이지   
김 도 영        : 로그인, 회원가입, Q&A게시판    
김 채 원        : 구매&결제, Q&A 게시판, PPT   
이 새 린        : 제품, 공지사항    
주 소 연        : 관리자 페이지(주문관리, 사용자관리 등), DB(ERD)   
이 주 은        : 커뮤니티
