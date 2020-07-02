<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0px;
	}       
	footer{
		height: 300px;
		background-color: #F2F2F2;  
		font-size: 12px;
		color: #BDBDBD; 
	}
	#main1{
		position:relative;
		top:20px; 
		width: 800px;
		margin: 0 auto;
		height: 260px;
/* 		border:1px solid black; */
	}bsd
	#f1{
		position:absolute;
		left:110px;
		top:100px;
		width:200px;
	}
	#f2{ 
		position: absolute; 
		left: 270px;
		top:50px;
		border-left: 2px solid gray;
		padding: 20px;
	}
</style>
</head>
<body>
	<h1>푸터 페이지</h1>
	<a href="user_regist.do">유저 회원가입 페이지로 이동</a><br>
	<a href="user_regist_category_test.do">유저 관심사 등록 페이지로 이동</a>
	<a href="login.do">로그인 페이지로 이동(공통)</a>
	<a href="test_reserve.do">결제창이동</a>
	<a href="test_menu.do">메뉴선택</a>
	<a href="test_reserve_list.do">예약목록</a>
	<a href="test_scroll.do">스크롤 테스트</a>
	<a href="test_modal.do">모달 테스트</a>
	<a href="test_file.do">다중파일업로드 테스트</a>
	<a href="test_calendar.do">캘린더 테스트</a>
	<a href="test_calendar02.do">캘린더 테스트2</a>
	<a href="test_time.do">시간 테스트</a>
	<a href="test_like.do">찜버튼 테스트</a>
	<a href="test_star.do">별점 라이브러리 테스트</a> 
	<a href="user_regist_finish.do">asd</a>
	<a href="test_reserve_success.do">결제완료 페이지</a>
	<a href="user_insert.do">유저관심사 아이콘들</a>
	<a href="error.do">에러페이지</a>
	
</body>
<footer> 
	<div id="main1"> 
		<div id="f1">
			<img alt="" src="./img/logo1.png" style="width: 140px;">
		</div>
		<div id="f2">
			(주)어디가개|대표이사:신윤호|사업자 등록번호 :220-87-42885|통신판매업신고:양평동 000호 <br/>
			메일:syhnz1102@gmail.com|관광사업자 등록번호:제2016-31호|주소:서울 양평동 한경닷컴 401호<br/>
			호스팅서비스 제공자:주식회사 어디가개|고객센터 :1644-1346(오전 9시~익일 새벽3시)<br>
			<br>
			(주)어디가개는 통신판매 중개자로서 통신판매의 당사자가 아니며<br>
			상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
		</div>
	</div> 
</footer>
</html>