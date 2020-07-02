<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.LikeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.conred.dtos.SDto"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/star_service.css">
<link rel="stylesheet" href="css/star_price.css">
<link rel="stylesheet" href="css/star_clean.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<style type="text/css">
   body{min-width: 1250px;}
   #container{ border:1px solid rgba(225,225,225,1.00);text-align:center;border-top-width:0px; border-bottom:1px solid #fff; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
   #sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
   #navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #585858;}
   .navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
   .navis2:last-child{ font-size:18px; float:left;width:198px;height:50px;color: #000;background-color: #fff;}
   .navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom: 5px solid #585858;}
/*    #navi2{width:998px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #5882FA;} */
/*    .navis2:hover{color:#000;transition:all .3s;cursor:pointer;border-bottom:5px solid #5882FA ;} */
   .home{background-color: white;color:black;border-bottom:5px solid #585858 ;}
/*    .navis2{ font-size:15px; float:left;width:199.7px;height:40px;background-color: #f2f2f2;color: #000;} */
/*    .navis2:hover{color:#000;transition:all .3s;background-color: white;cursor:pointer;} */
/*    진한색 #5882FA */
/*  중간색 #94B8FD */
/*  약한색 #D9E6FE */
   
   #photozone{width:100.1%; height:430px;margin-top: -5px;}
   
   .s_bold{font-size:20px;font-weight: bold;display:block;}
   .s_bold2{font-size:15px;font-weight: bold;}
   .s_week{font-size:15px;width:70px;display: inline-block;}
   .redfont{color:red;}
   .greenfont{color:#3ADF00;}

   .section{width:900px;display: inline-block;}
   #infobox_title{ height:auto;}
/*    #infobox_timeaddr{ height:230px;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;} */
   #infobox_timeaddr{ height:auto;border:0px solid rgba(225,225,225,1.00);border-top-width: 0.5px;border-bottom-width: 0.5px;}
   
/*    #infobox_intro{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
/*    #infobox_menu{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
   
   .infobox{text-align: left; height:auto;border:0px solid rgba(225,225,225,1.00);border-bottom-width: 0.5px;padding:30px 15px;}
/*    .infobox:last-child{text-align: left; border-bottom-width: 0px;height:auto;padding:30px 15px 80px;} */
   .lastinfo{text-align: left; border-bottom-width: 0px;height:auto;padding:30px 15px 60px;}
   
   .info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;padding:30px 15px;}
   .info2{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px; padding:30px 15px;}
   .width1{width:650px}
   .width2{width:250px}
   .seroline{border-right: 0.5px solid rgba(225,225,225,1.00)}
   
   .s_titlebox{margin-bottom: 10px;}
   #s_state{margin-left:10px;font-size:15px;font-weight: bold;display: inline-block;}
   .s_state_color1{color:#3ADF00;}
   .s_state_color2{color:#FF8000;}
   .s_state_color3{color:#FE2E2E;}
   .cate_icon_box{float:left;width:65px;height:65px;display:inline-block; padding:5px;position: relative;border: 1px solid #dedede;border-radius: 10px;}
   .cate_icon{position: relative;width:50px;left:1px;top:1px;}
   .medal{width:29px;padding-bottom:15px;position: relative;top: 0px;left:8px;}
   #s_title{font-size:30px;display: inline-block;position: relative;top: 2px;left:5px;}
   #s_intro_small{font-size:18px !important;height:auto;font-size:15px;display:inline-block;}

   #s_cates{overflow: auto;position: relative;bottom: 10px;left: 7px;color:grey;}
   .s_cate{float:left; font-size:12px;width:45px;text-align: center;}
   .icons{width:35px;padding-bottom: 12px;}

   #s_reviews{width:auto;}
   .s_star{font-size:25px;display:block;width:250px;margin:15px 0px 15px;}
   .s_btn{height:28px;line-height:28px;font-size:15px;display: inline-block; width:190px;background-color: #F2F2F2;padding:0px 5px; border-radius: 5px;text-align: center;}
   .s_btn:hover{cursor: pointer;background-color: lightgrey}
   
   #addr{height:60px;font-size:15px;}
   .s_mapbtn{z-index:0;}
   .s_phone{font-size:15px;}
   
   #s_menubox{height:auto;}
   #s_menu{text-align: center;}
   
   .replyqna{padding:15px;height: 250px; width:410px; background-color: #f2f2f2;border-radius: 5px;margin-top: 20px;}
   .marginleft{margin-left: 50px;}
   
   .flleft{float: left;}
   .flright{float: right;}
   .clrboth{clear: both;}
   
   hr{width:900px;border:0.5px solid grey;}
   /*
   #reserve_btn{box-shadow: 0px 0px 2px #5882FA;position: sticky; bottom:20px;width:300px;height:60px;background-color: #fff;color: #000;border:2px solid #5882FA;margin:0 auto;border-radius: 10px;line-height: 60px;border-left: 0px;border-right:0px}
   #reserve_btn:hover{box-shadow: 0px 2px 5px #5882FA;width:900px;background-color: #fff;cursor: pointer; transition:all .1s;border:2px solid #5882FA;border-left: 0px;border-right:0px}
   #reserve_btn:hover #reserve_text{ transition:all .3s;color: #000;}
   #reserve_text{width:300px;margin:0 auto;text-align: center;line-height: 60px;font-size:20px;}
   */
   #reserve_btn{animation: animate-updown 1s ease-out infinite;box-shadow: 0px 2px 4px grey;position: sticky; bottom:20px;width:900px;height:60px;background-color: #fff;color: #000;margin:0 auto;border-radius: 10px;line-height: 60px;margin-bottom: 70px;}
   #reserve_btn:hover{border-bottom:4px solid #585858;animation-play-state:paused;background-color:#f2f2f2;box-shadow: 0px 1px 4px grey;width:900px;background-color: #fff;cursor: pointer; transition:all .1s;}
   #reserve_btn:hover #reserve_text{ transition:all .3s;color: #585858;}
   #reserve_text{width:300px;margin:0 auto;text-align: center;line-height: 60px;font-size:20px;}
	@keyframes animate-shadow {
		50% {box-shadow: 0px 5px 5px grey;}
	}
	@keyframes animate-updown {
		50% {bottom:25px;}
		100% {bottom:20px;}
 	}
	
   .mname{border-top-width: 0px !important;font-size:18px;height:30px;text-align: left;}
   .mnametext{background-color: #f5f5f5;border-radius: 5px 5px 0px 0px;padding: 11px 31px 11px;border: 1px solid #ddd;border-bottom-width: 0px;}

   .pf{width:40px;height:40px;}
   .ib{display: inline-block;}
   .review_user{clear: both;display: inline-block;height:145px;}
   .rep_id{position: relative;height:53px;}
   .rep_rate{ border-radius: 5px;background-color: #fafafa;margin-top:0px;padding:10px;height:80px;width:187px;float:left;}
   .rep_content{margin-left:13px; border-radius: 5px;background-color: #fafafa;margin-top:0px;padding:10px;height:80px;width:180px;float: left;}
   .rep_regdate{float:right;text-align: right;margin-top:9px;}
   .owner_reply{background-color: #fafafa;height:75px;padding:10px; border-radius: 5px;}

   .rep_con_text{overflow: hidden;height:40px;
   text-overflow: ellipsis;
   white-space: normal;
   word-wrap: break-word;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
   }
   .ststar{color:gold;}
   .starz_big{width:30px;height:auto;display: inline-block;margin:-2px;}
   .starz{width:17px;height:auto;display: inline-block;margin:-2px;margin-bottom:4px;}
   
   .rep_rate_table{float:left;}
   .allrate{float:right;font-size: 20px;padding-top: 16px;padding-left: 2px;}
   .allstartext{margin-left: 5px; position: relative; top: 3.5px;}

   .qna_q{ border-radius: 5px;background-color: #fafafa;margin-top:0px;padding:10px;height:80px;width:380px;float:left;}
   .no_qna{position: relative;top: 100px;left: 95px;}
   
     <!-- Demo styles -->
   body {
      background: #fff;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      z-index:0;
      width: 100%;
      padding-top: 0px;
      padding-bottom: 0px;
    }
    .swiper-slide {
      background-position: center;
/*       background-size: cover; */
      background-size: contain;
      background-repeat: no-repeat;
      width: 1200px;
      height: 400px;
    }
    .swiper-button-prev{color:grey;padding: 10px;width:auto;height:auto;border-radius: 5px;}
    .swiper-button-prev:hover{background-color: #f2f2f2}
    .swiper-button-next{color:grey;padding: 10px;width:auto;height:auto;border-radius: 5px;}
    .swiper-button-next:hover{background-color: #f2f2f2}
    .caption{margin-top: 350px; color:#2E2E2E;background-color:rgba(255,255,255,0.5);width: 250px;margin-left: 475px;border-radius: 5px;}

   /*좋아요버튼 ================================*/
   .store_like_button_tle{width: 200px;height: 100px; margin-top: 47px;float: right;padding-left:25px;padding-top:50px;} 
   
   .btn_like {position: relative;display: block;width: 44px; height: 44px;border: 1px solid #e8e8e8; border-radius: 44px;
   font-family: notokr-bold,sans-serif;font-size: 14px;line-height: 16px;background-color: #fff;color: #DD5D54;box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
   transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;cursor: pointer;
   float: right; margin-right: 17px;}

   .btn_like:hover {border: 1px solid rgba(228,89,89,0.3); background-color: rgba(228,89,89,0.02);box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);}
   .btn_unlike .img_emoti {background-position: -30px -120px;}
   .img_emoti {display: inline-block;overflow: hidden;font-size: 0;line-height: 0;background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
       text-indent: -9999px;vertical-align: top; width: 20px;height: 17px; margin-top: 1px; background-position: 0px -120px; text-indent: 0;border: 0;}
   
   .btn_like .ani_heart_m {margin: -63px 0 0 -63px;}
   
   .ani_heart_m {display: block;position: absolute; top: 50%; left: 50%; width: 125px;height: 125px;margin: -63px 0 0 -63px;pointer-events: none;}
   
   .ani_heart_m.hi {background-image: url(img/zzim_on_m.png);-webkit-background-size: 9000px 125px;background-size: 9000px 125px;animation: on_m 1.06s steps(72);}
   
   .ani_heart_m.bye {background-image: url(img/zzim_off_m.png);-webkit-background-size: 8250px 125px;background-size: 8250px 125px;animation: off_m 1.06s steps(66);} 
   
   .btn_like:focus { outline:none; }
   
   @keyframes on_m {from { background-position: 0 }to { background-position: -9000px }}
   
   @keyframes off_m {from { background-position: 0 }to { background-position: -8250px }}
   /*========================================*/

</style>
<script src="js/jquery-3.4.1.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script type="text/javascript">
   $(function() {
      var rater1=$(".rater1").text().trim();
      var rater2=$(".rater2").text().trim();
      var rater3=$(".rater3").text().trim();
      for (var i = 0; i < $("input:radio[name=star-input01]").length; i++) {
         $("input:radio[name=star-input01]").eq(i).attr("disabled",true);
         if($("input:radio[name=star-input01]").eq(i).val()==rater1){
            $("input:radio[name=star-input01]").eq(i).attr("checked",true);
         }
      }
      for (var i = 0; i < $("input:radio[name=star-input02]").length; i++) {
         $("input:radio[name=star-input02]").eq(i).attr("disabled",true);
         if($("input:radio[name=star-input02]").eq(i).val()==rater2){
            $("input:radio[name=star-input02]").eq(i).attr("checked",true);
         }
      }
      for (var i = 0; i < $("input:radio[name=star-input03]").length; i++) {
         $("input:radio[name=star-input03]").eq(i).attr("disabled",true);
         if($("input:radio[name=star-input03]").eq(i).val()==rater3){
            $("input:radio[name=star-input03]").eq(i).attr("checked",true);
         }
      }
   });
   
   
   
   
   ////////////////////좋아요버튼
   $(function(){
      var session_id=$("input[name=session_id]").val();
      var store_seq=$("input[name=store_seq]").val();
      $('.btn_like').click(function(){ 
         
         if(session_id==""){
        	swal("로그인이 필요한 서비스입니다.", "", "info");//info,success,error,warning
//             alert("로그인이 필요한 서비스입니다."); 
         }else{
            if($(this).hasClass('btn_unlike')){
                $(this).removeClass('btn_unlike'); //좋아요 취소
                $('.ani_heart_m').removeClass('hi');
                $('.ani_heart_m').addClass('bye'); 
                
                $.ajax({
                   url:"store_unlike_ajax.do",
                   method:"post",
                   data:{"user_id":session_id,"store_seq":store_seq},
                   dataType:"json",
                   success:function(obj){
                     
                   }
                });
                
              }
              else{
                $(this).addClass('btn_unlike');    //좋아요
                $('.ani_heart_m').addClass('hi'); 
                $('.ani_heart_m').removeClass('bye');
                
                $.ajax({
                   url:"store_like_ajax.do", 
                   method:"post",
                   data:{"user_id":session_id,"store_seq":store_seq},
                   dataType:"json",
                   success:function(obj){
                     
                   }
                });
                
              }   
         }
      });
   });
   /////////////////////////////////////////////////
   
   
   
   
   
   
</script>
</head>
<%
   LikeDto like_dto=(LikeDto)request.getAttribute("like_dto");
   UDto uldto=(UDto)session.getAttribute("uldto");
   SDto store_detail=(SDto)request.getAttribute("store_detail");
   ODto oldto=(ODto)session.getAttribute("oldto");
%>
<body>
<input type="hidden" name="session_id" value="<%=session.getAttribute("uldto")==null?"":uldto.getUser_id()%>"/>
<input type="hidden" name="store_seq" value="<%=store_detail.getStore_seq()%>">
<%
   //내 (세션)sldto.getStore_seq()와 이 (파라미터)sdto.getStore_seq()가 맞는지
   //    SDto sdto =  >>>>>>스크립트릿에서하는법이뭐더라 jstl로 하자. 
   
//      뿌려줄 값 model 이름들
//         store_detail// 영업시간
//          list_stime// 영업시간
//          cmain// 대분류카테고리
//          list_clist// 소분류카테고리 
//          list_menu// 메뉴
//          list_reply// 리뷰
//         reply_avg// 리뷰 관련 통계, 갯수
//         reply_qna// 문의
//         reply_sphoto// 매장사진
//      내 매장인지/타인 매장인지 여부 확인용
//          s_seq//현재 매장 번호
//          sldto//로그인중인 사람의 매장정보 (세션)
%>

<div id="container">
   <c:if test="${sldto!=null}"> <!-- 매장을 가지고 있지 않으면(로그인 안되어있으면) -->
      <c:if test="${s_seq eq sldto.store_seq}"> <!-- 내 매장과 이 매장이 같으면(로그인 안되어있으면) -->
         <div id="sticky">
            <div id="navi2">
               <div class="navis2 home" onclick="location.href='store.do?store_seq=${store_detail.store_seq}'">
                  매장 홈
               </div>
               <div class="navis2" onclick="location.href='owner_toReupdate_store.do'">
                  매장정보 수정
               </div>
               <div class="navis2" onclick="location.href='owner_mystore_reserve.do?store_seq=${store_detail.store_seq}'">
                  예약관리
               </div>
               <div class="navis2" onclick="location.href='review.do?store_seq=${store_detail.store_seq}'">
                  리뷰관리
               </div>
               <div class="navis2" onclick="location.href='qna.do?store_seq=${store_detail.store_seq}'">
                  문의관리
               </div>
            </div>
         </div>
      </c:if>
   </c:if>
   
   <div id="photozone">
           <!-- Swiper -->
        <div class="swiper-container">
          <div class="swiper-wrapper">
               <c:choose>
                  <c:when test="${empty list_sphoto}">
                     <div class="swiper-slide" style="background-image:url(./img/2019083010048059816_1.jpg)">
                        <div class="caption">등록된 매장사진이 없습니다.</div>
                     </div>
                  </c:when>
                  <c:otherwise>
                        <c:forEach items="${list_sphoto}" var="list_sphoto">
                        <div class="swiper-slide" style="background-image:url(./upload_sphoto/${list_sphoto.store_photo_stored})">
                           <div class="caption">${list_sphoto.store_photo_title}</div>
                        </div>
                     </c:forEach>
                  </c:otherwise> 
               </c:choose>
               
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/2019083010048059816_1.jpg)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
<!--                <div class="swiper-slide" style="background-image:url(./img/bronze.png)"></div> -->
          </div>
          <!-- Add Pagination -->
          <div class="swiper-pagination"></div>
              <!-- Add Arrows -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      
        <!-- Swiper JS -->
        <script src="../package/js/swiper.min.js"></script>
      
        <!-- Initialize Swiper -->
        <script>
          var swiper = new Swiper('.swiper-container', {
            effect: 'coverflow',
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: 'auto',
            coverflowEffect: {
              rotate: 50,
              stretch: 0,
              depth: 100,
              modifier: 1,
              slideShadows : true,
            },
            pagination: {
              el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
          });
          
        </script>
        
   </div>
   <div id="infobox_title" class="section">
      <div class="info1 width1" >
         <div>
            <span id="s_state">
               <c:choose>
                  <c:when test="${store_detail.store_state=='O'}">
                     <span class="s_state_color1">영업중</span>
                  </c:when>
                  <c:when test="${store_detail.store_state=='B'}">
                     <span class="s_state_color2">휴업중</span>
                  </c:when>
                  <c:otherwise>
                     <span class="s_state_color3">폐&nbsp;&nbsp;&nbsp;점</span>
                  </c:otherwise>
               </c:choose>
            </span>
         </div>
         <div class="s_titlebox">
            <div class="cate_icon_box">
               <img class="cate_icon" src="./img/icon/icon_${cmain.category_code}.png">
            </div>
            <span id="s_title">${store_detail.store_name}
            </span>
            <img class="medal" alt="" src="./img/gold.png">
            <div id="s_cates">
<!--                <div> -->
                  <c:forEach begin="0" end="${list_clist.size()-1}" step="1" var="i">
                     <c:choose>
                        <c:when test="${i!=list_clist.size()-1}">
                           <c:choose>
                              <c:when test="${list_clist[i].category_code eq 'A'}">
                                 ${list_clist[i].category_name_small}병원 |
                              </c:when>
                              <c:otherwise>
                                 ${list_clist[i].category_name_small} |
                              </c:otherwise>
                           </c:choose>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                              <c:when test="${list_clist[i].category_code eq 'A'}">
                                 ${list_clist[i].category_name_small}병원
                              </c:when>
                              <c:otherwise>
                                 ${list_clist[i].category_name_small}
                              </c:otherwise>
                           </c:choose>
                        </c:otherwise> 
                     </c:choose>
                  </c:forEach>
               </div>
   <!--             조인해서 이름으로 출력하기(가능하면 윗줄의 동물병원 바로밑+ 아이콘height에 맞게) -->
<!--             </div> -->
         </div>
<!--          <div id="s_intro_small">고양이도 개처럼 만들어주는 댕댕미용실</div> -->
         <div id="s_intro_small">${store_detail.store_intro_simple}안아파동물병원입니다.안아파동물병원입니다. </div>
         
         <c:if test="${store_detail.store_path ne null}">
            <div><a href="${store_detail.store_path}">홈페이지링크 바로가기</a></div>
         </c:if>
         
         <div id="s_reviews">
            <div class="s_star">
               <c:set var="all_s" value="${reply_avg.all_avg}"/>
               <c:forEach begin="1" end="${all_s-(all_s%1)}" step="1">
                  <img class="starz_big" alt="" src="img/star_fill.png">
               </c:forEach>
               <c:if test="${all_s+(1-(all_s%1))%1==all_s-(all_s%1)+1}">
                  <img class="starz_big" alt="" src="img/star_half.png">
               </c:if>
               <c:forEach begin="1" end="${5-(all_s+(1-(all_s%1))%1)}" step="1">
                  <img class="starz_big" alt="" src="img/star_empty.png">
               </c:forEach>
               <span class="allstartext">${all_s}/5</span>
            </div>
            <div class="s_btn" onclick="location.href='review.do?store_seq=${store_detail.store_seq}&owner_id=${store_detail.owner_id}'">리뷰 | 999+</div>
         </div>
      </div>
      <div class="info2 width2" >
         <br>
<!--          <div><span  class="s_phone">매장번호 :</span><span>02-111-1111</span></div> -->
<!--          <div><span class="s_phone">담당자번호 :</span><span>010-1111-1111</span></div> -->
         <div><span  class="s_phone">매장번호 :</span><span>${store_detail.store_phone}</span></div>
         <div><span class="s_phone">담당자번호 :</span><span>${store_detail.store_phone_manager}</span></div>
      </div>
      
      <%
      if(like_dto!=null){
      %>
      <div class="store_like_button_tle">
         <button type="button" class="btn_like btn_unlike">
            <span class="img_emoti">좋아요</span>
            <span class="ani_heart_m"></span>
         </button>
      </div>      
      <%   
      }else{
      %>
      <div class="store_like_button_tle">
         <button type="button" class="btn_like">
            <span class="img_emoti">좋아요</span>
            <span class="ani_heart_m"></span>
         </button>
      </div>      
      <%      
      }
      %>
   
   
   </div>
<!--    <hr> -->
   <div id="infobox_timeaddr" class="section">
      <div class="info1 seroline" >
         <div class="s_bold">영업시간</div>
         <br>
         <c:forEach var="i" begin="0" end="7" step="1">
            <div>
               <span class="s_week">${list_stime[i].store_time_day}</span>
               <c:choose>
                  <c:when test="${list_stime[i].store_time_open.indexOf('00:00')!=-1&&list_stime[i].store_time_close.indexOf('00:00')!=-1}">
                     <span class="greenfont">24시간 영업중</span>
                  </c:when>
                  <c:when test="${list_stime[i].store_time_break=='Y'}">
                     <span class="redfont">휴무일</span>
                  </c:when>
                  <c:otherwise>
                     <span>${list_stime[i].store_time_open}</span>~<span>${list_stime[i].store_time_close}</span>
                  </c:otherwise>
               </c:choose>
            </div>
         </c:forEach>
         
         <div class="s_bold2 redfont"><br>${store_detail.store_time_other}</div>
      </div>
      <div class="info1" >
         <div class="s_bold">주소</div>
         <br>
         <div id="addr">
            <span>${store_detail.store_address}</span><br>
            <span>${store_detail.store_address_detail}</span>
         </div>
         <div id="addr_detail"></div>
         <div class="s_btn s_mapbtn" onclick="location.href='map_keyword.do?keyword=${store_detail.store_name}'">
            지도 바로가기
         </div>
      </div>
   </div>
   <div class="infobox section">
      <div class="s_bold">매장소개</div>
      <br>
      <div class="s_intro_big">
         ${store_detail.store_intro}
      </div>
   </div>
   <div class="infobox section">
      <div class="s_bold">메뉴</div>
      <br>
      <div id="s_menubox">
      
         <table id="s_menu" class="table">
            <col width="200px">
            <col width="500px">
            <col width="150px">
               
            <c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 -->
                  <c:choose>
                     <c:when test="${i==0}">
                        <tr>
                           <td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
                        </tr>
                        <tr>
                           <td class="active"><b>메뉴명</b></td>
                           <td class="active"><b>설명</b></td>
                           <td class="active"><b>가격</b></td>
                        </tr>
                     </c:when>
                     <c:when test="${list_menu[i-1].category_code != list_menu[i].category_code}">
                        <tr>
                           <td class="mname" colspan="3"></td>
                        </tr>
                        <tr>
                           <td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
                        </tr>
                        <tr>
                           <td class="active"><b>메뉴명</b></td>
                           <td class="active"><b>설명</b></td>
                           <td class="active"><b>가격</b></td>
                        </tr>            
                     </c:when>
                  
                  </c:choose>
   
                  <tr>
                     <td>${list_menu[i].menu_name}</td>
                     <td>${list_menu[i].menu_content}</td>
                     <td>${list_menu[i].menu_price}원</td>
                  </tr>
                        
   
            </c:forEach>
         </table>
      </div>
   </div>
   <div class="infobox section">
      <div class="s_bold flleft">리뷰</div>
      <div class="s_btn flright" onclick="location.href='review.do?store_seq=${store_detail.store_seq}&owner_id=${store_detail.owner_id}'">전체보기</div>
         <div id="s_reviews" class="clrboth">
            <div class="s_star">
               <c:set var="all_s" value="${reply_avg.all_avg}"/>
               <c:forEach begin="1" end="${all_s-(all_s%1)}" step="1">
                  <img class="starz_big" alt="" src="img/star_fill.png">
               </c:forEach>
               <c:if test="${all_s+(1-(all_s%1))%1==all_s-(all_s%1)+1}">
                  <img class="starz_big" alt="" src="img/star_half.png">
               </c:if>
               <c:forEach begin="1" end="${5-(all_s+(1-(all_s%1))%1)}" step="1">
                  <img class="starz_big" alt="" src="img/star_empty.png">
               </c:forEach>
               <span class="allstartext">${all_s}/5</span>
            </div>
            <table>
            <col width="50px;">
            <col width="200px;">
               <tr>
                  <td><span>서비스</span></td>
                  <td>
                     <c:set var="service_s" value="${reply_avg.service_avg}"/>
                     <c:forEach begin="1" end="${service_s-(service_s%1)}" step="1">
                        <img class="starz" alt="" src="img/star_fill.png">
                     </c:forEach>
                     <c:if test="${service_s+(1-(service_s%1))%1==service_s-(service_s%1)+1}">
                        <img class="starz" alt="" src="img/star_half.png">
                     </c:if>
                     <c:forEach begin="1" end="${5-(service_s+(1-(service_s%1))%1)}" step="1">
                        <img class="starz" alt="" src="img/star_empty.png">
                     </c:forEach>
                     <span>${service_s}/5</span>
                  </td>
               </tr>
               <tr>
                  <td><span>가격</span></td>
                  <td>
                     <c:set var="price_s" value="${reply_avg.price_avg}"/>
                     <c:forEach begin="1" end="${price_s-(price_s%1)}" step="1">
                        <img class="starz" alt="" src="img/star_fill.png">
                     </c:forEach>
                     <c:if test="${price_s+(1-(price_s%1))%1==price_s-(price_s%1)+1}">
                        <img class="starz" alt="" src="img/star_half.png">
                     </c:if>
                     <c:forEach begin="1" end="${5-(price_s+(1-(price_s%1))%1)}" step="1">
                        <img class="starz" alt="" src="img/star_empty.png">
                     </c:forEach>
                     <span>${price_s}/5</span>
                  </td>
               </tr>
               <tr>
                  <td><span>청결도</span></td>
                  <td>
                     <c:set var="clean_s" value="${reply_avg.clean_avg}"/>
                     <c:forEach begin="1" end="${clean_s-(clean_s%1)}" step="1">
                        <img class="starz" alt="" src="img/star_fill.png">
                     </c:forEach>
                     <c:if test="${clean_s+(1-(clean_s%1))%1==clean_s-(clean_s%1)+1}">
                        <img class="starz" alt="" src="img/star_half.png">
                     </c:if>
                     <c:forEach begin="1" end="${5-(clean_s+(1-(clean_s%1))%1)}" step="1">
                        <img class="starz" alt="" src="img/star_empty.png">
                     </c:forEach>
                     <span>${clean_s}/5</span>
                  </td>
               </tr>
            </table>
         </div>
      <div class="replyqna flleft clrboth">
         <c:choose>
            <c:when test="${list_reply[0].reply_seq!=null}">
               <div class="review_user">
                  <div class="rep_id">
                     <img src="./img/profile_default.png" class="pf"/>
                     <c:set var="a" value="${list_reply.size()}"/>
                     &emsp;${list_reply[0].user_id}
                     <div class="rep_regdate ib">
                        작성일: ${fn:substring(list_reply[0].reply_regdate,4,16)}
                     </div>
                  </div>
                  <div class="rep_rate">
                     <table class="rep_rate_table">
                     <tr>
                        <td>
                           서비스&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="service1" value="${list_reply[0].reply_service}"/>
                           <c:forEach begin="1" end="${service1-(service1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${service1+(1-(service1%1))%1==service1-(service1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(service1+(1-(service1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           가격&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="price1" value="${list_reply[0].reply_price}"/>
                           <c:forEach begin="1" end="${price1-(price1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${price1+(1-(price1%1))%1==price1-(price1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(price1+(1-(price1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           청결도&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="clean1" value="${list_reply[0].reply_clean}"/>
                           <c:forEach begin="1" end="${clean1-(clean1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${clean1+(1-(clean1%1))%1==clean1-(clean1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(clean1+(1-(clean1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     </table>
                     <c:set var="all1" value="${(clean1+price1+service1)/3}"/>
                     <div class="allrate">
                        <fmt:formatNumber value="${all1}" pattern=".0"/>
                     </div>
                  </div>
                  <div class="rep_content">
                     <div><b>리뷰내용</b></div>
                     <div class="rep_con_text">   
                        ${list_reply[0].reply_content}
                     </div>
                  </div>
               </div>
               <div class="owner_reply">
                  <div><b>매장답변</b></div>
                  <div class="rep_con_text">
                     ${list_reply[0].reply_answer!=null?list_reply[0].reply_answer:"아직 답변이 없습니다."}
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="review_user">
                  <div class="no_qna">--더 등록된 리뷰가 없습니다--</div>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
      <div class="info1 replyqna marginleft flright">
         <c:choose>
            <c:when test="${list_reply[1].reply_seq!=null}">   
               <div class="review_user">
                  <div class="rep_id">
                     <img src="./img/profile_default.png" class="pf"/>
                     &emsp;${list_reply[1].user_id}
                     <div class="rep_regdate ib">
                        작성일: ${fn:substring(list_reply[1].reply_regdate,4,16)}
                     </div>
                  </div>
                  <div class="rep_rate">
                     <table class="rep_rate_table">
                     <tr>
                        <td>
                           서비스&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="service1" value="${list_reply[1].reply_service}"/>
                           <c:forEach begin="1" end="${service1-(service1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${service1+(1-(service1%1))%1==service1-(service1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(service1+(1-(service1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           가격&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="price1" value="${list_reply[1].reply_price}"/>
                           <c:forEach begin="1" end="${price1-(price1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${price1+(1-(price1%1))%1==price1-(price1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(price1+(1-(price1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           청결도&nbsp;&nbsp;
                        </td>
                        <td>
                           <c:set var="clean1" value="${list_reply[1].reply_clean}"/>
                           <c:forEach begin="1" end="${clean1-(clean1%1)}" step="1">
                              <img class="starz" alt="" src="img/star_fill.png">
                           </c:forEach>
                           <c:if test="${clean1+(1-(clean1%1))%1==clean1-(clean1%1)+1}">
                              <img class="starz" alt="" src="img/star_half.png">
                           </c:if>
                           <c:forEach begin="1" end="${5-(clean1+(1-(clean1%1))%1)}" step="1">
                              <img class="starz" alt="" src="img/star_empty.png">
                           </c:forEach>
                        </td>
                     </tr>
                     </table>
                     <c:set var="all1" value="${(clean1+price1+service1)/3}"/>
                     <div class="allrate">
                        <fmt:formatNumber value="${all1}" pattern=".0"/>
                     </div>
                  </div>
                  <div class="rep_content">
                     <div><b>리뷰내용</b></div>
                     <div class="rep_con_text">   
                        ${list_reply[1].reply_content}
                     </div>
                  </div>
               </div>
               <div class="owner_reply">
                  <div><b>매장답변</b></div>
                  <div class="rep_con_text">
                     ${list_reply[1].reply_answer!=null?list_reply[1].reply_answer:"아직 답변이 없습니다."}
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="review_user">
                  <div class="no_qna">--더 등록된 리뷰가 없습니다--</div>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
   <div class="infobox section lastinfo">
      <div class="s_bold flleft">문의</div>
      <div class="s_btn flright" onclick="location.href='qna.do?store_seq=${store_detail.store_seq}&owner_id=${store_detail.owner_id}'">전체보기</div>
      <div class="info1 replyqna flleft clrboth">
         <c:choose>
            <c:when test="${list_qna[0].qna_seq!=null}">
               <div class="review_user">
                  <div class="rep_id">
                     <img src="./img/profile_default.png" class="pf"/>
                     <c:set var="a" value="${list_qna.size()}"/>
                     &emsp;${list_qna[0].user_id}
                     <div class="rep_regdate ib">
                        작성일: ${fn:substring(list_qna[0].qna_regdate,4,16)}
                     </div>
                  </div>
                  <div class="qna_q">
                     <div><b>문의내용</b></div>
                     <%
                     if(oldto!=null){
                    	 if(oldto.getOwner_id().equals(store_detail.getOwner_id())){
                    	 %>
                    	 <div class="rep_con_text">   
                         	${list_qna[0].qna_content}
                     	 </div>
                    	 <%	 
                    	 }else{
                    	 %>
                    	 <div class="rep_con_text">   
                         	비공개글 입니다.
                     	 </div>
                    	 <%	 
                    	 }
                     }else{
                     %>
                     <div class="rep_con_text">   
                  	   	비공개글 입니다.
                   	 </div>
                     <% 
                     }
                     %>
                  </div>
               </div>
               <div class="owner_reply">
                  <div><b>매장답변</b></div>
                  <div class="rep_con_text">
                     ${list_qna[0].qna_answer!=null?list_qna[0].qna_answer:"아직 답변이 없습니다."}
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="review_user">
                  <div class="no_qna">--더 등록된 문의가 없습니다--</div>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
      <div class="info1 replyqna marginleft flright">
         <c:choose>
            <c:when test="${list_qna[1].qna_seq!=null}">
               <div class="review_user">
                  <div class="rep_id">
                     <img src="./img/profile_default.png" class="pf"/>
                     &emsp;${list_qna[1].user_id}
                     <div class="rep_regdate ib">
                        작성일: ${fn:substring(list_qna[1].qna_regdate,4,16)}
                     </div>
                  </div>
                  <div class="qna_q">
                     <div><b>문의내용</b></div>
                     <%
                     if(oldto!=null){
                    	 if(oldto.getOwner_id().equals(store_detail.getOwner_id())){
                    	 %>
                    	 <div class="rep_con_text">   
                         	${list_qna[1].qna_content}
                     	 </div>
                    	 <%	 
                    	 }else{
                    	 %>
                    	 <div class="rep_con_text">   
                         	비공개글 입니다.
                     	 </div>
                    	 <%	 
                    	 }
                     }else{ 
                     %>
                     <div class="rep_con_text">   
                  	   	비공개글 입니다.
                   	 </div>
                     <% 
                     }
                     %>
                  </div>
               </div>
               <div class="owner_reply">
                  <div><b>매장답변</b></div>
                  <div class="rep_con_text">
                     ${list_qna[1].qna_answer!=null?list_qna[1].qna_answer:"아직 답변이 없습니다."}
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="review_user">
                  <div class="no_qna">--더 등록된 문의가 없습니다--</div>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
   <div id="reserve_btn" onclick="location.href='user_store_reserve.do?store_seq=${s_seq}&store_name=${store_detail.store_name}'"><div id="reserve_text">예약하러가기</div></div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />