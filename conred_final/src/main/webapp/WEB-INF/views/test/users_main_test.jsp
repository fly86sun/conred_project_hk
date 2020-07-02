<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	body{margin:0;}
	header{border:1px solid grey;border-top-width:0px;box-shadow: 0px 0.5px 3px grey; height:200px;width:100%;}
	#logo{width:200px; display: block; margin: 0 auto;position:relative; top:40px;}
	#logo:hover{cursor: pointer;}
	#profilebox{width:200px;height:30px;float:right;position: relative; bottom:-25px;left:-10px;}
	.profile{float:right; height:100%;line-height: 23px;padding-right:10px;}
	#navibox{width:380px;height:30px;float:right;position: relative; bottom:-20px;right:10px; padding-right:5px;clear:both;}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 50px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;}
	#profilepic{width:30px;float:right;padding-right:10px;}
</style>
</head>
<body>
<header>
	<img id="logo" alt="logo1" src="./img/logo1.png" onclick="location.href='index.jsp'"><!-- 나중에 세션에따라 이동되는페이지 달라지게 바꾸기 -->
	
	<%
		UDto uldto=(UDto)session.getAttribute("uldto");
		ODto oldto=(ODto)session.getAttribute("oldto");
		
		if(uldto==null&&oldto==null){/* 어떤 등급도 로그인이 되어있지 않으면 */
	%>
			<!-- 비회원 -->
			<div id="profilebox">
				<div id="tologin" class="profile">비회원<span>입니다.</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox">
				<div id="toregist" class="navis" onclick="location.href='select_regist.do'">회원가입</div>
				<div id="tologin" class="navis" onclick="location.href='login.do'">로그인</div>
			</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role()=="user"){/*사용자는 로그인, 점주는 비로그인, 사용자등급==user인 경우 */
	%>
			<!-- 사용자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>회원님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox">
				<div id="logout" class="navis">로그아웃</div>
				<div id="u_info" class="navis">나의정보</div>
				<div id="u_mypage" class="navis">마이페이지</div>
				<div id="u_like" class="navis">좋아요</div>
				<div id="u_reserve" class="navis">내 예약</div>
			</div>
	<%
		}else if(uldto==null&&oldto!=null){/*사용자는 비로그인, 점주는 로그인인 경우 */
	%>
			<!-- 점주 --> 
			<div id="profilebox">
				<div id="tologin" class="profile"><%=oldto.getOwner_name() %><span>사장님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox">
				<div id="logout" class="navis">로그아웃</div>
				<div id="o_info" class="navis">나의정보</div>
				<div id="o_tore" class="navis">매장관리</div>
				<div id="o_storeinfo" class="navis">매장정보</div>
				<div id="o_reserve" class="navis">예약</div>
			</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role()=="admin"){/*사용자는 로그인, 점주는 비로그인, 사용자등급==admin인 경우 */
	%>
			<!-- 관리자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>관리자님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox">
				<div id="logout" class="navis">로그아웃</div>
				<div id="a_mypage" class="navis">나의정보</div>
				<div id="a_site" class="navis">사이트관리</div>
			</div>
	<%
		}
	%>
</header>
</body>
</html>