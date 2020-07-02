<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#user1{cursor: pointer; }
	#user1:horver { }
</style>
</head>
<body>
<div id="container">


<a href="admin_site_userlist.do" id="user1">유저 검색/조회</a><br>
<a href="admin_site_storelist.do">매장 검색/조회</a><br>
<a href="admin_site_ownerlist.do">점주 검색/조회</a><br>


</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />