<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.mname{border-top-width: 0px !important;font-size:18px;height:30px;text-align: left;}
	.mnametext{background-color: #f5f5f5;border-radius: 5px 5px 0px 0px;padding: 11px 31px 11px;border: 1px solid #ddd;border-bottom-width: 0px;}
	.s_bold{font-size:20px;font-weight: bold;display:block; margin-top: 50px;margin-bottom: 50px;}
	#s_menubox{height:auto; border:2px solid #848484; border-width: 0 0 2px 0!important;}
	#s_menu{text-align: center;}
	.bigtle{width: 800px; margin: 0 auto; margin-bottom: 400px;}
	.reserve_btn{background-color: #F2F2F2; border: 0;}
	.reserve_btn:hover {background-color: lightgrey;cursor: pointer;}

	
	 
</style> 
<script type="text/javascript">
	function userReserve(menu_seq,menu_state,store_seq){	
		parseInt(menu_seq);
		parseInt(store_seq);	
// 		alert(typeof ); 
// 		alert(menu_state);
// 		alert(menu_seq);
// 		alert(store_seq);
		 
		swal({
		     title: "예약하러 가시겠습니까?",
		     text: "", 
		     icon: "info", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {

		    	 location.href="user_reserve_time_select.do?menu_seq="+menu_seq+"&menu_state="+menu_state+"&store_seq="+store_seq;
		     }else{
		     	
		     }
		});
	}
	
	function loginChk(){
		
		swal({
		     title: "로그인 후에 예약 가능합니다. \n\n로그인 하시겠습니까?",
		     text: "",
		     icon: "info", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	 location.href="login.do";
		     }else{
		     	
		     }
		});	

	}
	
	function ownerChk(){
		swal("이용자만 가능한 기능입니다","", "error");
	}
	
</script>
</head>
<%
	List<MenuDto> list_menu=(List<MenuDto>)request.getAttribute("list_menu");
	UDto uldto=(UDto)session.getAttribute("uldto");
	ODto oldto=(ODto)session.getAttribute("oldto");
	
%>
<body> 
<%
	for(MenuDto dto:list_menu){
		%>
		<input  type="hidden" value="<%=dto.getMenu_state()%>"/>
		<%
	} 
%>
<div id="container">
	<div class="bigtle">
		<div class="infobox section">
			<div class="s_bold">${store_name}의 예약가능 메뉴</div>
			<br>
			<div id="s_menubox"> 
				<table id="s_menu" class="table">
					<col width="150px">
					<col width="450px"> 
					<col width="100px">  
					<col width="150px">	
					<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 -->
						<c:if test="${list_menu[i].menu_state ne 'N'}">
							<c:choose>
								<c:when test="${i==0}">
									<tr>
										<td class="mname" colspan="4"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
									</tr>
									<tr>
										<td class="active"><b>메뉴명</b></td>
										<td class="active"><b>설명</b></td>
										<td class="active"><b>가격</b></td>
										<td class="active">예약하기</td>
									</tr>
								</c:when>
								<c:when test="${list_menu[i-1].category_code != list_menu[i].category_code}">
									<tr>
										<td class="mname" colspan="4"></td>
									</tr>
									<tr>
										<td class="mname" colspan="4"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
									</tr>
									<tr>
										<td class="active"><b>메뉴명</b></td> 
										<td class="active"><b>설명</b></td>
										<td class="active"><b>가격</b></td>
										<td class="active">예약하기</td>
									</tr>				
								</c:when>
							
							</c:choose>
		
							<tr>
								<td>${list_menu[i].menu_name}</td> 
								<td>${list_menu[i].menu_content}</td>
							 	<td>${list_menu[i].menu_price}원</td>
								<%
								if(uldto!=null){
								%>
								<td><input type="button" onclick="userReserve(${list_menu[i].menu_seq},'${list_menu[i].menu_state}',${list_menu[i].store_seq})" value="예약하러가기" class="reserve_btn"/></td>																								
								<%	
								}else{
									if(oldto!=null){ 
									%>
									<td><input type="button" onclick="ownerChk()" value="예약하러가기" class="reserve_btn"></td>
									<%	
									}else{
									%>
									<td><input type="button" onclick="loginChk()" value="예약하러가기" class="reserve_btn"></td>
									<%	
									}
								}
								%>
							</tr>
						</c:if>
					</c:forEach>				 	
				</table>
			</div>
		</div> 
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 