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
	#container{border:1px solid grey; border-top-width:1px; border-bottom-width:0px;height:700px; width:1000px;margin: 0 auto;}
	.bigtle{width: 600px; height:400px; margin: 0 auto; margin-top: 15px;text-align: center;}
	.main_home{transition: all ease 0.5s;width: 250px;height: 100px; border: 2px solid grey;float: left;margin-left: 174px;text-align: center;font-size: 50px;font-size: 50px;padding-top: 10px;}	
	.bigtle02{width: 600px; height: 200px; margin: 0 auto;padding-top: 35px;border-top: 3px solid grey}
	.check{background: url("img/error.png");width: 200px;height: 200px;background-size: 200px 200px;margin-left: 200px;margin-top: 50px;}
	
	.main_home:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	.asd{height: auto;font-size: 15px;}

</style>
<script type="text/javascript">
  
</script> 
</head> 
<body> 
<div id="container"> 
	<div class="bigtle">
		<div class="check"></div>
		<h1>페이지 오류 안내</h1>
		<div class="asd">오류내용 : ${msg}</div>
	</div> 
	<div class="bigtle02">
		<div onclick="location.href='index.jsp'" class="main_home">
			홈으로  
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />