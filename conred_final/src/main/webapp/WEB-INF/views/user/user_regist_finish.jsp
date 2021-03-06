<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{ border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff;border-top-width:1px; height:700px; width:1000px;margin: 0 auto;}
	.bigtle{width: 600px; height:300px; border-bottom: 3px solid grey;margin: 0 auto; margin-bottom: 35px;margin-top: 15px;text-align: center;}
	.main_home{transition: all ease 0.5s;width: 200px;height: 80px; border: 2px solid grey;float: left;margin-left: 80px;text-align: center;font-size: 40px;padding-top: 10px;}	
	.user_login{transition: all ease 0.5s;width: 200px;height: 80px;background-color:#01DF01;color:white; float: left;margin-left: 30px;text-align: center;font-size: 40px;padding-top: 10px;}
	.bigtle02{width: 600px; height: 200px; margin: 0 auto;}
	.check{background: url("img/check.png");width: 200px;height: 200px;background-size: 200px 200px;margin-left: 200px;margin-top: 50px;}
	
	.user_login:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	.main_home:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
</style>
<script type="text/javascript">
  
</script> 
</head> 
<body> 
<div id="container">
	<div class="bigtle">
		<div class="check"></div>
		<h2>회원가입이 <b>완료</b> 되었습니다</h2>
	</div>
	<div class="bigtle02">
		<div onclick="location.href='index.do'" class="main_home">
			홈으로  
		</div>
		<div onclick="location.href='login.do'" class="user_login">
			로그인
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />