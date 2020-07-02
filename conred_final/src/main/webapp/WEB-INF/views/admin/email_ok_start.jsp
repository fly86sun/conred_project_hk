<jsp:include page="../all/header2.jsp" />
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가냥저기가개! 메일인증 요청하기</title>
</head>
<body>
	<form action="email_ok_start.do" method="post">
		<table border="1" width="300" height="300" align="center">

			<span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증
				받아야 다음 단계로 넘어갈 수 있습니다.)</span>
			<br>
			<br>
			<br>
			<br>


		    <tr>
				<td>
					<br>
					<div>
						이메일 : <input type="email" name="email"
							placeholder="  이메일주소를 입력하세요. ">
					</div> <br> <br>
					<button type="submit" name="submit">이메일 본인인증 시작</button>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>
<jsp:include page="../all/footer.jsp" />