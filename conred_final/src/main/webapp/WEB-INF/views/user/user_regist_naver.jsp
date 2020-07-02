<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
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
	.req{color: red;font-weight: bold;font-size:20px;}
	#sel{border:1px solid grey;height:24px;vertical-align: middle;}
	.idCheck{width: 180px;color:red;height: 24px;margin-left: 45px;display: none;}
	
</style>
<script type="text/javascript">
	$(function(){
		//이메일 작성시 나머지 메일 주소 선택 넣어주기
		$("#sel").change(function(){
			$("input[name=user_email3]").val($(this).val());
		});
		$(".authBtn").click(function(){
			var emailVal=$("input[name=user_email1]").val()+"@"+$("input[name=user_email3]").val();
			$("input[name=email]").val(emailVal);
			var myForm=document.getElementById("emailform");
			window.open("","popForm","width=600px,height=600px");
			myForm.method="post";
			myForm.target="popForm";
			myForm.submit();
		});	
//      이메일 필수 기능 임시로 비활성화 해놓음 회원가입 편의성 및 개발 테스트를 위해서
// 		$("form").eq(0).submit(function() {
// 			if($("input[name=emailConfirm]").val()=='Y') {
// 				return true;
// 			}else{
// 				swal("이메일 인증은 필수입니다", "", "info");//info,success,error,warning
// 				$("input[name=user_email1]").focus();
// 				return false;
				
// 			}
// 		});
})
		
		
		//이메일 인증버튼 클릭하면
// 		$(".authBtn").click(function(){
// 			var emailVal=$("input[name=user_email1]").val()+"@"+$("input[name=user_email3]").val();
// 			$.ajax({
// 				url:"email_ok_start.do",
// 				method:"post",
// 				data:{"email":emailVal},
// 				dataType:"text",
// 				success:function(m){// 서버로부터 응답되어 돌아오는 데이터는 "m"에 저장된다.
// 					alert(m);
// 				},
// 				error:function(){
// 					alert("인증작업(서버통신실패)");
// 				}
// 			});
// 		});
// 	//이메일 유효성 검사 참고용
// 	function validate() {
// 		var re2 = [0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 		var email = document.getElementById("email");
// 	}


///////////////////////////////////////////////////////////////////////////////////////////////////
	$(function(){
	var user_id=$("input[name=user_id]");
	
	user_id[0].onblur=function(){ 
		var resultId=user_id.val().trim().replace(" ", "");
		$.ajax({ 
			url:"user_idcheck_ajax.do",
			method:"post",
			data:{"user_id":resultId},
			dataType:"json",
			success:function(obj){
				var result=obj.user_result;
				if(result!=null){
					$(".idCheck").css("display","inline-block");
					user_id.val("") 
				}else{
					$(".idCheck").css("display","none"); 
				}
			} 	
		}); 
	}
	
	var pwInputs=$("input[type=password]");
	pwInputs[1].onblur=function(){
		if(pwInputs.eq(0).val()!=pwInputs.eq(1).val()){
			swal("패스워드를 확인하세요", "", "info");//info,success,error,warning
			pwInputs[0].value="";
			pwInputs[1].value="";
			pwInputs[0].focus(); 
			
		}
	}
	 
	var form=$("form")[0];
	form.onsubmit=function(){ 
		var pwInputs=$("input[type=password]");
		if(pwInputs.eq(0).val()!=pwInputs.eq(1).val()){
			swal("패스워드를 확인하세요", "", "info");//info,success,error,warning
			pwInputs[0].value="";
			pwInputs[1].value="";
			pwInputs[0].focus(); 
			return false;
		}
	} 
	
})



</script>
</head>
<body>
<div id="container">
	<form action="user_insert.do" method="post">
		<div id="tle">
			<div id="regist">
				사용자 회원가입
			</div> 
				<table class="table table-hover" >
					<tr>
						<td><span class="req">* </span>아이디</td>
						<td><input type="text" name="user_id" value="${id}" required="required"/><div class="idCheck">중복된 아이디 입니다.</div></td>
					</tr>
					<tr>
						<td><span class="req">* </span>비밀번호</td>
						<td><input type="password" name="user_password" required="required"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>비밀번호 확인</td>
						<td><input type="password" name="user_password2" required="required"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>이름</td>
						<td><input type="text" name="user_name" value="${name}" required="required"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>이메일</td>
					<td>
						<input id="email" type="text" name="user_email1" style="width:200px;" value="${email}" required="required"/>
						<select id="sel">
							<!-- 직접입력처리 -->
							<option>직접입력</option>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
						</select>
						<input type="hidden" name="emailConfirm" required="required" value="N"/>
					</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>
							<input style="height:26px;" type="date" name="user_birth"/>
						</td>
					</tr>
					<tr>
						<td>성별</td>
					<td>
						<input type="radio" name="user_sex" value="남자"/>남
						<input type="radio" name="user_sex" value="여자"/>여
					</td>
					</tr>
					<tr>
						<td><span class="req">* </span>이용약관</td>
						<td>
							이용약관에 동의하시겠습니까? <input name="user_agreement" value="Y" type="checkbox" checked="checked" required="required"/>
							<button type="button"  class="btn"> 이용약관</button>
						</td>
					</tr>
				</table>
		</div>
		<div id="bot">
			<input class="btn redbtn" value="취소" onclick="location.href='index.do'" type="button"/>
			<input class="btn greenbtn" value="회원가입 완료" type="submit"/> 
		</div>
	</form>
	<form id="emailform" action="email_ok_start.do">
		<input type="hidden" name="email" required="required" />
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />