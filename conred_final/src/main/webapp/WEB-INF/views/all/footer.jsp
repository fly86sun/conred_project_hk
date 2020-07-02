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
		width: 900px;
		margin: 0 auto;
		height: 260px;
/* 		border:1px solid black; */
	}
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
</body>
<footer>
	<div id="main1">
		<div id="f1">
			<img alt="" src="./img/h1.gif" style="width: 140px;margin-top: -20px;">
		</div>
		<div id="f2">
			(주)어디가개 | 대표이사:신윤호 | 사업자 등록번호 :220-87-42885 | 통신판매업신고:양평동 000호 <br/>
			메일:syhnz1102@gmail.com | 관광사업자 등록번호:제2016-31호 | 주소:서울 양평동 한경닷컴 401호<br/>
			호스팅서비스 제공자:주식회사 어디가개 | 고객센터 :1644-1346(오전 9시~익일 새벽3시)<br>
			<br>
			(주)어디가개는 통신판매 중개자로서 통신판매의 당사자가 아니며<br>
			상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
		</div>
	</div>
</footer>
</html>