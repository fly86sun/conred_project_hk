<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; border-top-width:0px;  width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regcircles{width:600px;overflow:auto;margin-left:200px;position:relative;top:100px;}
	.regcircle_left{float:left;}
	.regcircle_right{float:right;}
	.regcircle{width:250px;height:250px;border:1px solid grey; border-radius:50%;text-align:center;line-height:250px;}
	.regcircle:hover{cursor:pointer;background-color: lightgrey;}
	.regtext{font-size: 20px;}
	
</style>
</head> 
<body>
<div id="container">
	<div id="regcircles">
		<div class="regcircle_left regcircle" onclick="location.href='user_regist.do'">
			<span class="regtext">사용자 회원가입</span>
		</div>
		<div class="regcircle_right regcircle" onclick="location.href='owner_regist.do'">
			<span class="regtext">점주 회원가입</span>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />