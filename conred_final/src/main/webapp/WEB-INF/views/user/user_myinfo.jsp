<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%> --%>
<%-- <%@page import="org.junit.internal.matchers.SubstringMatcher"%> --%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header2.jsp" />
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
	#container{box-sizing:border-box;  border-top-width:0px;border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 700px;}
	
	table tr{height: 80px;}
	     
	td{vertical-align: middle !important;} 
	
 	#bot{padding-left:680px;} 
	input{border:1px solid grey;vertical-align: middle;}
	input[type=radio],input[type=checkbox]{margin-bottom:6px;}
	.bt {border:1px solid grey;background-color: grey;color: white;border-radius: 5px;height: 30px;margin-left: 10px;} 
	.btn {margin-left: 10px;} 
	.btn:hover {background-color: lightgrey;} 
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	#sel{border:1px solid grey;height:24px;vertical-align: middle;}
	.user_infos{background-color: #D8D8D8;border-width: 0;}
	.radio_button{display: none;}
	.text{display: none;}
	.user_update{background-color: white;border:1px solid black;}
	.email3{width: 120px;}

	
	
</style>
<script type="text/javascript">
	function changeType(){
		$("input[name=user_birth]").prop("type","date");
	}
	function deleteCheck(){
		
		swal({
		     title: "정말 탈퇴 하시겠습니까?",
		     text: "",
		     icon: "warning", //"info,success,warning,error" 중 택1
		     buttons: ["아니오", "예"],
		}).then((YES) => {
		     if (YES) {
		    	 location.href="user_myinfo_delete.do";
		     }else{
		     	
		     }
		});

	}
	
	
	function changeSex(){
		$(".radio_button").css("display", "inline-block");
		$(".text").css("display", "inline-block"); 
		$("input[name=user_sex]").css("display", "none");
		var asd=$("#user_sex").val("");
		
	}
	
	$(function(){
		
		
// 		$(".email3").mouseup(function(){
// 			var emailChk=$("input[name=emailChk01]").val();
// 			var email=$("input[name=user_email1]").val();
// 			if(emailChk!=email){
// 				alert("aa");
// 			}
// 		});
		

	})
	
	
</script>
</head>
<%
	UDto dto=(UDto)request.getAttribute("dto");  
	String[] email=dto.getUser_email().split("@");
%>
<body>
<input type="hidden" name="emailChk01" value="<%=email[0]%>"/>
<input type="hidden" name="emailChk02" value="<%=email[1]%>"/>
<div id="container">
<%-- <input type="hidden"  name="user_email" value="<%=dto.getUser_email()%>"/> --%>
	<form action="user_myinfo_update.do" method="post">
		<div id="tle">
			<div id="regist">
				나의 정보
			</div> 
				<table class="table table-hover" >
					<tr>
						<td><span class="req"> </span>아이디</td>
						<td><input type="text" name="user_id" readonly="readonly" class="user_infos" value="<%=dto.getUser_id()%>"/></td>
					</tr>
					<tr>
						<td><span class="req"> </span>이름</td>
						<td><input type="text" name="user_name" required="required" value="<%=dto.getUser_name()%>" class="user_update"/></td>
					</tr> 
					<tr> 
						<td><span class="req"> </span>이메일</td>
					<td> 
						<input type="text" name="user_email1" required="required" class="user_update email1" value="<%=email[0]%>"/>@
						<input value="<%=email[1]%>" id="email" type="text" name="user_email3" required="required" class="user_update email3"/>
<!-- 						<input type="hidden" name="emailConfirm" required="required" value="N"/> -->
						<button class="emailChk">이메일 인증</button>
					</td>
					</tr> 
					<tr>   
						<td>생년월일</td>
						<%
						if(dto.getUser_birth()==null){
						%>
						<td>
							<input placeholder="정보가 없습니다." style="height:26px;" type="text" onclick="changeType()" name="user_birth" class="user_update" />
						</td>
						<%	
						}else{
						%>
						<td>
							<input value="<%=dto.getUser_birth()%>" style="height:26px;" type="text" onclick="changeType()" name="user_birth" class="user_update" />
						</td>
						<%	
						}
						%>
					</tr>
					<tr>
						<td>성별</td>
						<%
						if(dto.getUser_sex()==null){
						%>
						<td>
							<input type="text" id="user_sex" class="user_update" onclick="changeSex()" placeholder="정보가 없습니다."  name="user_sex" class="user_infos"/>
							<input type="radio" name="user_update_sex" value="남자" class="radio_button"/><span class="text">남</span>
							<input type="radio" name="user_update_sex" value="여자" class="radio_button"/><span class="text">여</span>
						</td> 
						<%	
						}else{
						%>
						<td>
							<input type="text" id="user_sex" class="user_update" onclick="changeSex()"  name="user_sex" value="<%=dto.getUser_sex()%>" class="user_infos"/>
							<input type="radio" name="user_update_sex" value="남자" class="radio_button"/><span class="text">남</span>
							<input type="radio" name="user_update_sex" value="여자" class="radio_button"/><span class="text">여</span>
						</td> 
						<%	
						}
						%>
					</tr>
				</table> 
		</div> 
		<div id="bot">
			<input class="btn redbtn" value="돌아가기" onclick="location.href='index.do'" type="button"/>
			<input class="btn greenbtn" value="수정완료" type="submit"/>
			<input type="button" value="탈퇴" class="btn redbtn" onclick="deleteCheck()"/> 
		</div>
	</form>
</div>

</body>
</html>
<jsp:include page="../all/footer.jsp" /> 