<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px; margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.sticky{position: sticky; top: 0;}
	.tab-content{width:1000px;height:50px;overflow:auto;position: relative;top:-20px;}
	#home{background-color: white;border:1px solid grey;border-bottom: white;}
	.cate{opacity:1.0;box-sizing:border-box;  float:left;width: 199.7px; height: 50px;background-color: #D8D8D8;text-align: center;line-height: 50px;} */
	.cate:hover{ background-color: #F2F2F2;}
	.cate:hover{ background-color: #F2F2F2;border:1px solid grey;border-bottom: white;}
	a{font-size: 20px;color: #000; }
	a:link { color: black; text-decoration: none;}
 	a:visited { color:black; text-decoration: none;}
 	a:hover { color: black; text-decoration: underline;}
 	.md{padding:20px;border-radius:5px;position: relative; top:40px;font-size: 18px;margin:0 auto; width: 800px; border: 1px solid grey; height: 200px;}
/*  	.md{font-size: 20px;margin-left: 100px; width: 800px; border: 1px solid black; height: 200px; clear: left; margin-top: 200px; } */
	
</style>      
</head>   
  

<body>    
<div id="container"> 
	<div class="sticky">
		<div class="tab-content">
			<div class="cate" id="home">
				<a href="user_mypage.do">마이페이지</a> 
			</div>
			<div class="cate">
				<a href="user_mypage_like.do">좋아요</a>
			</div>
			<div class="cate">
				<a href="user_mypage_reservation.do">내 예약</a>
			</div>
			<div class="cate">
				<a href="user_mypage_review.do">내 리뷰</a>
			</div>
			<div class="cate">
				<a href="user_mypage_qna.do">내 문의</a>
			</div>
		</div>
	</div>
	<div class="md">
		<span style="font-weight: bold;">??회원님 환영합니다.</span><br/><br/>
		<span>닉네임:??</span><br/>
		<span>핸드폰:???</span><br/>
	</div>
	<div class="md">
		<span style="font-weight: bold;">??회원님 환영합니다.</span><br/><br/>
		<span>닉네임:??</span><br/>
		<span>핸드폰:???</span><br/>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 