<%@page import="com.hk.conred.dtos.SDto"%>
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
		var chks = document.getElementsByName("store_seqs");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}

				$("input[name=store_seqs]").prop("checked",bool);
	}

	$(function() {
		//아이디 muldel 에서 submit이벤트가 발생하면 함수실행
		$("#muldel").submit(function() {
			var bool = true;
			var count = $(this).find("input[name=store_seqs]:checked").length;
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
		var chks = document.getElementsByName("store_seqs");
		for (var i = 0; i < chks.length; i++) {
			chks[i].onclick = function() {
				var checkedObjs = document
						.querySelectorAll("input[name=store_seqs]:checked");
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
	#container{border:1px solid grey; border-top-width:0px;border-bottom-width:0px; 
	width:1150px;margin: 0 auto; text-align: center; min-height: 900px; position: relative; top: -20px; padding-top: 20px;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#searchbar1{width:730px; margin-left: 45px;}
	#sel{height: 34px; }
	#searchbtn1{padding:3px;width:40px;height:35px; }
	#magnifyglass1{width:20px;}
	
	th{text-align: center;}
    #table1{width: 960px;}
</style>
</head> 
<%
List<SDto>list=(List<SDto>)request.getAttribute("list"); 
%>
<body>
<br>
<div id="container">
	<form action="admin_store_search.do" method="post">
			<table id="table1">
				<tr>
					<td align="left">
						<select	name="storeSearch" id="sel">
							<option value="keywordStore" ${storeSearch eq "keywordStore"?"selected":""}>키워드 검색</option>
							<option value="adminState_n" ${storeSearch eq "adminState_n"?"selected":""}>관리자 미승인 검색</option>
							<option value="adminState" ${storeSearch eq "adminState"?"selected":""}>관리자 승인 검색</option> 
						</select>
						<input value="${requestScope.searchWordStore}" name="searchWordStore" type="text" id="searchbar1" class="form-control pull-left" placeholder="안녕하세요 관리자님! 매장 관련 키워드로 검색 하세요">
						<button type="submit" id="searchbtn" class="btn"><img id="magnifyglass1" src="./img/magnifyglass.png"></button>
					</td>
				</tr>
			</table>
	</form>
	<br>
	<form id="muldel" method="post">
		<input type="hidden" name="storeSearch" value="${requestScope.storeSearch}"/>
		<input type="hidden" name="searchWordStore" value="${requestScope.searchWordStore}"/>
		<table id="table2" class="table table-striped" >
			<tr>
				<th>점포일련번호</th>
				<th>아이디</th>
				<th>매장명</th>
				<th>대표명</th>
<!-- 				<th>매장홈페이지링크</th> -->
<!-- 				<th>간단소개</th> -->
<!-- 				<th>매장소개</th> -->
				<th>영업상태(영업중,휴업중,폐점)</th>
<!-- 				<th>매장전화번호</th> -->
				<th>담당자전화번호</th>
<!-- 				<th>주소</th> -->
<!-- 				<th>상세주소</th> -->
<!-- 				<th>영업시간(기타사항)</th> -->
<!-- 				<th>은행명</th> -->
<!-- 				<th>계좌번호</th> -->
<!-- 				<th>사업자등록증</th> -->
<!-- 				<th>영업신고증</th> -->
				<th>관리자승인매장여부</th>
				<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
			</tr>
		<%
				if(list==null||list.size()==0){
					out.print("<tr><td colspan='19'>"
					         +"---관리자님 매장을 검색해보세요!---</td></tr>");
				}else{
					for(SDto dto:list){
						%>
						<tr>
							<td><%=dto.getStore_seq()%></td>
							<td><%=dto.getOwner_id()%></td>
							<td><%=dto.getStore_name()%></td>
							<td><%=dto.getStore_owner_name()%></td>
<%-- 							<td><%=dto.getStore_path()%></td> --%>
<%-- 							<td><%=dto.getStore_simple_intro()%></td> --%>
<%-- 							<td><%=dto.getStore_intro()%></td> --%>
							<td>
							<%
							String state="";
							if(dto.getStore_state().equals("O")){ 
								state = "영업중"; 
							}else if(dto.getStore_state().equals("X")){ 
								state = "점주탈퇴";
							}else if(dto.getStore_state().equals("B")){
								state = "휴업중";
							}else if(dto.getStore_state().equals("C")){
								state = "폐업";
							}
							%>
							    <%=state%>
							</td>
<%-- 							<td><%=dto.getStore_phone()%></td> --%>
							<td><%=dto.getStore_phone_manager()%></td>
<%-- 							<td><%=dto.getStore_address()%></td> --%>
<%-- 							<td><%=dto.getStore_detail_address()%></td> --%>
<%-- 							<td><%=dto.getStore_time_other()%></td> --%>
<%-- 							<td><%=dto.getStore_bank()%></td> --%>
<%-- 							<td><%=dto.getStore_account()%></td> --%>
<%-- 							<td><%=dto.getStore_license_owner()%></td> --%>
<%-- 							<td><%=dto.getStore_license_sales()%></td> --%>
							<td><%=dto.getStore_admin_state()%></td>
							<td><input type="checkbox" name="store_seqs" value="<%=dto.getStore_seq()%>"/></td>
						</tr>
						<%
					}
				}
			%>	
		</table>
<!-- 		승인하고 싶은 매장은 선택하여 승인하고, 승인을 취소하고 싶은 매장은 선택하여 취소하는 버튼 -->
		<button type="submit" formaction="adminMulchk.do">매장승인/승인취소</button>
		<button type="submit" formaction="adminMuldel.do">매장상태변경</button>
	    </form>
	</div>
 </body>
</html>
<jsp:include page="../all/footer.jsp" />