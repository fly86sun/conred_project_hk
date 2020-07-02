<%@page import="com.hk.conred.dtos.ODto"%>
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
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function allSel(bool) {
		var chks = document.getElementsByName("owner_ids");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}

				$("input[name=owner_ids]").prop("checked",bool);
	}

	$(function() {
		//아이디 test 에서 submit이벤트가 발생하면 함수실행
		$("#muldel").submit(function() {
			var bool = true;
			var count = $(this).find("input[name=owner_ids]:checked").length;
			if (count == 0) {
				alert("최소하나이상 선택해야 됩니다!");
				bool = false;
			}else {
				if(confirm("정말 변경 하시겠습니까?")){
					return bool;
				}else{
					bool = false;
				}
			}
			return bool;
		});

		// 체크박스 처리: 체크가 하나라도 안되면 전체선택체크박스 해제, 모두 선택되면 체크
		var chks = document.getElementsByName("owner_ids");
		for (var i = 0; i < chks.length; i++) {
			chks[i].onclick = function() {
				var checkedObjs = document
						.querySelectorAll("input[name=owner_ids]:checked");
				if (checkedObjs.length == chks.length) {
					document.getElementsByName("all")[0].checked = true;
				} else {
					document.getElementsByName("all")[0].checked = false;
				}
			}
		}
	});
</script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; 
	width:1150px; margin: 0 auto; text-align: center; min-height: 900px; position: relative; top: -20px; padding-top: 20px;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#searchbar1{width:770px; margin-left: 45px;}
	#sel{height: 34px; }
	#searchbtn1{padding:3px;width:40px;height:35px; }
	#magnifyglass1{width:20px;}
	
	th{text-align: center;}
    #table1{width: 960px;}
</style>
</head> 
<%
List<ODto>list=(List<ODto>)request.getAttribute("list"); 
%>
<body>
<br>
<div id="container">
	<form action="admin_owner_search.do" method="post">
			<table id="table1">
				<tr>
					<td align="left">
						<select	name="ownerSearch" id="sel">
							<option value="keywordOwner" ${ownerSearch eq "keywordOwner"?"selected":""}>키워드 검색</option>
						</select>
						<input value="${requestScope.searchWordOwner}" name="searchWordOwner" type="text" id="searchbar1" class="form-control pull-left" placeholder="안녕하세요 관리자님! 점주 관련 키워드로 검색 하세요">
						<button type="submit" id="searchbtn" class="btn"><img id="magnifyglass1" src="./img/magnifyglass.png"></button>
					<td>
				</tr>
			</table>
	</form>
	<br>
	<form id="muldel" method="post">
		<input type="hidden" name="ownerSearch" value="${requestScope.ownerSearch}"/>
		<input type="hidden" name="searchWordOwner" value="${requestScope.searchWordOwner}"/>
		<table id="table2" class="table table-striped" >
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>가입일자</th>
				<th>동의여부</th>
				<th>탈퇴여부</th>
				<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
			</tr>
		<%
				if(list==null||list.size()==0){
					out.print("<tr><td colspan='19'>"
					         +"---관리자님 점주를 검색해보세요!---</td></tr>");
				}else{
					for(ODto dto:list){
						%>
						<tr>
							<td><%=dto.getOwner_id()%></td>
<%-- 							<td><%=dto.getOwner_password()%></td> --%>
							<td><%=dto.getOwner_name()%></td>
							<td><%=dto.getOwner_email()%></td>
							<td><%=dto.getOwner_birth()%></td>
							<td><%=dto.getOwner_sex()%></td>
							<td><%=dto.getOwner_regdate()%></td>
							<td><%=dto.getOwner_agreement()%></td>
							<td><%=dto.getOwner_out()%></td>
							<td><input type="checkbox" name="owner_ids" value="<%=dto.getOwner_id()%>"/></td>
						</tr>
						<%
					}
				}
			%>	
		</table>
			<button type="submit" formaction="adminMuldelOwner.do" >탈퇴여부변경</button>
		</form>
	</div>
 </body>
</html>
<jsp:include page="../all/footer.jsp" />