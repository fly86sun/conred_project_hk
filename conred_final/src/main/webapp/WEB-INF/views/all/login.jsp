<%@page import="com.hk.conred.dtos.UDto"%>
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
	#container{border:1px solid lightgrey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:600px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#tle{margin-left:125px;overflow:auto;width:750px;padding-top:50px;}
	 
	.fo{float: left; width: 350px; height: 500px;text-align:center;}
	.fo2{margin-left:50px;}
	
	.hd{font-size:23px;} 
	.loginbox{margin-top:20px;border: 1px solid lightgrey;height:370px; width:350px; border-radius: 10px; padding: 30px 0px 50px 0px;}
	.loginbox:hover{
		box-shadow: 0px 0.5px 3px grey;       
	}
	 
	input{border: 1px solid lightgrey;width: 223.5px; height: 50px; margin-top: 10px; border-radius: 10px;} 
	input:focus {
		border: 1.5px solid black;
		outline:black;         
	}
	.nv{background-image: url("img/naver.PNG"); border-radius: 10px; background-size: 100%; }  
	    
	.bt{background-color: white;font-weight: bold; }
	
	.tx{text-align: center;}   
	
</style> 
<script type="text/javascript">
	function asd(url){
		
// 		swal({
// 		     title: "네이버로 회원 가입을 하시면 사이트의 이용약관에 동의를 하신것으로 간주 됩니다.",
// 		     text: "",
// 		     icon: "info", //"info,success,warning,error" 중 택1
// 		     buttons: ["아니오", "예"],
// 		}).then((YES) => {
// 		     if (YES) {
		    	 
// 				  }
// 		     }else{
// 		    	 return false;
// 		     }
// 		});
		
		var result=confirm("네이버로 회원 가입을 하시면 사이트의 이용약관에 동의를 하신것으로 간주 됩니다.");
		if(result){
			location.href=""+url+"";
			
		}else{
			return false;
		}
	}
	
	function qwe(url){
		var result=confirm("네이버로 회원 가입을 하시면 사이트의 이용약관에 동의를 하신것으로 간주 됩니다.");
		if(result){
			location.href=""+url+"";
			
		}else{ 
			return false;
		}	
	}
	
</script> 
</head>      
<body>
<div id="container">
	<div id="tle">
		<form action="user_login.do" method="post">
			<div class="fo">
				<span class="hd">사용자 로그인</span>
				<div id="user" class="loginbox"> 
					<input type="text" name="user_id" required="required" placeholder="아이디를 입력해주세요" class="tx"/><br/>
					<input type="password" name="user_password" required="required" placeholder="비밀번호를 입력해주세요" class="tx"/><br/>
					<input type="submit" value="로그인" class="bt"/><br/>
					<input type="button" value="회원가입" onclick="location.href='user_regist.do'" class="bt"/><br/>
					<input type="button" class="nv" id="naver_id_login" onclick="return asd('${url}')"/>
				</div>  
			</div>   
		</form>
		<form action="owner_login.do" method="post">
			<div class="fo fo2">
				<span class="hd">점주 로그인</span>
				<div id="owner" class="loginbox">
					<input type="text" name="owner_id" required="required" class="tx" placeholder="아이디를 입력해주세요"/><br/>
					<input type="password" name="owner_password" required="required" class="tx" placeholder="비밀번호를 입력해주세요"/><br/>
					<input type="submit" value="로그인" class="bt"/><br/>
					<input type="button" value="회원가입" onclick="location.href='owner_regist.do'" class="bt"/><br/>
					<input type="button" class="nv" id="naver_id_login" onclick="return qwe('${url02}')"/>
					
<%-- 					<div id="naver_id_login" style="text-align:center"><a href="${url}"> --%>
<!-- 					<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div> -->
					
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>
<jsp:include page="../all/footer.jsp" />