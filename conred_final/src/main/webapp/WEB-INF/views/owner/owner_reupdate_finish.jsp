<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../all/header2.jsp" />
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top:1px solid #fff; border-bottom-width:0px;height:700px; width:1000px;margin: 0 auto;}
	.bigtle{width: 600px; height:300px; border-bottom: 3px solid grey;margin: 0 auto; margin-bottom: 35px;margin-top: 15px;text-align: center;}
	.main_home{transition: all ease 0.5s;width: 200px;height: 80px; border: 2px solid grey;float: left;margin-left: 60px;text-align: center;font-size: 40px;padding-top: 10px;}	
	.owner_store{transition: all ease 0.5s;width: 250px;height: 80px;background-color:#01DF01;color:white; float: left;margin-left: 30px;text-align: center;font-size: 40px;padding-top: 10px;}
	.bigtle02{width: 600px; height: 200px; margin: 0 auto;}
	.check{background: url("img/check.png");width: 200px;height: 200px;background-size: 200px 200px;margin-left: 200px;margin-top: 50px;}
	
	.owner_store:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	.main_home:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	
	.empty{clear: both;margin-bottom:30px;}
	.subinfo{font-size:16px;}
</style>
<script type="text/javascript">
  
</script> 
</head> 
<body> 
<div id="container">
	<div class="bigtle">
		<div class="check"></div>
		<h2>매장수정이 <b>완료</b> 되었습니다</h2>
	</div>
	<div class="bigtle02">
		<div onclick="location.href='index.do'" class="main_home">
			홈으로
		</div>
		<div onclick="location.href='store.do?store_seq=${sdto.store_seq}'" class="owner_store">
			내 매장으로
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />
