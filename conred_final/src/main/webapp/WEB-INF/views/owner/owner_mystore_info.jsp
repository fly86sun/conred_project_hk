<%@page import="java.util.List"%>
<%@page import="com.hk.conred.dtos.ODto"%>
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
	body{min-width: 1250px;}
 	#container{ border:1px solid rgba(225,225,225,1.00); border-bottom:1px solid #fff; border-top-width:0px;min-height:800px; width:1000px;margin: 0 auto;height: 1000px;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/ 
/* 	#container{text-align:center;border:0px solid grey;border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;} */
/* 	
	#navi2{box-shadow: 0px 0.5px 2px #5882FA;width:1000px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #5882FA;} 
 	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;} 
 	.navis2:hover{color:#2F3376;transition:all .3s;cursor:pointer;border-bottom:5px solid #5882FA ;} 
 	.home{background-color: white;color:black;border-bottom:5px solid #5882FA ;text-decoration: none;border-left-width: 0;border-right-width: 0;}
 	 */
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   	#navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   	.navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   	.navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
	.home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;margin-left: 40px;margin-top: 20px;}
	 
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-bottom:20px;display: inline-block;height: 40px;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:800px;height:200px; margin:0 auto; margin-top: 20px;}
	.myboxmargin{margin-top:30px;}
	.mybox_info{width: 130px;height: 100px; float: left; margin-left: 100px;text-align: center;font-size: 20px;}
	.mybox_info1{width: 130px;height: 100px;  float: left; margin-left: 170px;text-align: center;font-size: 20px;}
    .stats_result{color: #A4A4A4; font-size: 30px;}
    a{color: gray; font-size: 50px;}
	a:hover{text-decoration: none; color:rgb(0, 255, 0);cursor: pointer;} 
	.mybox_info_header{font-weight: bold; font-size: 20px;} 
	#footprint1{width: 50px;height: 40px;border-radius: 15px;background-color: #EFFBFB;}
	.point{color: gray; font-size: 50px;} 
	.bottom_info{margin-bottom: 100px;}  
	.content_new{line-height:2;color:white; background-color: red; width: 40px;height: 40px;position: absolute;margin-left: 96px;margin-top: -92px;border-radius:20px 20px 20px 0;}
	
</style>
</head>
<%
	ODto dto=(ODto)request.getAttribute("dto");
	ODto oldto=(ODto)session.getAttribute("oldto");
	List<ODto> list_qna=(List<ODto>)request.getAttribute("list_qna");
	List<ODto> list_reply=(List<ODto>)request.getAttribute("list_reply");
	ODto owner_id=(ODto)request.getAttribute("owner_id");
%>
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
			<div class="navis2" onclick="location.href='owner_mystore_reserve.do?store_seq=<%=dto.getStore_seq()%>'">
				예약관리
			</div>
			<div class="navis2" onclick="location.href='review.do?store_seq=<%=dto.getStore_seq()%>&owner_id=<%=owner_id.getOwner_id()%>'">
				리뷰관리
			</div>
			<div class="navis2" onclick="location.href='qna.do?store_seq=<%=dto.getStore_seq()%>&owner_id=<%=owner_id.getOwner_id()%>'">
				문의관리
			</div>
		</div>
	</div>
	<div id="regist" class="testmod">
				나의 매장 정보
	</div>
	<div id="pagename">  
		<img src="img/icon/icon_foot.png" id="footprint1"> 
		<b></b><%=oldto.getOwner_id()%>님 환영합니다, 즐거운 하루!!<br>
		<span>이메일 : <%=oldto.getOwner_email()%></span><br><br>
	</div>    
	<div class="mybox">   
		<div class="mybox_info_header" >매장 통계</div><br/>
		<div class="mybox_info"> 
		 	<span class="stats_result"><a onclick="location.href='owner_mystore_reserve.do?store_seq=<%=dto.getStore_seq()%>'"><%=dto.getReserve_count()%></a></span><br/>
		 	<span><b>예약수</b></span> 
		</div>  
		<div class="mybox_info">  
	        <span class="stats_result"><a onclick="location.href='#'"><%=dto.getLike_count()%></a></span><br/>
	        <span><b>좋아요</b></span> 
		</div>     
		<div class="mybox_info">  
		  	<span class="stats_result"><a onclick="location.href='owner_mystore_reserve_success.do?store_seq=<%=dto.getStore_seq()%>'"><%=dto.getPay_count()%></a></span><br/>
		  	<span><b>결제수</b></span> 
		</div>
	</div>     
	<div class="mybox">  
		<div class="mybox_info_header">매장 글 관리</div><br/>
		<div class="mybox_info1">
			  <span class="stats_result">
			  	<a onclick="location.href='review.do?store_seq=<%=dto.getStore_seq()%>&owner_id=<%=owner_id.getOwner_id()%>'"><%=dto.getReply_count()%></a>
			  </span>
			  <%
			  if(list_reply==null||list_reply.size()==0){
				  
			  }else{
			  	for(int i=0;i<list_reply.size()+1;i++){
			  	%>
			  	<div class="content_new">+<%=i%></div>
			  	<%	
			  	}
			  }
			  %>
			  <br/>
			  <span><b>리뷰수</b></span> 
		</div>
		<div class="mybox_info1">
			  <span class="stats_result">
			  	<a onclick="location.href='qna.do?store_seq=<%=dto.getStore_seq()%>&owner_id=<%=owner_id.getOwner_id()%>'"><%=dto.getQna_count()%></a>
			  </span>
			  <%
			  if(list_qna==null||list_qna.size()==0){
			  
			  }else{	  
			  	for(int i=0;i<list_qna.size()+1;i++){ 
				%>
				<div class="content_new">+<%=i%></div>
				<%	  
				}				  
			  }
			  %>
			  <br/>
			  <span><b>문의수</b></span> 
		</div>
	</div> 
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />