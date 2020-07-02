<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function allSel(bool) {
		var chks = document.getElementsByName("user_ids");//[checkbox,checkbox..]
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}

				$("input[name=user_ids]").prop("checked",bool);
	}

	$(
			function() {
				//form태그에서 submit이벤트가 발생하면 함수실행
				$("muldel").submit(function() {
					var bool = true;
					var count = $(this).find("input[name=user_ids]:checked").length;
					if (count == 0) {
						alert("최소하나이상 체크해야 됩니다.!!");
						bool = false;
					}
					return bool;
				});

				//체크박스 처리: 체크가 하나라도 안되면 전체선택체크박스 해제, 모두 선택되면 체크
				var chks = document.getElementsByName("user_ids");
				for (var i = 0; i < chks.length; i++) {
					chks[i].onclick = function() {
						var checkedObjs = document
								.querySelectorAll("input[name=user_ids]:checked");
						if (checkedObjs.length == chks.length) {
							document.getElementsByName("all")[0].checked = true;
						} else {
							document.getElementsByName("all")[0].checked = false;
						}
					}
				}
			})
</script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; 
	width:1150px;margin: 0 auto; text-align: center; min-height: 900px; position: relative; top: -20px; padding-top: 20px;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#searchbar1{width:80%;}
	#sel{height: 34px; }
	#searchbtn1{padding:3px;width:40px;height:35px; }
	#magnifyglass1{width:20px;}
	#serchtable {width: 960px;}
	th{text-align: center;}
	
	
	
	
/* 	#search{padding-top:18px;width:25%;position:absolute;left:20px;} */
/* 	#searchbar{width:80%;} */
/* 	#searchbtn{padding:3px;width:40px;height:35px;} */
/* 	#magnifyglass{width:20px;} */
	
</style>
<!-- <script type="text/javascript"> -->
<!--  $('#sel').on('change', function() { -->
<!--      location.href= this.value; -->
<!--  }); -->
<!--  $('#sel').val(location.href); -->
<!-- </script> -->
</head> 
<%
List<UDto>list=(List<UDto>)request.getAttribute("list"); 
%>
<body>

<div id="container">
<br>
<form action="admin_user_search.do" method="post">
		<table id="serchtable" border="0" cellpadding="0" cellspacing="0" width="970" align="center">
			<tr>
			  <td align="left">
					<select	name="userSearch" id="sel">
						<option value="keyWord" ${userSearch eq "keyWord"?"selected":""}>키워드 검색</option>
						<option value="blackUser" ${userSearch eq "blackUser"?"selected":""}>블랙유저 검색</option> 
					</select>
					<input value="${requestScope.searchWord}" name="searchWord" type="text" id="searchbar1" class="form-control pull-left" placeholder="안녕하세요 관리자님! 유저 관련 키워드로 검색 하세요">
					<button type="submit" id="searchbtn1" class="btn"><img id="magnifyglass1" src="./img/magnifyglass.png"></button>
			  </td>
			</tr>
		</table>
		</form>
		<br>
<form id="muldel" method="post">
<input type="hidden" name="userSearch" value="${requestScope.userSearch}"/>
<input type="hidden" name="searchWord" value="${requestScope.searchWord}"/>
<table id="table2" class="table table-striped">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>가입일자</th>
		<th>약관동의여부</th>
		<th>탈퇴여부</th>
		<th>블랙여부</th>
		<th>유저등급</th>
		<th>포인트</th>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
	</tr>
<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='19'>"
			         +"---관리자님 회원을 검색해보세요!---</td></tr>");
		}else{
			for(UDto dto:list){
				%>
				<tr>
					<td><%=dto.getUser_id()%></td>
					<td><%=dto.getUser_password()%></td>
					<td><%=dto.getUser_name()%></td>
					<td><%=dto.getUser_email()%></td>
					<td><%=dto.getUser_birth()%></td>
					<td><%=dto.getUser_sex()%></td>
					<td><%=dto.getUser_regdate()%></td>
					<td><%=dto.getUser_agreement()%></td>
					<td><%=dto.getUser_out()%></td>
					<td><%=dto.getUser_black()%></td>
					<td><%=dto.getUser_role()%></td>
					<td><%=dto.getUser_point()%></td>
					<td><input type="checkbox" name="user_ids" value="<%=dto.getUser_id()%>"/></td>
				</tr>
				<%
			}
		}           
	%>	
</table>
	<button type="submit" formaction="adminMuldelUser.do" >탈퇴여부변경</button>
</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />