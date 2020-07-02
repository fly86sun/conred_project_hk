<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
		function confirmClose(){
			opener.document.getElementsByName("emailConfirm")[0].value="Y";
			self.close();
		}
	</script>
<meta charset="UTF-8">
<title>어디가냥저기가개! 이메일 본인 인증</title>
<style type="text/css" >
	#spans{
	 text-align: center;
	 color: black; 
	 font-weight: bold;
	}
	#table1{
	background-color: silver;
	border: solid;
	border-color: silver;
	margin-bottom: 110px;
	
	
		
	}
/* <!-- 		border="1" width="300" height="300" align="center" --> */
/* 	align="center" style="color: green; font-weight: bold;" */
	
</style>
</head>
<body>
	<form action="email_ok_end.do" method="post">
		<table id="table1" align="center">
			<br>
			<br>
			<br>
			<div id="spans">
			<span>
			입력하신 이메일로 받은 인증번호를 입력하라냥!<br>
			(인증번호가 일치하여야 다음 단계로 넘어가실 수 있습니다)
			</span>
			</div>
			<br>
			<br>
			<br>
			<br>

			<!--         //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인     -->
				<tr>
					<td>
						<div style="text-align: center;">
						이메일 인증번호 입력<br><br><input type="number" name="email_injeung"
							placeholder="  인증번호를 입력하세요. ">
						</div> <br> <br>
					<div style="text-align: center;" >
					<button type="submit" name="submit">확인</button><br/>
					</div>
					<span>${msg}</span>
					</td>
				</tr>
				<c:if test="${confirm =='Y'}">
					<tr>
						<td>
							<button type="button" onclick="confirmClose()">완료</button>
						</td>
					</tr>
				</c:if>
		 </table>
	</form>
</body>
</html>
<jsp:include page="../all/footer.jsp" />