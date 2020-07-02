<%@page import="com.hk.conred.dtos.CMainDto"%>
<%@page import="com.hk.conred.dtos.SDto"%>
<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="./img/footprint1.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어디가개!? 반려동물과 함께하는 모든 곳</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	body{margin:0;min-width:1250px;}
	header{border:1px solid lightgrey;border-top-width:0px; height:90px;width:100%;}
	#logo{width:320px; display: block; margin: 0 auto;position:relative; top:8px;}
	
/* 	#logo{width:400px; display: block; margin: 0 auto;position:relative; top:20px;} */
	#logo:hover{cursor: pointer;}
	#profilebox{width:200px;height:30px;float:right;position: relative; bottom:45px;left:-10px;}
	.profile{float:right; height:100%;line-height: 23px;padding-right:10px;}
	#navibox{width:380px;height:30px;float:right;position: relative; padding-right:5px;left:190px;bottom:20px}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 3px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;transition:all .3s;}
	#profilepic{width:30px;float:right;padding-right:10px;}
	.display_none{display: none;}

	
</style>
</head>
<body>
<header>
		<img id="logo" alt="logo2" src="./img/h2.gif" onclick="location.href='index.do'"><!-- 나중에 세션에따라 이동되는페이지 달라지게 바꾸기 -->
		
	<%
		UDto uldto=(UDto)session.getAttribute("uldto");
		ODto oldto=(ODto)session.getAttribute("oldto");
		SDto sdto=(SDto)session.getAttribute("sdto");
		CMainDto cmaindto=(CMainDto)session.getAttribute("cmaindto");
		
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
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("user")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==user인 경우 */
	%>
			<!-- 사용자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>회원님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox">
				<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
				<div id="u_info" class="navis" onclick="location.href='user_myinfo.do'">나의정보</div>
				<div id="u_mypage" class="navis" onclick="location.href='user_mypage.do'">마이페이지</div>
				<div id="u_like" class="navis" onclick="location.href='user_mypage_like.do'">좋아요</div>
				<div id="u_reserve" class="navis" onclick="location.href='user_mypage_reserve.do'">내 예약</div>
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
				<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
				<div id="o_info" class="navis" onclick="location.href='owner_myinfo.do'">나의정보</div>
				<%
				if(uldto==null&&oldto!=null&&sdto!=null){/* 점주이면서, 유저가아니면서, store가 있는사람 에게만 표시 */
					if(sdto.getStore_name()==null){//등록되어있으나 certify만 작성된상태면
						%>
						<div id="o_reserve" class="navis" onclick="location.href='owner_regist_store.do'">점포등록</div>
<!-- 						<div class="balloon_01 blink">점포등록이 1/3 진행되었어요!</div> -->
						<%
					}else if(cmaindto==null){//등록되어있으나 certify,store만 작성된상태면
						%>
						<div id="o_reserve" class="navis" onclick="location.href='owner_regist_menu.do'">점포등록</div>
<!-- 						<div class="balloon_01 blink">점포등록이 2/3 진행되었어요!</div> -->
						<%
					}else if(cmaindto!=null){//등록되어있으며 certify,store,menu 모두 작성된 상태라면
					%>
						<div id="o_tore" class="navis" onclick="location.href='store.do?store_seq=<%=sdto.getStore_seq()%>'">매장관리</div>
						<div id="o_storeinfo" class="navis" onclick="location.href='owner_mystore_info.do?store_seq=<%=sdto.getStore_seq()%>'">매장정보</div>
						<div id="o_reserve" class="navis" onclick="location.href='owner_mystore_reserve.do?store_seq=<%=sdto.getStore_seq()%>'">예약현황</div>
					<%
					}
				}else{/*  점포가 아직 없는 점주에게만 "점포등록버튼" 표시 */ 
				%>
					<div id="o_reserve" class="navis" onclick="location.href='owner_regist_certify.do'">점포등록</div>
				<%
				}
				%>
				
			</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("admin")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==admin인 경우 */
	%>
			<!-- 관리자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>관리자님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
			<div id="navibox"> 
				<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
				<div id="a_mypage" class="navis"  onclick="location.href='user_myinfo.do'">나의정보</div>
				<div id="a_site" class="navis"  onclick="location.href='admin_site.do'">사이트관리</div>
			</div>
	<%
		}
	%>
		
</header>

</body>
</html>