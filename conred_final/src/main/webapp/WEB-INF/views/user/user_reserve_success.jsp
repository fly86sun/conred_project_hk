<%@page import="com.hk.conred.dtos.ReserveDto"%>
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
	#container{border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; border-top-width:1px; height:1200px; width:1000px;margin: 0 auto;}
	.bigtle{width: 600px; height:300px; border-bottom: 3px solid grey;margin: 0 auto; margin-bottom: 35px;margin-top: 15px;text-align: center;}
	.main_home{transition: all ease 0.5s;width: 200px;height: 80px; border: 2px solid grey;float: left;margin-left: 210px;text-align: center;font-size: 40px;padding-top: 10px;margin-top: 35px;}	
	.bigtle02{width: 600px; height: 200px; margin: 0 auto;}
	.check{background: url("img/reserve_success02.png");width: 200px;height: 200px;background-size: 200px 200px;margin-left: 200px;margin-top: 5px;}
	
	.main_home:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	th,td{padding: 10px;}
	table{font-size: 18px;}
	
</style> 

</head>
<%
	ReserveDto dto=(ReserveDto)request.getAttribute("dto");
%>
<body>
<div id="container">
	<div class="bigtle">
		<div class="check"></div>
		<h1><%=dto.getUser_id()%>,님의 결제가 <b>완료</b> 되었습니다</h1>
	</div>
	<div class="bigtle02">
		<table>
			<tr>
				<th>ㆍ 매장이름:</th>
				<td><%=dto.getStore_name()%></td>
			</tr>
			<tr>
				<th>ㆍ 이용상품:</th>
				<td><%=dto.getMenu_name()%></td>
			</tr>
			<tr>
				<th>ㆍ 결제금액:</th>
				<td style="color: #FF8000"><%=dto.getReserve_price()%></td>
			</tr>
			<%
			if(dto.getReserve_edate()==null){
			%>
			<tr>
				<th>ㆍ 이용날짜:</th>
				<td><%=dto.getReserve_sdate()%> / <%=dto.getReserve_time()%></td>
			</tr>
			<%	
			}else{
			%>
			<tr>
				<th>ㆍ 이용날짜:</th>
				<td><%=dto.getReserve_sdate()%> ~ <%=dto.getReserve_edate()%></td>
			</tr>
			<%	
			}	
			%>
			<tr>
				<th>ㆍ 문의번호:</th>
				<td><%=dto.getStore_phone()%></td>
			</tr>
		</table>
		<div onclick="location.href='index.do'" class="main_home">
			홈으로  
		</div>
	</div>
</div> 
</body>
</html> 
<jsp:include page="../all/footer.jsp" />