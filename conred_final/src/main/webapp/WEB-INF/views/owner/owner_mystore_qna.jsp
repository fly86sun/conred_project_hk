<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
	#navi2{width:999px;clear:both;position:relative;top:0px;text-align: center;line-height: 40px;border-top: 1px solid grey;display: inline-block;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.7px;height:40px;background-color: #f2f2f2;color: #000;}
	.navis2:hover{color:#000;transition:all .3s;border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;color:black;}
	
	#photozone{width:100%; height:400px;border:1px solid grey;}
	
	.s_bold{font-size:20px;font-weight: bold;display:block;}
	.s_bold2{font-size:15px;font-weight: bold;}
	.s_week{font-size:15px;width:70px;display: inline-block;}
	.redfont{color:red;}

	.section{width:900px;display: inline-block;}
	#infobox_title{ height:290px;}
	#infobox_timeaddr{ height:230px;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;}
	#infobox_intro{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	#infobox_menu{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	.infobox{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	.infobox:last-child{text-align: left; border-bottom-width: 0px;height:auto;padding:30px 15px 80px;}
	
	.info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;padding:30px 15px;}
	.info2{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px; padding:30px 15px;}
	.width1{width:650px}
	.width2{width:250px}
	.seroline{border-left: 1px solid grey }
	
	#s_state{font-size:15px;color:#3ADF00;font-weight: bold;display: inline-block;}
	.medal{width:30px;padding-bottom:13px}
	#s_title{font-size:30px;display: inline-block;}
	#s_tinfo{height:60px;font-size:15px;display:inline-block;}

	#s_cates{overflow: auto;}
	.s_cate{float:left; font-size:12px;width:45px;text-align: center;}
	.icons{width:35px;padding-bottom: 12px;}

	#s_reviews{width:auto;}
	#s_star{font-size:25px;display:block;width:190px;}
	.s_btn{font-size:15px;display: inline-block; width:190px;background-color: #F2F2F2;padding:0px 5px; border-radius: 10px;text-align: center;}
	.s_btn:hover{cursor: pointer;background-color: lightgrey}
	
	#addr{height:60px;font-size:15px;}
	.s_mapbtn{float: right;margin-top: 40px;position:relative;bottom: 0px;}
	.s_phone{font-size:15px;}
	
	#s_menubox{height:auto;}
	#s_menu{text-align: center;}
	
	.replyqna{height: 250px; width:410px; background-color: #f2f2f2;border-radius: 5px;margin-top: 20px;}
	.marginleft{margin-left: 50px;}
	
	.flleft{float: left;}
	.flright{float: right;}
	.clrboth{clear: both;}
	hr{width:900px;border:0.5px solid grey;}
	
	
</style>
</head>
<body>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='store.do?store_seq=${sdto.store_seq}'">
				매장 홈
			</div>
			<div class="navis2" onclick="location.href='owner_toReupdate_store.do'">
				매장정보 수정
			</div>
			<div class="navis2" onclick="location.href='owner_mystore_reservation.do'">
				예약관리
			</div>
			<div class="navis2" onclick="location.href='owner_mystore_review.do'">
				리뷰관리
			</div>
			<div class="navis2 home" onclick="location.href='owner_mystore_qna.do'">
				문의관리
			</div>
		</div>
	</div>
	<h1>문의관리페이지</h1>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />